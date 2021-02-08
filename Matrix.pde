public static class Matrix {

    private int rows, cols;
    public double[][] data;

    public Matrix(int rows, int cols) {
        this.rows = rows;
        this.cols = cols;
        data = new double[rows][cols];
    }

    public static Matrix add(Matrix a, Matrix b) {
        Matrix res = new Matrix(a.rows, a.cols);
        for (int i = 0; i < res.rows; i++) {
            for (int j = 0; j < res.cols; j++) {
                res.data[i][j] = a.data[i][j] + b.data[i][j];
            }
        }
        return res;
    }

    public static Matrix convertArryToMatrix(double[] Array) {
        Matrix result = new Matrix(Array.length, 1);
        for (int i = 0; i < result.rows; i++) {
            result.data[i][0] = Array[i];
        }
        return result;
    }

    public static Matrix multiply(Matrix a, Matrix b) {
        if (a.cols != b.rows) {
            System.err.println("Error");
            return null;
        }
        Matrix result = new Matrix(a.rows, b.cols);
        double sum;
        for (int i = 0; i < result.rows; i++) {
            for (int j = 0; j < result.cols; j++) {
                sum = 0.0;
                for (int k = 0; k < a.cols; k++) {
                    sum += a.data[i][k] * b.data[k][j];
                }
                result.data[i][j] = sum;
            }
        }
        return result;
    }

    public static Matrix trancpose(Matrix a) {
        Matrix result=new Matrix(a.cols,a.rows);
        for(int i=0;i<a.cols;i++){
            for(int j=0;j<a.rows;j++){
                result.data[i][j]=a.data[j][i];
            }
        }
        return result;
    }

    public void multiply(Matrix a) {
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                this.data[i][j]=a.data[i][j]*this.data[i][j];
            }
        }
    }
    public void multiply(double a) {
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                this.data[i][j]=a*this.data[i][j];
            }
        }
    }

    public static Matrix convertArrayListToMatrix(ArrayList<Double> a) {
        Matrix c = new Matrix(a.size(), 1);
        for (int i = 0; i < a.size(); i++) {
            c.data[i][0] = a.get(i);
        }
        return c;
    }

    public static Matrix subtract(Matrix a, Matrix b) {
        Matrix result = new Matrix(a.rows, a.cols);
        for (int i = 0; i < result.rows; i++) {
            for (int j = 0; j < result.cols; j++) {
                result.data[i][j]=a.data[i][j]-b.data[i][j];
            }
        }
        return result;
    }

    public static Matrix map(Matrix a, Normalisation normalisation) {
        Matrix res=new Matrix(a.rows,a.cols);
        for(int i=0;i<a.rows;i++){
            for(int j=0;j<a.cols;j++){
                res.data[i][j]=normalisation.sigmoid(a.data[i][j]);
            }
        }
        return res;
    }

    public void add(Matrix b) {
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                this.data[i][j] = this.data[i][j] + b.data[i][j];
            }
        }
    }

    public void init() {
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                this.data[i][j] = Math.random()*2 - 1;
            }
        
        }
    }

    public void showMatrix() {
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                System.out.print(this.data[i][j] + ",");
            }
            System.out.println();
        }
    }

    public ArrayList<Double> convertMatrixToArray() {

        ArrayList<Double> r = new ArrayList();
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                r.add(this.data[i][j]);
            }
        }
        return r;
    }

    public void map(Normalisation o) {
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                this.data[i][j] = o.sigmoid(this.data[i][j]);
             
            }
        }
    }

}
