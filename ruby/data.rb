
module GoBible


    composition :Protestant do
        books %w{ Gen Exod Lev Num Deut Josh Judg Ruth 1Sam 2Sam 1Kgs 2Kgs 1Chr 2Chr Ezra Neh Esth Job Psa Prov Eccl Song Isa Jer Lam Ezek Dan Hos Joel Amos Obad Jonah Mic Nah Hab Zeph Hag Zech Mal Matt Mark Luke John Acts Rom 1Cor 2Cor Gal Eph Phil Col 1Thess 2Thess 1Tim 2Tim Titus Phlm Heb Jas 1Pet 2Pet 1John 2John 3John Jude Rev } 
        level '1M' { Gen, Ps }
        level '500k' { Gen, Josh, Psa, Matt }
        level '300k' { Gen, Josh, IChr, Psa, Isa, Hos, Matt, Rom }

        translation :HunKar, :HunUj do
            lang :hu_HU
            abbrs \
                Gen => '1Moz',
                Josh => 'Jozs',
                IChr => '1Kron',
                Psa => 'Zsolt',
                Isa => 'Ezs',
                Hos => 'Hos',
                Matt => 'Mt',
                Rom => 'Rom'
        end
        translation :NIV do
            lang :en_US
            abbrs \
                Gen => 'Ge',
                Josh => 'Jo',
                Judg => 'Ju',
                IChr => '1Ch',
                Psa => 'Ps',
                Isa => 'Is',
                Hos => 'Ho',
                Matt => 'Mt',
                Rom => 'Ro'
        end
    end


    composition :RomanCatholic do
        books %w{ Gen Exod Lev Num Deut Josh Judg Ruth 1Sam 2Sam 1Kgs 2Kgs 1Chr 2Chr Ezra Neh Tob Judi Esth 1Macc 2Macc Job Psa Prov Eccl Song Wis Sir Isa Jer Lam Ezek Dan Hos Joel Amos Obad Jonah Mic Nah Hab Zeph Hag Zech Mal Matt Mark Luke John Acts Rom 1Cor 2Cor Gal Eph Phil Col 1Thess 2Thess 1Tim 2Tim Titus Phlm Heb Jas 1Pet 2Pet 1John 2John 3John Jude Rev } 
        level '1M' { Gen, Ps }
        level '500k' { Gen, IKgs, Psa, Hos }
        level '300k' { Gen, Deut, IKgs, Esth, Pro, Jer, Matt, Rom }
        translation :HunSztI do
            lang :hu_HU
            abbrs \
                Gen => 'Ter',
                Deut => 'MTorv',
                IKgs => '1Kir',
                Esth => 'Eszt',
                Psa => 'Zsolt',
                Pro => 'Peld',
                Jer => 'Jer',
                Hos => 'Oz',
                Matt => 'Mt',
                Rom => 'Rom'
        end

    end


    composition :NewTestament do
        books %w{Matt Mark Luke John Acts Rom 1Cor 2Cor Gal Eph Phil Col 1Thess 2Thess 1Tim 2Tim Titus Phlm Heb Jas 1Pet 2Pet 1John 2John 3John Jude Rev}
        level '300k' { Matt, Rom }

        translation :Byz do
            lang :hu_HU
            abbrs \
                Matt => 'Mt',
                Rom => 'Rom'
        end


    end

    composition :ProtestantOldTestament do
        books %w{ Gen Exod Lev Num Deut Josh Judg Ruth 1Sam 2Sam 1Kgs 2Kgs 1Chr 2Chr Ezra Neh Esth Job Psa Prov Eccl Song Isa Jer Lam Ezek Dan Hos Joel Amos Obad Jonah Mic Nah Hab Zeph Hag Zech Mal } 
        level '500k' { Gen, Ezra }
        level '300k' { Gen, IISam, Prov }
        translation :Aleppo do
            lang :hu_HU
            abbrs \
                Gen => '1Moz',
                IISam => '2Sam',
                Prov => 'Peld'
        end
    end


end





