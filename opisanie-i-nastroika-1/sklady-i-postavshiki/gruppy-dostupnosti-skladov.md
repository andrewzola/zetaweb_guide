# Группы доступности складов

Zeta Web позволяет запретить отображение остатков товаров, добавление товаров в корзину, а также изменять порядок сортировки выдаваемых предложений на сайте.

Группа доступности может быть установлена:

* для группы клиентов \(роли\) 
* для веб-пользователя
* для контрагента
* для договора контрагента

{% hint style="info" %}
Список отсортирован в порядке от частного к общему. Таким образом, если группа доступности указана в договоре клиента, данное правило будет применено в независимости от настроек в других сущностях.
{% endhint %}

## Настройки групп доступности складов

Для настройки групп доступности необходимо открыть пункт меню: Zeta Web / Склады \(настройка отображения\) / Настройка групп доступности складов.

В открывшейся форме в левой части окна расположен список уже заведенных групп доступности, в правой - список складов, включенных в группу.

![&#x424;&#x43E;&#x440;&#x43C;&#x430; &#x43D;&#x430;&#x441;&#x442;&#x440;&#x43E;&#x439;&#x43A;&#x438; &#x433;&#x440;&#x443;&#x43F;&#x43F; &#x434;&#x43E;&#x441;&#x442;&#x443;&#x43F;&#x43D;&#x43E;&#x441;&#x442;&#x438; &#x441;&#x43A;&#x43B;&#x430;&#x434;&#x43E;&#x432;](../../.gitbook/assets/image%20%28387%29.png)

В каждую группу доступности можно включить остатки следующих типов:

* Склады - остатки из собственного наличия \(оптовые склады\)
* Товары в рознице - остатки из собственного наличия \(розничные склады и НТТ\)
* В пути - остатки, размещенные в заказе поставщику
* WSG -  остатки, получаемые от онлайн веб-сервисов поставщиков
* Прайс листы - остатки, загруженные в Виртуальный склад 3.0
* Под заказ - для отображения товаров, отсутствующих на каком-либо складе

В группу доступности можно включить остатки как по типу в целом, например, все оптовые склады, так и конкретный склад / поставщика / заказ поставщику.

{% hint style="info" %}
Для типов размещения "Склады" и "Товары в рознице", доступно уточнение в виде конкретного склада.

Для типа размещения "В пути", доступно уточнение в виде конкретного поставщика и конкретного заказа поставщику.

Для типов размещения "WSG" и "Прайс листы", доступно уточнение в виде конкретного поставщика и конкретного склада поставщика.
{% endhint %}

Дополнительно для каждой строки, входящей в группы доступности можно указать следующие настройки:

* Флаг "Только просмотр"
* Приоритет склада

При установленном флаге "Только просмотр" все предложения товаров с таких складов будут выведены на сайте справочно \(отключено добавление в корзину, и, следовательно, оформление заказов с таких складов\).

Порядок складов влияет на позицию товарно предложения в выдачи. Чем выше приоритет склада, тем выше товар в списке.

{% hint style="info" %}
После настройки групп доступности необходимо сохранить изменения. Для этого нажмите кнопку "Обновить группы доступности".
{% endhint %}

## Включение группы доступности складов

Установка группы доступности складов в роли веб-пользователей позволяет установить единые правила ограничения наличия товаров для группы веб-пользователей, входящих в состав данной роли.

![&#x41D;&#x430;&#x441;&#x442;&#x440;&#x43E;&#x439;&#x43A;&#x430; &#x433;&#x440;&#x443;&#x43F;&#x43F;&#x44B; &#x434;&#x43E;&#x441;&#x442;&#x443;&#x43F;&#x43D;&#x43E;&#x441;&#x442;&#x438; &#x441;&#x43A;&#x43B;&#x430;&#x434;&#x43E;&#x432; &#x432; &#x440;&#x43E;&#x43B;&#x438;](../../.gitbook/assets/image%20%2850%29.png)

Установка группы доступности веб-пользователя позволяет при необходимости добавить / переопределить настройки групп доступности складов для конкретного клиента.

![&#x41D;&#x430;&#x441;&#x442;&#x440;&#x43E;&#x439;&#x43A;&#x430; &#x433;&#x440;&#x443;&#x43F;&#x43F;&#x44B; &#x434;&#x43E;&#x441;&#x442;&#x443;&#x43F;&#x43D;&#x43E;&#x441;&#x442;&#x438; &#x441;&#x43A;&#x43B;&#x430;&#x434;&#x43E;&#x432; &#x432;&#x435;&#x431;-&#x43F;&#x43E;&#x43B;&#x44C;&#x437;&#x43E;&#x432;&#x430;&#x442;&#x435;&#x43B;&#x44F;](../../.gitbook/assets/image%20%283%29.png)

Установка группы доступности для конкретного контрагента

![&#x41D;&#x430;&#x441;&#x442;&#x440;&#x43E;&#x439;&#x43A;&#x430; &#x433;&#x440;&#x443;&#x43F;&#x43F;&#x44B; &#x434;&#x43E;&#x441;&#x442;&#x443;&#x43F;&#x43D;&#x43E;&#x441;&#x442;&#x438; &#x43A;&#x43E;&#x43D;&#x442;&#x440;&#x430;&#x433;&#x435;&#x43D;&#x442;&#x430;](../../.gitbook/assets/image%20%28436%29.png)

Установка группы доступности для конкретного договора контрагента

![&#x41D;&#x430;&#x441;&#x442;&#x440;&#x43E;&#x439;&#x43A;&#x430; &#x433;&#x440;&#x443;&#x43F;&#x43F;&#x44B; &#x434;&#x43E;&#x441;&#x442;&#x443;&#x43F;&#x43D;&#x43E;&#x441;&#x442;&#x438; &#x441;&#x43A;&#x43B;&#x430;&#x434;&#x43E;&#x432; &#x432; &#x434;&#x43E;&#x433;&#x43E;&#x432;&#x43E;&#x440;&#x435; &#x43A;&#x43E;&#x43D;&#x442;&#x440;&#x430;&#x433;&#x435;&#x43D;&#x442;&#x430;](../../.gitbook/assets/image%20%2857%29.png)

![&#x41F;&#x440;&#x438;&#x43C;&#x435;&#x440; &#x43E;&#x442;&#x43E;&#x431;&#x440;&#x430;&#x436;&#x435;&#x43D;&#x438;&#x44F; &#x441;&#x43A;&#x43B;&#x430;&#x434;&#x43E;&#x432; &#x43D;&#x430; &#x441;&#x430;&#x439;&#x442;&#x435;](../../.gitbook/assets/image%20%2893%29.png)

{% hint style="info" %}
В приведенном примере в карточке товара предложения со склада РМ1 \(тип остатков "Товары в рознице"\) находится выше предложений товаров со склада МИМ \(тип остатков "В пути"\), несмотря на более дорогую цену товара, т.к. приоритет склада РМ1 выше приоритета склада МИМ. Для предложений без наличия \(последние 2 строки\) не доступны поле ввода количества и кнопка добавления товара в корзину.
{% endhint %}

