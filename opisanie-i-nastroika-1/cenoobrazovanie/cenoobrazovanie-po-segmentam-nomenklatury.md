# Ценообразование по сегментам номенклатуры

Ценообразование по сегментам номенклатуры является дополнительным функционалом, расширяющим стандартные возможности 1С "Управление торговлей" ред. 10.3, с помощью разнесения номенклатуры по произвольным признакам к какому-либо сегменту, определенному пользователем.

Для создания нового правила ценообразования по сегментам должны необходимо:

1. Создать или выбрать сегмент номенклатуры.
2. Настроить схему отбора номенклатуры, которая принадлежит этому сегменту.
3. Создать новое правило ценообразования.

Для создания нового правила перейдем в форму регистра сведений, расположенную в меню "Zeta Web - Ценообразование - По сегментам номенклатуры покупателей - Правила ценообразования по сегментам".

![&#x424;&#x43E;&#x440;&#x43C;&#x430; &#x43F;&#x440;&#x430;&#x432;&#x438;&#x43B; &#x446;&#x435;&#x43D;&#x43E;&#x43E;&#x431;&#x440;&#x430;&#x437;&#x43E;&#x432;&#x430;&#x43D;&#x438;&#x44F; &#x43F;&#x43E; &#x441;&#x435;&#x433;&#x43C;&#x435;&#x43D;&#x442;&#x430;&#x43C;](../../.gitbook/assets/image%20%28193%29.png)

1. Левая область - список всех сегментов \(там же и создаем новые\).
2. Центральная - список правил для выбранного сегмента.
3. Правая - список контрагентов, для кого может быть применено правило.

## **Создание нового сегмента**

Для создания нового сегмента в левой области формы нажимаем кнопку "Создать новый элемент списка \(lns\)".

![&#x421;&#x43E;&#x437;&#x434;&#x430;&#x442;&#x44C; &#x43D;&#x43E;&#x432;&#x44B;&#x439; &#x44D;&#x43B;&#x435;&#x43C;&#x435;&#x43D;&#x442; &#x441;&#x43F;&#x438;&#x441;&#x43A;&#x430;](../../.gitbook/assets/image%20%28573%29.png)

Открывается форма создания нового элемента.

![](../../.gitbook/assets/image%20%28215%29.png)

Присваиваем имя элементу \(нашему сегменту\) и при необходимости заполняем описание - памятку, что входит в данный сегмент.

{% hint style="info" %}
Сортировка приоритетов нужна для создания иерархии внутри списка сегментов. Это полезно в ситуациях,если одна номенклатура попала в несколько сегментов.  
В случае, когда одна номенклатура попала в несколько сегментов, к ней применяется правило сегмента с более высоким приоритетом.
{% endhint %}

Далее создаем отбор номенклатуры - на основании этого отбора заполняется наш регистр "Состав сегментов номенклатуры", который содержит сегмент, номенклатуру и характеристику.

![&#x41D;&#x430;&#x441;&#x442;&#x440;&#x43E;&#x439;&#x43A;&#x430; &#x441;&#x43E;&#x441;&#x442;&#x430;&#x432;&#x430; &#x441;&#x435;&#x433;&#x43C;&#x435;&#x43D;&#x442;&#x430;](../../.gitbook/assets/image%20%2869%29.png)

В открытой форме добавляем условия, по которым мы будем наполнять наш регистр. Отбор строится с помощью стандартной схемы компоновки:

![&#x414;&#x43E;&#x431;&#x430;&#x432;&#x43B;&#x435;&#x43D;&#x438;&#x435; &#x43E;&#x442;&#x431;&#x43E;&#x440;&#x43E;&#x432;](../../.gitbook/assets/image%20%28346%29.png)

После установки отборов завершаем редактирование.

По нажатию кнопки "Сформировать" происходит заполнение регистра согласно выбранным отборам.

![](../../.gitbook/assets/image%20%28146%29.png)

Для автоматического последующего отнесения новой номенклатуры к нужному сегменту настроим регламентное задание:

![](../../.gitbook/assets/image%20%28396%29.png)

Теперь наш сегмент будет обновляться автоматически.

Кроме того, если необходимо - указываем порядок в сортировке приоритетов.

## Создание нового правила ценообразования

В форме списка регистра сведений "Правила ценообразования по сегментам" выбираем созданный нами сегмент и формируем для него правило.

![](../../.gitbook/assets/image%20%28349%29.png)

Правила бывают 2-х типов:

* Общие
* Для конкретного контрагента или договора

Если мы хотим создать общее правило, которое будет работать для всех наших клиентов, то в центральной части экрана нажимаем на кнопку "Создать общее правило".

![&#x421;&#x43E;&#x437;&#x434;&#x430;&#x442;&#x44C; &#x43E;&#x431;&#x449;&#x435;&#x435; &#x43F;&#x440;&#x430;&#x432;&#x438;&#x43B;&#x43E;](../../.gitbook/assets/image%20%2858%29.png)

В открывшейся форме устанавливаем приоритет правила, а также сам принцип ценообразования.

![](../../.gitbook/assets/image%20%28366%29.png)

**"Процент наценки скидки"**

При выборе этого правила пользователь задает наценку или скидку на позиции номенклатуры сегмента.  
В поле "Скидка \(наценка\) в %" указываем числовое значение в процентах. Скидка указывается положительным числом, наценка - отрицательным.

_**"Фиксированная цена"**_

Задание фиксированной цены для всей номенклатуры, попавшей в сегмент.

_**"Сумма наценки скидки"**_

К стоимости позиции прибавляется \(убавляется\) фиксированная сумма скидки \(наценки\).

_**"Сначала отнять сумму, потом процент"**_

От стоимости позиции вычитается сумма скидки \(наценки\), после чего к полученному числу применяется процент.

_**"Сначала отнять процент, потом сумму"**_

От стоимости позиции вычитается процент скидки \(наценки\), после чего к полученному числу применяется число из поля "Сумма".

{% hint style="info" %}
**Важно!** Цена и сумма указываются в валюте управленческого учета.
{% endhint %}

\*\*\*\*

\*\*\*\*

## **Алгоритм создания частного правила для конкретного договора или контрагента**

Создание такого правила немного отличается от создания общего правила.

Кнопка "Создать правило по покупателю \(договору\) позволяет создать правило для активного элемента списка. Для формирования правила сразу для нескольких контрагентов можно настроить список и выбрать команду из меню "Все действия - Создать / сортировать правила".

![](../../.gitbook/assets/image%20%28446%29.png)

{% hint style="info" %}
Важно! На форме имеются флаги отображения "По всем сегментам", "Только общие правила", "По всем покупателям". Они помогают отображать правила с различными фильтрами. Выбранная настройка отображается сверху в строке жирным шрифтом.
{% endhint %}

## Видеопример настройки ценообразования по сегментам

{% embed url="https://youtu.be/oN9R5dxHRdU" caption="" %}

{% hint style="info" %}
**Важно!** Для применения дополнительного ценообразования на сайте в настройках обмена с сайтом в разделе "Объекты Zeta Web - Цены" должны быть включены объекты обмена "Состав сегментов номенклатуры" и "Правила ценообразования по сегментам"
{% endhint %}

