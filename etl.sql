-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Янв 13 2017 г., 23:44
-- Версия сервера: 10.1.16-MariaDB
-- Версия PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `etl`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_product` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `id_product`, `type`, `brand`, `model`, `comments`) VALUES
(1, 37164441, 'Dyski', 'GoodRam', 'GoodRam Iridium Pro 240GB (SSDPR-IRIDPRO-240)', 'Dysk SSD o pojemno??ci 240GB.  Interfejs SATA3, format 2,5cala, zapis - 535MB/s, odczyt - 560MB/s');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `id_product` int(255) NOT NULL,
  `autor` varchar(255) CHARACTER SET latin1 NOT NULL,
  `advanteges` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `disadvanteges` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(5000) CHARACTER SET latin1 DEFAULT NULL,
  `stars` int(1) DEFAULT NULL,
  `date` varchar(255) CHARACTER SET latin1 NOT NULL,
  `recomend` varchar(255) CHARACTER SET latin1 NOT NULL,
  `voiceYes` int(255) DEFAULT NULL,
  `voiceNo` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `id_product`, `autor`, `advanteges`, `disadvanteges`, `description`, `stars`, `date`, `recomend`, `voiceYes`, `voiceNo`) VALUES
(1, 37164441, 'Alus', 'gwarancja 5 lat,szybkoÅ›c,trwaÅ‚oÅ›Ä‡,', '', 'dysk bardzo szybki, laptop po zmianie na tego gooodram `a pro dziaÅ‚a jak nowy, polecam wszystkim, na plus tez 5 lat gwarancji', 5, '2016-04-06 15:07:52', 'Polecam', 15, 4),
(2, 37164441, 'JarosÅ‚aw', '', '', 'Rewelacja - po clonowaniu systemu (Windows 7) rÃ³Å¼nica w szybkoÅ›ci dziaÅ‚ania powalajÄ…ca.\r\nzdecydowanie polecam', 5, '2016-03-07 17:06:58', 'Polecam', 7, 6),
(3, 37164441, 'Karol', '', '', 'Dysk o rewelacyjnych parametrach. W wiÄ™kszoÅ›ci testÃ³w bardzo blisko samsunga 850  pro. PiÄ™Ä‡ lat gwarancji, bardzo dobra jakoÅ›Ä‡ wykonania. \r\nZdecydowanie polecam.', 5, '2016-05-08 19:27:24', 'Polecam', 4, 1),
(4, 37164441, 'bartez11', 'cena,pojemnoÅ›Ä‡,szybkoÅ›c,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Åšwietny polski produkt', 5, '2016-04-19 15:37:18', 'Polecam', 6, 6),
(5, 37164441, 'Mudking', '', '', 'Mam 4 sztuki. Szybkie. Jeden uszkodziÅ‚ siÄ™ przez wirusa (zapis na dysk nie byÅ‚ moÅ¼liwy.\r\nOgÃ³lnie polecam/', 4, '2016-03-25 16:10:33', 'Polecam', 5, 11),
(6, 37164441, 'Bartek', 'cena,design,gwarancja 5 lat,pojemnoÅ›Ä‡,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,wysokoÅ›Ä‡ 7mm,', '', 'Wszystko bez problemu i sprawnie ruszyÅ‚o. Puki co nie mam Å¼adnych zastrzeÅ¼eÅ„.', 5, '2016-09-08 15:46:58', 'Polecam', 2, 2),
(7, 37164441, 'irekb', '', '', 'ok', 5, '2016-09-07 12:16:28', 'Polecam', 1, 6),
(8, 37164441, 'Kopek', '', '', 'PrÄ™dkoÅ›c dziaÅ‚ania systemu jest b.duÅ¼a.', 4, '2016-10-17 08:15:43', 'Polecam', 0, 1),
(9, 37164441, 'piotr', '', '', 'szybki dobry dysk na zainstalowanie systemu', 5, '2016-09-01 19:25:32', 'Polecam', 0, 1),
(10, 37164441, 'UÅ¼ytkownik Ceneo', '', '', 'Polecam jeden z najlepszych dyskÃ³w SSD', 5, '2017-01-12 16:39:36', 'Polecam', 0, 0),
(11, 37164441, 'TM', '', '', 'Chyba najlepszy stosunek jakoÅ›ci do ceny.', 5, '2017-01-03 11:23:35', 'Polecam', 0, 0),
(12, 37164441, 'Krzysztof', '', '', 'Dysk bardzo szybki i cichy, po jego zamontowaniu po prostu nie sÅ‚ychaÄ‡ komputera, wszystko Å›miga jak naleÅ¼y, zdecydowanie polecam', 5, '2016-12-31 21:37:57', 'Polecam', 0, 0),
(13, 37164441, 'Krzysiek', '', '', 'Poprzedni dysk to Goodram SSD C40 240GB - wytrzymaÅ‚ 2 lata. Kolejny to Goodram SSD C200 240GB. Kilka dni problemÃ³w z instalacjÄ… systemu, dwa tygodnie zwiÄ…zane z reklamacjÄ… dysku. Mimo to kupiÅ‚em kolejnego Goodrama. Instalacja bezproblemowa. SzybkoÅ›Ä‡ logowania do systemu - kilkanaÅ›cie sekund, znacznie przyspieszone programy i Å‚adowanie lokacji w grach. UÅ¼ywam dysku jako systemowego. Dysk posiadam za krÃ³tko Å¼eby poleciÄ‡ lub przestrzegaÄ‡, jednak 5 lat gwarancji trochÄ™ uspokaja.', 5, '2016-12-28 09:38:02', 'Polecam', 0, 0),
(14, 37164441, 'Tomasz', '', '', 'Jestem na poczatku uzytkowania lecz jestem zadowolony', 5, '2016-12-15 20:48:25', 'Polecam', 0, 0),
(15, 37164441, 'arek', '', '', 'Bardzo dobra oferta polskiego producenta, polecam', 5, '2016-12-12 14:04:29', 'Polecam', 0, 0),
(16, 37164441, 'mich', '', '', 'Aktualnie najrozsÄ…dniejszy ssd 240GB', 5, '2016-12-09 02:58:49', 'Polecam', 0, 0),
(17, 37164441, 'Leszek', '', '', 'DziaÅ‚a zgodnie z oczekiwaniem. Nie miaÅ‚em Å¼adnych problemÃ³w. pewniejszy i trwalszy od Szajsunga.', 5, '2016-12-08 21:01:49', 'Polecam', 0, 0),
(18, 37164441, 'UÅ¼ytkownik Ceneo', '', '', 'bardzo dobry produkt', 5, '2016-12-04 21:51:17', 'Polecam', 0, 0),
(19, 37164441, 'paweÅ‚', '', '', 'bardzo dobry szybki dysk polecam kazdemy kupujacemu.Å‚atwa instalacja,wyglÄ…d,szybki', 5, '2016-11-23 11:41:56', 'Polecam', 0, 0),
(20, 37164441, 'Przemo', '', '', 'Dysk jest Å›wietny, koniec z czekaniem aÅ¼ siÄ™ coÅ› otworzy. Win 10 uruchamia siÄ™ w 22s. Gry szybko siÄ™ instalujÄ…, wczytujÄ… i koniec z czkawkÄ… podczas rozgrywki nadpisywania danych(pomimo dobrego sprzÄ™tu). Polecam kaÅ¼demu, jest to mÃ³j pierwszy dysk ssd i jestem mega zadowolony. DuÅ¼y POZYTYW', 5, '2016-11-18 18:33:34', 'Polecam', 0, 0),
(21, 37164441, 'Kasia', '', '', 'Bardzo dobry', 4, '2016-11-15 14:18:49', 'Polecam', 0, 0),
(22, 37164441, 'Marcin', '', '', 'Bardzo dobry dysk.', 5, '2016-11-14 10:10:24', 'Polecam', 0, 0),
(23, 37164441, 'rufin', '', '', '.', 5, '2016-11-11 20:11:43', 'Polecam', 0, 0),
(24, 37164441, 'Michal', '', '', 'OK', 4, '2016-11-11 15:24:37', 'Polecam', 0, 0),
(25, 37164441, 'UÅ¼ytkownik Ceneo', '', '', 'Szybki dysk SSD na koÅ›ciach MLC. W tej klasie cenowej zdecydowanie najlepszy wybÃ³r.', 5, '2016-10-20 17:47:30', 'Polecam', 0, 0),
(26, 37164441, 'macumb', '', '', 'PojemnoÅ›Ä‡ /cena /gwarancja /wydajnoÅ›Ä‡ - w polecam', 5, '2016-10-13 18:03:12', 'Polecam', 0, 0),
(27, 37164441, 'StanCom', '', '', 'jestem pod wraÅ¼enie pracy /szybkoÅ›Ä‡/', 5, '2016-10-03 15:52:20', 'Polecam', 0, 0),
(28, 37164441, 'Jacek', 'pojemnoÅ›Ä‡,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'ok', 4, '2016-09-20 23:18:33', 'Polecam', 0, 0),
(29, 37164441, 'Toomas', 'cena,pojemnoÅ›Ä‡,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Szybki dysk na koÅ›ciach MLC.', 5, '2016-09-18 16:42:33', 'Polecam', 0, 0),
(30, 37164441, 'Mariusz', 'cena,', '', 'Bardzo szybki dysk na zÅ‚Ä…czu SATA III - ponad 1130 pkt w programie AS SSD. Bardzo duÅ¼a trwaÅ‚oÅ›Ä‡ zapisu 600 TBW i dÅ‚uga 5 letnia gwarancja. Cena przystÄ™pna - 319 zÅ‚.', 5, '2016-03-27 19:55:07', 'Polecam', 10, 1),
(31, 37164441, 'TomDom', '', '', 'Mam mieszane wraÅ¼enia dotyczÄ…ce tego dysku, system Win 10 chodziÅ‚ dobrze, ale ne rewelacyjne. System miaÅ‚ momenty, Å¼e obraz siÄ™ zamraÅ¼aÅ‚ tzn. kursor myszki dziaÅ‚aÅ‚ ale po klikniÄ™ciu nie byÅ‚o Å¼adnej akcji. Sam system wstawaÅ‚ szybko ale do 3,5 sekundy byÅ‚o mu daleko - Å‚adowaÅ‚ siÄ™ ok 20-30 sekund (komputer mam nie najgorszy i5/8GB Ram). Po kontakcie z serwisem GoodRam (przesÅ‚aniu logÃ³w z oprogramowania testujÄ…cego)  zasugerowano mi zareklamowanie dysku. Kontakt z serwisem muszÄ™ oceniÄ‡ na bardzo dobry.  ZareklamowaÅ‚em w Sferis (gdzie dysk kupiÅ‚em) i czekam juÅ¼ 21 dni. W gÅ‚Ã³wnym serwisie GoodRam o moim dysku nie sÅ‚yszeli. Dlatego w tym miejscu WIELKI MINUS DLA SFERIS. WczeÅ›niej miaÅ‚em przygodÄ™ z CX100 ktÃ³ry po tygodniu zamilkÅ‚ na wieki ale tam po 10 dniach sprzedawca zadzwoniÅ‚ i dostaÅ‚em nowy dysk ktÃ³ry dziaÅ‚a do juÅ¼ rok bez zarzutu.', 4, '2016-04-11 14:36:28', 'Polecam', 9, 4),
(32, 37164441, 'Maciej', 'cena,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Bardzo przyzwoita cena jak za produkt z gwarancjÄ… producenta 5 lat i moÅ¼liwoÅ›ciÄ… zapisania sporej iloÅ›ci danych (zaleta koÅ›ci MLC). Zobaczymy, jak bÄ™dzie siÄ™ sprawowaÅ‚ dysk, czas pokaÅ¼e. Na razie jestem zadowolony.', 5, '2016-06-28 13:58:23', 'Polecam', 3, 0),
(33, 37164441, 'Misiu', 'pojemnoÅ›Ä‡,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Po dwÃ³ch tygodnia pracy dysk sprawuje siÄ™ bardzo dobrze.\r\nMÃ³j windows 10 uruchamia siÄ™ w 3,5 sekundy.', 5, '2015-11-18 15:31:12', 'Polecam', 5, 10),
(34, 37164441, 'marek', '', '', 'nie mam opinii', 4, '2016-04-11 07:02:35', 'Polecam', 5, 22),
(35, 37164441, 'Wojciech', 'szybkoÅ›Ä‡,wysokoÅ›Ä‡ 7mm,', '', 'Dopiero zaczÄ…Å‚em uÅ¼ywaÄ‡ tego SSD, ale mÃ³j netbook zyskaÅ‚ dziÄ™ki niemu drugie Å¼ycie - zniknÄ™Å‚y irytujÄ…ce przycinki potrafiÄ…ce zawiesiÄ‡ komputer na kilkanaÅ›cie sekund (czasem nawet dÅ‚uÅ¼ej). Teraz wÄ…skim gardÅ‚em staÅ‚ siÄ™ procesor. ;)', 5, '2016-07-21 21:29:48', 'Polecam', 2, 0),
(36, 37164441, 'Golum', '', '', 'Dysk ktÃ³ry posiadam ma benchmarkach niÅ¼sze parametry zapisu niÅ¼ deklarowane przez producenta 400 MB/s zamiast 560MB/s odczyt 515 Mb/s czyli teÅ¼ gorzej, moÅ¼e zaleÅ¼y to od wersji firmware. MÃ³j PC: i5 6600k, 16GB RAM, WIn 10, pÅ‚yta na chipsecie z170. PisaÅ‚em do GoodRam - zero odpowiedzi. Brak dedykowanego oprogramowania i moÅ¼liwoÅ›ci wgrania nowego firmware. Na pewno znacznie poprawia dziaÅ‚anie systemu ale juÅ¼ wiÄ™cej nie kupiÄ™ produkt GoodRAm choÄ‡ staram siÄ™ wspieraÄ‡ polskich poducentÃ³w', 3, '2016-06-05 10:34:52', 'Golum            \r\n        \r\n\r\n\r\n            \r\n                \r\n                        Nie polecam', 2, 12),
(37, 37164441, 'UÅ¼ytkownik Ceneo', '', '', 'Te dyski padajÄ… jak muchy. Komputery z tymi dyskami pracujÄ… niestabilnie, czÄ™sto wystÄ™pujÄ… blue screen, po wymianie na inny dysk problemy znikÅ‚y. Na pewno nie wolno przetrzymywaÄ‡ na nich waÅ¼nych danych.', 1, '2016-10-13 23:38:12', 'UÅ¼ytkownik Ceneo            \r\n        \r\n\r\n\r\n            \r\n                \r\n                        Nie polecam', 0, 3),
(38, 37164441, 'Wolv', 'pojemnoÅ›Ä‡,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Dysk szybki i sprawny. Firma Polska, wiÄ™c trzeba wspieraÄ‡ naszych :)', 5, '2016-06-04 22:45:03', 'Polecam', 1, 0),
(39, 37164441, 'Buckey', 'pojemnoÅ›Ä‡,szybkoÅ›Ä‡,', '', 'Szybki we wszystkich testach, elegancki wyglÄ…d, posiadam od tygodnia, wiÄ™c o trwaÅ‚oÅ›ci nie mogÄ™ siÄ™ wypowiedzieÄ‡.', 5, '2016-04-15 16:33:42', 'Polecam', 1, 0),
(40, 37164441, 'Marcin', '', '', 'Tsu2vvevd\nGshxududiid', 0, '2017-01-13 10:04:32', 'Marcin            \r\n        \r\n\r\n\r\n            \r\n                \r\n                        Nie polecam', 0, 0),
(41, 37164441, 'Sah', '', '', 'NaprawdÄ™ warto w tej cenie.', 5, '2017-01-12 07:19:03', 'Polecam', 0, 0),
(42, 37164441, 'monia', '', '', 'sprawuje sie bardo dobrze', 4, '2017-01-03 18:36:51', 'Polecam', 0, 0),
(43, 37164441, 'Semidas', '', '', 'Dysk kupiÅ‚em tydzieÅ„ temu i sprawuje siÄ™ Å›wietnie, oczywiÅ›cie jako dysk systemowy. DaÅ‚em 4 gwiazdki bo nie wiem jak dÅ‚ugo bÄ™dzie pracowaÅ‚.', 4, '2017-01-01 21:14:18', 'Polecam', 0, 0),
(44, 37164441, 'Piotr', '', '', 'Znakomity produkt w bardzo rozsÄ…dnej cenie. Zdecydowanie polecam wszystkim zainteresowanym.', 5, '2016-12-30 21:02:40', 'Polecam', 0, 0),
(45, 37164441, 'Patryk', '', '', 'Polecam z wÅ‚asnego doÅ›wiadczenia .', 4, '2016-12-27 20:45:15', 'Polecam', 0, 0),
(46, 37164441, 'Darek', '', '', 'WybraÅ‚em ten model, bo oferuje bardzo dÅ‚ugÄ… gwarancjÄ™, poza tym to produkt polski co prawda na podzespoÅ‚ach Hitachi ale zawsze to produkcja w Polsce dlatego to mÃ³j wybÃ³r. Co do innych cech ? muszÄ™ go po prostu zainstalowaÄ‡ i popracowaÄ‡', 5, '2016-12-17 20:48:59', 'Polecam', 0, 0),
(47, 37164441, 'Dawid', '', '', 'Kupno dysku SSD to chyba najistotniejszy upgrade, jaki moÅ¼na w tej chwili zafundowaÄ‡ - za stosunkowo niewielkie pieniÄ…dze - swojemu komputerowi. RÃ³Å¼nica w prÄ™dkoÅ›ci Å‚adowania systemu i aplikacji jest kolosalna. A Iridium Pro z GoodRamu to jedna z najciekawszych opcji na rynku. Jestem z niego bardzo zadowolony. Jest szybki, pojemny (240 GB jest w sam raz na Windows 10 i najwaÅ¼niejsze programy) i taÅ„szy od wielu konkurentÃ³w. Ale powodem dla ktÃ³rego wybraÅ‚em wÅ‚aÅ›nie Iridium Pro byÅ‚a 5-letnia gwarancja. To chyba najlepszy dowÃ³d na jakoÅ›Ä‡ tego dysku.', 5, '2016-12-10 23:03:43', 'Polecam', 0, 0),
(48, 37164441, 'Piotr', '', '', 'Narazie jest dobrze', 4, '2016-12-09 13:23:00', 'Polecam', 0, 0),
(49, 37164441, 'UÅ¼ytkownik Ceneo', 'cena,design,gwarancja 5 lat,pojemnoÅ›Ä‡,szybkoÅ›c,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,wysokoÅ›Ä‡ 7mm,', '', 'Idealna pamiÄ™Ä‡ RAM', 5, '2016-12-06 18:03:49', 'Polecam', 0, 0),
(50, 37164441, 'Mateusz', 'cena,design,gwarancja 5 lat,pojemnoÅ›Ä‡,szybkoÅ›c,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,wysokoÅ›Ä‡ 7mm,', '', 'Niesamowita wydajnoÅ›Ä‡ i szybkoÅ›Ä‡ zapisu i odczytu, w zaledwie kilka sekund juÅ¼ mamy zaÅ‚adowany system operacyjny Windows taki wÅ‚aÅ›nie jest plus dyskÃ³w SSD.', 5, '2016-12-04 11:10:16', 'Polecam', 0, 0),
(51, 37164441, 'Marcin', '', '', 'Polecam, bardzo dobry produkt.', 5, '2016-12-04 07:31:49', 'Polecam', 0, 0),
(52, 37164441, 'UÅ¼ytkownik Ceneo', '', '', 'Bardzo dobry dysk za rozsÄ…dne pieniÄ…dze :)', 4, '2016-12-04 00:15:20', 'Polecam', 0, 0),
(53, 37164441, 'fix666', '', '', 'Produkt dobry lecz jeszcze drogi.', 5, '2016-11-28 17:03:38', 'Polecam', 0, 0),
(54, 37164441, 'Tomasz', '', '', 'win 10 startuje mi w 24s Å›rednio o poÅ‚owÄ™ szybciej od hdd', 5, '2016-11-27 16:39:18', 'Polecam', 0, 0),
(55, 37164441, 'UÅ¼ytkownik Ceneo', '', '', 'Åšwietny dysk na system. Wydajny przy odczycie wielu maÅ‚ych plikÃ³w a do tego odpowiednio pojemny do zainstalowania wielu programÃ³w i gier.', 5, '2016-11-25 17:42:26', 'Polecam', 0, 0),
(56, 37164441, 'andzaw46', '', '', 'Dobry i tani jak na dysk SSD. Instalacja systemu bez problemu. Przeniesienie systemu bez problemu, instalacja oprogramowania bez problemu. Kopiowanie danych szybkie, dysk nie grzeje siÄ™ i jest cichy - taka technologia.', 5, '2016-11-24 19:43:01', 'Polecam', 0, 0),
(57, 37164441, 'Adam', '', '', 'KupiÅ‚em ten dysk gdyÅ¼ poprzedni w laptopie, Hitachi Travelstar Z5K500, nie nadawaÅ‚ siÄ™ na systemowy, pracowaÅ‚ czÄ™sto na 100% i dlatego komputer przymulaÅ‚. Co prawda, mam dysk niecaÅ‚y miesiÄ…c i na nowo mam postawiony system ale widzÄ™, Å¼e komputer Å›miga jak nigdy wczeÅ›niej.', 5, '2016-11-22 18:45:09', 'Polecam', 0, 0),
(58, 37164441, 'Kacper', '', '', 'bardzo trwaÅ‚y dysk uwiodÅ‚o mnie w nim\r\n-5 letnia gwarancja \r\n-jakosc wykonania \r\ni to Å¼e jest polskim produktem', 5, '2016-11-19 16:07:39', 'Polecam', 0, 0),
(59, 37164441, 'captain1999', '', '', 'NaprawdÄ™ szybki i niezawodny dysk na pamiÄ™ciach MLC. Zwykle HDD nawet nie majÄ… startu do niego.', 5, '2016-11-13 12:41:39', 'Polecam', 0, 0),
(60, 37164441, 'Piotr', '', '', 'Bardzo dobry produkt, Å›wietne wykonanie i niebanalne podejÅ›cie pozwalajÄ… mi wydaÄ‡ rekomendacje.  GorÄ…co polecam', 5, '2016-11-09 18:26:22', 'Polecam', 0, 0),
(61, 37164441, 'Åukasz', '', '', 'nieliczny w tej kategorii cenowej dysk SSD oparty o pamiÄ™ci typu MLC - gwarantuje trwaÅ‚oÅ›Ä‡ na lata, w przeciwieÅ„stwie do taÅ„szych, mniej wytrzymaÅ‚ych ukÅ‚adÃ³w TLC. PrÄ™dkoÅ›Ä‡ bardzo dobra, parametry lepsze od produktÃ³w znanych, zagranicznych producentÃ³w.', 5, '2016-11-06 16:52:22', 'Polecam', 0, 0),
(62, 37164441, 'Krzysztof', '', '', 'W dobie marnych dyskÃ³w na koÅ›ciach TLC, polski Goodram Iridium Pro to prawdziwy strzaÅ‚ w dziesiÄ…tkÄ™! KoÅ›ci MLC Toshiby w procesie 19 nm oraz wydajny kontroler Phison to bardzo dobry tandem. WydajnoÅ›ciowo ten dysk nie odstaje od czoÅ‚Ã³wki z tego segmentu cenowego (Samsung, Crucial, Plextor), a w niektÃ³rych testach nawet wysuwa siÄ™ na prowadzenie. Na plus dÅ‚uga, piÄ™cioletnia gwarancja z wysokim limitem zapisu. W tej cenie nie ma siÄ™ nad czym zastanawiaÄ‡ - braÄ‡ pÃ³ki jest w ofercie.', 5, '2016-11-05 14:58:35', 'Polecam', 0, 0),
(63, 37164441, 'Dominik', '', '', 'bardzo dobry stosunek jakoÅ›ci do ceny. dysk szybki i duÅ¼a liczba zapisu. Do tego 5 lat gwarancji. Szkoda Å¼e producent nie dodaje sanek do montaÅ¼u w 3,5"\r\n\r\nPolecam!', 5, '2016-11-03 20:43:23', 'Polecam', 0, 0),
(64, 37164441, 'captain1999', '', '', 'W pakiecie z Gaming Pro Carbon i GTX 1070 od Zotaca tworzy mega parÄ™. Gry wÅ‚Ä…czajÄ… siÄ™ bÅ‚yskawicznie a praca komputera to poezja. Zastosowanie pamiÄ™ci MLC znaczÄ…co zwiÄ™ksza Å¼ywotnoÅ›Ä‡. OGROMNY PLUS!!!', 5, '2016-11-02 19:06:25', 'Polecam', 0, 0),
(65, 37164441, 'mag', '', '', 'ok', 3, '2016-11-02 16:37:34', '', 0, 0),
(66, 37164441, 'dad', '', '', 'DziaÅ‚a.', 4, '2016-11-02 16:11:37', 'Polecam', 0, 0),
(67, 37164441, 'Tomasz', '', '', 'Cena adekwatna do wydajnoÅ›ci', 4, '2016-10-30 19:22:27', 'Polecam', 0, 0),
(68, 37164441, 't', '', '', 'test', 3, '2016-10-27 10:29:21', '', 0, 0),
(69, 37164441, 'Piotr', '', '', 'Znakomity produkt Å›wietne wykonanie i bardzo dobra cena. GorÄ…co polecam wszystkim zainteresowanym', 5, '2016-10-23 12:14:02', 'Polecam', 0, 0),
(70, 37164441, 'UÅ¼ytkownik Ceneo', '', '', 'OK', 4, '2016-10-20 20:36:46', 'Polecam', 0, 0),
(71, 37164441, 'Adam', '', '', 'Wszystko pracuje jak naleÅ¼y, wykonany Å‚adnie i dokÅ‚adnie(obudowa). \r\nMocowanie Å‚atwe. SzybkoÅ›Ä‡ bardzo zauwaÅ¼alna na komputerze', 5, '2016-10-13 10:52:33', 'Polecam', 0, 0),
(72, 37164441, 'zygi', '', '', 'Bardzo dobry', 5, '2016-10-05 11:35:53', 'Polecam', 0, 0),
(73, 37164441, 'donger', '', '', 'Najlepszy dysk SSD na rynku. Wspierasz polskÄ… firmÄ™ i dostajesz odpowiednio wyceniony produkt z wysokiej pÃ³Å‚ki. Najlepszy typ pamiÄ™ci i 5 lat gwarancji. Nie ma konkurencji w tym przedziale cenowym.', 5, '2016-10-04 16:13:44', 'Polecam', 0, 0),
(74, 37164441, 'Arkadiusz', 'cena,gwarancja 5 lat,pojemnoÅ›Ä‡,szybkoÅ›Ä‡,', '', 'Dysk  o bardzo dobrych parametrach w tej cenie. PiÄ™cioletnia gwarancja sprzedawcy X-kom sprawiÅ‚a, Å¼e zakupiÅ‚em Iridium Pro zamiast kolejnego Samsunga z serii 850.', 5, '2016-10-04 10:45:22', 'Polecam', 0, 0),
(75, 37164441, 'PaweÅ‚', '', '', 'Dysk jest super. Poza tym Goodram to polska firma. Dysk jest ogÃ³lnie super system odpala siÄ™ w pare sekund.', 5, '2016-10-02 10:12:00', 'Polecam', 0, 0),
(76, 37164441, 'Mareczek35', 'szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Najlepszy wybÃ³r w swojej cenie. 5 letnia gwarancja. Bardzo szybki produkt wykonany na komÃ³rkach MLC ktÃ³re sÄ… duÅ¼o trwalsze od TLC na ktÃ³re siÄ™ przestawia coraz wiÄ™cej producentÃ³w', 5, '2016-09-14 18:08:34', 'Polecam', 0, 0),
(77, 37164441, 'UÅ¼ytkownik Ceneo', 'pojemnoÅ›Ä‡,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Dobry dysk w dobrej cenie, jedyne czego brakuje to jakichÅ› Å›rubek montaÅ¼owych.', 5, '2016-09-12 10:08:22', 'Polecam', 0, 0),
(78, 37164441, 'MiÅ‚osz', 'cena,gwarancja 5 lat,pojemnoÅ›Ä‡,szybkoÅ›Ä‡,', '', 'Dysk Å›wietnie siÄ™ sprawuje. Rzeczywiste parametry byÅ‚y mi znane dziÄ™ki testom dostÄ™pnym w sieci. O jego zakupie zadecydowaÅ‚o gÅ‚Ã³wnie polskie pochodzenie ;) oraz cena.', 5, '2016-09-10 10:25:50', 'Polecam', 0, 0),
(79, 37164441, 'PaweÅ‚', 'szybkoÅ›Ä‡,', '', 'UÅ¼ytkuje dysk okoÅ‚o 4-5miesiÄ™cy zapisaÅ‚em juÅ¼ na nim ponad 2TB danych wedÅ‚ug programu Goodram. Dysk dobry, system szybciej startuje, programy rÃ³wnieÅ¼. Taka maÅ‚a uwaga jeÅ›li ktoÅ› z starszym PC zastanawia siÄ™ nad SSD szkoda zachodu, poniewaÅ¼ do peÅ‚ni sprawnoÅ›ci trzeba SATA III jak siÄ™ nie myle. Sam teÅ¼ chyba nie osiÄ…gam max tego co bym mÃ³gÅ‚. Jeszcze jeden DUÅ»Y PLUS producent gwarantuje, ze dysk wytrzyma 400TB lub 5lat, nawet Samsung jak dobrze pamiÄ™tam nie daje tyle - Szacun! KupujÄ…c przyszÅ‚oÅ›ci jeszcze 1ssd na 99% bÄ™dzie to GOODRAM', 5, '2016-08-14 00:50:38', 'Polecam', 0, 0),
(80, 37164441, 'Mateusz', 'cena,szybkoÅ›c,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Bardzo polecam Iridiuma, zupeÅ‚nie inna jakoÅ›Ä‡ niÅ¼ stare goodramy ze Å›redniej pÃ³Å‚ki. Tu mamy do czynienia z topowym pod kaÅ¼dym wzglÄ™dem SSD.', 5, '2016-08-10 08:53:30', 'Polecam', 0, 0),
(81, 37164441, 'Piotr', '', '', 'Znakomity produkt w .bardzo dobrej cenie, zdecydowanie polecam wszystkim zainteresowanym. NaprawdÄ™ warto', 5, '2016-08-08 20:17:11', 'Polecam', 0, 0),
(82, 37164441, 'soul', 'pojemnoÅ›Ä‡,szybkoÅ›Ä‡,trwaÅ‚oÅ›Ä‡,', '', 'Godny polecenie cena i gwarancja 5lat rewelka!', 5, '2016-07-31 22:03:22', 'Polecam', 0, 0),
(83, 37164441, 'Sebastian', '', '', 'Bardzo szybki i jak na razie bezawaryjny dysk.', 5, '2016-07-27 11:25:17', 'Polecam', 0, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
