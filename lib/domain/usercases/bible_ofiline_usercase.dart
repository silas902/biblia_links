import 'dart:convert';

import 'package:biblia_links/domain/entities/bible/book.dart';
import 'package:biblia_links/domain/entities/bible/chapter.dart';
import 'package:biblia_links/domain/entities/bible/verse.dart';
import 'package:biblia_links/domain/value_object/number_text_vo.dart';
import 'package:biblia_links/domain/value_object/quantity_of_letters_vo.dart';

import 'package:biblia_links/domain/value_object/text_vo.dart';
import 'package:flutter/material.dart';


class BibleOffilineUserCase extends ChangeNotifier {
  

  String locale = """{
   "1 timoteo": [
    {
        "1": {
            "1": "Paulo, apóstolo de Jesus Cristo, segundo o mandado de Deus, nosso Salvador, e do Senhor Jesus Cristo, esperança nossa,",
            "2": "A Timóteo meu verdadeiro filho na fé: Graça, misericórdia e paz da parte de Deus nosso Pai, e da de Cristo Jesus, nosso Senhor.",
            "3": "Como te roguei, quando parti para a macedônia, que ficasses em Éfeso, para advertires a alguns, que não ensinem outra doutrina,",
            "4": "Nem se dêem a fábulas ou a genealogias intermináveis, que mais produzem questões do que edificação de Deus, que consiste na fé; assim o faço agora.",
            "5": "Ora, o fim do mandamento é o amor de um coração puro, e de uma boa consciência, e de uma fé não fingida.",
            "6": "Do que, desviando-se alguns, se entregaram a vãs contendas;",
            "7": "Querendo ser mestres da lei, e não entendendo nem o que dizem nem o que afirmam.",
            "8": "Sabemos, porém, que a lei é boa, se alguém dela usa legitimamente;",
            "9": "Sabendo isto, que a lei não é feita para o justo, mas para os injustos e obstinados, para os ímpios e pecadores, para os profanos e irreligiosos, para os parricidas e matricidas, para os homicidas,",
            "10": "Para os devassos, para os sodomitas, para os roubadores de homens, para os mentirosos, para os perjuros, e para o que for contrário à sã doutrina,",
            "11": "Conforme o evangelho da glória de Deus bem-aventurado, que me foi confiado.",
            "12": "E dou graças ao que me tem confortado, a Cristo Jesus Senhor nosso, porque me teve por fiel, pondo-me no ministério;",
            "13": "A mim, que dantes fui blasfemo, e perseguidor, e injurioso; mas alcancei misericórdia, porque o fiz ignorantemente, na incredulidade.",
            "14": "E a graça de nosso Senhor superabundou com a fé e amor que há em Jesus Cristo.",
            "15": "Esta é uma palavra fiel, e digna de toda a aceitação, que Cristo Jesus veio ao mundo, para salvar os pecadores, dos quais eu sou o principal.",
            "16": "Mas por isso alcancei misericórdia, para que em mim, que sou o principal, Jesus Cristo mostrasse toda a sua longanimidade, para exemplo dos que haviam de crer nele para a vida eterna.",
            "17": "Ora, ao Rei dos séculos, imortal, invisível, ao único Deus sábio, seja honra e glória para todo o sempre. Amém.",
            "18": "Este mandamento te dou, meu filho Timóteo, que, segundo as profecias que houve acerca de ti, milites por elas boa milícia;",
            "19": "Conservando a fé, e a boa consciência, a qual alguns, rejeitando, fizeram naufrágio na fé.",
            "20": "E entre esses foram Himeneu e Alexandre, os quais entreguei a Satanás, para que aprendam a não blasfemar."
        }
    },
    {
        "2": {
            "1": "Admoesto-te, pois, antes de tudo, que se façam deprecações, orações, intercessões, e ações de graças, por todos os homens;",
            "2": "Pelos reis, e por todos os que estão em eminência, para que tenhamos uma vida quieta e sossegada, em toda a piedade e honestidade;",
            "3": "Porque isto é bom e agradável diante de Deus nosso Salvador,",
            "4": "Que quer que todos os homens se salvem, e venham ao conhecimento da verdade.",
            "5": "Porque há um só Deus, e um só Mediador entre Deus e os homens, Jesus Cristo homem.",
            "6": "O qual se deu a si mesmo em preço de redenção por todos, para servir de testemunho a seu tempo.",
            "7": "Para o que (digo a verdade em Cristo, não minto) fui constituído pregador, e apóstolo, e doutor dos gentios na fé e na verdade.",
            "8": "Quero, pois, que os homens orem em todo o lugar, levantando mãos santas, sem ira nem contenda.",
            "9": "Que do mesmo modo as mulheres se ataviem em traje honesto, com pudor e modéstia, não com tranças, ou com ouro, ou pérolas, ou vestidos preciosos,",
            "10": "Mas (como convém a mulheres que fazem profissão de servir a Deus) com boas obras.",
            "11": "A mulher aprenda em silêncio, com toda a sujeição.",
            "12": "Não permito, porém, que a mulher ensine, nem use de autoridade sobre o marido, mas que esteja em silêncio.",
            "13": "Porque primeiro foi formado Adão, depois Eva.",
            "14": "E Adão não foi enganado, mas a mulher, sendo enganada, caiu em transgressão.",
            "15": "Salvar-se-á, porém, dando à luz filhos, se permanecer com modéstia na fé, no amor e na santificação."
        }
    },
    {
        "3": {
            "1": "Esta é uma palavra fiel: se alguém deseja o episcopado, excelente obra deseja.",
            "2": "Convém, pois, que o bispo seja irrepreensível, marido de uma mulher, vigilante, sóbrio, honesto, hospitaleiro, apto para ensinar;",
            "3": "Não dado ao vinho, não espancador, não cobiçoso de torpe ganância, mas moderado, não contencioso, não avarento;",
            "4": "Que governe bem a sua própria casa, tendo seus filhos em sujeição, com toda a modéstia",
            "5": "(Porque, se alguém não sabe governar a sua própria casa, terá cuidado da igreja de Deus? );",
            "6": "Não neófito, para que, ensoberbecendo-se, não caia na condenação do diabo.",
            "7": "Convém também que tenha bom testemunho dos que estão de fora, para que não caia em afronta, e no laço do diabo.",
            "8": "Da mesma sorte os diáconos sejam honestos, não de língua dobre, não dados a muito vinho, não cobiçosos de torpe ganância;",
            "9": "Guardando o mistério da fé numa consciência pura.",
            "10": "E também estes sejam primeiro provados, depois sirvam, se forem irrepreensíveis.",
            "11": "Da mesma sorte as esposas sejam honestas, não maldizentes, sóbrias e fiéis em tudo.",
            "12": "Os diáconos sejam maridos de uma só mulher, e governem bem a seus filhos e suas próprias casas.",
            "13": "Porque os que servirem bem como diáconos, adquirirão para si uma boa posição e muita confiança na fé que há em Cristo Jesus.",
            "14": "Escrevo-te estas coisas, esperando ir ver-te bem depressa;",
            "15": "Mas, se tardar, para que saibas como convém andar na casa de Deus, que é a igreja do Deus vivo, a coluna e firmeza da verdade.",
            "16": "E, sem dúvida alguma, grande é o mistério da piedade: Deus se manifestou em carne, foi justificado no Espírito, visto dos anjos, pregado aos gentios, crido no mundo, recebido acima na glória."
        }
    },
    {
        "4": {
            "1": "Mas o Espírito expressamente diz que nos últimos tempos apostatarão alguns da fé, dando ouvidos a espíritos enganadores, e a doutrinas de demônios;",
            "2": "Pela hipocrisia de homens que falam mentiras, tendo cauterizada a sua própria consciência;",
            "3": "Proibindo o casamento, e ordenando a abstinência dos alimentos que Deus criou para os fiéis, e para os que conhecem a verdade, a fim de usarem deles com ações de graças;",
            "4": "Porque toda a criatura de Deus é boa, e não há nada que rejeitar, sendo recebido com ações de graças.",
            "5": "Porque pela palavra de Deus e pela oração é santificada.",
            "6": "Propondo estas coisas aos irmãos, serás bom ministro de Jesus Cristo, criado com as palavras da fé e da boa doutrina que tens seguido.",
            "7": "Mas rejeita as fábulas profanas e de velhas, e exercita-te a ti mesmo em piedade;",
            "8": "Porque o exercício corporal para pouco aproveita, mas a piedade para tudo é proveitosa, tendo a promessa da vida presente e da que há de vir.",
            "9": "Esta palavra é fiel e digna de toda a aceitação;",
            "10": "Porque para isto trabalhamos e somos injuriados, pois esperamos no Deus vivo, que é o Salvador de todos os homens, principalmente dos fiéis.",
            "11": "Manda estas coisas e ensina-as.",
            "12": "Ninguém despreze a tua mocidade; mas sê o exemplo dos fiéis, na palavra, no trato, no amor, no espírito, na fé, na pureza.",
            "13": "Persiste em ler, exortar e ensinar, até que eu vá.",
            "14": "Não desprezes o dom que há em ti, o qual te foi dado por profecia, com a imposição das mãos do presbitério.",
            "15": "Medita estas coisas; ocupa-te nelas, para que o teu aproveitamento seja manifesto a todos.",
            "16": "Tem cuidado de ti mesmo e da doutrina. Persevera nestas coisas; porque, fazendo isto, te salvarás, tanto a ti mesmo como aos que te ouvem."
        }
    },
    {
        "5": {
            "1": "NÃO repreendas asperamente o ancião, mas admoesta-o como a pai; aos moços como a irmãos;",
            "2": "As mulheres idosas, como a mães, às moças, como a irmãs, em toda a pureza.",
            "3": "Honra as viúvas que verdadeiramente são viúvas.",
            "4": "Mas, se alguma viúva tiver filhos, ou netos, aprendam primeiro a exercer piedade para com a sua própria família, e a recompensar seus pais; porque isto é bom e agradável diante de Deus.",
            "5": "Ora, a que é verdadeiramente viúva e desamparada espera em Deus, e persevera de noite e de dia em rogos e orações;",
            "6": "Mas a que vive em deleites, vivendo está morta.",
            "7": "Manda, pois, estas coisas, para que elas sejam irrepreensíveis.",
            "8": "Mas, se alguém não tem cuidado dos seus, e principalmente dos da sua família, negou a fé, e é pior do que o infiel.",
            "9": "Nunca seja inscrita viúva com menos de sessenta anos, e só a que tenha sido mulher de um só marido;",
            "10": "Tendo testemunho de boas obras: Se criou os filhos, se exercitou hospitalidade, se lavou os pés aos santos, se socorreu os aflitos, se praticou toda a boa obra.",
            "11": "Mas não admitas as viúvas mais novas, porque, quando se tornam levianas contra Cristo, querem casar-se;",
            "12": "Tendo já a sua condenação por haverem aniquilado a primeira fé.",
            "13": "E, além disto, aprendem também a andar ociosas de casa em casa; e não só ociosas, mas também paroleiras e curiosas, falando o que não convém.",
            "14": "Quero, pois, que as que são moças se casem, gerem filhos, governem a casa, e não dêem ocasião ao adversário de maldizer;",
            "15": "Porque já algumas se desviaram, indo após Satanás.",
            "16": "Se algum crente ou alguma crente tem viúvas, socorra-as, e não se sobrecarregue a igreja, para que se possam sustentar as que deveras são viúvas.",
            "17": "Os presbíteros que governam bem sejam estimados por dignos de duplicada honra, principalmente os que trabalham na palavra e na doutrina;",
            "18": "Porque diz a Escritura: Não ligarás a boca ao boi que debulha. E: Digno é o obreiro do seu salário.",
            "19": "Não aceites acusação contra o presbítero, senão com duas ou três testemunhas.",
            "20": "Aos que pecarem, repreende-os na presença de todos, para que também os outros tenham temor.",
            "21": "Conjuro-te diante de Deus, e do Senhor Jesus Cristo, e dos anjos eleitos, que sem prevenção guardes estas coisas, nada fazendo por parcialidade.",
            "22": "A ninguém imponhas precipitadamente as mãos, nem participes dos pecados alheios; conserva-te a ti mesmo puro.",
            "23": "Não bebas mais água só, mas usa de um pouco de vinho, por causa do teu estômago e das tuas freqüentes enfermidades.",
            "24": "Os pecados de alguns homens são manifestos, precedendo o juízo; e em alguns manifestam-se depois.",
            "25": "Assim mesmo também as boas obras são manifestas, e as que são de outra maneira não podem ocultar-se."
        }
    },
    {
        "6": {
            "1": "Todos os servos que estão debaixo do jugo estimem a seus senhores por dignos de toda a honra, para que o nome de Deus e a doutrina não sejam blasfemados.",
            "2": "E os que têm senhores crentes não os desprezem, por serem irmãos; antes os sirvam melhor, porque eles, que participam do benefício, são crentes e amados. Isto ensina e exorta.",
            "3": "Se alguém ensina alguma outra doutrina, e se não conforma com as sãs palavras de nosso Senhor Jesus Cristo, e com a doutrina que é segundo a piedade,",
            "4": "É soberbo, e nada sabe, mas delira acerca de questões e contendas de palavras, das quais nascem invejas, porfias, blasfêmias, ruins suspeitas,",
            "5": "Perversas contendas de homens corruptos de entendimento, e privados da verdade, cuidando que a piedade seja causa de ganho; aparta-te dos tais.",
            "6": "Mas é grande ganho a piedade com contentamento.",
            "7": "Porque nada trouxemos para este mundo, e manifesto é que nada podemos levar dele.",
            "8": "Tendo, porém, sustento, e com que nos cobrirmos, estejamos com isso contentes.",
            "9": "Mas os que querem ser ricos caem em tentação, e em laço, e em muitas concupiscências loucas e nocivas, que submergem os homens na perdição e ruína.",
            "10": "Porque o amor ao dinheiro é a raiz de toda a espécie de males; e nessa cobiça alguns se desviaram da fé, e se traspassaram a si mesmos com muitas dores.",
            "11": "Mas tu, ó homem de Deus, foge destas coisas, e segue a justiça, a piedade, a fé, o amor, a paciência, a mansidão.",
            "12": "Milita a boa milícia da fé, toma posse da vida eterna, para a qual também foste chamado, tendo já feito boa confissão diante de muitas testemunhas.",
            "13": "Mando-te diante de Deus, que todas as coisas vivifica, e de Cristo Jesus, que diante de Pôncio Pilatos deu o testemunho de boa confissão,",
            "14": "Que guardes este mandamento sem mácula e repreensão, até à aparição de nosso Senhor Jesus Cristo;",
            "15": "A qual a seu tempo mostrará o bem-aventurado, e único poderoso Senhor, Rei dos reis e Senhor dos senhores;",
            "16": "Aquele que tem, ele só, a imortalidade, e habita na luz inacessível; a quem nenhum dos homens viu nem pode ver, ao qual seja honra e poder sempiterno. Amém.",
            "17": "Manda aos ricos deste mundo que não sejam altivos, nem ponham a esperança na incerteza das riquezas, mas em Deus, que abundantemente nos dá todas as coisas para delas gozarmos;",
            "18": "Que façam bem, enriqueçam em boas obras, repartam de boa mente, e sejam comunicáveis;",
            "19": "Que entesourem para si mesmos um bom fundamento para o futuro, para que possam se apoderar da vida eterna.",
            "20": "Ó Timóteo, guarda o depósito que te foi confiado, tendo horror aos clamores vãos e profanos e às oposições da falsamente chamada ciência,",
            "21": "A qual professando-a alguns, se desviaram da fé. A graça seja contigo. Amém."
        }
    }
]
  }""";
  
