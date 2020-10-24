require "example"
require "tty-font"
require "tty-table"
require "paint"


class Main
  def initialize()
  end

  def run
    system "clear"
    # puts Paint["██████╗░░█████╗░███╗░░██╗██████╗░░█████╗░███╗░░░███╗  ██████╗░░█████╗░░██████╗░█████╗░██████╗░██╗░░░██╗", :red]
    # puts Paint["██╔══██╗██╔══██╗████╗░██║██╔══██╗██╔══██╗████╗░████║  ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗░██╔╝", :red]
    # puts Paint["██████╔╝███████║██╔██╗██║██║░░██║██║░░██║██╔████╔██║  ██████╔╝██║░░██║╚█████╗░███████║██████╔╝░╚████╔╝░", :red]
    # puts Paint["██╔══██╗██╔══██║██║╚████║██║░░██║██║░░██║██║╚██╔╝██║  ██╔══██╗██║░░██║░╚═══██╗██╔══██║██╔══██╗░░╚██╔╝░░", :white]
    # puts Paint["██║░░██║██║░░██║██║░╚███║██████╔╝╚█████╔╝██║░╚═╝░██║  ██║░░██║╚█████╔╝██████╔╝██║░░██║██║░░██║░░░██║░░░", :white]
    # puts Paint["╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░╚═╝░░░░░╚═╝  ╚═╝░░╚═╝░╚════╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░", :white]

    puts Paint["█▀█ ▄▀█ █▄░█ █▀▄ █▀█ █▀▄▀█   █▀█ █▀█ █▀ ▄▀█ █▀█ █▄█", :red]
    puts Paint["█▀▄ █▀█ █░▀█ █▄▀ █▄█ █░▀░█   █▀▄ █▄█ ▄█ █▀█ █▀▄ ░█░", :white]

    file = File.open("./name.txt")
    names = file.readlines.map(&:chomp)
    file.close

    colors = ["d90429", "fa4442", "e76f51", "f9c74f", "aaf683", "83b692", "5390d9", "72efdd", "a11692", "5e60ce"]
    # colors += ["e63946", "f1faee", "a8dadc", "457b9d", "1d3557", "264653", "2a9d8f", "e9c46a", "f4a261", "e76f51"]

    names = names.each_with_index.map { |name, idx|
      Paint[name, colors.delete_at(rand(colors.length))]
      # Paint[name, colors[idx]]
    }
    rosario = []
    idx = 0
    50.times {
      rosario << names[idx]
      idx += 1
      if idx == names.count
        idx = 0
      end
    }

    table = TTY::Table.new(header: ["Peristiwa 1", "Peristiwa 2", "Peristiwa 3", "Peristiwa 4", "Peristiwa 5"])
    idx = 0
    10.times {
      table << [
        "#{idx + 1}. " + rosario[idx],
        "#{idx + 1}. " + rosario[idx + 10],
        "#{idx + 1}. " + rosario[idx + 20],
        "#{idx + 1}. " + rosario[idx + 30],
        "#{idx + 1}. " + rosario[idx + 40],
      ]

      idx += 1
    }
    puts table.render(:unicode, padding: [0, 3])
  end
end
