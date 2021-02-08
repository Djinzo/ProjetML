public static class NeuralNetwork {
    private int inputsNodes, hiddenNodes, outputsNodes;
    private Matrix weighet_Input_Hiden, weighet_Hiden_Output, output_Bais, hidden_Bais;
    private double learningRate;


    public static double sigmonid(double x) {
        return 1 / (1 + Math.exp(-x));
    }

    public static double desigmonid(double y) {
        return y * (1 - y);
    }

    public NeuralNetwork(int inputsNodes, int hiddenNodes, int outputsNodes) {
        this.inputsNodes = inputsNodes;
        this.hiddenNodes = hiddenNodes;
        this.outputsNodes = outputsNodes;

        weighet_Input_Hiden = new Matrix(this.hiddenNodes, this.inputsNodes);
        weighet_Hiden_Output = new Matrix(this.outputsNodes, this.hiddenNodes);
        output_Bais = new Matrix(this.outputsNodes, 1);
        hidden_Bais = new Matrix(this.hiddenNodes, 1);

        weighet_Hiden_Output.init();
        weighet_Input_Hiden.init();
        output_Bais.init();
        hidden_Bais.init();


        this.learningRate = 0.1;
    }

    public ArrayList<Double> getPredection(double[] inputsArry) {
        Matrix inputs = Matrix.convertArryToMatrix(inputsArry);
        Matrix hidden = Matrix.multiply(this.weighet_Input_Hiden, inputs);
        hidden.add(this.hidden_Bais);
        hidden.map(new Normalisation() {
            @Override
            public double sigmoid(double x) {
                return NeuralNetwork.sigmonid(x);
            }
        });

        Matrix outputs = Matrix.multiply(this.weighet_Hiden_Output, hidden);
        outputs.add(this.output_Bais);

        outputs.map(new Normalisation() {
            @Override
            public double sigmoid(double x) {
                return NeuralNetwork.sigmonid(x);
            }
        });

        return outputs.convertMatrixToArray();
    }


    public void training(double[] inputsArry, double[] targetArray) {

        Matrix inputs = Matrix.convertArryToMatrix(inputsArry);
        Matrix hidden = Matrix.multiply(this.weighet_Input_Hiden, inputs);
        hidden.add(this.hidden_Bais);
        hidden.map(new Normalisation() {
            @Override
            public double sigmoid(double x) {
                return NeuralNetwork.sigmonid(x);
            }
        });

        Matrix outputs = Matrix.multiply(this.weighet_Hiden_Output, hidden);
        outputs.add(this.output_Bais);

        outputs.map(new Normalisation() {
            @Override
            public double sigmoid(double x) {
                return NeuralNetwork.sigmonid(x);
            }
        });


        Matrix target = Matrix.convertArryToMatrix(targetArray);
        Matrix outputError = Matrix.subtract(target, outputs);


        Matrix gradian = Matrix.map(outputs, new Normalisation() {
            @Override
            public double sigmoid(double x) {
                return NeuralNetwork.desigmonid(x);
            }
        });
        gradian.multiply(outputError);
        gradian.multiply(this.learningRate);

        Matrix hidenTrans = Matrix.trancpose(hidden);
        Matrix wieghtHidenOutputDelta = Matrix.multiply(gradian, hidenTrans);


        this.weighet_Hiden_Output.add(wieghtHidenOutputDelta);
        this.output_Bais.add(gradian);

        Matrix weighetHidenOutputTrans = Matrix.trancpose(this.weighet_Hiden_Output);
        Matrix hiddenError = Matrix.multiply(weighetHidenOutputTrans, outputError);

        Matrix hiddenGradian = Matrix.map(hidden, new Normalisation() {
            @Override
            public double sigmoid(double x) {
                return NeuralNetwork.desigmonid(x);
            }
        });
        hiddenGradian.multiply(hiddenError);
        hiddenGradian.multiply(this.learningRate);

        Matrix inputsTranc = Matrix.trancpose(Matrix.convertArryToMatrix(inputsArry));
        Matrix weighetInputHiddenDelta = Matrix.multiply(hiddenGradian, inputsTranc);

        this.weighet_Input_Hiden.add(weighetInputHiddenDelta);
        this.hidden_Bais.add(hiddenGradian);


    }
    
  
    
    
    public void mutate(Normalisation n){
      this.weighet_Input_Hiden.map(n);
      this.weighet_Hiden_Output.map(n);
      this.output_Bais.map(n);
      this.hidden_Bais.map(n);   
    }
}
