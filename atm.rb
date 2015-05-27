class Atm
  STARTING_BALANCE = 100.0

  DEPOSIT  = 'D'
  WITHDRAW = 'W'
  BALANCE  = 'B'
  QUIT     = 'Q'

  def initialize(filename = "balance.txt")
    @filename = filename

    if !File.exists?(@filename)
      file = File.new(@filename, 'w')
      file.puts(STARTING_BALANCE)
      file.close
    end
  end

  def run
    printf "Your balance is $%.2f\n", get_balance

    printf "List of available commands:\n%c: Deposit\n%c: Withdraw\n%c: Balance\n%c: Quit\n", DEPOSIT, WITHDRAW, BALANCE, QUIT
    while (command = gets.chomp.upcase) != QUIT
      case command
        when DEPOSIT
          printf "Input the amount you want to deposit: "
          amount = get_input_amount
          if amount <= 0
            printf "Input only positive numbers please.\n"
          else
            modify_balance(amount)
          end
        when WITHDRAW
          printf "Input the amount you want to withdraw: "
          amount = get_input_amount
          if amount <= 0
            printf "Input only positive numbers please.\n"
          else
            modify_balance(-amount)
          end
        when BALANCE
          printf "Your balance is $%.2f\n", get_balance
        else
          printf "Unknown command\nList of available commands:\n%c: Deposit\n%c: Withdraw\n%c: Balance\n%c: Quit\n", DEPOSIT, WITHDRAW, BALANCE, QUIT
      end
    end
  end

  def get_balance
    File.open(@filename, &:readline).to_f
  end

  def get_input_amount
    amount = gets.to_f
    if amount < 0
      amount = 0
    end

    amount
  end

  def modify_balance(amount = 0)
    balance = get_balance
    if balance + amount < 0
      printf "You cannot be in red numbers my friend\n"
    else
      file = File.open(@filename, 'w')
      file.write(balance + amount)
      file.close
    end
  end
end
