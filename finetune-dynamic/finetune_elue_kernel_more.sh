export ELUE_DIR=../elue_data
export TASK_NAME=SNLI
export CUDA_VISIBLE_DEVICES=3

steps=50
#TASK_NAME=$1
#CUDA_VISIBLE_DEVICES=$2

# fine-tuning
python ./run_elue_kernel.py \
  --model_name_or_path ../elasticbert-base \
  --task_name $TASK_NAME \
  --do_train \
  --do_lower_case \
  --data_dir "$ELUE_DIR/$TASK_NAME" \
  --log_dir ./logs/elue/kernel \
  --output_dir ./ckpts/elue/kernel/$TASK_NAME \
  --num_hidden_layers 12 \
  --num_output_layers 12 \
  --max_seq_length 128 \
  --per_gpu_train_batch_size 32 \
  --per_gpu_eval_batch_size 32 \
  --learning_rate 2e-5 \
  --weight_decay 0.1 \
  --save_steps $steps \
  --logging_steps $steps \
  --num_train_epochs 5  \
  --warmup_rate 0.06 \
  --evaluate_during_training \
  --overwrite_output_dir \

# infer
python ./run_elue_kernel.py \
  --model_name_or_path ../elasticbert-base \
  --task_name $TASK_NAME \
  --do_eval \
  --do_lower_case \
  --data_dir "$ELUE_DIR/$TASK_NAME" \
  --log_dir ./logs/elue/kernel \
  --output_dir ./ckpts/elue/kernel/$TASK_NAME \
  --num_hidden_layers 12 \
  --num_output_layers 12 \
  --max_seq_length 128 \
  --per_gpu_train_batch_size 32 \
  --per_gpu_eval_batch_size 1 \
  --learning_rate 2e-5 \
  --weight_decay 0.1 \
  --save_steps $steps \
  --logging_steps $steps \
  --num_train_epochs 5  \
  --warmup_rate 0.06 \
  --evaluate_during_training \
  --overwrite_output_dir \
  --eval_all_checkpoints \
  --infer_threshold=4
