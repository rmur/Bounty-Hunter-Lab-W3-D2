require('pry-byebug')
require_relative('bounty_hunter')

BountyHunter.delete_all

creature1 = BountyHunter.new ({'name' => 'Travis', 'species' => 'big_frog', 'bounty_value' => '1500', 'homeworld' => 'Disneyland'})
creature2 = BountyHunter.new ({'name' => 'Roman', 'species' => 'mini_dog', 'bounty_value' => '1200', 'homeworld' => 'Siberya'})

creature1.save()
creature1.name = "Guy"
creature1.update


BountyHunter.find(1)