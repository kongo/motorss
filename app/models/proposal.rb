class Proposal < ActiveRecord::Base

  VEHICLE_TYPES_NAMES = {
    classic:        'Классик',
    neoclassic:     'Неоклассик',
    chopper:        'Чоппер',
    sport:          'Спорт',
    sporttourist:   'Спорт-турист',
    tourist:        'Турист',
    enduro:         'Эндуро',
    cross:          'Кросс',
    pitbike:        'Питбайк',
    supermoto:      'Супермото',
    trial:          'Триал',
    scooter:        'Скутер',
    maxiscooter:    'Максискутер',
    custom:         'Кастом',
    trike:          'Трайк',
    quadracycle:    'Квадроцикл',
    watercraft:     'Гидроцикл',
    snowmobile:     'Снегоход'
  }
  VEHICLE_TYPES = VEHICLE_TYPES_NAMES.keys

  PAPERS_TYPES_NAMES = [
    "Модель не для дорог общего пользования",
    "Не растаможен(есь зарубежные доки)",
    "\"Свои\" документы(деланые)",
    "Без документов",
    "Снят с учета",
    "Стоит на укр.учете",
    "Справка-счет на покупателя"
  ]
  PAPER_TYPES_LEGAL_INDEXES = {
    legal:   [4, 5, 6],
    illegal: [1, 2, 3],
    na:      [0]
  }

  REGIONS_BY_INDEX = {
    1  => 'Винница',
    11 => 'Днепропетровск',
    13 => 'Донецк',
    2  => 'Житомир',
    14 => 'Запорожье',
    15 => 'Ивано',
    29 => 'Керчь',
    10 => 'Киев',
    16 => 'Кировоград',
    31 => 'Кривой',
    27 => 'Крым',
    17 => 'Луганск',
    18 => 'Луцк',
    5  => 'Львов',
    28 => 'Мелитополь',
    19 => 'Николаев',
    12 => 'Одесса',
    20 => 'Полтава',
    9  => 'Ровно',
    30 => 'Севастополь',
    21 => 'Симферополь',
    8  => 'Сумы',
    3  => 'Тернополь',
    22 => 'Ужгород',
    26 => 'Феодосия',
    7  => 'Харьков',
    23 => 'Херсон',
    4  => 'Хмельницкий',
    24 => 'Черкассы',
    6  => 'Чернигов',
    25 => 'Черновцы'
  }

  validates_inclusion_of   :vehicle_type, in: VEHICLE_TYPES
  validates_presence_of    :uin
  validates_uniqueness_of  :uin

  default_scope ->() { order 'uin desc' }
  scope :page, ->(num, per_page = 100) {
    num = 1 unless num.present?
    offset((num.to_i - 1) * per_page).limit(per_page)
  }

  def title
    "#{make} - #{model_name} (#{year_built}) - #{price} - #{location}"
  end

  def full_link
    "http://" + Parsers::Motosale::ENDPOINT + "/" + link
  end
end
