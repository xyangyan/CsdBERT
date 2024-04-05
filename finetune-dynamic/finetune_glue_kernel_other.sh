export GLUE_DIR=../glue_data
export TASK_NAME=RTE
export CUDA_VISIBLE_DEVICES=3

# fine-tuning
python ./run_glue_kernel.py \
  --model_name_or_path fnlp/elasticbert-base \
  --task_name $TASK_NAME \
  --do_train \
  --do_lower_case \
  --data_dir "$GLUE_DIR/$TASK_NAME" \
  --log_dir ./logs/glue/kernel \
  --output_dir ./ckpts/glue/kernel/$TASK_NAME \
  --num_hidden_layers 12 \
  --num_output_layers 12 \
  --max_seq_length 128 \
  --per_gpu_train_batch_size 32 \
  --per_gpu_eval_batch_size 32 \
  --learning_rate 2e-5 \
  --weight_decay 0.1 \
  --save_steps 50 \
  --logging_steps 50 \
  --num_train_epochs 5  \
  --warmup_rate 0.06 \
  --evaluate_during_training \
  --overwrite_output_dir \

# infer
python ./run_glue_kernel.py \
  --model_name_or_path fnlp/elasticbert-base \
  --task_name $TASK_NAME \
  --do_eval \
  --do_lower_case \
  --data_dir "$GLUE_DIR/$TASK_NAME" \
  --log_dir ./logs/glue/kernel \
  --output_dir ./ckpts/glue/kernel/$TASK_NAME \
  --num_hidden_layers 12 \
  --num_output_layers 12 \
  --max_seq_length 128 \
  --per_gpu_train_batch_size 32 \
  --per_gpu_eval_batch_size 1 \
  --learning_rate 2e-5 \
  --weight_decay 0.1 \
  --save_steps 50 \
  --logging_steps 50 \
  --num_train_epochs 5  \
  --warmup_rate 0.06 \
  --evaluate_during_training \
  --overwrite_output_dir \
  --eval_all_checkpoints \
  --infer_threshold=1
