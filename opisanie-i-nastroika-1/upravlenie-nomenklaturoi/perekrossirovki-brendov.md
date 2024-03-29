# Перекроссировка брендов

Zeta Web позволяет создавать перекросировки между собственными брендами, выбирая основной бренд, а также привязывать свои бренды к нужным эталонным брендам WSG.

Например, в 1С были созданы 2 номенклатуры с одинаковым артикулом, но разными брендами.

![&#x414;&#x443;&#x431;&#x43B;&#x438; &#x432; 1&#x421;](../../.gitbook/assets/image%20%28340%29.png)

Хотя это по сути один фильтр, но названы они по каким-то причинам по-разному. В результате на сайте при поиске пользователь увидит на этапе уточнения следующую картину:

![&#x41E;&#x442;&#x43E;&#x431;&#x440;&#x430;&#x436;&#x435;&#x43D;&#x438;&#x435; &#x434;&#x443;&#x431;&#x43B;&#x435;&#x439; &#x43D;&#x430; &#x441;&#x430;&#x439;&#x442;&#x435;](../../.gitbook/assets/image%20%28406%29.png)

Для того, чтобы исключить такие дубли и существует перекроссировка брендов.

## **Термины и определения**

Про собственные бренды есть соответствующий раздел - [бренды](brendy.md).

![&#x424;&#x43E;&#x440;&#x43C;&#x430; &#x44D;&#x43B;&#x435;&#x43C;&#x435;&#x43D;&#x442;&#x430; &#x441;&#x43F;&#x440;&#x430;&#x432;&#x43E;&#x447;&#x43D;&#x438;&#x43A;&#x430; &#x411;&#x440;&#x435;&#x43D;&#x434;&#x44B; \(Zeta Web\)](../../.gitbook/assets/image%20%2866%29.png)

{% hint style="info" %}
**"Одобрен" и "Не одобрен"** - носит информационный характер, влияет на подсветку брендов в табличной части обработки "Работа с дублями брендов". По умолчанию у всех брендов установлено значение "Не одобрен".

Одобренные бренды подсвечиваются зеленым цветом.
{% endhint %}

![&#x41F;&#x43E;&#x434;&#x441;&#x432;&#x435;&#x442;&#x43A;&#x430; &#x43E;&#x434;&#x43E;&#x431;&#x440;&#x435;&#x43D;&#x43D;&#x44B;&#x445; &#x431;&#x440;&#x435;&#x43D;&#x434;&#x43E;&#x432;](../../.gitbook/assets/image%20%28365%29.png)

{% hint style="info" %}
**Основной бренд** - признак бренда \(флаг\), определяющий, что к данному бренду будут приводиться другие бренды.
{% endhint %}

{% hint style="info" %}
**Эталонные бренды WSG** получаются из [Zeta Веб-сервисы](https://www.zetasoft.ru/products-zeta-webservices/) \(WSG\) и являются дополнительным реквизитом у бренда.

Эталонные бренды используются для:

* связи собственной номенклатуры с предложениями, полученными из веб-сервисов поставщиков через Zeta Веб-сервисы;
* помощи в перекроссировке собственных брендов с учетом уже созданных в WSG перекроссировок.

"id бренда WSG" - служебный параметр, хранится для сопоставления с эталонным брендом WSG.
{% endhint %}

## Обработка "Работа с дублями брендов"

Обработка для работы с дублями брендов доступна из формы справочника Бренды.

![](../../.gitbook/assets/image%20%2833%29.png)

![](../../.gitbook/assets/image%20%28421%29.png)

![&#x41E;&#x431;&#x440;&#x430;&#x431;&#x43E;&#x442;&#x43A;&#x430; &#x43F;&#x43E; &#x440;&#x430;&#x431;&#x43E;&#x442;&#x435; &#x441; &#x434;&#x443;&#x431;&#x43B;&#x44F;&#x43C;&#x438; &#x431;&#x440;&#x435;&#x43D;&#x434;&#x43E;&#x432;](../../.gitbook/assets/image%20%2827%29.png)

### Шапка

![](../../.gitbook/assets/image%20%28252%29.png)

В шапке находятся кнопки для управления, групповых операций и работе с WSG.

{% hint style="warning" %}
При большом количестве номенклатуры в 1С выполнение групповых операций может занимать продолжительное время.
{% endhint %}

#### Групповые операции

![](../../.gitbook/assets/image%20%28555%29.png)

* Обновить количество номенклатуры - подсчитывает и проставляет количество номенклатуры по каждому бренду.
* Переместить все необработанные бренды в основные бренды. Этой групповой операцией есть смысл воспользоваться в том случае, когда в необработанных брендах нет дублей.
* Переместить все основные бренды без эталонного и кроссов в необработанные бренды. Этой групповой операцией можно воспользоваться для того, чтобы вернуть все бренды, по которым нет привязки к эталонным брендом и не добавлены кроссы.

#### Групповые операции WSG

![](../../.gitbook/assets/image%20%28227%29.png)

* Подобрать эталонные бренды WSG - проверяет бренды через Zeta Веб-сервисы и заполняет реквизит "Эталонный бренд WSG" и "id бренда WSG" \(служебный реквизиты\).
* Одобрить бренды с эталонными названиями WSG - у всех брендов, которые точно совпали с названиями эталонных брендов WSG, будет установлен флаг "Одобрен" \(по умолчанию у всех брендов установлено значение "Не одобрен"\).
* Заполнить основные бренды по эталонным брендам WSG - переносит все бренды в основные бренды и кроссы к ним, у которых подобрался эталонный бренд WSG.

### Левая область

![](../../.gitbook/assets/image%20%28277%29.png)

В левой области находятся список необработанных брендов и список номенклатуры по выбранному бренду.

А также строка для поиска бренда.

{% hint style="info" %}
При установленном флаге "Автоотбор" при выбора любого бренда в списке необработанных брендов будет автоматически происходить поиск по первым трём символам в списке основных брендов.
{% endhint %}

### Правая область

В правой области находится список основных брендов, а так же кроссы, которые отображаются при выборе бренда.

{% hint style="info" %}
При установленном флаге "Автоотбор" при выбора любого бренда в списке основных брендов будет автоматически происходить поиск по первым трём символам в списке необработанных брендов.
{% endhint %}

## Порядок действий по обработке брендов

Мы рекомендуем следующую методику по начальной обработке брендов.

### Обновить количество номенклатуры

В групповых операциях выберите "Обновить количество номенклатуры". После выполнения операции рядом с каждым брендом появится количество номенклатуры в 1С с соответствующим брендом.

![](../../.gitbook/assets/image%20%28322%29.png)

### Подобрать эталонные бренды WSG

Следующий этап - подбор эталонных брендов WSG. Zeta Веб-сервисы \(WSG\) имеет свою базу перекроссировок, на основании которых и происходит подбор.

Для этого нажмите "Подобрать эталонные бренды" в выпадающем списке WSG.

![](../../.gitbook/assets/image%20%28227%29.png)

О начале и окончании операции будут соответствующие служебные сообщения.

![](../../.gitbook/assets/image%20%28131%29.png)

В результате у всех брендов, которые были найдены в WSG, будут заполнены эталонные бренды WSG.

![](../../.gitbook/assets/image%20%28103%29.png)

### Одобрить бренды с эталонными названиями WSG

Следующим этапом мы рекомендуем одобрить все бренды, у которых название в точности совпало с названием эталонного бренда WSG. Для этого нажмите "Одобрить бренды с эталонными названиями WSG" в выпадающем списке WSG.

После выполнения операции все одобренные бренды будут подсвечены зеленым цветом.

![](../../.gitbook/assets/image%20%28109%29.png)

### Заполнить основные бренды по эталонным брендам WSG

После этого мы рекомендуем перенести все бренды, у которых подобрался эталонный бренд WSG в список основных брендов \(т.е. у этих брендов будет проставлен флаг "Основной бренд"\).

{% hint style="warning" %}
Если несколько брендов соответствуют одному эталонному бренду WSG, то при переносе основным брендом будет сделан первый попавшийся бренд, а остальные будут добавлены в кроссы к этому основному бренду.
{% endhint %}

Для выполнения операции в списке WSG выберите пункт "Заполнить основные бренды по эталонным брендам WSG".

![](../../.gitbook/assets/image%20%28326%29.png)

После заполнения основных брендов рекомендуется просмотреть все основные бренды с кроссами. Для этого сделайте сортировку по колонке "Кол. кр. бр." и перейдите в начало списка.

![](../../.gitbook/assets/image%20%28214%29.png)

{% hint style="info" %}
Основные бренды, на которые созданы перекроссировки, выделены жирным, а также у них проставлено количество кроссов.
{% endhint %}

### Изменение основного бренда

По каждому выбранному основному бренду отображаются привязанные перекроссировки.

![](../../.gitbook/assets/image%20%28487%29.png)

#### Переименование бренда

Если основной бренд подобрался верно, но мы хотим изменить его наименование, то для этого необходимо открыть нужный бренд, нажав на него два раза, изменить наименование и нажать "Записать и закрыть".

![](../../.gitbook/assets/image%20%28298%29.png)

#### Изменение основного бренда

Если необходимо изменить основной бренд и кроссировки, то необходимо:

* Удалить все перекроссировки для выбранного основного бренда. Для выделения всех кросс-брендов нажмите Ctrl + A в списке кросс-брендов, после чего нажмите Delete для удаления и подтвердите действие.

![](../../.gitbook/assets/image%20%28236%29.png)

* После этого все бренды из списка кросс-брендов по этому основному бренду перейдут в список необработанных брендов.
* Откройте нужный основного бренда и снимите флаг "Основной бренд". После этого он также перейдет в список необработанных брендов.
* Выберите нужный необработанный бренд и нажмите "Переместить в основные бренды"

![](../../.gitbook/assets/image%20%2876%29.png)

* Создайте перекроссировки на выбранный основной бренд. Для этого выберите нужный бренд в необработанных и нажмите "Переместить в кросс-бренды". При этом обращайте внимание на выбранный основной бренд, т.к. перекроссировка будет создана на него.

![](../../.gitbook/assets/image%20%28295%29.png)

В результате получим новый основной бренд с перекроссировками.

![&#x420;&#x435;&#x437;&#x443;&#x43B;&#x44C;&#x442;&#x430;&#x442; &#x438;&#x437;&#x43C;&#x435;&#x43D;&#x435;&#x43D;&#x438;&#x44F; &#x43E;&#x441;&#x43D;&#x43E;&#x432;&#x43D;&#x43E;&#x433;&#x43E; &#x431;&#x440;&#x435;&#x43D;&#x434;&#x430;](../../.gitbook/assets/image%20%2884%29.png)

### Обработка оставшихся брендов

Заключительный этап - обработка брендов, которые не подобрались через WSG. Порядок действий примерно следующий:

* Просматриваем список, видим бренд, который называется некорректно \(на этом этапе рекомендуем включить "Автоотбор" в необработанных брендах\).

![](../../.gitbook/assets/image%20%28358%29.png)

* При включенном флаге "Автоотбор" и выборе бренда "BAW \(JASON CO., LTD.\)" в основных брендах будет отобран бренд "BAW".

![](../../.gitbook/assets/image%20%281%29.png)

* Если мы понимаем, что это кросс-бренд, то нажимаем "Переместить в кросс-бренды", предварительно выбрав основной бренд.
* Также в процессе мы можем переименовать или пометить бренд на удаление.

{% hint style="danger" %}
При установке пометки на удаление обращайте внимание на наличие номенклатуры, которая участвовала в движениях. Т.к. при наличии ссылок на нее в документах 1С не даст просто удалить ее.
{% endhint %}

![](../../.gitbook/assets/image%20%28232%29.png)

* В результате в необработанных останутся только те бренды, наименования которых мы считаем правильными. Их мы можем либо переносить в основные каждый в ручном режиме, либо воспользоваться соответствующей групповой операцией. 

![](../../.gitbook/assets/image%20%28434%29.png)

