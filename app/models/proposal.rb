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

  validates_inclusion_of   :vehicle_type, in: VEHICLE_TYPES
  validates_presence_of    :uin
  validates_uniqueness_of  :uin

  default_scope ->() { order 'uin desc' }

  def title
    "#{make} - #{model_name} (#{year_built}) - #{price}"
  end

  def full_link
    "http://" + Parsers::Motosale::ENDPOINT + "/" + link
  end
end
