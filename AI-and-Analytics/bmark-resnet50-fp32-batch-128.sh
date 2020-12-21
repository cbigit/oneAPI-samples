echo 'source /opt/intel/oneapi/setavrs.sh' >> ~/.bashrc
echo 'source activate tensorflow' >> ~/.bashrc

#source activate tensorflow

#pip install -r /opt/intel/oneapi/modelzoo/latest/models/requirements-test.txt

git clone https://github.com/IntelAI/models.git

apt-get install wget
mkdir pretrained
cd pretrained
wget https://storage.googleapis.com/intel-optimized-tensorflow/models/v1_8/resnet50_fp32_pretrained_model.pb
#wget https://storage.googleapis.com/intel-optimized-tensorflow/models/v1_8/resnet101_fp32_pretrained_model.pb
#wget https://storage.googleapis.com/intel-optimized-tensorflow/models/v1_8/inceptionv3_fp32_pretrained_model.pb
cd ..

cd /opt/intel/oneapi/modelzoo/latest/models/benchmarks
python launch_benchmark.py --in-graph /cnvrg/pretrained/resnet50_fp32_pretrained_model.pb \
   --model-name resnet50 --framework tensorflow --precision fp32 --mode inference --batch-size 128 --benchmark-only --noinstall