  List<Book> books = [];
  List<Chapter> chapters = [];

  Future<void> prefBibleOffline() async {
    books.clear();
   
    chapters.clear();
    Map<dynamic, dynamic> pase = jsonDecode(locale);

    pase.forEach(
      (key, value) {
        books.add(
          Book(
            idBook: TextVO(key),
            nameBook: TextVO(key),
            chapters: chapters,
          ),
        );

        ssss(chap: value);
      },
    );
    notifyListeners();
    //books = (pase["1 timoteo"] as List).map((book) => Book.fromJson(book) ).toList();
    print(books.length);

    //var ss = ()
  }

  Future ssss({required List chap}) async {
    for (var i = 0; i < chap.length; i++) {
      chap[i].forEach((key, value) {
        chapters.add(
          Chapter(
            idChapter: TextVO('value'),
            chapterNumber: NumberTextVO(key),
            verses: ddd(value: value),
          ),
        );
        //ddd(value: value);
        notifyListeners();
      });
    }
  }

  List<Verse> ddd({required Map value}) {
    List<Verse> verses = [];
    value.forEach((key, value) {
      verses.add(
        Verse(
          idVerse: TextVO('value'),
          numberVerse: NumberTextVO(key),
          verse: QuantityOfLettersVO(value),
        ),
      );
      
    });
    notifyListeners();
    return verses;
  }

  //print(books);
}
