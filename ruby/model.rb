module GoBible 
    @compositions = []
    def self.composition name, &block
        c = Composition.new name
        c.module.class_eval &block
        @compositions << c
    end
    class Composition
        attr_reader :name, :module, :levels, :translations
        def initialize name
            @name = name
            @module = Module.new
            @levels = []
            @translations = []
        end

        def books bs
            bs.enum_with_index do |b,i| 
                @module.class_eval "#{b} = #{i+1}"
            end
        end

        def level name, &block
            @levels[name] = block[]
        end

        def translation *names, &block
            names.each do |name|
                t = Translation.new name
                t.instance_exec &block
                @translations << t
            end
        end
    end


    class Translation
        attr_reader :name 
        def initialize name
            @name = name
            @abbrs
        end
        def lang l=nil
            @lang = l if l
            @lang
        end
        def abbrs a={}
            @abbrs.merge! a
        end
    end

    class Level 
    end

    class Collection
    end

    class WholeCollection < Collection
    end

    class SplitCollection < Collection
    end

    class File
    end

    class TXT < File
    end

    class JAR < File
    end

    class JAD < File
    end

    class ZIP < File
    end

    class OSIS < File
    end

    class SVG < File
    end


end
