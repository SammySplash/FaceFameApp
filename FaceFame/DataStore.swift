//
//  DataStore.swift
//  FaceFame
//
//  Created by Ast on 20.03.2025.
//

import Foundation

struct DataStore {
    static let maleActors = [
        "Аль Пачино": "Знаменит за роль в 'Крестном отце' и получил 'Оскар' за 'Запах женщины'",
        "Джонни Депп": "Стал мировым символом благодаря роли Джэка Воробья в 'Пиратах Карибского моря'",
        "Леонардо ДиКаприо": "Получил 'Оскар' за роль в 'Выжившем', известен по ролям в 'Титанике' и 'Начале'",
        "Том Хэнкс": "Обладатель двух 'Оскаров' за роль в 'Форресте Гампе' и 'Филадельфии'",
        "Роберт Дауни-младший": "Звезда 'Железного человека' и киновселенной Marvel",
        "Мэтт Дэймон": "Известен по ролям в 'Солдатах удачи' и 'Марсианине', а также получил 'Оскар' за 'Умницу Уилл Хантинга'",
        "Бенедикт Камбербэтч": "Исполнил роль Доктора Стрэнджа в одноимённом фильме Marvel, также прославился благодаря роли Шерлока Холмса",
        "Кристиан Бейл": "Звезда 'Темного рыцаря', получил 'Оскар' за роль в 'Машинисте' и 'Афера по-американски'",
        "Хью Джекман": "Обладатель 'Золотого глобуса' за роль в 'Отверженных', известен как Росомаха из 'Людей Икс'",
        "Дензел Вашингтон": "Дважды лауреат 'Оскара', известен по ролям в 'Тренировочном дне' и 'Гладиаторе'",
        "Морган Фриман": "Обладатель 'Оскара' за роль в 'Миллионерах', стал культовой фигурой благодаря 'Северной звезде'",
        "Маттиас Шонартс": "Известен по ролям в 'Коде незнакомца' и 'Тени Геракла'",
        "Эдвард Нортон": "Звезда 'Бойцовского клуба', также снялся в 'Американской истории Х'",
        "Джуд Лоу": "Исполнил роли в 'Шерлоке Холмсе' и 'Облачном атласе'",
        "Иэн Маккеллен": "Звезда 'Властелина колец' и 'X-Men', получил 'Оскар' за роль в 'Преступлении'",
        "Вин Дизель": "Известен по роли Доминика Торетто в франшизе 'Форсаж'",
        "Джордж Клуни": "Получил 'Оскар' за роль в 'Сириане', также звезда 'Гравитации' и 'Одиннадцати друзей Оушена'",
        "Уилл Смит": "Звезда 'Легенды о Бенджамине Баттоне' и 'Мужчины в черном', дважды номинирован на 'Оскар'",
        "Джеймс МакЭвой": "Звезда 'Рок-н-ролльщика' и 'Трансов', также сыграл в 'Почтальоне'",
        "Рассел Кроу": "Лауреат 'Оскара' за роль в 'Гладиаторе', также сыграл в 'Пророке'",
        "Киану Ривз": "Известен по ролям в 'Матрице' и 'Джоне Уике', культовый актёр экшн-фильмов",
        "Хоакин Феникс": "Звезда 'Джокера', получивший 'Оскар' за эту роль, также известен по 'Гладиатору' и 'Мастеру'",
        "Чедвик Боузман": "Звезда 'Черной пантеры', умер слишком рано, оставив великое наследие",
        "Том Харди": "Известен по ролям в 'Безумном Максе' и 'Темном рыцаре: Возрождение легенды'",
        "Джеймс Франко": "Звезда 'Серии братьев Де Бондс' и '127 часов'",
        "Шон Пенн": "Дважды лауреат 'Оскара' за 'Мистера Смитса' и 'Догоняющую черту'",
        "Кевин Спейси": "Звезда 'Короля Града' и 'Образца операционного примера'",
        "Марк Уолберг": "Известен по ролям в 'Интерстелларе' и 'Косячные дни'",
        "Александр Скарсгард": "Сыграл в 'Сказках' и 'Мастера исполнения'",
        "Райан Рейнольдс": "Известен по ролям в 'Дэдпуле' и 'Багамский экспресс'",
        "Эмиль Хирш": "Звезда 'Князя мракосучков', лауреат 'Мишинового фильме'",
        "Пенелопа Крус": "Исполнил роль в 'Шерлок Холмсе: Джек-Сибири'",
        "Николас Кейдж": "Талантливый актёр из фильма 'Законопроводчики с банкистером'",
        "Тим Рот": "Известен по фильму 'Риманство'",
        "Марк Руффало": "Известен своим участием в 'Блоке норм'",
        "Джек Николсон": "Знаменит за роль в 'Сиянии' и получил 'Оскар' за 'Лучше звоните Солу'",
        "Крис Хемсворт": "Звезда 'Тора' и 'Мстителей' в киновселенной Marvel",
        "Роберт Паттинсон": "Известен как Эдвард из 'Сумерек', а также снялся в 'Космополисе' и 'Клиенте'",
        "Джереми Реннер": "Звезда 'Мстителей', исполнил роль Соколиных Глаз в фильмах Marvel",
        "Томми Ли Джонс": "Получил 'Оскар' за роль в 'На грани совершенства', также звезда 'Ларго Винча'",
        "Даниэль Крейг": "Известен как Джеймс Бонд в серии фильмов о шпионе 007",
        "Валь Килмер": "Исполнил роль в 'Топ Ган' и 'Томасе Томаске' 'Солс'",
        "Гэри Олдман": "Лауреат 'Оскара' за роль в 'Темном рыцаре', также сыграл в 'Царе-рыбе'",
        "Мэтт Смит": "Известен по ролям в 'Докторе Кто' и 'Стариках под Северной звездой'",
        "Аарон Пол": "Известен по роли Джесси Пинка в сериале 'Во все тяжкие'",
        "Дэвид Теннант": "Стал культовой фигурой благодаря роли Доктора в 'Докторе Кто'",
        "Нэйтан Филлион": "Звезда 'Кастетных нападений' и 'Сыгранных резисторов'",
        "Лиам Нисон": "Исполнил роли в 'Заложнице' и 'Светлой стороне ночи'",
        "Сэмюэл Л. Джексон": "Известен по ролям в 'Пульпе' и 'Токамако'",
        "Тимоти Шаламе": "Звезда 'Легенды о Бенджамине Баттоне' и 'Неудобных любимцев'",
        "Эдди Мерфи": "Известен по ролям в 'Дело' и 'Трудных странах'"
    ]
    
