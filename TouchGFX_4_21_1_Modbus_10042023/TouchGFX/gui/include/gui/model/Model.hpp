#ifndef MODEL_HPP
#define MODEL_HPP

class ModelListener;

class Model
{
public:
    Model();

    void bind(ModelListener* listener)
    {
        modelListener = listener;
    }

    void tick();
    virtual void LedToggleRequested(bool value);		//KOM
    virtual void RegisterUpDown(int value);				//KOM
protected:
    ModelListener* modelListener;
    bool valuetoggle;									//KOM
    int counter;										//KOM
    unsigned int reg;									//KOM
};

#endif // MODEL_HPP
