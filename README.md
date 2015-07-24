# Cv::Generator

Simple CV generator from YAML file to PDF format.

## Installation

    $ gem install cv-generator

## Usage

Create sample YAML file "cv.yml":

```yaml
general:
  first_name: Jan
  last_name: Kowalski
  address: ul. Testowa 1/2, 11-111 Testowe
  birth_date: 01.01.1980
  email: foo@bar.com
  phone: 123-456-789
  websites: { GitHub: 'https://github.com/test',
              RubyGems: 'https://rubygems.org/profiles/test' }

skills:
  - Ruby 
  - Perl

other_skills:
  - Prawo jazdy, kategoria B

jobs:
  - { name: 'Test Sp. z o.o.', interval: '2011 - obecnie' }
  - { name: 'Test', interval: '2010 - 2011' }

education:
  - { name: 'Wyższa Szkoła', interval: '2000 - 2003' }

projects:
  - projekt nr 1
  - projekt nr 2
```

    cv_generator --from cv.yml


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dbackowski/cv-generator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

