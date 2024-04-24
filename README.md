# qa-day2-ios-ruby

iOS App Test Otomasyon Projesi


# Tool stack

* **Ruby** - Development language
* **RubyMine IDE** - Development IDE
* **Allure** Multi-language test report tool
* **Cucumber** - Gherkin Syntax Framework
* **RSpec** - Assertion & Validation Framework
* **Appium** - Mobile APP Test Automation Tool

# Kurulumlar

* Kurulumlar için projedeki ruby-ios-android kurulum.pdf takip edilmelidir.
* Gerekli kütüphanelerin yüklenilebilmesi için proje dizininde aşağıdaki komutlar çalıştırılır.
  ```
  gem install bundler
  bundle install
  ```

# Testlerin Çalıştırılması

1. IDE üzerinden yeşil RUN butonu ile senaryo ya da feature bazlı çalıştırılabilir.


2. Terminalden ilgili proje dizininde senaryo ismi ile çalıştırma:

   `cucumber --name "Successful login"`


3. Terminalden ilgili proje dizininde scenario ya da feature tag'i ile çalıştırma:

   `cucumber --tag @smoke`


4. Local device ya da cloud device lab'da çalıştırmak için:

   `cucumber --tag @successful_login device_type=cloud`

# Raporlama
* Raporlama aracı olarak allure report kullanılmaktadır.


* Allure report oluşturmak için allure pc'nizde kurulu olmalıdır.

    * Mac kurulum

      `brew install allure`

    * Windows Kurulum

        * Powershell açılır. Aşağıdaki komut çalıştırılır. Scoop kurulumu yapılır.

          `iwr -useb get.scoop.sh | iex`

        * Scoop başarılı kurulduktan sonra komut satırı açılır. Aşağıdaki komut çalıştırılır. Allure kurulumu yapılır.

          `scoop install allure`


* Allure report generate etmek için proje dizininde oluşan allure-results folder yolu verilerek aşağıdaki komut çalıştırılır.

  `allure serve output/allure-results `


# Project Folder Structure

```
├── Gemfile                                         #Projenin kullanılacak kütüphanelerin yönetimi
├── README.md                                   
├── apps                                            #İlgili apk'ların tutulduğu dizin
├── config                                          #Projeye ait configürasyonlar
│   ├── base
│   │   └── base_config.rb
│   └── device
│       └── device_config.yml
├── cucumber.yml
├── features
│   ├── pages                                        #Page Object Model implementasyonu için kullanılacaktır
│   │      └── login_page.rb
│   ├── step_definitions                             #Senaryolara ait step tanımlamalarının yapıldığı dizin
│   │   └── login_steps.rb
│   ├── support                                      #Hooks ve env tanımlamalarının yapıldığı dizin
│   │   ├── env.rb
│   │   └── hooks.rb
│   └── tests                                        #Gherkin Synxtaxı'ndaki senaryoların bulunduğu dizin
└── utils                                              #Utils class ve metodların yer aldığı dizin
    ├── loggers.rb
    └── page_helper.rb
```