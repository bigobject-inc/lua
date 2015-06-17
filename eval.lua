function eval(eval_str,...)
        arg={...}
        _ret = 0
        func=load(eval_str)
        func()

        return _ret
end