    static let femaleActors = [
        "Анджелина Джоли": "Исполнила роль Лары Крофт в 'Расхитительнице гробниц' и является послом доброй воли ООН",
        "Мэрил Стрип": "Известна по роли Миранды Пристли в 'Дьявол носит Prada', имеет рекордное количество номинаций на 'Оскар'",
        "Натали Портман": "Получила 'Оскар' за роль в 'Чёрном лебеде', также известна по роли Падме в 'Звёздных войнах'",
        "Джулия Робертс": "Стала знаменитой после роли в 'Красотке', также получила 'Оскар' за фильм 'Эрин Брокович'",
        "Кейт Уинслет": "Исполнила роль Розы в 'Титанике' и является обладательницей премии 'Оскар' за фильм 'Чтец'",
        "Сандра Буллок": "Сыграла астронавта в 'Гравитации' и получила 'Оскар' за роль в 'Невидимой стороне'",
        "Шарлиз Терон": "Преобразилась до неузнаваемости для роли в 'Монстре', за которую получила 'Оскар'",
        "Скарлетт Йоханссон": "Исполнила роль Чёрной вдовы в 'Мстителях' и была дважды номинирована на 'Оскар' в один год",
        "Кейт Бланшетт": "Получила 'Оскар' за роль в 'Авиаторе' и сыграла эльфийку Галадриэль в 'Властелине колец'",
        "Эмма Уотсон": "Прославилась благодаря роли Гермионы в 'Гарри Поттере', активно занимается правозащитной деятельностью",
        "Дженнифер Лоуренс": "Получила 'Оскар' за роль в 'Мой парень — псих' и известна по франшизе 'Голодные игры'",
        "Марго Робби": "Исполнила роль Харли Квинн в 'Отряде самоубийц' и номинировалась на 'Оскар' за 'Тоня против всех'",
        "Галь Гадот": "Стала мировой звездой благодаря роли Чудо-женщины в одноимённом фильме DC",
        "Кирстен Данст": "Известна по роли Мэри Джейн в трилогии 'Человек-паук' Сэма Рэйми",
        "Виола Дэвис": "Получила 'Оскар' за фильм 'Ограды' и известна по сериалу 'Как избежать наказания за убийство'",
        "Мила Кунис": "Сыграла в 'Черном лебеде' и прославилась благодаря роли в сериале 'Шоу 70-х'",
        "Риз Уизерспун": "Звезда 'Блондинки в законе', получила 'Оскар' за роль в фильме 'Переступить черту'",
        "Кейт Мара": "Известна по ролям в 'Карточном домике' и 'Фантастической четвёрке'",
        "Оливия Уайлд": "Прославилась благодаря роли в сериале 'Доктор Хаус', перешла в режиссуру с фильмом 'Забивай'",
        "Дакота Джонсон": "Стала известной благодаря роли Анастейши Стил в 'Пятьдесят оттенков серого'",
        "Зои Салдана": "Сыграла Нейтири в 'Аватаре' и Гамору в 'Стражах Галактики'",
        "Кэмерон Диас": "Звезда фильмов 'Маска', 'Ангелы Чарли' и 'Отпуск по обмену'",
        "Дженнифер Энистон": "Стала иконой благодаря роли Рэйчел Грин в 'Друзьях'",
        "Мишель Пфайффер": "Прославилась после 'Лица со шрамом', также сыграла Женщину-кошку в 'Бэтмен возвращается'",
        "Шэрон Стоун": "Знаменита ролью в 'Основном инстинкте', за которую получила мировую известность",
        "Хелен Миррен": "Получила 'Оскар' за роль Елизаветы II в фильме 'Королева'",
        "Гвинет Пэлтроу": "Лауреатка 'Оскара' за роль в 'Влюблённом Шекспире', известна как Пеппер Поттс в 'Железном человеке'",
        "Дрю Бэрримор": "Известна с детства после 'Инопланетянина', звезда 'Ангелов Чарли'",
        "Люпита Нионго": "Получила 'Оскар' за '12 лет рабства', также сыграла в 'Чёрной пантере'",
        "Энн Хэтэуэй": "Звезда 'Дьявол носит Prada', получила 'Оскар' за роль в 'Отверженных'",
        "Сигурни Уивер": "Стала иконой научной фантастики благодаря роли Рипли в серии фильмов 'Чужой'",
        "Джоди Фостер": "Лауреатка двух 'Оскаров', прославилась благодаря 'Молчанию ягнят'",
        "Кристен Стюарт": "Стала известной благодаря роли Беллы в саге 'Сумерки'",
        "Эмма Стоун": "Получила 'Оскар' за роль в 'Ла-Ла Ленд', известна по 'Бердмену' и 'Отряду самоубийц'",
        "Николь Кидман": "Обладательница 'Оскара', звезда 'Мулен Руж!' и 'Часов'",
        "Кейт Хадсон": "Прославилась благодаря роли в 'Почти знаменит'",
        "Мег Райан": "Королева романтических комедий, известна по 'Когда Гарри встретил Салли'",
        "Сальма Хайек": "Исполнила главную роль в байопике 'Фрида'",
        "Ума Турман": "Музa Квентина Тарантино, сыграла в 'Криминальном чтиве' и 'Убить Билла'",
        "Вайнона Райдер": "Звезда 'Битлджуса' и 'Очень странных дел'",
        "Моника Беллуччи": "Стала иконой стиля после фильма 'Малена'",
        "Деми Мур": "Известна по ролям в 'Призраке' и 'Солдат Джейн'",
        "Сьюзан Сарандон": "Звезда 'Тельма и Луиза', лауреатка 'Оскара' за фильм 'Мертвец идёт'",
        "Кейт Бекинсейл": "Стала известной после серии фильмов 'Другой мир'",
        "Холли Берри": "Первая афроамериканка, получившая 'Оскар' за главную женскую роль в 'Бал монстров'",
        "Элизабет Олсен": "Известна по роли Алой Ведьмы в киновселенной Marvel",
        "Анжела Бассетт": "Сыграла в 'Что-то на мне есть' и 'Черной пантере', номинировалась на 'Оскар' за роль в 'Сутенерах'",
        "Лили Джеймс": "Прославилась ролью в 'Молодом Виктории' и 'Мамма миа! 2'",
        "Тильда Суинтон": "Лауреатка 'Оскара' за роль в 'Томбе Роберта Джексона' и известна благодаря ролям в 'Докторе Стрэндже'",
        "Лора Дерн": "Звезда 'Секретного материала' и обладательница 'Оскара' за роль в 'Маленькая женщина'",
        "Ребекка Холл": "Известна по ролям в 'Истории игрушек 3' и 'Джокере'",
        "Джоди Тёрнер-Смит": "Исполнила роль в 'Соль земли' и сыграла в 'Куче афиши'"
    ]
    
    static func image(for actor: String) -> String? {
        if maleActors.keys.contains(actor) || femaleActors.keys.contains(actor) {
            return actor.replacingOccurrences(of: " ", with: "_")
        }
        return nil
    }
}
