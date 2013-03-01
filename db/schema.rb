# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130228151858) do

  create_table "abnormal", :primary_key => "ab_uid", :force => true do |t|
    t.integer   "abnormal_type_uid"
    t.integer   "dnr_location_uid"
    t.string    "ab_address",        :limit => 40,  :null => false
    t.integer   "mat_uid"
    t.integer   "quantity"
    t.timestamp "ab_issue_date"
    t.integer   "ab_insert_user"
    t.string    "ab_info",           :limit => 256
  end

  create_table "abnormal_corret", :id => false, :force => true do |t|
    t.integer   "ab_uid"
    t.integer   "abnormal_type_uid"
    t.integer   "dnr_location_uid"
    t.string    "ab_address",        :limit => 40
    t.integer   "mat_uid"
    t.integer   "quantity"
    t.timestamp "ab_issue_date"
    t.integer   "ab_insert_user"
    t.string    "ab_info",           :limit => 256
  end

  create_table "abnormal_pm", :id => false, :force => true do |t|
    t.integer   "mat_uid"
    t.integer   "quantity"
    t.boolean   "ab_from"
    t.boolean   "ab_direction"
    t.boolean   "ab_type"
    t.timestamp "ab_timestamp"
  end

  create_table "abnormal_type", :primary_key => "abnormal_type_uid", :force => true do |t|
    t.string "abnormal_type_desc", :limit => 80,  :null => false
    t.string "abnormal_type_def",  :limit => 256
  end

  create_table "abnormal_type_change", :id => false, :force => true do |t|
    t.integer "abnormal_type_uid"
    t.integer "reverse_uid"
  end

  create_table "advise_index", :id => false, :force => true do |t|
    t.string    "explain_requester", :limit => 128,     :default => "",    :null => false
    t.timestamp "explain_time",                                            :null => false
    t.string    "source_name",       :limit => 128,     :default => "",    :null => false
    t.string    "source_schema",     :limit => 128,     :default => "",    :null => false
    t.string    "source_version",    :limit => 64,      :default => "",    :null => false
    t.string    "explain_level",     :limit => 1,       :default => "",    :null => false
    t.integer   "stmtno",                               :default => 0,     :null => false
    t.integer   "sectno",                               :default => 0,     :null => false
    t.integer   "queryno",                              :default => 0,     :null => false
    t.string    "querytag",          :limit => 20,      :default => "",    :null => false
    t.string    "name",              :limit => 128,                        :null => false
    t.string    "creator",           :limit => 128,     :default => "",    :null => false
    t.string    "tbname",            :limit => 128,                        :null => false
    t.string    "tbcreator",         :limit => 128,     :default => "",    :null => false
    t.text      "colnames",          :limit => 2097152,                    :null => false
    t.string    "uniquerule",        :limit => 1,       :default => "",    :null => false
    t.boolean   "colcount",                             :default => false, :null => false
    t.boolean   "iid",                                  :default => false, :null => false
    t.integer   "nleaf",                                :default => 0,     :null => false
    t.boolean   "nlevels",                              :default => false, :null => false
    t.integer   "firstkeycard",                         :default => 0,     :null => false
    t.integer   "fullkeycard",                          :default => 0,     :null => false
    t.boolean   "clusterratio",                         :default => false, :null => false
    t.float     "clusterfactor",                        :default => 0.0,   :null => false
    t.boolean   "userdefined",                          :default => false, :null => false
    t.boolean   "system_required",                      :default => false, :null => false
    t.timestamp "create_time",                                             :null => false
    t.timestamp "stats_time"
    t.string    "page_fetch_pairs",  :limit => 254,     :default => "",    :null => false
    t.string    "remarks",           :limit => 254,     :default => ""
    t.string    "definer",           :limit => 128,     :default => "",    :null => false
    t.string    "converted",         :limit => 1,       :default => "",    :null => false
    t.integer   "sequential_pages",                     :default => 0,     :null => false
    t.integer   "density",                              :default => 0,     :null => false
    t.integer   "first2keycard",                        :default => 0,     :null => false
    t.integer   "first3keycard",                        :default => 0,     :null => false
    t.integer   "first4keycard",                        :default => 0,     :null => false
    t.boolean   "pctfree",                              :default => false, :null => false
    t.boolean   "unique_colcount",                      :default => false, :null => false
    t.boolean   "minpctused",                           :default => false, :null => false
    t.string    "reverse_scans",     :limit => 1,       :default => "N",   :null => false
    t.string    "use_index",         :limit => 1
    t.text      "creation_text",     :limit => 2097152, :default => "",    :null => false
    t.binary    "packed_desc",       :limit => 1048576
    t.timestamp "run_id"
    t.string    "indextype",         :limit => 4,       :default => "",    :null => false
    t.string    "exists",            :limit => 1,       :default => "N",   :null => false
    t.string    "ridtoblock",        :limit => 1,       :default => "N",   :null => false
  end

  add_index "advise_index", ["explain_time"], :name => "idx_i1"
  add_index "advise_index", ["name", "explain_time"], :name => "idx_i2"

  create_table "advise_instance", :primary_key => "start_time", :force => true do |t|
    t.timestamp "end_time",                                          :null => false
    t.string    "mode",             :limit => 4, :default => "",     :null => false
    t.string    "wkld_compression", :limit => 4, :default => "NONE", :null => false
    t.string    "status",           :limit => 9, :default => "",     :null => false
  end

  create_table "advise_mqt", :id => false, :force => true do |t|
    t.string    "explain_requester", :limit => 128,     :default => "",    :null => false
    t.timestamp "explain_time",                                            :null => false
    t.string    "source_name",       :limit => 128,     :default => "",    :null => false
    t.string    "source_schema",     :limit => 128,     :default => "",    :null => false
    t.string    "source_version",    :limit => 64,      :default => "",    :null => false
    t.string    "explain_level",     :limit => 1,       :default => "",    :null => false
    t.integer   "stmtno",                               :default => 0,     :null => false
    t.integer   "sectno",                               :default => 0,     :null => false
    t.string    "name",              :limit => 128,                        :null => false
    t.string    "creator",           :limit => 128,     :default => "",    :null => false
    t.boolean   "iid",                                  :default => false, :null => false
    t.timestamp "create_time",                                             :null => false
    t.timestamp "stats_time"
    t.float     "numrows",                              :default => 0.0,   :null => false
    t.boolean   "numcols",                              :default => false, :null => false
    t.float     "rowsize",                              :default => 0.0,   :null => false
    t.float     "benefit",                              :default => 0.0,   :null => false
    t.string    "use_mqt",           :limit => 1
    t.string    "mqt_source",        :limit => 1
    t.text      "query_text",        :limit => 2097152, :default => "",    :null => false
    t.text      "creation_text",     :limit => 2097152, :default => "",    :null => false
    t.text      "sample_text",       :limit => 2097152, :default => "",    :null => false
    t.text      "colstats",          :limit => 2097152, :default => "",    :null => false
    t.binary    "extra_info",        :limit => 2097152, :default => "",    :null => false
    t.string    "tbspace",           :limit => 128,     :default => "",    :null => false
    t.timestamp "run_id"
    t.string    "refresh_type",      :limit => 1,       :default => "",    :null => false
    t.string    "exists",            :limit => 1,       :default => "N",   :null => false
  end

  add_index "advise_mqt", ["explain_time"], :name => "mqt_i1"
  add_index "advise_mqt", ["name", "explain_time"], :name => "mqt_i2"

  create_table "advise_partition", :id => false, :force => true do |t|
    t.string    "explain_requester", :limit => 128,     :default => "",    :null => false
    t.timestamp "explain_time",                                            :null => false
    t.string    "source_name",       :limit => 128,     :default => "",    :null => false
    t.string    "source_schema",     :limit => 128,     :default => "",    :null => false
    t.string    "source_version",    :limit => 64,      :default => "",    :null => false
    t.string    "explain_level",     :limit => 1,       :default => "",    :null => false
    t.integer   "stmtno",                               :default => 0,     :null => false
    t.integer   "sectno",                               :default => 0,     :null => false
    t.integer   "queryno",                              :default => 0,     :null => false
    t.string    "querytag",          :limit => 20,      :default => "",    :null => false
    t.string    "tbname",            :limit => 128,                        :null => false
    t.string    "tbcreator",         :limit => 128,     :default => "",    :null => false
    t.boolean   "pmid",                                                    :null => false
    t.string    "tbspace",           :limit => 128,     :default => "",    :null => false
    t.text      "colnames",          :limit => 2097152, :default => "",    :null => false
    t.boolean   "colcount",                             :default => false, :null => false
    t.string    "replicate",         :limit => 1,       :default => "N",   :null => false
    t.float     "cost",                                                    :null => false
    t.string    "useit",             :limit => 1
    t.timestamp "run_id"
  end

  add_index "advise_partition", ["explain_time"], :name => "prt_i1"

  create_table "advise_table", :id => false, :force => true do |t|
    t.timestamp "run_id"
    t.string    "table_name",     :limit => 128,                      :null => false
    t.string    "table_schema",   :limit => 128,     :default => "",  :null => false
    t.string    "tablespace",     :limit => 128,     :default => "",  :null => false
    t.string    "selection_flag", :limit => 8,       :default => "",  :null => false
    t.string    "table_exists",   :limit => 1,       :default => "",  :null => false
    t.string    "use_table",      :limit => 1,       :default => "",  :null => false
    t.text      "gen_columns",    :limit => 2097152, :default => "",  :null => false
    t.text      "organize_by",    :limit => 2097152, :default => "",  :null => false
    t.text      "creation_text",  :limit => 2097152, :default => "",  :null => false
    t.text      "alter_command",  :limit => 2097152, :default => "",  :null => false
    t.float     "diskuse",                           :default => 0.0, :null => false
  end

  create_table "advise_workload", :id => false, :force => true do |t|
    t.string  "workload_name",  :limit => 128,     :default => "WK0", :null => false
    t.integer "statement_no",                      :default => 1,     :null => false
    t.text    "statement_text", :limit => 2097152,                    :null => false
    t.string  "statement_tag",  :limit => 256,     :default => "",    :null => false
    t.integer "frequency",                         :default => 1,     :null => false
    t.float   "importance",                        :default => 1.0,   :null => false
    t.float   "weight",                            :default => 1.0,   :null => false
    t.float   "cost_before"
    t.float   "cost_after"
    t.string  "compilable",     :limit => 17
  end

  create_table "alternative_material", :primary_key => "mat_uid", :force => true do |t|
    t.integer "mat_alt_uid",        :null => false
    t.integer "mat_alt_status_uid", :null => false
    t.integer "mat_alt_type_uid",   :null => false
  end

  create_table "am_base_tasks", :force => true do |t|
    t.string "name",             :limit => 128,                    :null => false
    t.text   "appl_filter",      :limit => 32768
    t.string "need_lock_chains", :limit => 1,     :default => "N", :null => false
  end

  create_table "as400_mmls_inv_matchup_data", :id => false, :force => true do |t|
    t.integer   "mat_uid",      :null => false
    t.integer   "diff",         :null => false
    t.integer   "ruleid"
    t.timestamp "insert_date"
    t.integer   "start_buffer"
  end

  create_table "as400_upd_data", :id => false, :force => true do |t|
    t.integer   "mat_uid",                  :null => false
    t.string    "mat_serial", :limit => 40, :null => false
    t.integer   "stqava",                   :null => false
    t.integer   "rack_qnt",                 :null => false
    t.integer   "case_qnt",                 :null => false
    t.integer   "ava_qnt",                  :null => false
    t.integer   "prm_qnt",                  :null => false
    t.integer   "snd_qnt",                  :null => false
    t.integer   "cnt",                      :null => false
    t.integer   "diff",                     :null => false
    t.integer   "control",                  :null => false
    t.timestamp "upd_date",                 :null => false
  end

  create_table "as400_update_data_friday", :id => false, :force => true do |t|
    t.integer   "mat_uid",                       :null => false
    t.string    "mat_serial",      :limit => 40, :null => false
    t.integer   "last_as400"
    t.integer   "as400_start"
    t.integer   "excel_count_qnt"
    t.integer   "excel_start_qnt"
    t.integer   "rack_qnt"
    t.integer   "case_qnt"
    t.integer   "abn_qnt"
    t.integer   "waybill_qnt"
    t.integer   "ship_qnt"
    t.integer   "exit_qnt"
    t.integer   "export_qnt"
    t.integer   "pdi_qnt"
    t.integer   "bill_qnt"
    t.timestamp "last_exit_date"
  end

  create_table "as400_update_data_son", :id => false, :force => true do |t|
    t.integer   "mat_uid",                       :null => false
    t.string    "mat_serial",      :limit => 40, :null => false
    t.integer   "last_as400"
    t.integer   "as400_start"
    t.integer   "excel_count_qnt"
    t.integer   "excel_start_qnt"
    t.integer   "rack_qnt"
    t.integer   "case_qnt"
    t.integer   "abn_qnt"
    t.integer   "waybill_qnt"
    t.integer   "ship_qnt"
    t.integer   "exit_qnt"
    t.integer   "export_qnt"
    t.integer   "pdi_qnt"
    t.integer   "bill_qnt"
    t.timestamp "last_exit_date"
  end

  create_table "as400_update_data_son_end", :id => false, :force => true do |t|
    t.integer   "mat_uid",                       :null => false
    t.string    "mat_serial",      :limit => 40, :null => false
    t.integer   "last_as400"
    t.integer   "as400_start"
    t.integer   "excel_count_qnt"
    t.integer   "excel_start_qnt"
    t.integer   "rack_qnt"
    t.integer   "case_qnt"
    t.integer   "abn_qnt"
    t.integer   "waybill_qnt"
    t.integer   "ship_qnt"
    t.integer   "exit_qnt"
    t.integer   "export_qnt"
    t.integer   "pdi_qnt"
    t.integer   "bill_qnt"
    t.timestamp "last_exit_date"
  end

  create_table "barcode", :primary_key => "barcode_uid", :force => true do |t|
    t.string "barcode_def",    :limit => 10
    t.string "barcode_script", :limit => 100, :null => false
  end

  create_table "blinvoice", :primary_key => "invono", :force => true do |t|
    t.string  "order_id", :limit => 40,                :null => false
    t.integer "co_uid",                                :null => false
    t.string  "bl",       :limit => 40
    t.date    "cc_date"
    t.integer "sh_uid",                 :default => 0
  end

  create_table "bool", :primary_key => "bool", :force => true do |t|
    t.string "boolyn", :limit => 10, :null => false
    t.string "boolai", :limit => 10
  end

  create_table "buffer_case", :id => false, :force => true do |t|
    t.string  "mat_address", :limit => 40, :null => false
    t.integer "ca_uid",                    :null => false
  end

  create_table "buffer_group", :primary_key => "bf_uid", :force => true do |t|
    t.integer "bf_wh_type_uid",                   :null => false
    t.string  "bf_name",           :limit => 80,  :null => false
    t.string  "bf_rack_filter",    :limit => 100, :null => false
    t.string  "bf_address_filter", :limit => 15
  end

  add_index "buffer_group", ["bf_name"], :name => "cc1286329161234", :unique => true

  create_table "buffer_status", :primary_key => "buffer_status_uid", :force => true do |t|
    t.string "buffer_status_desc", :limit => 40,  :null => false
    t.string "buffer_status_def",  :limit => 256
  end

  create_table "buffer_type", :primary_key => "buffer_type_uid", :force => true do |t|
    t.string "buffer_type_desc", :limit => 40,  :null => false
    t.string "buffer_type_def",  :limit => 256
  end

  create_table "buffers", :primary_key => "mat_address", :force => true do |t|
    t.boolean "buffer_type", :default => false, :null => false
  end

  create_table "ca_approve", :id => false, :force => true do |t|
    t.integer   "ca_uid",      :null => false
    t.integer   "emp_uid"
    t.timestamp "start_date",  :null => false
    t.timestamp "finish_date"
  end

  add_index "ca_approve", ["ca_uid"], :name => "ix_cauid_approve", :unique => true

  create_table "ca_box", :id => false, :force => true do |t|
    t.integer   "box_count",                    :null => false
    t.string    "supp_def_id",    :limit => 4,  :null => false
    t.string    "mat_serial",     :limit => 40, :null => false
    t.integer   "quantity",                     :null => false
    t.string    "order_no",       :limit => 40, :null => false
    t.string    "ca_serial",      :limit => 40, :null => false
    t.string    "barcode_string", :limit => 50, :null => false
    t.timestamp "opr_time"
    t.integer   "case_no",                      :null => false
  end

  create_table "ca_box_local", :id => false, :force => true do |t|
    t.integer   "box_count",                    :null => false
    t.integer   "case_no",                      :null => false
    t.string    "supp_def_id",    :limit => 4,  :null => false
    t.string    "mat_serial",     :limit => 40, :null => false
    t.integer   "quantity",                     :null => false
    t.string    "ca_serial",      :limit => 40, :null => false
    t.string    "barcode_string", :limit => 50, :null => false
    t.timestamp "opr_time"
  end

  create_table "ca_count", :id => false, :force => true do |t|
    t.integer "ca_uid",       :null => false
    t.integer "mat_uid",      :null => false
    t.integer "quantity"
    t.integer "count_status"
    t.integer "emp_uid"
    t.integer "count_no"
  end

  add_index "ca_count", ["ca_uid", "mat_uid", "emp_uid"], :name => "pk_ca_cnt_1"

  create_table "ca_distribute", :id => false, :force => true do |t|
    t.integer   "ca_uid"
    t.string    "ca_serial",   :limit => 40, :null => false
    t.integer   "ca_count",                  :null => false
    t.integer   "supp_uid",                  :null => false
    t.integer   "mat_uid",                   :null => false
    t.integer   "quantity",                  :null => false
    t.integer   "dist_status"
    t.timestamp "dist_date"
  end

  add_index "ca_distribute", ["ca_uid", "ca_serial", "supp_uid", "mat_uid", "dist_status"], :name => "pk_ca_dist"
  add_index "ca_distribute", ["dist_status", "ca_serial", "supp_uid"], :name => "idx909241529290000"
  add_index "ca_distribute", ["supp_uid", "dist_status"], :name => "idx909241540530000"

  create_table "ca_old_status", :id => false, :force => true do |t|
    t.integer "ca_uid",        :null => false
    t.integer "ca_status_uid", :null => false
  end

  create_table "ca_receive", :id => false, :force => true do |t|
    t.integer "ca_uid",                  :null => false
    t.integer "co_uid"
    t.string  "ca_serial", :limit => 40
  end

  create_table "ca_return", :id => false, :force => true do |t|
    t.integer   "ca_uid",                    :null => false
    t.integer   "cust_uid",                  :null => false
    t.string    "invoice_no",  :limit => 20, :null => false
    t.integer   "mat_uid",                   :null => false
    t.integer   "quantity",                  :null => false
    t.timestamp "insert_date",               :null => false
    t.boolean   "status",                    :null => false
  end

  create_table "ca_select", :id => false, :force => true do |t|
    t.integer "ca_uid",                 :null => false
    t.integer "mat_uid",                :null => false
    t.integer "template",               :null => false
    t.string  "address",  :limit => 40
    t.integer "amount",                 :null => false
    t.integer "selected",               :null => false
  end

  create_table "ca_unpack", :primary_key => "ca_uid", :force => true do |t|
    t.timestamp "ca_unpack_time",                :null => false
    t.integer   "emp_uid",        :default => 0, :null => false
  end

  create_table "car", :primary_key => "car_uid", :force => true do |t|
    t.string "car_desc",        :limit => 40,  :null => false
    t.string "car_spec_header", :limit => 10
    t.string "car_def",         :limit => 256
  end

  create_table "cardex", :primary_key => "cardex_uid", :force => true do |t|
    t.string "cardex_desc", :limit => 3,   :null => false
    t.string "cardex_def",  :limit => 256
  end

  create_table "cases", :primary_key => "ca_uid", :force => true do |t|
    t.string  "ca_serial",        :limit => 40,  :null => false
    t.integer "ca_status_uid",                   :null => false
    t.integer "ca_type_uid",                     :null => false
    t.string  "wh_address_alias", :limit => 40
    t.integer "wh_address_floor"
    t.integer "haos_container"
    t.string  "ca_note",          :limit => 100
  end

  add_index "cases", ["ca_serial", "ca_uid"], :name => "idx909241538070000"
  add_index "cases", ["ca_uid", "ca_serial"], :name => "idx909241428110000", :unique => true
  add_index "cases", ["ca_uid", "ca_status_uid"], :name => "idx909241530210000", :unique => true

  create_table "cases_test", :primary_key => "ca_uid", :force => true do |t|
    t.string  "ca_serial",        :limit => 40,  :null => false
    t.integer "ca_status_uid",                   :null => false
    t.integer "ca_type_uid",                     :null => false
    t.string  "wh_address_alias", :limit => 40
    t.integer "wh_address_floor"
    t.integer "haos_container"
    t.string  "ca_note",          :limit => 100
  end

  add_index "cases_test", ["ca_serial", "ca_uid"], :name => "pk_cases_test5"
  add_index "cases_test", ["ca_uid", "ca_serial"], :name => "pk_cases_test2", :unique => true

  create_table "cases_warehouse_zone", :primary_key => "ca_uid", :force => true do |t|
    t.integer "wh_zone_uid",                 :null => false
    t.string  "wh_address",    :limit => 16
    t.string  "wh_subzone",    :limit => 40
    t.boolean "wh_zone_level"
  end

  create_table "co_ca", :primary_key => "co_uid", :force => true do |t|
    t.integer "ca_uid", :null => false
  end

  create_table "co_integrate", :id => false, :force => true do |t|
    t.integer   "seq",                            :null => false
    t.integer   "co_uid",                         :null => false
    t.string    "co_serial",       :limit => 40,  :null => false
    t.string    "intg_type",       :limit => 1,   :null => false
    t.string    "order_type",      :limit => 10,  :null => false
    t.integer   "j_uid"
    t.timestamp "co_receive_date"
    t.timestamp "co_exit_date"
    t.string    "intg_status",     :limit => 1,   :null => false
    t.string    "err_msg",         :limit => 200
    t.timestamp "intg_timestamp"
  end

  create_table "co_old_status", :id => false, :force => true do |t|
    t.integer "co_uid",        :null => false
    t.integer "co_status_uid", :null => false
  end

  create_table "co_select", :id => false, :force => true do |t|
    t.integer   "co_uid",                              :null => false
    t.integer   "co_status_uid",                       :null => false
    t.timestamp "co_entrance_date",                    :null => false
    t.integer   "co_demurrage",     :default => 0,     :null => false
    t.timestamp "co_demurrage_end",                    :null => false
    t.integer   "co_point",         :default => 0,     :null => false
    t.boolean   "co_selected",      :default => false
    t.integer   "ca_uid",                              :null => false
    t.boolean   "ca_selected",      :default => false
    t.timestamp "co_arrive_date"
    t.integer   "dem"
  end

  create_table "connheader_lockoz", :id => false, :force => true do |t|
    t.integer   "agent_id",                      :null => false
    t.string    "appl_id",         :limit => 32, :null => false
    t.string    "appl_name",                     :null => false
    t.string    "auth_id",         :limit => 30, :null => false
    t.string    "client_db_alias", :limit => 8,  :null => false
    t.string    "client_nname",    :limit => 20, :null => false
    t.integer   "client_pid",                    :null => false
    t.integer   "client_platform",               :null => false
    t.string    "client_prdid",    :limit => 20, :null => false
    t.integer   "client_protocol",               :null => false
    t.integer   "codepage_id",                   :null => false
    t.timestamp "conn_time",                     :null => false
    t.string    "corr_token",      :limit => 32, :null => false
    t.string    "execution_id",    :limit => 30, :null => false
    t.string    "sequence_no",     :limit => 4,  :null => false
    t.integer   "territory_code",                :null => false
  end

  create_table "connheader_trial", :id => false, :force => true do |t|
    t.integer   "agent_id",                      :null => false
    t.string    "appl_id",         :limit => 32, :null => false
    t.string    "appl_name",                     :null => false
    t.string    "auth_id",         :limit => 30, :null => false
    t.string    "client_db_alias", :limit => 8,  :null => false
    t.string    "client_nname",    :limit => 20, :null => false
    t.integer   "client_pid",                    :null => false
    t.integer   "client_platform",               :null => false
    t.string    "client_prdid",    :limit => 20, :null => false
    t.integer   "client_protocol",               :null => false
    t.integer   "codepage_id",                   :null => false
    t.timestamp "conn_time",                     :null => false
    t.string    "corr_token",      :limit => 32, :null => false
    t.string    "execution_id",    :limit => 30, :null => false
    t.string    "sequence_no",     :limit => 4,  :null => false
    t.integer   "territory_code",                :null => false
  end

  create_table "cont_yard", :primary_key => "cy_address", :force => true do |t|
    t.integer "cy_zone_uid"
    t.string  "cy_subzone",  :limit => 40
  end

  create_table "cont_yard_zone", :primary_key => "cy_zone_uid", :force => true do |t|
    t.string  "cy_zone_alias",         :limit => 40, :null => false
    t.boolean "cy_zone_ns_direction"
    t.boolean "cy_zone_we_direction"
    t.integer "cy_zone_width"
    t.integer "cy_zone_height"
    t.string  "cy_zone_color",         :limit => 10
    t.boolean "cy_zone_max_level"
    t.integer "cy_subzone_row"
    t.integer "cy_subzone_col"
    t.string  "cy_zone_start_address", :limit => 10
  end

  create_table "cont_yard_zone_container", :primary_key => "cy_zone_uid", :force => true do |t|
    t.integer "co_uid",                      :null => false
    t.string  "cy_address",    :limit => 20
    t.string  "cy_subzone",    :limit => 20
    t.boolean "cy_zone_level"
  end

  create_table "cont_yard_zone_rules", :id => false, :force => true do |t|
    t.integer "cy_zone_uid",               :null => false
    t.integer "rule_uid",                  :null => false
    t.string  "rule_param",  :limit => 40
  end

  create_table "container_case", :primary_key => "co_uid", :force => true do |t|
    t.integer "ca_uid", :null => false
  end

  create_table "control_lockoz", :id => false, :force => true do |t|
    t.string    "event_monitor_name", :limit => 128, :null => false
    t.string    "message",            :limit => 128, :null => false
    t.timestamp "message_time",                      :null => false
  end

  create_table "control_trial", :id => false, :force => true do |t|
    t.string    "event_monitor_name", :limit => 128, :null => false
    t.string    "message",            :limit => 128, :null => false
    t.timestamp "message_time",                      :null => false
  end

  create_table "count", :primary_key => "count_uid", :force => true do |t|
    t.timestamp "count_start_date",                :null => false
    t.timestamp "count_finish_date",               :null => false
    t.integer   "count_status_uid"
    t.integer   "sysmatkind_uid"
    t.integer   "count_type_uid"
    t.integer   "mat_uid"
    t.integer   "cy_zone_uid"
    t.integer   "wh_zone_uid"
    t.integer   "sta_uid"
    t.string    "buffer_address",    :limit => 80
  end

  create_table "count_abnormal", :primary_key => "count_uid", :force => true do |t|
    t.string "reason_src", :limit => 1
  end

  create_table "count_bc", :id => false, :force => true do |t|
    t.string    "mat_address",     :limit => 40, :null => false
    t.integer   "ca_uid",                        :null => false
    t.integer   "count_uid",                     :null => false
    t.timestamp "count_timestamp",               :null => false
    t.integer   "emp_uid",                       :null => false
  end

  create_table "count_cc", :id => false, :force => true do |t|
    t.integer   "co_uid",          :null => false
    t.integer   "ca_uid",          :null => false
    t.integer   "count_uid",       :null => false
    t.timestamp "count_timestamp", :null => false
    t.integer   "emp_uid",         :null => false
  end

  create_table "count_cwz", :id => false, :force => true do |t|
    t.integer   "ca_uid",                        :null => false
    t.integer   "wh_zone_uid",                   :null => false
    t.string    "wh_address",      :limit => 10
    t.string    "wh_subzone",      :limit => 40
    t.boolean   "wh_zone_level"
    t.integer   "count_uid",                     :null => false
    t.timestamp "count_timestamp",               :null => false
    t.integer   "emp_uid",                       :null => false
  end

  create_table "count_cyzc", :id => false, :force => true do |t|
    t.integer   "cy_zone_uid",                   :null => false
    t.integer   "co_uid",                        :null => false
    t.string    "cy_address",      :limit => 10
    t.string    "cy_subzone",      :limit => 10
    t.boolean   "cy_zone_level"
    t.integer   "count_uid",                     :null => false
    t.timestamp "count_timestamp",               :null => false
    t.integer   "emp_uid",                       :null => false
  end

  create_table "count_ext_data", :id => false, :force => true do |t|
    t.string    "mat_serial",   :limit => 40
    t.string    "mat_address",  :limit => 40
    t.integer   "quantity",                                  :null => false
    t.integer   "count_status",                              :null => false
    t.integer   "count_type",                                :null => false
    t.string    "ca_serial",    :limit => 40
    t.string    "file_name",    :limit => 80
    t.timestamp "insert_date"
    t.integer   "processed",                  :default => 0, :null => false
  end

  create_table "count_ma", :id => false, :force => true do |t|
    t.integer   "mat_uid"
    t.string    "mat_address",      :limit => 40
    t.integer   "current_quantity",               :default => 0, :null => false
    t.integer   "count_uid",                                     :null => false
    t.timestamp "count_timestamp",                               :null => false
    t.integer   "emp_uid",                                       :null => false
    t.integer   "rack_quantity"
    t.integer   "count_status"
  end

  create_table "count_mc", :id => false, :force => true do |t|
    t.integer   "ca_uid",                         :null => false
    t.integer   "mat_uid",                        :null => false
    t.integer   "box_quantity",                   :null => false
    t.integer   "count_uid",                      :null => false
    t.timestamp "count_timestamp",                :null => false
    t.integer   "emp_uid",                        :null => false
    t.integer   "old_quantity",    :default => 0, :null => false
  end

  create_table "count_mc_non", :id => false, :force => true do |t|
    t.integer   "ca_uid",                         :null => false
    t.integer   "mat_uid",                        :null => false
    t.integer   "box_quantity",                   :null => false
    t.integer   "count_uid",                      :null => false
    t.timestamp "count_timestamp",                :null => false
    t.integer   "emp_uid",                        :null => false
    t.integer   "old_quantity",    :default => 0, :null => false
  end

  create_table "count_status", :primary_key => "count_status_uid", :force => true do |t|
    t.string "count_status_desc", :limit => 40, :null => false
  end

  create_table "count_type", :primary_key => "count_type_uid", :force => true do |t|
    t.string "count_type_desc", :limit => 40, :null => false
    t.string "count_type_def",  :limit => 80
  end

  create_table "cust_distribute", :id => false, :force => true do |t|
    t.string  "pikno",           :limit => 11
    t.integer "cust_uid"
    t.string  "dealer",          :limit => 5
    t.integer "insert_date"
    t.string  "order_no",        :limit => 8
    t.string  "order_line",      :limit => 4
    t.string  "suffix",          :limit => 1
    t.integer "mat_uid"
    t.string  "partno",          :limit => 40
    t.integer "order_qnt"
    t.integer "job_qnt"
    t.string  "address",         :limit => 40
    t.boolean "cust_address_id"
    t.integer "cust_address"
    t.boolean "job_create"
    t.integer "priority"
  end

  add_index "cust_distribute", ["cust_uid", "job_create", "cust_address_id", "mat_uid"], :name => "pk_job_status_cust"
  add_index "cust_distribute", ["mat_uid", "address"], :name => "pk_cust_distribute"
  add_index "cust_distribute", ["pikno"], :name => "cust_dist_pik"

  create_table "cust_orders", :primary_key => "cust_uid", :force => true do |t|
    t.integer   "order_status_uid",                 :null => false
    t.integer   "order_type_uid",                   :null => false
    t.string    "pikno",              :limit => 20, :null => false
    t.timestamp "order_insert_date"
    t.timestamp "order_receive_date"
    t.timestamp "order_exit_date"
    t.integer   "mat_uid",                          :null => false
    t.integer   "order_quantity",                   :null => false
    t.integer   "collect_quantity"
    t.string    "collect_address",    :limit => 40
    t.integer   "wh_address_uid"
    t.integer   "ca_uid"
    t.integer   "packed_quantity"
  end

  create_table "cust_return", :id => false, :force => true do |t|
    t.integer "mat_uid",                   :null => false
    t.string  "mat_serial",  :limit => 40, :null => false
    t.integer "return_date",               :null => false
    t.string  "type",        :limit => 2
    t.integer "quantity",                  :null => false
  end

  create_table "cust_status", :id => false, :force => true do |t|
    t.integer "cust_status_uid",                 :null => false
    t.string  "cust_status_desc", :limit => 40,  :null => false
    t.string  "cust_status_def",  :limit => 256
  end

  create_table "cust_type", :primary_key => "cust_type_uid", :force => true do |t|
    t.string "cust_type_desc", :limit => 40,  :null => false
    t.string "cust_type_def",  :limit => 256
  end

  create_table "customer", :primary_key => "cust_uid", :force => true do |t|
    t.string  "cust_default_id", :limit => 40
    t.string  "cust_name",       :limit => 60,                    :null => false
    t.integer "cust_type_uid"
    t.string  "cust_address"
    t.string  "cust_country",    :limit => 80
    t.string  "cust_zip",        :limit => 10
    t.string  "cust_tel1",       :limit => 15
    t.string  "cust_tel2",       :limit => 15
    t.string  "cust_fax",        :limit => 15
    t.string  "cust_email",      :limit => 80
    t.string  "cust_taxno",      :limit => 40
    t.string  "cust_taxof",      :limit => 40
    t.string  "cust_zipcode",    :limit => 40
    t.string  "cust_cont_name",  :limit => 80
    t.boolean "cust_effective",                :default => false, :null => false
    t.string  "cust_web",        :limit => 80
  end

  add_index "customer", ["cust_default_id", "cust_name", "cust_uid"], :name => "idx909241438200000"
  add_index "customer", ["cust_default_id", "cust_name"], :name => "idx909241428170000"
  add_index "customer", ["cust_uid", "cust_default_id", "cust_country"], :name => "idx909241539160000", :unique => true

  create_table "customer_cont", :primary_key => "cust_con_uid", :force => true do |t|
    t.integer "cust_uid"
    t.string  "cust_con_name",    :limit => 80
    t.string  "cust_con_address"
    t.string  "cust_con_zip",     :limit => 10
    t.string  "cust_con_tel1",    :limit => 15
    t.string  "cust_con_tel2",    :limit => 15
    t.string  "cust_con_fax",     :limit => 15
    t.string  "cust_con_email",   :limit => 80
    t.string  "cust_adr_id",      :limit => 1
  end

  add_index "customer_cont", ["cust_uid", "cust_adr_id", "cust_con_email", "cust_con_fax", "cust_con_tel2", "cust_con_tel1", "cust_con_zip", "cust_con_address", "cust_con_name"], :name => "idx909241539320000"

  create_table "customer_period", :primary_key => "cust_per_uid", :force => true do |t|
    t.integer "cust_uid",                       :null => false
    t.boolean "cust_day"
    t.string  "cust_start_time",  :limit => 10
    t.string  "cust_finish_time", :limit => 10
  end

  create_table "datapik2", :id => false, :force => true do |t|
    t.string  "p1npik", :limit => 11,                               :null => false
    t.string  "p1ncfm", :limit => 20,                               :null => false
    t.decimal "p1dpik",               :precision => 8, :scale => 0, :null => false
    t.integer "p1qpic",                                             :null => false
    t.string  "p1flg",  :limit => 1,                                :null => false
  end

  create_table "deadlock_lockoz", :id => false, :force => true do |t|
    t.integer   "deadlock_id",                              :null => false
    t.integer   "dl_conns",                                 :null => false
    t.integer   "evmon_activates",                          :null => false
    t.integer   "rolled_back_agent_id",                     :null => false
    t.string    "rolled_back_appl_id",        :limit => 32, :null => false
    t.boolean   "rolled_back_participant_no",               :null => false
    t.string    "rolled_back_sequence_no",    :limit => 4,  :null => false
    t.timestamp "start_time",                               :null => false
  end

  create_table "deadlock_trial", :id => false, :force => true do |t|
    t.integer   "deadlock_id",                              :null => false
    t.integer   "dl_conns",                                 :null => false
    t.integer   "evmon_activates",                          :null => false
    t.integer   "rolled_back_agent_id",                     :null => false
    t.string    "rolled_back_appl_id",        :limit => 32, :null => false
    t.boolean   "rolled_back_participant_no",               :null => false
    t.string    "rolled_back_sequence_no",    :limit => 4,  :null => false
    t.timestamp "start_time",                               :null => false
  end

  create_table "dlconn_lockoz", :id => false, :force => true do |t|
    t.integer   "agent_id",                                     :null => false
    t.string    "appl_id",                   :limit => 32,      :null => false
    t.string    "appl_id_holding_lk",        :limit => 32,      :null => false
    t.boolean   "blocking_cursor",                              :null => false
    t.string    "creator",                   :limit => 30,      :null => false
    t.string    "cursor_name",               :limit => 18,      :null => false
    t.integer   "deadlock_id",                                  :null => false
    t.integer   "evmon_activates",                              :null => false
    t.integer   "lock_attributes",                              :null => false
    t.integer   "lock_count",                                   :null => false
    t.integer   "lock_current_mode",                            :null => false
    t.boolean   "lock_escalation",                              :null => false
    t.integer   "lock_hold_count",                              :null => false
    t.integer   "lock_mode",                                    :null => false
    t.integer   "lock_mode_requested",                          :null => false
    t.string    "lock_name",                 :limit => 13,      :null => false
    t.integer   "lock_node",                                    :null => false
    t.integer   "lock_object_name",                             :null => false
    t.integer   "lock_object_type",                             :null => false
    t.integer   "lock_release_flags",                           :null => false
    t.timestamp "lock_wait_start_time",                         :null => false
    t.integer   "locks_held",                                   :null => false
    t.integer   "locks_in_list",                                :null => false
    t.string    "package_name",              :limit => 8,       :null => false
    t.boolean   "participant_no",                               :null => false
    t.boolean   "participant_no_holding_lk",                    :null => false
    t.integer   "section_number",                               :null => false
    t.string    "sequence_no",               :limit => 4,       :null => false
    t.string    "sequence_no_holding_lk",    :limit => 4,       :null => false
    t.timestamp "start_time",                                   :null => false
    t.integer   "stmt_operation",                               :null => false
    t.integer   "stmt_type",                                    :null => false
    t.string    "table_name",                :limit => 128,     :null => false
    t.string    "table_schema",              :limit => 30,      :null => false
    t.string    "tablespace_name",           :limit => 18,      :null => false
    t.text      "stmt_text",                 :limit => 2097152
  end

  create_table "dlconn_trial", :id => false, :force => true do |t|
    t.integer   "agent_id",                                     :null => false
    t.string    "appl_id",                   :limit => 32,      :null => false
    t.string    "appl_id_holding_lk",        :limit => 32,      :null => false
    t.boolean   "blocking_cursor",                              :null => false
    t.string    "creator",                   :limit => 30,      :null => false
    t.string    "cursor_name",               :limit => 18,      :null => false
    t.integer   "deadlock_id",                                  :null => false
    t.integer   "evmon_activates",                              :null => false
    t.integer   "lock_attributes",                              :null => false
    t.integer   "lock_count",                                   :null => false
    t.integer   "lock_current_mode",                            :null => false
    t.boolean   "lock_escalation",                              :null => false
    t.integer   "lock_hold_count",                              :null => false
    t.integer   "lock_mode",                                    :null => false
    t.integer   "lock_mode_requested",                          :null => false
    t.string    "lock_name",                 :limit => 13,      :null => false
    t.integer   "lock_node",                                    :null => false
    t.integer   "lock_object_name",                             :null => false
    t.integer   "lock_object_type",                             :null => false
    t.integer   "lock_release_flags",                           :null => false
    t.timestamp "lock_wait_start_time",                         :null => false
    t.integer   "locks_held",                                   :null => false
    t.integer   "locks_in_list",                                :null => false
    t.string    "package_name",              :limit => 8,       :null => false
    t.boolean   "participant_no",                               :null => false
    t.boolean   "participant_no_holding_lk",                    :null => false
    t.integer   "section_number",                               :null => false
    t.string    "sequence_no",               :limit => 4,       :null => false
    t.string    "sequence_no_holding_lk",    :limit => 4,       :null => false
    t.timestamp "start_time",                                   :null => false
    t.integer   "stmt_operation",                               :null => false
    t.integer   "stmt_type",                                    :null => false
    t.string    "table_name",                :limit => 128,     :null => false
    t.string    "table_schema",              :limit => 30,      :null => false
    t.string    "tablespace_name",           :limit => 18,      :null => false
    t.text      "stmt_text",                 :limit => 2097152
  end

  create_table "dllock_lockoz", :id => false, :force => true do |t|
    t.integer "deadlock_id",                       :null => false
    t.integer "evmon_activates",                   :null => false
    t.integer "lock_attributes",                   :null => false
    t.integer "lock_count",                        :null => false
    t.integer "lock_current_mode",                 :null => false
    t.boolean "lock_escalation",                   :null => false
    t.integer "lock_hold_count",                   :null => false
    t.integer "lock_mode",                         :null => false
    t.string  "lock_name",          :limit => 13,  :null => false
    t.integer "lock_object_name",                  :null => false
    t.integer "lock_object_type",                  :null => false
    t.integer "lock_release_flags",                :null => false
    t.integer "lock_status",                       :null => false
    t.boolean "participant_no",                    :null => false
    t.integer "table_file_id",                     :null => false
    t.string  "table_name",         :limit => 128, :null => false
    t.string  "table_schema",       :limit => 30,  :null => false
    t.string  "tablespace_name",    :limit => 18,  :null => false
  end

  create_table "dllock_trial", :id => false, :force => true do |t|
    t.integer "deadlock_id",                       :null => false
    t.integer "evmon_activates",                   :null => false
    t.integer "lock_attributes",                   :null => false
    t.integer "lock_count",                        :null => false
    t.integer "lock_current_mode",                 :null => false
    t.boolean "lock_escalation",                   :null => false
    t.integer "lock_hold_count",                   :null => false
    t.integer "lock_mode",                         :null => false
    t.string  "lock_name",          :limit => 13,  :null => false
    t.integer "lock_object_name",                  :null => false
    t.integer "lock_object_type",                  :null => false
    t.integer "lock_release_flags",                :null => false
    t.integer "lock_status",                       :null => false
    t.boolean "participant_no",                    :null => false
    t.integer "table_file_id",                     :null => false
    t.string  "table_name",         :limit => 128, :null => false
    t.string  "table_schema",       :limit => 30,  :null => false
    t.string  "tablespace_name",    :limit => 18,  :null => false
  end

  create_table "emp_department", :primary_key => "emp_department_uid", :force => true do |t|
    t.string "emp_department_desc", :limit => 80,  :null => false
    t.string "emp_department_def",  :limit => 256
  end

  create_table "emp_group", :primary_key => "emp_group_uid", :force => true do |t|
    t.string "emp_group_desc", :limit => 80
    t.string "emp_group_def",  :limit => 256
  end

  add_index "emp_group", ["emp_group_uid", "emp_group_desc"], :name => "idx909241437340000", :unique => true

  create_table "emp_main_group", :id => false, :force => true do |t|
    t.integer "emp_uid",       :null => false
    t.integer "emp_group_uid", :null => false
    t.integer "sg_uid"
  end

  add_index "emp_main_group", ["emp_uid"], :name => "pk_emp_main_gr"

  create_table "emp_mat", :id => false, :force => true do |t|
    t.integer   "emp_uid", :null => false
    t.integer   "mat_uid", :null => false
    t.integer   "amount",  :null => false
    t.timestamp "time",    :null => false
  end

  create_table "emp_old_group", :id => false, :force => true do |t|
    t.integer "emp_uid",       :null => false
    t.integer "emp_group_uid", :null => false
    t.integer "sg_uid"
  end

  add_index "emp_old_group", ["emp_uid"], :name => "pk_emp_old_grp"

  create_table "emp_position", :primary_key => "emp_position_uid", :force => true do |t|
    t.string "emp_position_desc", :limit => 80,  :null => false
    t.string "emp_position_def",  :limit => 256
  end

  create_table "emp_section", :primary_key => "emp_section_uid", :force => true do |t|
    t.string "emp_section_desc", :limit => 80,  :null => false
    t.string "emp_section_def",  :limit => 256
  end

  create_table "employee", :primary_key => "emp_uid", :force => true do |t|
    t.string  "emp_username",       :limit => 40
    t.string  "emp_password",       :limit => 40
    t.integer "emp_position_uid"
    t.integer "emp_department_uid"
    t.integer "workarea_uid"
    t.integer "emp_group_uid"
    t.string  "emp_default_id",     :limit => 40
    t.string  "emp_name",           :limit => 80,                :null => false
    t.string  "emp_surname",        :limit => 80,                :null => false
    t.boolean "emp_active"
    t.string  "emp_tel",            :limit => 15
    t.string  "emp_gsm",            :limit => 15
    t.string  "emp_fax",            :limit => 15
    t.string  "emp_address"
    t.string  "emp_email",          :limit => 80
    t.string  "emp_photo",          :limit => 80
    t.integer "sg_uid",                           :default => 0
    t.integer "emp_section_uid",                  :default => 0
  end

  add_index "employee", ["emp_uid", "emp_username"], :name => "idx909241428020000", :unique => true

  create_table "employee_qualification", :primary_key => "emp_uid", :force => true do |t|
    t.integer "qualification_uid",                :null => false
    t.string  "emp_qual_parameter", :limit => 80
  end

  create_table "employee_workarea", :primary_key => "emp_uid", :force => true do |t|
    t.integer "workarea_uid", :null => false
  end

  create_table "equi", :primary_key => "equi_uid", :force => true do |t|
    t.string  "equi_default_id", :limit => 40,                :null => false
    t.string  "equi_name",       :limit => 80
    t.integer "equi_type_uid"
    t.integer "equi_status_uid"
    t.integer "equi_max_case"
    t.float   "equi_max_load"
    t.integer "equi_energy_uid"
    t.integer "emp_group_uid",                 :default => 0
  end

  add_index "equi", ["equi_default_id"], :name => "pk_equi_default_id", :unique => true

  create_table "equi_energy", :primary_key => "equi_energy_uid", :force => true do |t|
    t.string "equi_energy_desc", :limit => 80,  :null => false
    t.string "equi_energy_def",  :limit => 256
  end

  create_table "equi_mat", :primary_key => "equi_uid", :force => true do |t|
    t.integer "mat_uid",                   :null => false
    t.string  "mat_address", :limit => 40, :null => false
    t.integer "quantity"
  end

  add_index "equi_mat", ["mat_address", "quantity"], :name => "idx909241645180000"

  create_table "equi_status", :primary_key => "equi_status_uid", :force => true do |t|
    t.string "equi_status_desc", :limit => 40,  :null => false
    t.string "equi_status_def",  :limit => 256
  end

  create_table "equi_type", :primary_key => "equi_type_uid", :force => true do |t|
    t.string "equi_type_desc", :limit => 40
    t.string "equi_type_def",  :limit => 256
  end

  create_table "explain_argument", :id => false, :force => true do |t|
    t.string    "explain_requester",   :limit => 128,     :null => false
    t.timestamp "explain_time",                           :null => false
    t.string    "source_name",         :limit => 128,     :null => false
    t.string    "source_schema",       :limit => 128,     :null => false
    t.string    "source_version",      :limit => 64,      :null => false
    t.string    "explain_level",       :limit => 1,       :null => false
    t.integer   "stmtno",                                 :null => false
    t.integer   "sectno",                                 :null => false
    t.integer   "operator_id",                            :null => false
    t.string    "argument_type",       :limit => 8,       :null => false
    t.string    "argument_value",      :limit => 1024
    t.text      "long_argument_value", :limit => 2097152
  end

  add_index "explain_argument", ["explain_time", "explain_level", "stmtno", "sectno", "operator_id"], :name => "arg_i2"

  create_table "explain_instance", :primary_key => "explain_requester", :force => true do |t|
    t.timestamp "explain_time",                  :null => false
    t.string    "source_name",    :limit => 128, :null => false
    t.string    "source_schema",  :limit => 128, :null => false
    t.string    "source_version", :limit => 64,  :null => false
    t.string    "explain_option", :limit => 1,   :null => false
    t.string    "snapshot_taken", :limit => 1,   :null => false
    t.string    "db2_version",    :limit => 7,   :null => false
    t.string    "sql_type",       :limit => 1,   :null => false
    t.integer   "queryopt",                      :null => false
    t.string    "block",          :limit => 1,   :null => false
    t.string    "isolation",      :limit => 2,   :null => false
    t.integer   "buffpage",                      :null => false
    t.integer   "avg_appls",                     :null => false
    t.integer   "sortheap",                      :null => false
    t.integer   "locklist",                      :null => false
    t.boolean   "maxlocks",                      :null => false
    t.integer   "locks_avail",                   :null => false
    t.float     "cpu_speed",                     :null => false
    t.string    "remarks",        :limit => 254
    t.integer   "dbheap",                        :null => false
    t.float     "comm_speed",                    :null => false
    t.string    "parallelism",    :limit => 2,   :null => false
    t.string    "datajoiner",     :limit => 1,   :null => false
  end

  create_table "explain_object", :id => false, :force => true do |t|
    t.string    "explain_requester",            :limit => 128, :null => false
    t.timestamp "explain_time",                                :null => false
    t.string    "source_name",                  :limit => 128, :null => false
    t.string    "source_schema",                :limit => 128, :null => false
    t.string    "source_version",               :limit => 64,  :null => false
    t.string    "explain_level",                :limit => 1,   :null => false
    t.integer   "stmtno",                                      :null => false
    t.integer   "sectno",                                      :null => false
    t.string    "object_schema",                :limit => 128, :null => false
    t.string    "object_name",                  :limit => 128, :null => false
    t.string    "object_type",                  :limit => 2,   :null => false
    t.timestamp "create_time"
    t.timestamp "statistics_time"
    t.boolean   "column_count",                                :null => false
    t.integer   "row_count",                                   :null => false
    t.integer   "width",                                       :null => false
    t.integer   "pages",                                       :null => false
    t.string    "distinct",                     :limit => 1,   :null => false
    t.string    "tablespace_name",              :limit => 128
    t.float     "overhead",                                    :null => false
    t.float     "transfer_rate",                               :null => false
    t.integer   "prefetchsize",                                :null => false
    t.integer   "extentsize",                                  :null => false
    t.float     "cluster",                                     :null => false
    t.integer   "nleaf",                                       :null => false
    t.integer   "nlevels",                                     :null => false
    t.integer   "fullkeycard",                                 :null => false
    t.integer   "overflow",                                    :null => false
    t.integer   "firstkeycard",                                :null => false
    t.integer   "first2keycard",                               :null => false
    t.integer   "first3keycard",                               :null => false
    t.integer   "first4keycard",                               :null => false
    t.integer   "sequential_pages",                            :null => false
    t.integer   "density",                                     :null => false
    t.string    "stats_src",                    :limit => 1,   :null => false
    t.float     "average_sequence_gap",                        :null => false
    t.float     "average_sequence_fetch_gap",                  :null => false
    t.float     "average_sequence_pages",                      :null => false
    t.float     "average_sequence_fetch_pages",                :null => false
    t.float     "average_random_pages",                        :null => false
    t.float     "average_random_fetch_pages",                  :null => false
    t.integer   "numrids",                                     :null => false
    t.integer   "numrids_deleted",                             :null => false
    t.integer   "num_empty_leafs",                             :null => false
    t.integer   "active_blocks",                               :null => false
  end

  add_index "explain_object", ["explain_time", "explain_level", "stmtno", "sectno"], :name => "obj_i2"

  create_table "explain_operator", :id => false, :force => true do |t|
    t.string    "explain_requester", :limit => 128, :null => false
    t.timestamp "explain_time",                     :null => false
    t.string    "source_name",       :limit => 128, :null => false
    t.string    "source_schema",     :limit => 128, :null => false
    t.string    "source_version",    :limit => 64,  :null => false
    t.string    "explain_level",     :limit => 1,   :null => false
    t.integer   "stmtno",                           :null => false
    t.integer   "sectno",                           :null => false
    t.integer   "operator_id",                      :null => false
    t.string    "operator_type",     :limit => 6,   :null => false
    t.float     "total_cost",                       :null => false
    t.float     "io_cost",                          :null => false
    t.float     "cpu_cost",                         :null => false
    t.float     "first_row_cost",                   :null => false
    t.float     "re_total_cost",                    :null => false
    t.float     "re_io_cost",                       :null => false
    t.float     "re_cpu_cost",                      :null => false
    t.float     "comm_cost",                        :null => false
    t.float     "first_comm_cost",                  :null => false
    t.float     "buffers",                          :null => false
    t.float     "remote_total_cost",                :null => false
    t.float     "remote_comm_cost",                 :null => false
  end

  add_index "explain_operator", ["explain_time", "explain_level", "stmtno", "sectno", "operator_id"], :name => "opr_i2"

  create_table "explain_predicate", :id => false, :force => true do |t|
    t.string    "explain_requester", :limit => 128,     :null => false
    t.timestamp "explain_time",                         :null => false
    t.string    "source_name",       :limit => 128,     :null => false
    t.string    "source_schema",     :limit => 128,     :null => false
    t.string    "source_version",    :limit => 64,      :null => false
    t.string    "explain_level",     :limit => 1,       :null => false
    t.integer   "stmtno",                               :null => false
    t.integer   "sectno",                               :null => false
    t.integer   "operator_id",                          :null => false
    t.integer   "predicate_id",                         :null => false
    t.string    "how_applied",       :limit => 5,       :null => false
    t.string    "when_evaluated",    :limit => 3,       :null => false
    t.string    "relop_type",        :limit => 2,       :null => false
    t.string    "subquery",          :limit => 1,       :null => false
    t.float     "filter_factor",                        :null => false
    t.text      "predicate_text",    :limit => 2097152
  end

  add_index "explain_predicate", ["explain_time", "explain_level", "stmtno", "sectno", "operator_id"], :name => "prd_i2"

  create_table "explain_statement", :primary_key => "explain_requester", :force => true do |t|
    t.timestamp "explain_time",                       :null => false
    t.string    "source_name",    :limit => 128,      :null => false
    t.string    "source_schema",  :limit => 128,      :null => false
    t.string    "source_version", :limit => 64,       :null => false
    t.string    "explain_level",  :limit => 1,        :null => false
    t.integer   "stmtno",                             :null => false
    t.integer   "sectno",                             :null => false
    t.integer   "queryno",                            :null => false
    t.string    "querytag",       :limit => 20,       :null => false
    t.string    "statement_type", :limit => 2,        :null => false
    t.string    "updatable",      :limit => 1,        :null => false
    t.string    "deletable",      :limit => 1,        :null => false
    t.float     "total_cost",                         :null => false
    t.text      "statement_text", :limit => 2097152,  :null => false
    t.binary    "snapshot",       :limit => 10485760
    t.integer   "query_degree",                       :null => false
  end

  add_index "explain_statement", ["explain_time", "explain_level", "stmtno", "sectno"], :name => "stmt_i2"

  create_table "explain_stream", :id => false, :force => true do |t|
    t.string    "explain_requester", :limit => 128,     :null => false
    t.timestamp "explain_time",                         :null => false
    t.string    "source_name",       :limit => 128,     :null => false
    t.string    "source_schema",     :limit => 128,     :null => false
    t.string    "source_version",    :limit => 64,      :null => false
    t.string    "explain_level",     :limit => 1,       :null => false
    t.integer   "stmtno",                               :null => false
    t.integer   "sectno",                               :null => false
    t.integer   "stream_id",                            :null => false
    t.string    "source_type",       :limit => 1,       :null => false
    t.integer   "source_id",                            :null => false
    t.string    "target_type",       :limit => 1,       :null => false
    t.integer   "target_id",                            :null => false
    t.string    "object_schema",     :limit => 128
    t.string    "object_name",       :limit => 128
    t.float     "stream_count",                         :null => false
    t.boolean   "column_count",                         :null => false
    t.integer   "predicate_id",                         :null => false
    t.text      "column_names",      :limit => 2097152
    t.boolean   "pmid",                                 :null => false
    t.string    "single_node",       :limit => 5
    t.text      "partition_columns", :limit => 2097152
  end

  add_index "explain_stream", ["explain_time", "explain_level", "stmtno", "sectno"], :name => "stm_i2"

  create_table "export_exit", :id => false, :force => true do |t|
    t.string  "mat_serial", :limit => 40, :null => false
    t.integer "quantity",                 :null => false
    t.integer "exit_date",                :null => false
    t.string  "ship_no",    :limit => 40
    t.string  "order_line", :limit => 40
    t.string  "eit_type",   :limit => 10
  end

  create_table "job_priority_type", :primary_key => "job_priority_type_uid", :force => true do |t|
    t.string  "job_priority_type_desc",  :limit => 40,                     :null => false
    t.integer "job_priority_base",                      :default => 0
    t.boolean "job_priority_time_scale",                :default => false
    t.string  "job_priority_type_def",   :limit => 256
  end

  add_index "job_priority_type", ["job_priority_type_uid", "job_priority_time_scale", "job_priority_base"], :name => "idx909241437500000", :unique => true

  create_table "job_status", :primary_key => "job_status_uid", :force => true do |t|
    t.string "job_status_desc", :limit => 40,  :null => false
    t.string "job_status_def",  :limit => 256
  end

  add_index "job_status", ["job_status_uid", "job_status_desc"], :name => "idx909241436310000", :unique => true

  create_table "job_template", :primary_key => "job_template_uid", :force => true do |t|
    t.string  "job_template_desc", :limit => 256,                    :null => false
    t.integer "job_start",                        :default => 0,     :null => false
    t.integer "job_finish",                       :default => 0,     :null => false
    t.boolean "job_urgency",                      :default => false, :null => false
    t.string  "job_template_def",  :limit => 256
  end

  create_table "job_template_master", :primary_key => "jt_uid", :force => true do |t|
    t.integer "workarea_start_uid",                 :null => false
    t.integer "workarea_finish_uid",                :null => false
    t.integer "sysmatkind_uid",                     :null => false
    t.integer "job_type_uid",                       :null => false
    t.integer "emp_group_uid",                      :null => false
    t.string  "msg1",                :limit => 256
    t.string  "msg2",                :limit => 256
    t.string  "msg3",                :limit => 256
  end

  create_table "job_template_master_job_template", :primary_key => "job_template_uid", :force => true do |t|
    t.integer "jt_uid",    :null => false
    t.integer "job_order"
  end

  create_table "job_type", :primary_key => "job_type_uid", :force => true do |t|
    t.string "job_type_desc", :limit => 40,  :null => false
    t.string "job_type_def",  :limit => 256
  end

  create_table "jobs", :primary_key => "j_uid", :force => true do |t|
    t.integer   "workarea_start_uid",                      :null => false
    t.integer   "workarea_finish_uid",                     :null => false
    t.integer   "sysmatkind_uid",                          :null => false
    t.integer   "job_status_uid",                          :null => false
    t.integer   "uid",                   :default => 0,    :null => false
    t.integer   "amount",                :default => 0,    :null => false
    t.boolean   "j_total_step",          :default => true, :null => false
    t.timestamp "j_creation_timestamp",                    :null => false
    t.integer   "job_priority_type_uid",                   :null => false
    t.integer   "job_priority",          :default => 0,    :null => false
    t.integer   "creator_uid",           :default => 0
  end

  add_index "jobs", ["j_uid", "job_priority_type_uid", "workarea_finish_uid", "workarea_start_uid", "sysmatkind_uid", "j_creation_timestamp", "j_total_step", "creator_uid"], :name => "idx909241427360000", :unique => true
  add_index "jobs", ["j_uid", "job_priority_type_uid"], :name => "pk_job_prio"

  create_table "login_log", :id => false, :force => true do |t|
    t.integer   "emp_uid",                   :null => false
    t.string    "ip_address", :limit => 20
    t.string    "log_path",   :limit => 200
    t.timestamp "login_time",                :null => false
    t.string    "host_name",  :limit => 80
  end

  create_table "manual_buffer", :id => false, :force => true do |t|
    t.integer   "manual_job_type_uid",               :null => false
    t.integer   "emp_uid",                           :null => false
    t.integer   "mat_uid",                           :null => false
    t.integer   "amount",                            :null => false
    t.timestamp "opr_time",                          :null => false
    t.string    "opr_address",         :limit => 40, :null => false
    t.integer   "diff"
    t.integer   "status"
  end

  create_table "manuel_job_type", :id => false, :force => true do |t|
    t.integer "manuel_job_type_uid",                :null => false
    t.string  "manuel_job_type_desc", :limit => 80, :null => false
    t.string  "manuel_job_type_def",  :limit => 80
  end

  create_table "manuel_jobs", :id => false, :force => true do |t|
    t.integer   "manual_job_type_uid", :null => false
    t.integer   "emp_uid",             :null => false
    t.integer   "uid",                 :null => false
    t.timestamp "opr_time",            :null => false
    t.integer   "sysmatkind_uid"
    t.integer   "amount"
  end

  create_table "mat_add_default", :id => false, :force => true do |t|
    t.integer "mat_uid",                   :null => false
    t.string  "mat_address", :limit => 40, :null => false
    t.boolean "bydefault"
  end

  create_table "mat_add_select", :id => false, :force => true do |t|
    t.integer "mat_uid",                   :null => false
    t.string  "mat_address", :limit => 40, :null => false
    t.integer "amount",                    :null => false
    t.integer "selected",                  :null => false
  end

  create_table "mat_address", :id => false, :force => true do |t|
    t.integer "mat_uid"
    t.string  "mat_address",             :limit => 40
    t.integer "mat_max_quantity",                      :default => 0, :null => false
    t.integer "mat_min_quantity",                      :default => 0, :null => false
    t.integer "grp_max_quantity",                      :default => 0, :null => false
    t.integer "current_quantity",                      :default => 0, :null => false
    t.integer "current_left",                          :default => 0, :null => false
    t.integer "buffer_type_uid",                       :default => 7, :null => false
    t.integer "buffer_status_uid",                     :default => 3, :null => false
    t.integer "warehouse_freq_type_uid"
  end

  add_index "mat_address", ["mat_uid", "mat_address", "buffer_status_uid"], :name => "pk_buffer_adr"

  create_table "mat_address_bckup", :id => false, :force => true do |t|
    t.integer "mat_uid"
    t.string  "mat_address",             :limit => 40
    t.integer "mat_max_quantity",                      :default => 0, :null => false
    t.integer "mat_min_quantity",                      :default => 0, :null => false
    t.integer "grp_max_quantity",                      :default => 0, :null => false
    t.integer "current_quantity",                      :default => 0, :null => false
    t.integer "current_left",                          :default => 0, :null => false
    t.integer "buffer_type_uid",                       :default => 7, :null => false
    t.integer "buffer_status_uid",                     :default => 3, :null => false
    t.integer "warehouse_freq_type_uid"
  end

  create_table "mat_alt_status", :primary_key => "mat_alt_status_uid", :force => true do |t|
    t.string "mat_alt_status_desc", :limit => 40,  :null => false
    t.string "mat_alt_status_def",  :limit => 256
  end

  create_table "mat_alt_type", :primary_key => "mat_alt_type_uid", :force => true do |t|
    t.string "mat_alt_type_desc", :limit => 40,  :null => false
    t.string "mat_alt_type_def",  :limit => 256
  end

  create_table "mat_case", :id => false, :force => true do |t|
    t.integer "ca_uid",       :null => false
    t.integer "mat_uid",      :null => false
    t.integer "box_quantity", :null => false
  end

  create_table "mat_feeding", :primary_key => "mat_feeding_uid", :force => true do |t|
    t.string "mat_feeding_desc", :limit => 40,  :null => false
    t.string "mat_feeding_def",  :limit => 256
  end

  create_table "mat_freq", :primary_key => "mat_uid", :force => true do |t|
    t.integer "mat_freq_type_uid",                               :null => false
    t.integer "freq_count",                                      :null => false
    t.decimal "freq_average",      :precision => 5, :scale => 2, :null => false
  end

  create_table "mat_freq_log", :id => false, :force => true do |t|
    t.integer   "mat_uid",                                             :null => false
    t.integer   "mat_freq_type_uid_old",                               :null => false
    t.integer   "mat_freq_type_uid_new",                               :null => false
    t.timestamp "update_date",                                         :null => false
    t.integer   "old_count",                                           :null => false
    t.integer   "new_count",                                           :null => false
    t.decimal   "old_average",           :precision => 5, :scale => 2, :null => false
    t.decimal   "new_average",           :precision => 5, :scale => 2, :null => false
  end

  create_table "mat_freq_type", :primary_key => "mat_freq_type_uid", :force => true do |t|
    t.string "mat_freq_type_desc", :limit => 40, :null => false
    t.string "mat_freq_type_def",  :limit => 40
  end

  create_table "mat_group", :primary_key => "mat_group_uid", :force => true do |t|
    t.string "mat_group_desc", :limit => 40
    t.string "mat_group_def",  :limit => 256
  end

  create_table "mat_pack", :primary_key => "mat_pack_uid", :force => true do |t|
    t.integer "mat_uid",     :null => false
    t.float   "mat_package", :null => false
  end

  create_table "mat_photo", :id => false, :force => true do |t|
    t.integer "mat_uid",                  :default => 0, :null => false
    t.string  "mat_photo", :limit => 256
  end

  create_table "mat_stor_type", :primary_key => "mat_stor_type_uid", :force => true do |t|
    t.string "mat_stor_type_desc", :limit => 40,  :null => false
    t.string "mat_stor_type_def",  :limit => 256
  end

  create_table "mat_usage_type", :primary_key => "mat_usage_type_uid", :force => true do |t|
    t.string "mat_usage_type_desc", :limit => 40
    t.string "mat_usage_type_def",  :limit => 256
  end

  create_table "material", :primary_key => "mat_uid", :force => true do |t|
    t.string    "mat_serial",         :limit => 40,                     :null => false
    t.string    "mat_alc",            :limit => 40
    t.integer   "mat_stor_type_uid"
    t.string    "mat_name",                                             :null => false
    t.string    "mat_name_tur",                                         :null => false
    t.integer   "mat_group_uid"
    t.integer   "mat_feeding_uid"
    t.integer   "mat_usage_type_uid"
    t.integer   "cardex_uid"
    t.float     "mat_length"
    t.float     "mat_height"
    t.float     "mat_width"
    t.float     "mat_weight"
    t.boolean   "mat_effective"
    t.integer   "mat_effective_days"
    t.timestamp "mat_insert"
    t.timestamp "mat_update"
    t.integer   "mat_insert_user"
    t.integer   "mat_update_user"
    t.boolean   "hasbuffer",                         :default => false
    t.string    "mat_note",           :limit => 100
  end

  add_index "material", ["mat_serial", "mat_uid"], :name => "pkk_material"

  create_table "material_case", :primary_key => "ca_uid", :force => true do |t|
    t.integer "mat_uid",      :null => false
    t.integer "box_quantity", :null => false
  end

  create_table "material_order", :primary_key => "order_id", :force => true do |t|
    t.integer "mat_uid",                               :null => false
    t.integer "order_quantity",         :default => 0, :null => false
    t.integer "order_recieve_quantity", :default => 0, :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string    "content"
    t.integer   "user_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "mmlspik2sp", :id => false, :force => true do |t|
    t.string  "p1npik", :limit => 11,                               :null => false
    t.string  "p1ncfm", :limit => 20,                               :null => false
    t.decimal "p1dpik",               :precision => 8, :scale => 0, :null => false
    t.integer "p1qpic",                                             :null => false
    t.string  "p1flg",  :limit => 1,                                :null => false
  end

  add_index "mmlspik2sp", ["p1npik"], :name => "cc1317594848219", :unique => true

  create_table "mmlspik2sp_backup", :id => false, :force => true do |t|
    t.string  "p1npik", :limit => 11,                               :null => false
    t.string  "p1ncfm", :limit => 20,                               :null => false
    t.decimal "p1dpik",               :precision => 8, :scale => 0, :null => false
    t.integer "p1qpic",                                             :null => false
    t.string  "p1flg",  :limit => 1,                                :null => false
  end

  add_index "mmlspik2sp_backup", ["p1npik"], :name => "sql121212191949810", :unique => true

  create_table "mmlspik2sp_bk", :id => false, :force => true do |t|
    t.string  "p1npik", :limit => 11,                               :null => false
    t.string  "p1ncfm", :limit => 20,                               :null => false
    t.decimal "p1dpik",               :precision => 8, :scale => 0, :null => false
    t.integer "p1qpic",                                             :null => false
    t.string  "p1flg",  :limit => 1,                                :null => false
  end

  create_table "months", :primary_key => "months_uid", :force => true do |t|
    t.string "months_desc", :limit => 40, :null => false
    t.string "months_def",  :limit => 40
  end

  create_table "move_log", :id => false, :force => true do |t|
    t.integer "move_log_uid",                :null => false
    t.string  "move_log_desc", :limit => 80, :null => false
    t.string  "move_log_def",  :limit => 80
  end

  create_table "movement_backup", :id => false, :force => true do |t|
    t.integer "mat_uid",               :null => false
    t.integer "qnt"
    t.string  "source",  :limit => 20
  end

  create_table "order_status", :primary_key => "order_status_uid", :force => true do |t|
    t.string "order_status_desc", :limit => 40
    t.string "order_status_def",  :limit => 256
  end

  create_table "order_type", :primary_key => "order_type_uid", :force => true do |t|
    t.string "order_type_desc", :limit => 40
    t.string "order_type_def",  :limit => 256
  end

  create_table "orders", :primary_key => "order_id", :force => true do |t|
    t.integer   "order_type_uid",         :null => false
    t.integer   "supp_uid",               :null => false
    t.integer   "order_status_uid",       :null => false
    t.timestamp "order_insrt_date"
    t.date      "order_est_time_arrival"
    t.date      "order_receive_date"
  end

  create_table "ozcan", :id => false, :force => true do |t|
    t.string "single_quoted_values", :limit => 20, :null => false
  end

  create_table "pm", :primary_key => "mat_uid", :force => true do |t|
    t.integer "orderq",     :default => 0, :null => false
    t.integer "lorderq",    :default => 0
    t.integer "onshipq",    :default => 0
    t.integer "onportq",    :default => 0
    t.integer "ontransitq", :default => 0
    t.integer "boundedq",   :default => 0
    t.integer "cyardq",     :default => 0, :null => false
    t.integer "cyjobq",     :default => 0
    t.integer "whouseq",    :default => 0, :null => false
    t.integer "whjobq",     :default => 0
    t.integer "bufferq",    :default => 0, :null => false
    t.integer "bfjobq",     :default => 0
    t.integer "lineq",      :default => 0, :null => false
    t.integer "abnormalq",  :default => 0, :null => false
  end

  create_table "pm_backup", :id => false, :force => true do |t|
    t.integer "mat_uid",                                                                :null => false
    t.integer "orderq",                                                  :default => 0, :null => false
    t.integer "lorderq",                                                 :default => 0
    t.integer "onshipq",                                                 :default => 0
    t.integer "onportq",                                                 :default => 0
    t.integer "ontransitq",                                              :default => 0
    t.integer "boundedq",                                                :default => 0
    t.integer "cyardq",                                                  :default => 0, :null => false
    t.integer "cyjobq",                                                  :default => 0
    t.integer "whouseq",                                                 :default => 0, :null => false
    t.integer "whjobq",                                                  :default => 0
    t.integer "bufferq",                                                 :default => 0, :null => false
    t.integer "bfjobq",                                                  :default => 0
    t.integer "lineq",                                                   :default => 0, :null => false
    t.integer "abnormalq",                                               :default => 0, :null => false
    t.decimal "insertdate",               :precision => 12, :scale => 0
    t.string  "mat_serial", :limit => 40
  end

  create_table "pm_bckup", :id => false, :force => true do |t|
    t.integer "mat_uid",                   :null => false
    t.integer "orderq",     :default => 0, :null => false
    t.integer "lorderq",    :default => 0
    t.integer "onshipq",    :default => 0
    t.integer "onportq",    :default => 0
    t.integer "ontransitq", :default => 0
    t.integer "boundedq",   :default => 0
    t.integer "cyardq",     :default => 0, :null => false
    t.integer "cyjobq",     :default => 0
    t.integer "whouseq",    :default => 0, :null => false
    t.integer "whjobq",     :default => 0
    t.integer "bufferq",    :default => 0, :null => false
    t.integer "bfjobq",     :default => 0
    t.integer "lineq",      :default => 0, :null => false
    t.integer "abnormalq",  :default => 0, :null => false
  end

  create_table "pm_compare_data", :id => false, :force => true do |t|
    t.integer "mat_uid",                   :null => false
    t.string  "mat_serial",  :limit => 40, :null => false
    t.integer "stqmov"
    t.integer "bufferq"
    t.integer "bfjobq"
    t.integer "in_job"
    t.integer "out_job"
    t.integer "rack_q"
    t.integer "case_q"
    t.integer "iade_q"
    t.integer "adr_q"
    t.string  "mat_address", :limit => 40
    t.integer "prm_q"
    t.integer "n_abn_q"
    t.integer "old_abn"
    t.integer "his_qnt"
    t.integer "final_q"
    t.integer "case_job"
    t.integer "in_job_road"
    t.integer "old_return"
    t.integer "case_abn"
  end

  create_table "pm_compare_data_2", :id => false, :force => true do |t|
    t.integer "mat_uid",                   :null => false
    t.string  "mat_serial",  :limit => 40, :null => false
    t.integer "stqmov"
    t.integer "bufferq"
    t.integer "bfjobq"
    t.integer "in_job"
    t.integer "out_job"
    t.integer "rack_q"
    t.integer "case_q"
    t.integer "iade_q"
    t.integer "adr_q"
    t.string  "mat_address", :limit => 40
    t.integer "prm_q"
    t.integer "n_abn_q"
    t.integer "old_abn"
    t.integer "his_qnt"
    t.integer "final_q"
    t.integer "case_job"
    t.integer "in_job_road"
    t.integer "old_return"
    t.integer "case_abn"
  end

  create_table "printer", :primary_key => "printer_id", :force => true do |t|
    t.string "printer_name", :limit => 256, :null => false
    t.string "printer_def",  :limit => 256
  end

  create_table "procedure_log", :primary_key => "proc_name", :force => true do |t|
    t.integer   "seq",              :null => false
    t.timestamp "start_timestamp",  :null => false
    t.timestamp "finish_timestamp"
    t.integer   "emp_uid",          :null => false
  end

  create_table "qualification", :primary_key => "qualification_uid", :force => true do |t|
    t.string "qualification_desc", :limit => 80,  :null => false
    t.string "qualification_def",  :limit => 256
  end

  create_table "reports", :primary_key => "report_uid", :force => true do |t|
    t.string    "report_name"
    t.string    "report_desc",        :limit => 100
    t.string    "report_query",       :limit => 100
    t.integer   "report_insert_user"
    t.integer   "report_update_user"
    t.timestamp "report_insert_date"
    t.timestamp "report_update_date"
    t.boolean   "report_active"
  end

  create_table "return_emp", :id => false, :force => true do |t|
    t.string    "invoice_no",  :limit => 20, :null => false
    t.integer   "ca_uid",                    :null => false
    t.integer   "mat_uid",                   :null => false
    t.integer   "quantity",                  :null => false
    t.integer   "emp_uid",                   :null => false
    t.timestamp "insert_date",               :null => false
  end

  create_table "return_old", :id => false, :force => true do |t|
    t.string  "invoice_no",      :limit => 20
    t.integer "mat_uid",                       :null => false
    t.string  "mat_serial",      :limit => 20, :null => false
    t.integer "cust_uid",                      :null => false
    t.string  "cust_default_id", :limit => 10, :null => false
    t.string  "cust_name",       :limit => 20
    t.integer "quantity",                      :null => false
    t.integer "inv_date",                      :null => false
  end

  create_table "return_parts", :id => false, :force => true do |t|
    t.string    "invoice_no",      :limit => 20, :null => false
    t.string    "cust_default_id", :limit => 40, :null => false
    t.integer   "cust_uid",                      :null => false
    t.string    "cust_name",       :limit => 20, :null => false
    t.integer   "mat_uid",                       :null => false
    t.string    "mat_serial",      :limit => 40, :null => false
    t.integer   "inv_qnt",                       :null => false
    t.integer   "case_qnt",                      :null => false
    t.boolean   "inv_status",                    :null => false
    t.integer   "start_user_uid",                :null => false
    t.timestamp "start_date",                    :null => false
    t.integer   "finish_user_uid"
    t.timestamp "finish_date"
  end

  create_table "return_reject", :id => false, :force => true do |t|
    t.string  "invoice_no",  :limit => 20, :null => false
    t.integer "ca_uid",                    :null => false
    t.integer "mat_uid",                   :null => false
    t.integer "prev_qnt",                  :null => false
    t.integer "changed_qnt",               :null => false
    t.boolean "status",                    :null => false
  end

  create_table "return_reject_emp", :id => false, :force => true do |t|
    t.string    "invoice_no",      :limit => 20, :null => false
    t.integer   "ca_uid",                        :null => false
    t.integer   "mat_uid",                       :null => false
    t.integer   "prev_qnt",                      :null => false
    t.integer   "changed_qnt",                   :null => false
    t.integer   "emp_uid",                       :null => false
    t.timestamp "insert_date",                   :null => false
    t.integer   "job_emp_uid"
    t.timestamp "job_finish_date"
  end

  create_table "spcontainer", :id => false, :force => true do |t|
    t.integer   "co_uid",                         :null => false
    t.string    "co_serial",       :limit => 40,  :null => false
    t.integer   "co_status_uid"
    t.integer   "co_style_uid"
    t.integer   "co_size_uid"
    t.integer   "co_purpose_uid"
    t.integer   "co_demurrage"
    t.timestamp "co_receive_date"
    t.timestamp "co_open_date"
    t.timestamp "co_exit_date"
    t.integer   "tr_uid"
    t.string    "co_note",         :limit => 100
    t.timestamp "co_port_date"
    t.timestamp "co_transit_date"
  end

  create_table "sub_jobs", :primary_key => "sj_uid", :force => true do |t|
    t.integer   "j_uid"
    t.integer   "workarea_start_uid"
    t.integer   "workarea_finish_uid"
    t.integer   "sysmatkind_uid"
    t.integer   "uid",                               :default => 0,     :null => false
    t.integer   "amount",                            :default => 0,     :null => false
    t.integer   "job_status_uid"
    t.boolean   "sj_step",                           :default => false, :null => false
    t.timestamp "sj_start_time"
    t.timestamp "sj_finish_time"
    t.integer   "sj_emp",                            :default => 0,     :null => false
    t.integer   "sj_parent_uid",                     :default => 0,     :null => false
    t.integer   "obj_status",                        :default => 0,     :null => false
    t.integer   "obj_amount",                        :default => 0,     :null => false
    t.string    "obj_address",         :limit => 40
    t.integer   "emp_group_uid",                     :default => 0,     :null => false
  end

  add_index "sub_jobs", ["j_uid", "job_status_uid"], :name => "idx909241631190000"
  add_index "sub_jobs", ["j_uid", "sj_finish_time"], :name => "idx909251522330000"
  add_index "sub_jobs", ["j_uid", "sj_uid", "job_status_uid", "obj_address"], :name => "pk_sj_jm_jb_adr"
  add_index "sub_jobs", ["j_uid", "sj_uid", "job_status_uid"], :name => "pk_sub_main_j"
  add_index "sub_jobs", ["job_status_uid", "sj_emp", "workarea_finish_uid"], :name => "idx909241525370000"
  add_index "sub_jobs", ["obj_address", "job_status_uid", "workarea_finish_uid", "j_uid"], :name => "idx909241423060000"
  add_index "sub_jobs", ["obj_address", "job_status_uid"], :name => "idx909241630560000"
  add_index "sub_jobs", ["sj_emp", "job_status_uid"], :name => "idx909241527000000"
  add_index "sub_jobs", ["sj_emp", "sysmatkind_uid", "job_status_uid", "amount", "workarea_finish_uid"], :name => "idx909241544020000"
  add_index "sub_jobs", ["sj_emp", "sysmatkind_uid"], :name => "idx909241544010000"
  add_index "sub_jobs", ["sj_emp", "workarea_finish_uid", "workarea_start_uid", "job_status_uid", "obj_address", "emp_group_uid", "obj_status", "sj_parent_uid", "sj_finish_time", "sj_start_time", "sj_step", "amount", "uid", "sysmatkind_uid", "j_uid", "sj_uid"], :name => "idx909241530260000"
  add_index "sub_jobs", ["sj_uid", "j_uid", "job_status_uid", "uid"], :name => "pk_sub_j_id"
  add_index "sub_jobs", ["sj_uid", "job_status_uid"], :name => "idx909241423530000", :unique => true

  create_table "sub_jobs_mat", :primary_key => "mat_uid", :force => true do |t|
    t.integer "sj_uid", :null => false
  end

  create_table "subgroup", :id => false, :force => true do |t|
    t.integer "sg_uid",                                           :null => false
    t.integer "emp_group_uid",                     :default => 0, :null => false
    t.string  "sg_name",           :limit => 80,                  :null => false
    t.string  "sg_station_filter", :limit => 1750
    t.string  "sg_order_filter",   :limit => 20
    t.string  "sg_address_filter", :limit => 15
    t.string  "sg_level_filter",   :limit => 40
  end

  create_table "sup_mat", :primary_key => "supp_uid", :force => true do |t|
    t.integer "mat_uid",                               :null => false
    t.integer "supp_rate",          :default => 0
    t.boolean "supp_mat_effective", :default => false, :null => false
  end

  create_table "supp_status", :id => false, :force => true do |t|
    t.integer "supp_status_uid",                 :null => false
    t.string  "supp_status_desc", :limit => 40,  :null => false
    t.string  "supp_status_def",  :limit => 256
  end

  create_table "supp_type", :primary_key => "supp_type_uid", :force => true do |t|
    t.string "supp_type_desc", :limit => 40,  :null => false
    t.string "supp_type_def",  :limit => 256
  end

  create_table "supplier", :primary_key => "supp_uid", :force => true do |t|
    t.string  "supp_default_id", :limit => 40
    t.string  "supp_name",       :limit => 60,                    :null => false
    t.integer "supp_type_uid"
    t.string  "supp_address"
    t.string  "supp_country",    :limit => 80
    t.string  "supp_zip",        :limit => 10
    t.string  "supp_tel1",       :limit => 15
    t.string  "supp_tel2",       :limit => 15
    t.string  "supp_fax",        :limit => 15
    t.string  "supp_email",      :limit => 80
    t.string  "supp_taxno",      :limit => 40
    t.string  "supp_taxof",      :limit => 40
    t.string  "supp_zipcode",    :limit => 40
    t.string  "supp_cont_name",  :limit => 80
    t.boolean "supp_effective",                :default => false, :null => false
    t.string  "supp_web",        :limit => 80
  end

  create_table "supplier_cont", :primary_key => "supp_con_uid", :force => true do |t|
    t.integer "supp_uid"
    t.string  "supp_con_name",    :limit => 80
    t.string  "supp_con_address"
    t.string  "supp_con_zip",     :limit => 10
    t.string  "supp_con_tel1",    :limit => 15
    t.string  "supp_con_tel2",    :limit => 15
    t.string  "supp_con_fax",     :limit => 15
    t.string  "supp_con_email",   :limit => 80
  end

  create_table "supplier_period", :primary_key => "supp_per_uid", :force => true do |t|
    t.integer "supp_uid",                       :null => false
    t.boolean "supp_day"
    t.string  "supp_start_time",  :limit => 10
    t.string  "supp_finish_time", :limit => 10
  end

  create_table "sysattributes", :id => false, :force => true do |t|
    t.string  "typeschema",        :limit => 128, :null => false
    t.string  "typename",          :limit => 128, :null => false
    t.string  "attr_name",         :limit => 128, :null => false
    t.string  "attr_typeschema",   :limit => 128, :null => false
    t.string  "attr_typename",     :limit => 128, :null => false
    t.boolean "ordinal",                          :null => false
    t.integer "length",                           :null => false
    t.boolean "scale",                            :null => false
    t.string  "unused1",           :limit => 254
    t.string  "unused2",           :limit => 1,   :null => false
    t.boolean "codepage",                         :null => false
    t.string  "logged",            :limit => 1,   :null => false
    t.string  "compact",           :limit => 1,   :null => false
    t.string  "target_typeschema", :limit => 128
    t.string  "target_typename",   :limit => 128
    t.string  "dl_features",       :limit => 10,  :null => false
    t.string  "source_typeschema", :limit => 128, :null => false
    t.string  "source_typename",   :limit => 128, :null => false
    t.string  "java_fieldname",    :limit => 256
  end

  add_index "sysattributes", ["attr_typeschema", "attr_typename", "typeschema", "typename", "attr_name"], :name => "ibm84", :unique => true
  add_index "sysattributes", ["target_typeschema", "target_typename", "typeschema", "typename"], :name => "ibm85"
  add_index "sysattributes", ["typeschema", "typename", "attr_name"], :name => "ibm83", :unique => true

  create_table "sysbufferpoolnodes", :id => false, :force => true do |t|
    t.integer "bufferpoolid", :null => false
    t.boolean "nodenum",      :null => false
    t.integer "npages",       :null => false
  end

  add_index "sysbufferpoolnodes", ["bufferpoolid", "nodenum"], :name => "ibm69", :unique => true

  create_table "sysbufferpools", :id => false, :force => true do |t|
    t.string  "bpname",        :limit => 128, :null => false
    t.integer "bufferpoolid",                 :null => false
    t.string  "ngname",        :limit => 128
    t.integer "npages",                       :null => false
    t.integer "pagesize",                     :null => false
    t.string  "estore",        :limit => 1,   :null => false
    t.integer "numblockpages",                :null => false
    t.integer "blocksize",                    :null => false
  end

  add_index "sysbufferpools", ["bpname", "ngname"], :name => "ibm67", :unique => true
  add_index "sysbufferpools", ["bufferpoolid", "ngname"], :name => "ibm68", :unique => true

  create_table "syschecks", :id => false, :force => true do |t|
    t.string    "name",         :limit => 128,     :null => false
    t.string    "definer",      :limit => 128,     :null => false
    t.string    "tbname",       :limit => 128,     :null => false
    t.string    "tbcreator",    :limit => 128,     :null => false
    t.timestamp "create_time",                     :null => false
    t.string    "func_path",    :limit => 254,     :null => false
    t.text      "text",         :limit => 2097152, :null => false
    t.string    "qualifier",    :limit => 128,     :null => false
    t.string    "type",         :limit => 1,       :null => false
    t.boolean   "percentvalid",                    :null => false
  end

  add_index "syschecks", ["tbcreator", "tbname", "name"], :name => "ibm37", :unique => true

  create_table "syscodeproperties", :id => false, :force => true do |t|
    t.string  "object_type",        :limit => 1,        :null => false
    t.integer "object_id",                              :null => false
    t.integer "lib_id"
    t.integer "libversion"
    t.string  "debug_mode",         :limit => 1,        :null => false
    t.string  "trace_level",        :limit => 1,        :null => false
    t.string  "diagnostic_level",   :limit => 1,        :null => false
    t.text    "debug_data",         :limit => 1048576
    t.string  "checkout_userid",    :limit => 128
    t.string  "precompile_options", :limit => 1024
    t.string  "compile_options",    :limit => 1024
    t.binary  "sql_compiled_code",  :limit => 10485760
  end

  add_index "syscodeproperties", ["object_type", "object_id", "lib_id", "libversion"], :name => "ibm161", :unique => true

  create_table "syscolauth", :id => false, :force => true do |t|
    t.string  "grantor",     :limit => 128, :null => false
    t.string  "grantee",     :limit => 128, :null => false
    t.string  "granteetype", :limit => 1,   :null => false
    t.string  "creator",     :limit => 128, :null => false
    t.string  "tname",       :limit => 128, :null => false
    t.string  "privtype",    :limit => 1,   :null => false
    t.string  "colname",     :limit => 128, :null => false
    t.string  "grantable",   :limit => 1,   :null => false
    t.boolean "colno",                      :null => false
  end

  add_index "syscolauth", ["creator", "tname", "grantee", "granteetype", "colno", "privtype"], :name => "ibm64"
  add_index "syscolauth", ["grantee", "granteetype", "creator", "tname", "privtype", "colname", "grantor"], :name => "ibm42", :unique => true
  add_index "syscolauth", ["grantor", "creator", "tname", "privtype", "colname"], :name => "ibm43"

  create_table "syscolchecks", :id => false, :force => true do |t|
    t.string "constname", :limit => 128, :null => false
    t.string "tbname",    :limit => 128, :null => false
    t.string "tbcreator", :limit => 128, :null => false
    t.string "colname",   :limit => 128, :null => false
    t.string "usage",     :limit => 1,   :null => false
  end

  add_index "syscolchecks", ["tbcreator", "tbname", "colname", "constname"], :name => "ibm38", :unique => true
  add_index "syscolchecks", ["tbcreator", "tbname", "constname"], :name => "ibm39"

  create_table "syscoldist", :id => false, :force => true do |t|
    t.string  "name",      :limit => 128, :null => false
    t.string  "tbname",    :limit => 128, :null => false
    t.string  "schema",    :limit => 128, :null => false
    t.string  "type",      :limit => 1,   :null => false
    t.boolean "seqno",                    :null => false
    t.string  "colvalue",  :limit => 254
    t.integer "valcount",                 :null => false
    t.integer "distcount"
  end

  add_index "syscoldist", ["schema", "tbname", "name", "type", "seqno"], :name => "ibm46", :unique => true

  create_table "syscolgroupdist", :id => false, :force => true do |t|
    t.integer "colgroupid",                :null => false
    t.string  "type",       :limit => 1,   :null => false
    t.boolean "ordinal",                   :null => false
    t.boolean "seqno",                     :null => false
    t.string  "colvalue",   :limit => 254, :null => false
  end

  add_index "syscolgroupdist", ["colgroupid", "ordinal", "type", "seqno"], :name => "ibm157"

  create_table "syscolgroupdistcounts", :id => false, :force => true do |t|
    t.integer "colgroupid",              :null => false
    t.string  "type",       :limit => 1, :null => false
    t.boolean "seqno",                   :null => false
    t.integer "valcount",                :null => false
    t.integer "distcount",               :null => false
  end

  add_index "syscolgroupdistcounts", ["colgroupid", "type", "seqno"], :name => "ibm158"

  create_table "syscolgroups", :id => false, :force => true do |t|
    t.string  "colgroupschema", :limit => 128, :null => false
    t.string  "colgroupname",   :limit => 128, :null => false
    t.integer "colgroupid",                    :null => false
    t.integer "colgroupcard",                  :null => false
    t.boolean "numfreq_values",                :null => false
    t.boolean "numquantiles",                  :null => false
  end

  add_index "syscolgroups", ["colgroupid"], :name => "ibm155", :unique => true
  add_index "syscolgroups", ["colgroupschema", "colgroupname"], :name => "ibm154", :unique => true

  create_table "syscolgroupscols", :id => false, :force => true do |t|
    t.integer "colgroupid",                :null => false
    t.string  "colname",    :limit => 128, :null => false
    t.string  "tabschema",  :limit => 128, :null => false
    t.string  "tabname",    :limit => 128, :null => false
    t.boolean "ordinal",                   :null => false
  end

  add_index "syscolgroupscols", ["colgroupid"], :name => "ibm156"

  create_table "syscoloptions", :id => false, :force => true do |t|
    t.string "tabschema", :limit => 128, :null => false
    t.string "tabname",   :limit => 128, :null => false
    t.string "colname",   :limit => 128, :null => false
    t.string "option",    :limit => 128, :null => false
    t.string "setting",                  :null => false
  end

  add_index "syscoloptions", ["tabschema", "tabname", "colname", "option"], :name => "ibm89", :unique => true

  create_table "syscolproperties", :id => false, :force => true do |t|
    t.string "colname",           :limit => 128, :null => false
    t.string "tabname",           :limit => 128, :null => false
    t.string "tabschema",         :limit => 128, :null => false
    t.string "target_typeschema", :limit => 128
    t.string "target_typename",   :limit => 128
    t.string "scope_tabschema",   :limit => 128
    t.string "scope_tabname",     :limit => 128
    t.string "dl_features",       :limit => 10,  :null => false
    t.string "special_props",     :limit => 8,   :null => false
  end

  add_index "syscolproperties", ["scope_tabschema", "scope_tabname"], :name => "ibm82"
  add_index "syscolproperties", ["tabschema", "tabname", "colname"], :name => "ibm79", :unique => true
  add_index "syscolproperties", ["target_typeschema", "target_typename", "tabschema", "tabname"], :name => "ibm80"

  create_table "syscolumns", :id => false, :force => true do |t|
    t.string  "name",               :limit => 128, :null => false
    t.string  "tbname",             :limit => 128, :null => false
    t.string  "tbcreator",          :limit => 128, :null => false
    t.string  "remarks",            :limit => 254
    t.string  "coltype",            :limit => 8,   :null => false
    t.string  "nulls",              :limit => 1,   :null => false
    t.boolean "codepage",                          :null => false
    t.boolean "dbcscodepg",                        :null => false
    t.boolean "length",                            :null => false
    t.boolean "scale",                             :null => false
    t.boolean "colno",                             :null => false
    t.integer "colcard",                           :null => false
    t.string  "high2key",           :limit => 254
    t.string  "low2key",            :limit => 254
    t.integer "avgcollen",                         :null => false
    t.boolean "keyseq"
    t.string  "typename",           :limit => 128, :null => false
    t.string  "typeschema",         :limit => 128, :null => false
    t.string  "default",            :limit => 254
    t.integer "longlength",                        :null => false
    t.string  "logged",             :limit => 1,   :null => false
    t.string  "compact",            :limit => 1,   :null => false
    t.boolean "nquantiles",                        :null => false
    t.boolean "nmostfreq",                         :null => false
    t.boolean "composite_codepage",                :null => false
    t.boolean "partkeyseq"
    t.string  "source_tabschema",   :limit => 128
    t.string  "source_tabname",     :limit => 128
    t.string  "hidden",             :limit => 1,   :null => false
    t.string  "generated",          :limit => 1,   :null => false
    t.integer "inline_length",                     :null => false
    t.integer "numnulls",                          :null => false
    t.integer "datamodel",                         :null => false
    t.boolean "sub_count",                         :null => false
    t.boolean "sub_delim_length",                  :null => false
    t.string  "identity",           :limit => 1,   :null => false
    t.string  "compress",           :limit => 1,   :null => false
    t.float   "avgdistinctperpage"
    t.float   "pagevarianceratio"
  end

  add_index "syscolumns", ["tbcreator", "tbname", "name"], :name => "ibm01", :unique => true
  add_index "syscolumns", ["typename", "typeschema"], :name => "ibm24"

  create_table "syscoluse", :id => false, :force => true do |t|
    t.string  "tabschema", :limit => 128, :null => false
    t.string  "tabname",   :limit => 128, :null => false
    t.string  "colname",   :limit => 128, :null => false
    t.boolean "dimension",                :null => false
    t.boolean "colseq",                   :null => false
    t.string  "type",      :limit => 1,   :null => false
  end

  add_index "syscoluse", ["tabschema", "tabname", "dimension", "colseq"], :name => "ibm146"
  add_index "syscoluse", ["tabschema", "tabname", "type", "dimension", "colseq"], :name => "ibm147"

  create_table "syscomments", :id => false, :force => true do |t|
    t.integer "objectid",                :null => false
    t.string  "remarks",  :limit => 254, :null => false
  end

  add_index "syscomments", ["objectid"], :name => "ibm73", :unique => true

  create_table "sysconstdep", :id => false, :force => true do |t|
    t.string "bname",      :limit => 128, :null => false
    t.string "bcreator",   :limit => 128, :null => false
    t.string "btype",      :limit => 1,   :null => false
    t.string "dtbname",    :limit => 128, :null => false
    t.string "dtbcreator", :limit => 128, :null => false
    t.string "dconstname", :limit => 128, :null => false
  end

  add_index "sysconstdep", ["bcreator", "bname", "btype", "dtbcreator", "dtbname", "dconstname"], :name => "ibm44", :unique => true
  add_index "sysconstdep", ["dtbcreator", "dtbname", "dconstname", "btype"], :name => "ibm45"

  create_table "sysdatatypes", :id => false, :force => true do |t|
    t.string    "name",                  :limit => 128,     :null => false
    t.string    "schema",                :limit => 128,     :null => false
    t.string    "definer",               :limit => 128,     :null => false
    t.string    "sourcetype",            :limit => 128
    t.string    "sourceschema",          :limit => 128
    t.string    "metatype",              :limit => 1,       :null => false
    t.boolean   "typeid",                                   :null => false
    t.boolean   "sourcetypeid"
    t.integer   "length",                                   :null => false
    t.boolean   "scale",                                    :null => false
    t.boolean   "codepage",                                 :null => false
    t.timestamp "create_time",                              :null => false
    t.string    "remarks",               :limit => 254
    t.binary    "packed_desc",           :limit => 2097152
    t.binary    "type_desc",             :limit => 1048576
    t.boolean   "attrcount",                                :null => false
    t.string    "instantiable",          :limit => 1,       :null => false
    t.string    "with_func_access",      :limit => 1,       :null => false
    t.string    "final",                 :limit => 1,       :null => false
    t.integer   "inline_length",                            :null => false
    t.string    "jarschema",             :limit => 128
    t.string    "jar_id",                :limit => 128
    t.string    "class",                 :limit => 128
    t.string    "sqlj_representation",   :limit => 1
    t.integer   "natural_inline_length"
    t.timestamp "alter_time",                               :null => false
  end

  add_index "sysdatatypes", ["name", "schema"], :name => "ibm40", :unique => true
  add_index "sysdatatypes", ["schema", "name"], :name => "ibm56", :unique => true
  add_index "sysdatatypes", ["typeid"], :name => "ibm41", :unique => true

  create_table "sysdbauth", :id => false, :force => true do |t|
    t.string "grantor",             :limit => 128, :null => false
    t.string "grantee",             :limit => 128, :null => false
    t.string "dbadmauth",           :limit => 1,   :null => false
    t.string "createtabauth",       :limit => 1,   :null => false
    t.string "bindaddauth",         :limit => 1,   :null => false
    t.string "connectauth",         :limit => 1,   :null => false
    t.string "nofenceauth",         :limit => 1,   :null => false
    t.string "granteetype",         :limit => 1,   :null => false
    t.string "implschemaauth",      :limit => 1,   :null => false
    t.string "loadauth",            :limit => 1,   :null => false
    t.string "externalroutineauth", :limit => 1,   :null => false
    t.string "quiesceconnectauth",  :limit => 1,   :null => false
    t.string "securityadmauth",     :limit => 1,   :null => false
    t.string "libraryadmauth",      :limit => 1,   :null => false
  end

  add_index "sysdbauth", ["grantee", "granteetype", "grantor"], :name => "ibm12", :unique => true

  create_table "sysdependencies", :id => false, :force => true do |t|
    t.string  "bname",      :limit => 128, :null => false
    t.string  "bschema",    :limit => 128, :null => false
    t.string  "btype",      :limit => 1,   :null => false
    t.string  "dname",      :limit => 128, :null => false
    t.string  "dschema",    :limit => 128, :null => false
    t.boolean "tabauth"
    t.string  "dtype",      :limit => 1,   :null => false
    t.string  "bunique_id", :limit => 8
  end

  add_index "sysdependencies", ["bschema", "bname", "btype", "dtype", "dschema", "dname", "bunique_id"], :name => "ibm51", :unique => true
  add_index "sysdependencies", ["dtype", "dschema", "dname"], :name => "ibm52"

  create_table "syserrors", :primary_key => "err_uid", :force => true do |t|
    t.timestamp "err_timestamp",                                   :null => false
    t.boolean   "err_status",                   :default => false, :null => false
    t.integer   "err_state",                    :default => 0,     :null => false
    t.string    "err_cause",     :limit => 100
    t.string    "err_message"
  end

  create_table "syseventmonitors", :id => false, :force => true do |t|
    t.string  "name",            :limit => 128,   :null => false
    t.string  "definer",         :limit => 128,   :null => false
    t.string  "target_type",     :limit => 1,     :null => false
    t.string  "target",          :limit => 256,   :null => false
    t.integer "maxfiles"
    t.integer "maxfilesize"
    t.integer "buffersize"
    t.string  "io_mode",         :limit => 1
    t.string  "write_mode",      :limit => 1
    t.string  "autostart",       :limit => 1,     :null => false
    t.string  "remarks",         :limit => 254
    t.binary  "packed_desc",     :limit => 65536, :null => false
    t.boolean "nodenum",                          :null => false
    t.string  "monscope",        :limit => 1,     :null => false
    t.integer "evmon_activates",                  :null => false
  end

  add_index "syseventmonitors", ["name"], :name => "ibm47", :unique => true

  create_table "sysevents", :id => false, :force => true do |t|
    t.string "name",   :limit => 128,   :null => false
    t.string "type",   :limit => 18,    :null => false
    t.text   "filter", :limit => 32768
  end

  add_index "sysevents", ["name"], :name => "ibm48"

  create_table "syseventtables", :id => false, :force => true do |t|
    t.string  "evmonname",     :limit => 128, :null => false
    t.string  "logical_group", :limit => 18,  :null => false
    t.string  "tabname",       :limit => 128, :null => false
    t.string  "tabschema",     :limit => 128, :null => false
    t.boolean "pctdeactivate",                :null => false
  end

  add_index "syseventtables", ["evmonname", "logical_group"], :name => "ibm165", :unique => true
  add_index "syseventtables", ["tabschema", "tabname"], :name => "ibm167", :unique => true

  create_table "sysfuncmapoptions", :id => false, :force => true do |t|
    t.string "function_mapping", :limit => 128, :null => false
    t.string "option",           :limit => 128, :null => false
    t.string "setting",                         :null => false
  end

  add_index "sysfuncmapoptions", ["function_mapping", "option"], :name => "ibm90", :unique => true

  create_table "sysfuncmapparmoptions", :id => false, :force => true do |t|
    t.string  "function_mapping", :limit => 128, :null => false
    t.boolean "ordinal",                         :null => false
    t.string  "location",         :limit => 1,   :null => false
    t.string  "option",           :limit => 128, :null => false
    t.string  "setting",                         :null => false
  end

  add_index "sysfuncmapparmoptions", ["function_mapping", "ordinal", "location", "option"], :name => "ibm91", :unique => true

  create_table "sysfuncmappings", :id => false, :force => true do |t|
    t.string    "function_mapping", :limit => 128,  :null => false
    t.string    "funcschema",       :limit => 128
    t.string    "funcname",         :limit => 1024
    t.integer   "funcid"
    t.string    "specificname",     :limit => 128
    t.string    "definer",          :limit => 128,  :null => false
    t.string    "servername",       :limit => 128
    t.string    "servertype",       :limit => 30
    t.string    "serverversion",    :limit => 18
    t.string    "wrapname",         :limit => 128
    t.timestamp "create_time",                      :null => false
    t.string    "remarks",          :limit => 254
  end

  add_index "sysfuncmappings", ["funcid"], :name => "ibm93"
  add_index "sysfuncmappings", ["function_mapping"], :name => "ibm92", :unique => true
  add_index "sysfuncmappings", ["servername"], :name => "ibm94"
  add_index "sysfuncmappings", ["servertype", "serverversion", "wrapname"], :name => "ibm96"
  add_index "sysfuncmappings", ["wrapname"], :name => "ibm95"

  create_table "syshierarchies", :id => false, :force => true do |t|
    t.string "metatype",     :limit => 1,   :null => false
    t.string "sub_schema",   :limit => 128, :null => false
    t.string "sub_name",     :limit => 128, :null => false
    t.string "super_schema", :limit => 128, :null => false
    t.string "super_name",   :limit => 128, :null => false
    t.string "root_schema",  :limit => 128, :null => false
    t.string "root_name",    :limit => 128, :null => false
  end

  add_index "syshierarchies", ["metatype", "sub_schema", "sub_name", "super_schema", "super_name"], :name => "ibm86", :unique => true
  add_index "syshierarchies", ["metatype", "super_schema", "super_name", "sub_schema", "sub_name"], :name => "ibm87", :unique => true

  create_table "sysindexauth", :id => false, :force => true do |t|
    t.string "grantor",     :limit => 128, :null => false
    t.string "grantee",     :limit => 128, :null => false
    t.string "name",        :limit => 128, :null => false
    t.string "creator",     :limit => 128, :null => false
    t.string "controlauth", :limit => 1,   :null => false
    t.string "granteetype", :limit => 1,   :null => false
  end

  add_index "sysindexauth", ["creator", "name"], :name => "ibm18"
  add_index "sysindexauth", ["grantee", "creator", "name", "granteetype", "grantor"], :name => "ibm17", :unique => true

  create_table "sysindexcoluse", :id => false, :force => true do |t|
    t.string  "indschema", :limit => 128, :null => false
    t.string  "indname",   :limit => 128, :null => false
    t.string  "colname",   :limit => 128, :null => false
    t.boolean "colseq",                   :null => false
    t.string  "colorder",  :limit => 1,   :null => false
  end

  add_index "sysindexcoluse", ["indschema", "indname", "colname", "colseq"], :name => "ibm139", :unique => true

  create_table "sysindexes", :id => false, :force => true do |t|
    t.string    "name",                         :limit => 128,     :null => false
    t.string    "creator",                      :limit => 128,     :null => false
    t.string    "tbname",                       :limit => 128,     :null => false
    t.string    "tbcreator",                    :limit => 128,     :null => false
    t.string    "colnames",                     :limit => 640,     :null => false
    t.string    "uniquerule",                   :limit => 1,       :null => false
    t.boolean   "colcount",                                        :null => false
    t.boolean   "iid",                                             :null => false
    t.integer   "nleaf",                                           :null => false
    t.boolean   "nlevels",                                         :null => false
    t.integer   "firstkeycard",                                    :null => false
    t.integer   "fullkeycard",                                     :null => false
    t.boolean   "clusterratio",                                    :null => false
    t.float     "clusterfactor",                                   :null => false
    t.boolean   "user_defined",                                    :null => false
    t.boolean   "system_required",                                 :null => false
    t.timestamp "create_time",                                     :null => false
    t.timestamp "stats_time"
    t.string    "page_fetch_pairs",             :limit => 254,     :null => false
    t.string    "remarks",                      :limit => 254
    t.string    "definer",                      :limit => 128,     :null => false
    t.string    "made_unique",                  :limit => 1,       :null => false
    t.integer   "sequential_pages",                                :null => false
    t.integer   "density",                                         :null => false
    t.integer   "first2keycard",                                   :null => false
    t.integer   "first3keycard",                                   :null => false
    t.integer   "first4keycard",                                   :null => false
    t.boolean   "pctfree",                                         :null => false
    t.boolean   "unique_colcount",                                 :null => false
    t.string    "indextype",                    :limit => 4,       :null => false
    t.string    "entrytype",                    :limit => 1,       :null => false
    t.boolean   "minpctused",                                      :null => false
    t.string    "reverse_scans",                :limit => 1,       :null => false
    t.string    "ieschema",                     :limit => 128
    t.string    "iename",                       :limit => 128
    t.text      "iearguments",                  :limit => 32768
    t.binary    "index_desc",                   :limit => 1048576
    t.boolean   "internal_format",                                 :null => false
    t.integer   "index_objectid",                                  :null => false
    t.integer   "tbspaceid",                                       :null => false
    t.float     "average_sequence_gap",                            :null => false
    t.float     "average_sequence_fetch_gap",                      :null => false
    t.float     "average_sequence_pages",                          :null => false
    t.float     "average_sequence_fetch_pages",                    :null => false
    t.float     "average_random_pages",                            :null => false
    t.float     "average_random_fetch_pages",                      :null => false
    t.integer   "numrids",                                         :null => false
    t.integer   "numrids_deleted",                                 :null => false
    t.integer   "num_empty_leafs",                                 :null => false
    t.integer   "os_ptr_size",                                     :null => false
  end

  add_index "sysindexes", ["creator", "name"], :name => "ibm02", :unique => true
  add_index "sysindexes", ["iename", "ieschema"], :name => "ibm126"
  add_index "sysindexes", ["tbcreator", "tbname", "iid"], :name => "ibm03", :unique => true

  create_table "sysindexexploitrules", :id => false, :force => true do |t|
    t.integer "funcid",                         :null => false
    t.boolean "specid",                         :null => false
    t.string  "ieschema",       :limit => 128,  :null => false
    t.string  "iename",         :limit => 128,  :null => false
    t.boolean "ruleid",                         :null => false
    t.boolean "searchmethodid",                 :null => false
    t.string  "searchkey",      :limit => 320,  :null => false
    t.string  "searchargument", :limit => 1800, :null => false
    t.string  "exact",          :limit => 1,    :null => false
  end

  add_index "sysindexexploitrules", ["funcid", "specid", "ruleid"], :name => "ibm97", :unique => true

  create_table "sysindexextensionmethods", :id => false, :force => true do |t|
    t.string  "methodname",     :limit => 128, :null => false
    t.boolean "methodid",                      :null => false
    t.string  "ieschema",       :limit => 128, :null => false
    t.string  "iename",         :limit => 128, :null => false
    t.string  "rtfuncschema",   :limit => 128, :null => false
    t.string  "rtfuncname",     :limit => 18,  :null => false
    t.string  "rtspecificname", :limit => 18,  :null => false
    t.string  "cwfuncschema",   :limit => 128
    t.string  "cwfuncname",     :limit => 128
    t.string  "cwspecificname", :limit => 128
    t.string  "remarks",        :limit => 254
  end

  add_index "sysindexextensionmethods", ["ieschema", "iename", "methodid"], :name => "ibm101", :unique => true
  add_index "sysindexextensionmethods", ["ieschema", "iename", "methodname"], :name => "ibm100", :unique => true

  create_table "sysindexextensionparms", :id => false, :force => true do |t|
    t.string  "ieschema",   :limit => 128, :null => false
    t.string  "iename",     :limit => 128, :null => false
    t.boolean "ordinal",                   :null => false
    t.string  "parmname",   :limit => 128, :null => false
    t.string  "typeschema", :limit => 128, :null => false
    t.string  "typename",   :limit => 128, :null => false
    t.integer "length",                    :null => false
    t.boolean "scale",                     :null => false
    t.string  "parmtype",   :limit => 1,   :null => false
    t.boolean "codepage",                  :null => false
  end

  add_index "sysindexextensionparms", ["ieschema", "iename", "parmname"], :name => "ibm98", :unique => true

  create_table "sysindexextensions", :id => false, :force => true do |t|
    t.string    "ieschema",       :limit => 128,      :null => false
    t.string    "iename",         :limit => 128,      :null => false
    t.string    "definer",        :limit => 128,      :null => false
    t.timestamp "create_time",                        :null => false
    t.string    "ktfuncschema",   :limit => 128,      :null => false
    t.string    "ktfuncname",     :limit => 128,      :null => false
    t.string    "ktspecificname", :limit => 128,      :null => false
    t.text      "text",           :limit => 2097152,  :null => false
    t.binary    "index_desc",     :limit => 10485760, :null => false
    t.string    "remarks",        :limit => 254
  end

  add_index "sysindexextensions", ["ieschema", "iename"], :name => "ibm99", :unique => true

  create_table "sysindexoptions", :id => false, :force => true do |t|
    t.string "indschema", :limit => 128, :null => false
    t.string "indname",   :limit => 128, :null => false
    t.string "option",    :limit => 128, :null => false
    t.string "setting",                  :null => false
  end

  add_index "sysindexoptions", ["indschema", "indname", "option"], :name => "ibm102", :unique => true

  create_table "sysjarcontents", :id => false, :force => true do |t|
    t.string "jarschema",    :limit => 128,      :null => false
    t.string "jar_id",       :limit => 128,      :null => false
    t.string "class",        :limit => 128,      :null => false
    t.text   "class_source", :limit => 10485760
  end

  add_index "sysjarcontents", ["jarschema", "jar_id", "class"], :name => "ibm131", :unique => true

  create_table "sysjarobjects", :id => false, :force => true do |t|
    t.string    "jarschema", :limit => 128,       :null => false
    t.string    "jar_id",    :limit => 128,       :null => false
    t.string    "definer",   :limit => 128,       :null => false
    t.binary    "jar_data",  :limit => 104857600
    t.timestamp "alteredts",                      :null => false
    t.timestamp "createdts",                      :null => false
  end

  add_index "sysjarobjects", ["jarschema", "jar_id"], :name => "ibm132", :unique => true

  create_table "syskeycoluse", :id => false, :force => true do |t|
    t.string  "constname", :limit => 128, :null => false
    t.string  "tbname",    :limit => 128, :null => false
    t.string  "tbcreator", :limit => 128, :null => false
    t.string  "colname",   :limit => 128, :null => false
    t.boolean "colseq",                   :null => false
  end

  add_index "syskeycoluse", ["tbcreator", "tbname", "colname", "constname"], :name => "ibm35", :unique => true
  add_index "syskeycoluse", ["tbcreator", "tbname", "constname"], :name => "ibm36"

  create_table "syslibraries", :id => false, :force => true do |t|
    t.string  "libschema",        :limit => 128, :null => false
    t.string  "libname",          :limit => 128, :null => false
    t.string  "definer",          :limit => 128, :null => false
    t.integer "lib_id",                          :null => false
    t.integer "libversion_count",                :null => false
    t.integer "active_version",                  :null => false
    t.boolean "system_required",                 :null => false
  end

  add_index "syslibraries", ["lib_id"], :name => "ibm141", :unique => true
  add_index "syslibraries", ["libschema", "libname"], :name => "ibm110", :unique => true

  create_table "syslibraryauth", :id => false, :force => true do |t|
    t.string "grantor",     :limit => 128, :null => false
    t.string "grantee",     :limit => 128, :null => false
    t.string "granteetype", :limit => 1,   :null => false
    t.string "libschema",   :limit => 128, :null => false
    t.string "libname",     :limit => 128, :null => false
    t.string "usageauth",   :limit => 1,   :null => false
    t.string "alterauth",   :limit => 1,   :null => false
  end

  add_index "syslibraryauth", ["grantee", "granteetype", "libschema", "libname"], :name => "ibm160"
  add_index "syslibraryauth", ["grantor", "grantee", "granteetype", "libschema", "libname"], :name => "ibm159", :unique => true

  create_table "syslibrarybindfiles", :id => false, :force => true do |t|
    t.integer "lib_id",                              :null => false
    t.integer "libversion",                          :null => false
    t.string  "package_schema",  :limit => 128,      :null => false
    t.string  "package_name",    :limit => 128,      :null => false
    t.string  "package_version", :limit => 64,       :null => false
    t.string  "bindfile_path",                       :null => false
    t.binary  "bindfile_body",   :limit => 10485760, :null => false
  end

  add_index "syslibrarybindfiles", ["lib_id", "libversion", "package_name"], :name => "ibm149", :unique => true

  create_table "syslibraryversions", :id => false, :force => true do |t|
    t.integer   "lib_id",                              :null => false
    t.integer   "libversion",                          :null => false
    t.string    "definer",         :limit => 128,      :null => false
    t.timestamp "create_time",                         :null => false
    t.string    "version_path",                        :null => false
    t.boolean   "bindfiles_count",                     :null => false
    t.binary    "version_body",    :limit => 20971520, :null => false
    t.integer   "checksum",                            :null => false
    t.string    "stale",           :limit => 1
  end

  add_index "syslibraryversions", ["lib_id", "libversion"], :name => "ibm150", :unique => true

  create_table "syslookuptablelist", :id => false, :force => true do |t|
    t.integer "lookup_id",                                   :null => false
    t.string  "table_name", :limit => 40
    t.string  "table_desc", :limit => 80
    t.boolean "editable",                 :default => false
  end

  create_table "sysmatkind", :primary_key => "sysmatkind_uid", :force => true do |t|
    t.string "sysmatkind_desc", :limit => 40,  :null => false
    t.string "sysmatkind_def",  :limit => 256
  end

  add_index "sysmatkind", ["sysmatkind_uid", "sysmatkind_desc"], :name => "idx909241436260000", :unique => true

  create_table "sysnamemappings", :id => false, :force => true do |t|
    t.string "type",            :limit => 1,   :null => false
    t.string "logical_schema",  :limit => 128, :null => false
    t.string "logical_name",    :limit => 128, :null => false
    t.string "logical_colname", :limit => 128
    t.string "impl_schema",     :limit => 128, :null => false
    t.string "impl_name",       :limit => 128, :null => false
    t.string "impl_colname",    :limit => 128
  end

  add_index "sysnamemappings", ["type", "impl_schema", "impl_name", "impl_colname"], :name => "ibm134"
  add_index "sysnamemappings", ["type", "logical_schema", "logical_name", "logical_colname"], :name => "ibm133"

  create_table "sysnodegroupdef", :id => false, :force => true do |t|
    t.string  "ngname",  :limit => 128, :null => false
    t.boolean "nodenum",                :null => false
    t.string  "in_use",  :limit => 1,   :null => false
  end

  add_index "sysnodegroupdef", ["ngname", "nodenum"], :name => "ibm61", :unique => true

  create_table "sysnodegroups", :id => false, :force => true do |t|
    t.string    "name",              :limit => 128, :null => false
    t.string    "definer",           :limit => 128, :null => false
    t.boolean   "pmap_id",                          :null => false
    t.boolean   "rebalance_pmap_id",                :null => false
    t.timestamp "ctime",                            :null => false
    t.string    "remarks",           :limit => 254
  end

  add_index "sysnodegroups", ["name"], :name => "ibm62", :unique => true

  create_table "syspartitionmaps", :id => false, :force => true do |t|
    t.boolean "pmap_id",                     :null => false
    t.binary  "partitionmap", :limit => 100, :null => false
  end

  add_index "syspartitionmaps", ["pmap_id"], :name => "ibm63", :unique => true

  create_table "syspassthruauth", :id => false, :force => true do |t|
    t.string "grantor",     :limit => 128, :null => false
    t.string "grantee",     :limit => 128, :null => false
    t.string "granteetype", :limit => 1,   :null => false
    t.string "servername",  :limit => 128, :null => false
  end

  add_index "syspassthruauth", ["grantee", "servername"], :name => "ibm130"
  add_index "syspassthruauth", ["grantor", "grantee", "granteetype", "servername"], :name => "ibm103", :unique => true

  create_table "sysplan", :id => false, :force => true do |t|
    t.string    "name",                :limit => 128,                                    :null => false
    t.string    "creator",             :limit => 128,                                    :null => false
    t.string    "boundby",             :limit => 128,                                    :null => false
    t.string    "valid",               :limit => 1,                                      :null => false
    t.string    "unique_id",           :limit => 8,                                      :null => false
    t.boolean   "totalsect",                                                             :null => false
    t.string    "format",              :limit => 1,                                      :null => false
    t.binary    "sect_info",           :limit => 1048576,                                :null => false
    t.binary    "host_vars",           :limit => 1048576
    t.string    "isolation",           :limit => 2
    t.string    "block",               :limit => 1
    t.string    "standards_level",     :limit => 1
    t.string    "func_path",           :limit => 254,                                    :null => false
    t.timestamp "explicit_bind_time",                                                    :null => false
    t.timestamp "last_bind_time",                                                        :null => false
    t.integer   "queryopt",                                                              :null => false
    t.string    "explain_level",       :limit => 1,                                      :null => false
    t.string    "explain_mode",        :limit => 1,                                      :null => false
    t.string    "explain_snapshot",    :limit => 1,                                      :null => false
    t.string    "sqlwarn",             :limit => 1,                                      :null => false
    t.boolean   "codepage",                                                              :null => false
    t.string    "remarks",             :limit => 254
    t.string    "sqlrules",            :limit => 1,                                      :null => false
    t.string    "sqlrules_string",     :limit => 254,                                    :null => false
    t.string    "insert_buf",          :limit => 1,                                      :null => false
    t.string    "definer",             :limit => 128,                                    :null => false
    t.string    "default_schema",      :limit => 128,                                    :null => false
    t.string    "multinode_plans",     :limit => 1,                                      :null => false
    t.string    "degree",              :limit => 5,                                      :null => false
    t.boolean   "rds_level",                                                             :null => false
    t.string    "sqlmathwarn",         :limit => 1,                                      :null => false
    t.string    "intra_parallel",      :limit => 1,                                      :null => false
    t.string    "validate",            :limit => 1,                                      :null => false
    t.string    "dynamicrules",        :limit => 1,                                      :null => false
    t.string    "sqlerror",            :limit => 1,                                      :null => false
    t.decimal   "refreshage",                             :precision => 20, :scale => 6, :null => false
    t.timestamp "pkg_create_time",                                                       :null => false
    t.string    "federated",           :limit => 1,                                      :null => false
    t.string    "transformgroup",      :limit => 1024
    t.binary    "trf_grp_packed_desc", :limit => 2048
    t.string    "pkgversion",          :limit => 64,                                     :null => false
    t.string    "reoptvar",            :limit => 1,                                      :null => false
    t.integer   "os_ptr_size",                                                           :null => false
    t.binary    "packed_desc",         :limit => 1048576
  end

  add_index "sysplan", ["boundby"], :name => "ibm19"
  add_index "sysplan", ["creator", "name", "pkgversion"], :name => "ibm153", :unique => true
  add_index "sysplan", ["creator", "name", "unique_id"], :name => "ibm07", :unique => true

  create_table "sysplanauth", :id => false, :force => true do |t|
    t.string "grantor",     :limit => 128, :null => false
    t.string "grantee",     :limit => 128, :null => false
    t.string "name",        :limit => 128, :null => false
    t.string "creator",     :limit => 128, :null => false
    t.string "controlauth", :limit => 1,   :null => false
    t.string "bindauth",    :limit => 1,   :null => false
    t.string "executeauth", :limit => 1,   :null => false
    t.string "granteetype", :limit => 1,   :null => false
  end

  add_index "sysplanauth", ["creator", "name"], :name => "ibm14"
  add_index "sysplanauth", ["grantee", "creator", "name", "granteetype", "grantor"], :name => "ibm13", :unique => true

  create_table "sysplandep", :id => false, :force => true do |t|
    t.string  "bname",      :limit => 128,  :null => false
    t.string  "bcreator",   :limit => 128,  :null => false
    t.string  "btype",      :limit => 1,    :null => false
    t.string  "dname",      :limit => 128,  :null => false
    t.string  "dcreator",   :limit => 128,  :null => false
    t.string  "binder",     :limit => 128
    t.boolean "tabauth"
    t.boolean "tabusage",                   :null => false
    t.binary  "colusage",   :limit => 5120
    t.string  "dunique_id", :limit => 8
  end

  add_index "sysplandep", ["bcreator", "bname", "btype", "dcreator", "dname", "dunique_id"], :name => "ibm08", :unique => true
  add_index "sysplandep", ["dcreator", "dname", "dunique_id"], :name => "ibm09"

  create_table "syspredicatespecs", :id => false, :force => true do |t|
    t.integer "funcid",                      :null => false
    t.boolean "specid",                      :null => false
    t.string  "contextop",  :limit => 8,     :null => false
    t.text    "contextexp", :limit => 32768, :null => false
    t.text    "filtertext", :limit => 65536
  end

  add_index "syspredicatespecs", ["funcid", "specid"], :name => "ibm104", :unique => true

  create_table "sysprocoptions", :id => false, :force => true do |t|
    t.string "procschema", :limit => 128, :null => false
    t.string "procname",   :limit => 128, :null => false
    t.string "option",     :limit => 128, :null => false
    t.string "setting",                   :null => false
  end

  add_index "sysprocoptions", ["procschema", "procname", "option"], :name => "ibm105", :unique => true

  create_table "sysprocparmoptions", :id => false, :force => true do |t|
    t.string  "procschema", :limit => 128, :null => false
    t.string  "procname",   :limit => 128, :null => false
    t.boolean "ordinal",                   :null => false
    t.string  "option",     :limit => 128, :null => false
    t.string  "setting",                   :null => false
  end

  add_index "sysprocparmoptions", ["procschema", "procname", "ordinal", "option"], :name => "ibm106", :unique => true

  create_table "sysrels", :id => false, :force => true do |t|
    t.string    "creator",      :limit => 128, :null => false
    t.string    "tbname",       :limit => 128, :null => false
    t.string    "relname",      :limit => 128, :null => false
    t.string    "reftbname",    :limit => 128, :null => false
    t.string    "reftbcreator", :limit => 128, :null => false
    t.boolean   "colcount",                    :null => false
    t.string    "deleterule",   :limit => 1,   :null => false
    t.string    "updaterule",   :limit => 1,   :null => false
    t.timestamp "timestamp",                   :null => false
    t.string    "fkcolnames",   :limit => 640, :null => false
    t.string    "pkcolnames",   :limit => 640, :null => false
    t.string    "refkeyname",   :limit => 128, :null => false
    t.string    "definer",      :limit => 128, :null => false
  end

  add_index "sysrels", ["creator", "tbname", "relname"], :name => "ibm20", :unique => true

  create_table "sysroutineauth", :id => false, :force => true do |t|
    t.string    "grantor",      :limit => 128, :null => false
    t.string    "grantee",      :limit => 128, :null => false
    t.string    "granteetype",  :limit => 1,   :null => false
    t.string    "schema",       :limit => 128, :null => false
    t.string    "specificname", :limit => 128
    t.string    "typeschema",   :limit => 128
    t.string    "typename",     :limit => 128
    t.string    "routinetype",  :limit => 1,   :null => false
    t.string    "executeauth",  :limit => 1,   :null => false
    t.timestamp "grant_time",                  :null => false
  end

  add_index "sysroutineauth", ["grantee", "granteetype", "routinetype", "schema", "specificname"], :name => "ibm108"
  add_index "sysroutineauth", ["grantee", "granteetype", "routinetype", "schema", "typeschema", "typename", "specificname"], :name => "ibm109"
  add_index "sysroutineauth", ["grantor", "grantee", "granteetype", "routinetype", "schema", "specificname", "typeschema", "typename"], :name => "ibm107", :unique => true
  add_index "sysroutineauth", ["routinetype", "schema", "specificname"], :name => "ibm729"
  add_index "sysroutineauth", ["typeschema", "typename"], :name => "ibm166"

  create_table "sysroutineparms", :id => false, :force => true do |t|
    t.string  "routinename",       :limit => 128, :null => false
    t.string  "routineschema",     :limit => 128, :null => false
    t.string  "specificname",      :limit => 128, :null => false
    t.string  "rowtype",           :limit => 1,   :null => false
    t.boolean "ordinal",                          :null => false
    t.string  "typename",          :limit => 128, :null => false
    t.string  "typeschema",        :limit => 128, :null => false
    t.integer "length",                           :null => false
    t.boolean "scale",                            :null => false
    t.boolean "codepage",                         :null => false
    t.integer "cast_function_id"
    t.string  "parmname",          :limit => 128
    t.string  "locator",           :limit => 1,   :null => false
    t.string  "target_typeschema", :limit => 128
    t.string  "target_typename",   :limit => 128
    t.string  "scope_tabschema",   :limit => 128
    t.string  "scope_tabname",     :limit => 128
    t.string  "transform_grpname", :limit => 128
    t.integer "routine_id",                       :null => false
    t.string  "routinetype",       :limit => 1,   :null => false
    t.boolean "target_typeid"
    t.boolean "typeid"
    t.string  "remarks",           :limit => 254
  end

  add_index "sysroutineparms", ["cast_function_id"], :name => "ibm33"
  add_index "sysroutineparms", ["specificname", "routineschema", "ordinal", "rowtype"], :name => "ibm152", :unique => true
  add_index "sysroutineparms", ["specificname", "routineschema"], :name => "ibm31"
  add_index "sysroutineparms", ["target_typeschema", "target_typename", "routineschema", "specificname"], :name => "ibm81"
  add_index "sysroutineparms", ["transform_grpname", "typename", "typeschema"], :name => "ibm128"
  add_index "sysroutineparms", ["typename", "typeschema", "specificname", "routineschema", "rowtype"], :name => "ibm32"

  create_table "sysroutinepropertiesjava", :id => false, :force => true do |t|
    t.integer "routine_id",                    :null => false
    t.string  "class",         :limit => 128
    t.string  "jar_id",        :limit => 128
    t.string  "jarschema",     :limit => 128
    t.string  "jar_signature", :limit => 1024
  end

  add_index "sysroutinepropertiesjava", ["jarschema"], :name => "ibm164"
  add_index "sysroutinepropertiesjava", ["routine_id"], :name => "ibm71", :unique => true

  create_table "sysroutines", :id => false, :force => true do |t|
    t.string    "routinename",         :limit => 128, :null => false
    t.string    "routineschema",       :limit => 128, :null => false
    t.string    "definer",             :limit => 128, :null => false
    t.string    "specificname",        :limit => 128, :null => false
    t.binary    "parm_signature",      :limit => 180, :null => false
    t.integer   "routine_id",                         :null => false
    t.boolean   "return_type",                        :null => false
    t.string    "origin",              :limit => 1,   :null => false
    t.string    "function_type",       :limit => 1,   :null => false
    t.timestamp "createdts",                          :null => false
    t.boolean   "parm_count",                         :null => false
    t.string    "deterministic",       :limit => 1,   :null => false
    t.string    "external_action",     :limit => 1,   :null => false
    t.string    "fenced",              :limit => 1,   :null => false
    t.string    "null_call",           :limit => 1,   :null => false
    t.string    "cast_function",       :limit => 1,   :null => false
    t.string    "assign_function",     :limit => 1,   :null => false
    t.string    "scratchpad",          :limit => 1,   :null => false
    t.string    "final_call",          :limit => 1,   :null => false
    t.string    "language",            :limit => 8,   :null => false
    t.string    "implementation",      :limit => 254
    t.string    "sourcespecific",      :limit => 128
    t.string    "sourceschema",        :limit => 128
    t.float     "ios_per_invoc",                      :null => false
    t.float     "insts_per_invoc",                    :null => false
    t.float     "ios_per_argbyte",                    :null => false
    t.float     "insts_per_argbyte",                  :null => false
    t.boolean   "percent_argbytes",                   :null => false
    t.float     "initial_ios",                        :null => false
    t.float     "initial_insts",                      :null => false
    t.integer   "internal_prec1",                     :null => false
    t.float     "internal_prec2",                     :null => false
    t.string    "remarks",             :limit => 254
    t.binary    "internal_desc",       :limit => 100, :null => false
    t.string    "parallel",            :limit => 1,   :null => false
    t.string    "sql_data_access",     :limit => 1,   :null => false
    t.string    "dbinfo",              :limit => 1,   :null => false
    t.boolean   "result_cols",                        :null => false
    t.text      "text",                :limit => 100
    t.integer   "cardinality",                        :null => false
    t.string    "parameter_style",     :limit => 8,   :null => false
    t.string    "methodimplemented",   :limit => 1,   :null => false
    t.string    "methodeffect",        :limit => 2,   :null => false
    t.string    "func_path",           :limit => 254
    t.string    "type_preserving",     :limit => 1,   :null => false
    t.string    "with_func_access",    :limit => 1,   :null => false
    t.float     "selectivity",                        :null => false
    t.integer   "overridden_methodid"
    t.string    "subject_typeschema",  :limit => 128
    t.string    "subject_typename",    :limit => 128
    t.string    "qualifier",           :limit => 128, :null => false
    t.boolean   "scratchpad_length",                  :null => false
    t.integer   "lib_id"
    t.string    "spec_reg",            :limit => 1,   :null => false
    t.string    "federated",           :limit => 1,   :null => false
    t.timestamp "alteredts",                          :null => false
    t.integer   "sourceroutineid"
    t.boolean   "subject_typeid"
    t.string    "routinetype",         :limit => 1,   :null => false
    t.string    "threadsafe",          :limit => 1,   :null => false
    t.boolean   "result_sets",                        :null => false
    t.string    "program_type",        :limit => 1,   :null => false
    t.string    "valid",               :limit => 1,   :null => false
    t.integer   "text_body_offset",                   :null => false
    t.string    "commit_on_return",    :limit => 1,   :null => false
    t.string    "namespace",           :limit => 1,   :null => false
    t.string    "methodproperty",      :limit => 1,   :null => false
    t.string    "newsavepointlevel",   :limit => 1,   :null => false
  end

  add_index "sysroutines", ["lib_id", "origin"], :name => "ibm151"
  add_index "sysroutines", ["namespace", "routinename", "parm_count", "internal_prec1", "internal_prec2", "routineschema", "createdts", "return_type", "cast_function", "assign_function", "methodimplemented"], :name => "ibm30", :unique => true
  add_index "sysroutines", ["return_type", "cast_function", "parm_count", "internal_prec1", "routine_id"], :name => "ibm127", :unique => true
  add_index "sysroutines", ["routine_id"], :name => "ibm29", :unique => true
  add_index "sysroutines", ["routinename", "parm_count", "routineschema", "namespace"], :name => "ibm26", :unique => true
  add_index "sysroutines", ["routinename", "routineschema", "routinetype", "parm_count"], :name => "ibm27"
  add_index "sysroutines", ["routineschema", "specificname"], :name => "ibm55", :unique => true
  add_index "sysroutines", ["routinetype", "routinename", "parm_count", "routineschema"], :name => "ibm189"
  add_index "sysroutines", ["sourceschema", "sourcespecific"], :name => "ibm28"
  add_index "sysroutines", ["specificname", "routineschema", "namespace"], :name => "ibm25", :unique => true

  create_table "sysschemaauth", :id => false, :force => true do |t|
    t.string "grantor",      :limit => 128, :null => false
    t.string "grantee",      :limit => 128, :null => false
    t.string "granteetype",  :limit => 1,   :null => false
    t.string "schemaname",   :limit => 128, :null => false
    t.string "createinauth", :limit => 1,   :null => false
    t.string "dropinauth",   :limit => 1,   :null => false
    t.string "alterinauth",  :limit => 1,   :null => false
  end

  add_index "sysschemaauth", ["grantee", "schemaname", "granteetype", "grantor"], :name => "ibm57", :unique => true
  add_index "sysschemaauth", ["schemaname"], :name => "ibm58"

  create_table "sysschemata", :id => false, :force => true do |t|
    t.string    "name",        :limit => 128, :null => false
    t.string    "owner",       :limit => 128, :null => false
    t.string    "definer",     :limit => 128, :null => false
    t.timestamp "create_time",                :null => false
    t.string    "remarks",     :limit => 254
  end

  add_index "sysschemata", ["name"], :name => "ibm59", :unique => true

  create_table "syssection", :id => false, :force => true do |t|
    t.string  "plname",       :limit => 128,      :null => false
    t.string  "plcreator",    :limit => 128,      :null => false
    t.boolean "sectno",                           :null => false
    t.binary  "section",      :limit => 10485760
    t.string  "valid",        :limit => 1,        :null => false
    t.string  "unique_id",    :limit => 8,        :null => false
    t.binary  "section_info", :limit => 4190000
  end

  add_index "syssection", ["plcreator", "plname", "unique_id", "sectno"], :name => "ibm10", :unique => true

  create_table "syssequenceauth", :id => false, :force => true do |t|
    t.string  "grantor",     :limit => 128, :null => false
    t.string  "grantee",     :limit => 128, :null => false
    t.string  "granteetype", :limit => 1,   :null => false
    t.integer "seqid",                      :null => false
    t.string  "usageauth",   :limit => 1,   :null => false
    t.string  "alterauth",   :limit => 1,   :null => false
  end

  add_index "syssequenceauth", ["grantee", "seqid", "granteetype", "grantor"], :name => "ibm74", :unique => true
  add_index "syssequenceauth", ["seqid"], :name => "ibm75"

  create_table "syssequences", :id => false, :force => true do |t|
    t.decimal   "lastassignedval",                  :precision => 31, :scale => 0
    t.integer   "seqid",                                                           :null => false
    t.string    "seqschema",       :limit => 128,                                  :null => false
    t.string    "seqname",         :limit => 128,                                  :null => false
    t.decimal   "increment",                        :precision => 31, :scale => 0, :null => false
    t.decimal   "start",                            :precision => 31, :scale => 0, :null => false
    t.decimal   "maxvalue",                         :precision => 31, :scale => 0, :null => false
    t.decimal   "minvalue",                         :precision => 31, :scale => 0, :null => false
    t.string    "cycle",           :limit => 1,                                    :null => false
    t.integer   "cache",                                                           :null => false
    t.string    "order",           :limit => 1,                                    :null => false
    t.string    "origin",          :limit => 1,                                    :null => false
    t.string    "seqtype",         :limit => 1,                                    :null => false
    t.integer   "datatypeid",                                                      :null => false
    t.binary    "seq_desc",        :limit => 65536
    t.timestamp "create_time",                                                     :null => false
    t.timestamp "alter_time",                                                      :null => false
    t.integer   "sourcetypeid",                                                    :null => false
    t.boolean   "precision",                                                       :null => false
    t.string    "definer",         :limit => 128,                                  :null => false
    t.string    "owner",           :limit => 128,                                  :null => false
  end

  add_index "syssequences", ["seqid"], :name => "ibm135", :unique => true
  add_index "syssequences", ["seqschema", "seqname"], :name => "ibm136", :unique => true

  create_table "sysserveroptions", :id => false, :force => true do |t|
    t.string    "wrapname",        :limit => 128
    t.string    "servername",      :limit => 128
    t.string    "servertype",      :limit => 30
    t.string    "serverversion",   :limit => 18
    t.timestamp "create_time",                     :null => false
    t.string    "option",          :limit => 128,  :null => false
    t.string    "setting",         :limit => 2048, :null => false
    t.string    "serveroptionkey", :limit => 18,   :null => false
    t.string    "remarks",         :limit => 254
  end

  add_index "sysserveroptions", ["servername", "option"], :name => "ibm115"
  add_index "sysserveroptions", ["serveroptionkey"], :name => "ibm117", :unique => true
  add_index "sysserveroptions", ["servertype", "serverversion", "wrapname", "option"], :name => "ibm116"
  add_index "sysserveroptions", ["wrapname"], :name => "ibm143"

  create_table "sysservers", :id => false, :force => true do |t|
    t.string "wrapname",      :limit => 128,      :null => false
    t.string "servername",    :limit => 128,      :null => false
    t.string "servertype",    :limit => 30
    t.string "serverversion", :limit => 18
    t.binary "server_desc",   :limit => 10485760
    t.string "remarks",       :limit => 254
  end

  add_index "sysservers", ["servername"], :name => "ibm118", :unique => true
  add_index "sysservers", ["servertype", "serverversion", "wrapname"], :name => "ibm138"
  add_index "sysservers", ["wrapname"], :name => "ibm144"

  create_table "sysstmt", :id => false, :force => true do |t|
    t.string  "plname",    :limit => 128,     :null => false
    t.string  "plcreator", :limit => 128,     :null => false
    t.integer "stmtno",                       :null => false
    t.boolean "sectno",                       :null => false
    t.text    "text",      :limit => 2097152, :null => false
    t.string  "unique_id", :limit => 8,       :null => false
    t.binary  "host_vars", :limit => 4190000
  end

  add_index "sysstmt", ["plcreator", "plname", "unique_id", "sectno"], :name => "ibm11", :unique => true

  create_table "systabauth", :id => false, :force => true do |t|
    t.string  "grantor",     :limit => 128, :null => false
    t.string  "grantee",     :limit => 128, :null => false
    t.string  "tcreator",    :limit => 128, :null => false
    t.string  "ttname",      :limit => 128, :null => false
    t.boolean "tabauth",                    :null => false
    t.string  "controlauth", :limit => 1,   :null => false
    t.string  "alterauth",   :limit => 1,   :null => false
    t.string  "deleteauth",  :limit => 1,   :null => false
    t.string  "indexauth",   :limit => 1,   :null => false
    t.string  "insertauth",  :limit => 1,   :null => false
    t.string  "selectauth",  :limit => 1,   :null => false
    t.string  "updateauth",  :limit => 1,   :null => false
    t.string  "refauth",     :limit => 1,   :null => false
    t.string  "granteetype", :limit => 1,   :null => false
  end

  add_index "systabauth", ["grantee", "tcreator", "ttname", "granteetype", "grantor"], :name => "ibm15", :unique => true
  add_index "systabauth", ["tcreator", "ttname"], :name => "ibm16"

  create_table "systabconst", :id => false, :force => true do |t|
    t.string "name",              :limit => 128, :null => false
    t.string "definer",           :limit => 128, :null => false
    t.string "constraintyp",      :limit => 1,   :null => false
    t.string "tbname",            :limit => 128, :null => false
    t.string "tbcreator",         :limit => 128, :null => false
    t.string "remarks",           :limit => 254
    t.string "enforced",          :limit => 1,   :null => false
    t.string "checkexistingdata", :limit => 1,   :null => false
    t.string "enablequeryopt",    :limit => 1,   :null => false
  end

  add_index "systabconst", ["tbcreator", "tbname", "name"], :name => "ibm34", :unique => true

  create_table "systables", :id => false, :force => true do |t|
    t.string    "name",               :limit => 128,      :null => false
    t.string    "creator",            :limit => 128,      :null => false
    t.string    "type",               :limit => 1,        :null => false
    t.timestamp "ctime",                                  :null => false
    t.string    "remarks",            :limit => 254
    t.binary    "packed_desc",        :limit => 20971520
    t.binary    "view_desc",          :limit => 131072
    t.boolean   "colcount",                               :null => false
    t.boolean   "fid",                                    :null => false
    t.boolean   "tid",                                    :null => false
    t.integer   "card",                                   :null => false
    t.integer   "npages",                                 :null => false
    t.integer   "fpages",                                 :null => false
    t.integer   "overflow",                               :null => false
    t.boolean   "parents"
    t.boolean   "children"
    t.boolean   "selfrefs"
    t.boolean   "keycolumns"
    t.boolean   "keyobid"
    t.binary    "rel_desc",           :limit => 262144
    t.string    "base_name",          :limit => 128
    t.string    "base_schema",        :limit => 128
    t.string    "tbspace",            :limit => 128
    t.string    "index_tbspace",      :limit => 128
    t.string    "long_tbspace",       :limit => 128
    t.boolean   "keyunique",                              :null => false
    t.boolean   "checkcount",                             :null => false
    t.binary    "check_desc",         :limit => 131072
    t.timestamp "stats_time"
    t.string    "definer",            :limit => 128,      :null => false
    t.binary    "trig_desc",          :limit => 3145728
    t.string    "data_capture",       :limit => 1,        :null => false
    t.string    "status",             :limit => 1,        :null => false
    t.string    "const_checked",      :limit => 32,       :null => false
    t.boolean   "pmap_id"
    t.string    "log_attribute",      :limit => 1,        :null => false
    t.boolean   "pctfree",                                :null => false
    t.string    "rowtypeschema",      :limit => 128
    t.string    "rowtypename",        :limit => 128
    t.string    "append_mode",        :limit => 1,        :null => false
    t.string    "partition_mode",     :limit => 1,        :null => false
    t.string    "refresh",            :limit => 1,        :null => false
    t.timestamp "refresh_time"
    t.string    "locksize",           :limit => 1,        :null => false
    t.string    "volatile",           :limit => 1,        :null => false
    t.binary    "remote_desc",        :limit => 10485760
    t.string    "clustered",          :limit => 1
    t.binary    "ast_desc",           :limit => 5242880
    t.string    "droprule",           :limit => 1,        :null => false
    t.string    "row_format",         :limit => 1,        :null => false
    t.string    "property",           :limit => 32,       :null => false
    t.text      "statistics_profile", :limit => 32768
    t.string    "compression",        :limit => 1,        :null => false
    t.string    "access_mode",        :limit => 1,        :null => false
    t.integer   "active_blocks",                          :null => false
    t.boolean   "maxfreespacesearch",                     :null => false
  end

  add_index "systables", ["creator", "name"], :name => "ibm00", :unique => true
  add_index "systables", ["index_tbspace"], :name => "ibm22"
  add_index "systables", ["long_tbspace"], :name => "ibm23"
  add_index "systables", ["rowtypeschema", "rowtypename", "creator", "name"], :name => "ibm78", :unique => true
  add_index "systables", ["tbspace"], :name => "ibm21"
  add_index "systables", ["tid", "fid"], :name => "ibm137"

  create_table "systablespaces", :id => false, :force => true do |t|
    t.string    "tbspace",       :limit => 128, :null => false
    t.string    "definer",       :limit => 128, :null => false
    t.timestamp "create_time",                  :null => false
    t.integer   "tbspaceid",                    :null => false
    t.string    "tbspacetype",   :limit => 1,   :null => false
    t.string    "datatype",      :limit => 1,   :null => false
    t.integer   "extentsize",                   :null => false
    t.integer   "prefetchsize",                 :null => false
    t.float     "overhead",                     :null => false
    t.float     "transferrate",                 :null => false
    t.string    "remarks",       :limit => 254
    t.string    "ngname",        :limit => 128, :null => false
    t.integer   "bufferpoolid",                 :null => false
    t.integer   "pagesize",                     :null => false
    t.string    "drop_recovery", :limit => 1,   :null => false
  end

  add_index "systablespaces", ["bufferpoolid"], :name => "ibm70"
  add_index "systablespaces", ["definer"], :name => "ibm50"
  add_index "systablespaces", ["ngname"], :name => "ibm65"
  add_index "systablespaces", ["tbspace"], :name => "ibm49", :unique => true
  add_index "systablespaces", ["tbspaceid"], :name => "ibm66", :unique => true

  create_table "systaboptions", :id => false, :force => true do |t|
    t.string "tabschema", :limit => 128, :null => false
    t.string "tabname",   :limit => 128, :null => false
    t.string "option",    :limit => 128, :null => false
    t.string "setting",                  :null => false
  end

  add_index "systaboptions", ["option", "setting"], :name => "ibm145"
  add_index "systaboptions", ["tabschema", "tabname", "option"], :name => "ibm119", :unique => true

  create_table "systbspaceauth", :id => false, :force => true do |t|
    t.string  "grantor",     :limit => 128, :null => false
    t.string  "grantee",     :limit => 128, :null => false
    t.string  "granteetype", :limit => 1,   :null => false
    t.integer "tbspaceid",                  :null => false
    t.string  "useauth",     :limit => 1,   :null => false
    t.string  "tbspace",     :limit => 128, :null => false
  end

  add_index "systbspaceauth", ["grantee", "granteetype", "tbspace", "grantor"], :name => "ibm148", :unique => true
  add_index "systbspaceauth", ["grantee", "granteetype", "tbspaceid"], :name => "ibm129"

  create_table "system_parameter", :primary_key => "system_parameter_uid", :force => true do |t|
    t.string  "system_parameter",                                           :null => false
    t.string  "system_parameter_value",    :limit => 40,                    :null => false
    t.boolean "edit",                                    :default => false, :null => false
    t.string  "system_parameter_val_type", :limit => 10
  end

  create_table "systransforms", :id => false, :force => true do |t|
    t.boolean "typeid",                        :null => false
    t.string  "groupname",      :limit => 128, :null => false
    t.integer "fromsql_funcid"
    t.integer "tosql_funcid"
    t.string  "fromsql_format", :limit => 1,   :null => false
    t.string  "tosql_format",   :limit => 1,   :null => false
    t.integer "fromsql_length",                :null => false
    t.string  "origin",         :limit => 1,   :null => false
    t.string  "remarks",        :limit => 254
  end

  add_index "systransforms", ["fromsql_funcid"], :name => "ibm121"
  add_index "systransforms", ["tosql_funcid"], :name => "ibm122"
  add_index "systransforms", ["typeid", "groupname"], :name => "ibm120", :unique => true

  create_table "systriggers", :id => false, :force => true do |t|
    t.string    "name",        :limit => 128,     :null => false
    t.string    "schema",      :limit => 128,     :null => false
    t.string    "definer",     :limit => 128,     :null => false
    t.string    "tbname",      :limit => 128,     :null => false
    t.string    "tbcreator",   :limit => 128,     :null => false
    t.string    "trigtime",    :limit => 1,       :null => false
    t.string    "trigevent",   :limit => 1,       :null => false
    t.string    "granularity", :limit => 1,       :null => false
    t.string    "valid",       :limit => 1,       :null => false
    t.text      "text",        :limit => 2097152, :null => false
    t.timestamp "create_time",                    :null => false
    t.string    "func_path",   :limit => 254,     :null => false
    t.string    "remarks",     :limit => 254
    t.string    "qualifier",   :limit => 128,     :null => false
  end

  add_index "systriggers", ["schema", "name"], :name => "ibm53", :unique => true
  add_index "systriggers", ["tbcreator", "tbname"], :name => "ibm54"

  create_table "systypemappings", :id => false, :force => true do |t|
    t.string    "type_mapping",       :limit => 18,  :null => false
    t.string    "typeschema",         :limit => 128
    t.string    "typename",           :limit => 128, :null => false
    t.boolean   "typeid",                            :null => false
    t.boolean   "sourcetypeid",                      :null => false
    t.string    "definer",            :limit => 128, :null => false
    t.integer   "upper_len"
    t.boolean   "upper_scale"
    t.string    "bit_data",           :limit => 1
    t.string    "wrapname",           :limit => 128
    t.string    "servername",         :limit => 128
    t.string    "servertype",         :limit => 30
    t.string    "serverversion",      :limit => 18
    t.string    "remote_typeschema",  :limit => 128
    t.string    "remote_typename",    :limit => 128, :null => false
    t.string    "remote_meta_type",   :limit => 1
    t.integer   "remote_lower_len"
    t.integer   "remote_upper_len"
    t.boolean   "remote_lower_scale"
    t.boolean   "remote_upper_scale"
    t.string    "remote_s_opr_p",     :limit => 2
    t.string    "remote_bit_data",    :limit => 1
    t.string    "user_defined",       :limit => 1,   :null => false
    t.timestamp "create_time",                       :null => false
    t.string    "remarks",            :limit => 254
    t.string    "mappingdirection",   :limit => 1,   :null => false
    t.integer   "lower_len"
    t.boolean   "lower_scale"
    t.string    "s_opr_p",            :limit => 2
  end

  add_index "systypemappings", ["servername"], :name => "ibm113"
  add_index "systypemappings", ["servertype", "serverversion", "wrapname"], :name => "ibm114"
  add_index "systypemappings", ["type_mapping"], :name => "ibm111", :unique => true
  add_index "systypemappings", ["typename", "typeschema"], :name => "ibm112"
  add_index "systypemappings", ["wrapname"], :name => "ibm142"

  create_table "sysuserauth", :id => false, :force => true do |t|
    t.string "grantee",     :limit => 128,     :null => false
    t.string "granteetype", :limit => 1,       :null => false
    t.string "tabschema",   :limit => 128,     :null => false
    t.string "tabname",     :limit => 128,     :null => false
    t.binary "auth_desc",   :limit => 2097152, :null => false
  end

  add_index "sysuserauth", ["tabschema", "tabname", "grantee", "granteetype"], :name => "ibm60", :unique => true

  create_table "sysuseroptions", :id => false, :force => true do |t|
    t.string "servername", :limit => 128, :null => false
    t.string "authid",     :limit => 128, :null => false
    t.string "option",     :limit => 128, :null => false
    t.string "setting",                   :null => false
  end

  add_index "sysuseroptions", ["servername", "authid", "option"], :name => "ibm123", :unique => true

  create_table "sysversions", :id => false, :force => true do |t|
    t.integer   "versionnumber",                    :null => false
    t.timestamp "version_timestamp",                :null => false
    t.string    "authid",            :limit => 128, :null => false
  end

  add_index "sysversions", ["versionnumber", "version_timestamp"], :name => "ibm140", :unique => true

  create_table "sysviewdep", :id => false, :force => true do |t|
    t.string  "bname",      :limit => 128, :null => false
    t.string  "bcreator",   :limit => 128, :null => false
    t.string  "btype",      :limit => 1,   :null => false
    t.string  "dname",      :limit => 128, :null => false
    t.string  "dcreator",   :limit => 128, :null => false
    t.string  "vcauthid",   :limit => 128
    t.boolean "tabauth"
    t.string  "dtype",      :limit => 1,   :null => false
    t.string  "outer_from", :limit => 1,   :null => false
  end

  add_index "sysviewdep", ["bcreator", "bname", "btype", "dcreator", "dname"], :name => "ibm05", :unique => true
  add_index "sysviewdep", ["dcreator", "dname"], :name => "ibm06"

  create_table "sysviews", :id => false, :force => true do |t|
    t.string "name",      :limit => 128,     :null => false
    t.string "creator",   :limit => 128,     :null => false
    t.string "check",     :limit => 1,       :null => false
    t.text   "text",      :limit => 2097152, :null => false
    t.string "func_path", :limit => 254,     :null => false
    t.string "valid",     :limit => 1,       :null => false
    t.string "readonly",  :limit => 1,       :null => false
    t.string "definer",   :limit => 128,     :null => false
    t.string "qualifier", :limit => 128,     :null => false
  end

  add_index "sysviews", ["creator", "name"], :name => "ibm04"

  create_table "syswrapoptions", :id => false, :force => true do |t|
    t.string "wrapname", :limit => 128, :null => false
    t.string "option",   :limit => 128, :null => false
    t.string "setting",                 :null => false
  end

  add_index "syswrapoptions", ["wrapname", "option"], :name => "ibm124", :unique => true

  create_table "syswrappers", :id => false, :force => true do |t|
    t.string  "wrapname",    :limit => 128, :null => false
    t.string  "wraptype",    :limit => 1,   :null => false
    t.integer "wrapversion",                :null => false
    t.string  "library",                    :null => false
    t.string  "remarks",     :limit => 254
  end

  add_index "syswrappers", ["wrapname"], :name => "ibm125", :unique => true

  create_table "sysxmlobjectauth", :id => false, :force => true do |t|
    t.string  "grantor",        :limit => 128, :null => false
    t.string  "grantee",        :limit => 128, :null => false
    t.string  "granteetype",    :limit => 1,   :null => false
    t.integer "objectid",                      :null => false
    t.string  "privilege_type", :limit => 30,  :null => false
    t.string  "is_grantable",   :limit => 1,   :null => false
  end

  add_index "sysxmlobjectauth", ["grantee", "objectid", "granteetype", "grantor", "privilege_type"], :name => "ibm179", :unique => true
  add_index "sysxmlobjectauth", ["objectid"], :name => "ibm180"

  create_table "sysxmlobjectauthperf", :id => false, :force => true do |t|
    t.string  "grantee",     :limit => 128,  :null => false
    t.string  "granteetype", :limit => 1,    :null => false
    t.integer "objectid",                    :null => false
    t.binary  "auth_desc",   :limit => 1024, :null => false
  end

  add_index "sysxmlobjectauthperf", ["objectid", "grantee", "granteetype"], :name => "ibm181", :unique => true

  create_table "sysxmlobjectproperties", :id => false, :force => true do |t|
    t.integer "objectid",                 :null => false
    t.string  "option",   :limit => 128,  :null => false
    t.string  "setting",  :limit => 1024
  end

  add_index "sysxmlobjectproperties", ["objectid", "option"], :name => "ibm169", :unique => true

  create_table "sysxmlobjectreldep", :id => false, :force => true do |t|
    t.integer "objectid",                :null => false
    t.string  "dtype",    :limit => 2,   :null => false
    t.string  "btype",    :limit => 1,   :null => false
    t.string  "bschema",  :limit => 128, :null => false
    t.string  "bname",    :limit => 128, :null => false
    t.boolean "tabauth",                 :null => false
  end

  add_index "sysxmlobjectreldep", ["objectid", "dtype", "btype", "bschema", "bname"], :name => "ibm182", :unique => true

  create_table "sysxmlobjects", :id => false, :force => true do |t|
    t.integer   "objectid",                   :null => false
    t.string    "objecttype",  :limit => 2,   :null => false
    t.string    "definer",     :limit => 128, :null => false
    t.timestamp "create_time",                :null => false
    t.timestamp "alter_time"
    t.integer   "links_count",                :null => false
  end

  add_index "sysxmlobjects", ["objectid"], :name => "ibm168", :unique => true

  create_table "sysxmlobjectxmldep", :id => false, :force => true do |t|
    t.integer "objectid",                 :null => false
    t.string  "dtype",       :limit => 2, :null => false
    t.string  "btype",       :limit => 2, :null => false
    t.integer "bobjectid",                :null => false
    t.boolean "objectauths",              :null => false
  end

  add_index "sysxmlobjectxmldep", ["objectid", "dtype", "btype", "bobjectid"], :name => "ibm183", :unique => true

  create_table "sysxmlphysicalcollections", :id => false, :force => true do |t|
    t.integer "objectid",                      :null => false
    t.string  "primaryuse",     :limit => 1,   :null => false
    t.string  "storage",        :limit => 1,   :null => false
    t.integer "tbspaceid"
    t.string  "collectiontype", :limit => 1,   :null => false
    t.integer "bufferpoolid"
    t.string  "dbpgname",       :limit => 128
  end

  add_index "sysxmlphysicalcollections", ["bufferpoolid"], :name => "ibm177"
  add_index "sysxmlphysicalcollections", ["dbpgname"], :name => "ibm176"
  add_index "sysxmlphysicalcollections", ["objectid"], :name => "ibm175", :unique => true
  add_index "sysxmlphysicalcollections", ["tbspaceid"], :name => "ibm178"

  create_table "sysxmlqueries", :id => false, :force => true do |t|
    t.integer "objectid",                        :null => false
    t.text    "xmlquerytext", :limit => 1048576, :null => false
  end

  add_index "sysxmlqueries", ["objectid"], :name => "ibm185", :unique => true

  create_table "sysxmlrelationships", :id => false, :force => true do |t|
    t.integer   "relationshipid",                           :null => false
    t.integer   "parentid"
    t.integer   "childid",                                  :null => false
    t.string    "linkedname",                :limit => 128, :null => false
    t.string    "relationshiptype",          :limit => 2,   :null => false
    t.integer   "referenced_relationshipid"
    t.string    "definer",                   :limit => 128, :null => false
    t.timestamp "create_time",                              :null => false
    t.timestamp "alter_time"
  end

  add_index "sysxmlrelationships", ["childid"], :name => "ibm172"
  add_index "sysxmlrelationships", ["linkedname"], :name => "ibm173"
  add_index "sysxmlrelationships", ["parentid"], :name => "ibm171"
  add_index "sysxmlrelationships", ["relationshipid"], :name => "ibm170", :unique => true

  create_table "sysxmlrsproperties", :id => false, :force => true do |t|
    t.integer "relationshipid",                 :null => false
    t.string  "option",         :limit => 128,  :null => false
    t.string  "setting",        :limit => 1024
  end

  add_index "sysxmlrsproperties", ["relationshipid", "option"], :name => "ibm174", :unique => true

  create_table "sysxmlstats", :id => false, :force => true do |t|
    t.integer "objectid"
    t.string  "objecttype",    :limit => 2,   :null => false
    t.string  "statistictype", :limit => 128, :null => false
    t.string  "value"
  end

  add_index "sysxmlstats", ["objectid", "objecttype", "statistictype"], :name => "ibm184"

  create_table "t20090212_111738", :id => false, :force => true do |t|
    t.string  "pikno",           :limit => 11
    t.integer "cust_uid"
    t.string  "dealer",          :limit => 5
    t.integer "insert_date"
    t.string  "order_no",        :limit => 8
    t.string  "order_line",      :limit => 4
    t.string  "suffix",          :limit => 1
    t.integer "mat_uid"
    t.string  "partno",          :limit => 40
    t.integer "order_qnt"
    t.integer "job_qnt"
    t.string  "address",         :limit => 40
    t.string  "cust_address_id", :limit => 1
    t.string  "cust_address"
  end

  create_table "t20090212_111738_exception", :id => false, :force => true do |t|
    t.string  "pikno",           :limit => 11
    t.integer "cust_uid"
    t.string  "dealer",          :limit => 5
    t.integer "insert_date"
    t.string  "order_no",        :limit => 8
    t.string  "order_line",      :limit => 4
    t.string  "suffix",          :limit => 1
    t.integer "mat_uid"
    t.string  "partno",          :limit => 40
    t.integer "order_qnt"
    t.integer "job_qnt"
    t.string  "address",         :limit => 40
    t.boolean "cust_address_id"
    t.string  "cust_address"
  end

  create_table "t20120502_091349", :id => false, :force => true do |t|
    t.integer   "mat_uid"
    t.string    "mat_serial",      :limit => 40
    t.integer   "last_as400",                    :null => false
    t.integer   "as400_start",                   :null => false
    t.integer   "excel_count_qnt",               :null => false
    t.integer   "excel_start_qnt",               :null => false
    t.integer   "rack_qnt",                      :null => false
    t.integer   "case_qnt",                      :null => false
    t.integer   "abn_qnt",                       :null => false
    t.integer   "waybill_qnt",                   :null => false
    t.integer   "ship_qnt",                      :null => false
    t.integer   "exit_qnt",                      :null => false
    t.integer   "export_qnt",                    :null => false
    t.integer   "pdi_qnt",                       :null => false
    t.integer   "bill_qnt",                      :null => false
    t.timestamp "last_exit_date",                :null => false
  end

  create_table "t20120502_091349_exception", :id => false, :force => true do |t|
    t.integer   "mat_uid",                       :null => false
    t.string    "mat_serial",      :limit => 40, :null => false
    t.integer   "last_as400"
    t.integer   "as400_start"
    t.integer   "excel_count_qnt"
    t.integer   "excel_start_qnt"
    t.integer   "rack_qnt"
    t.integer   "case_qnt"
    t.integer   "abn_qnt"
    t.integer   "waybill_qnt"
    t.integer   "ship_qnt"
    t.integer   "exit_qnt"
    t.integer   "export_qnt"
    t.integer   "pdi_qnt"
    t.integer   "bill_qnt"
    t.timestamp "last_exit_date"
  end

  create_table "temppickrcv", :id => false, :force => true do |t|
    t.integer "insert_date"
    t.integer "update_date"
    t.string  "insert_user",        :limit => 10
    t.string  "pick_direct",        :limit => 1
    t.string  "pick_indirect",      :limit => 2
    t.string  "pikpin",             :limit => 11
    t.string  "cust_default_id",    :limit => 5
    t.string  "payment_type",       :limit => 3
    t.string  "order_type",         :limit => 1
    t.string  "ship_mode",          :limit => 1
    t.integer "pick_date"
    t.string  "orderno",            :limit => 8
    t.string  "ord_line",           :limit => 4
    t.string  "suffix",             :limit => 1
    t.string  "partno",             :limit => 20
    t.integer "order_qnt"
    t.integer "sent_qnt"
    t.string  "change_reason_code", :limit => 2
    t.integer "piqosd"
    t.float   "list_price"
    t.float   "unit_proce"
    t.string  "pic_status",         :limit => 1
    t.string  "cargo_code",         :limit => 1
    t.string  "waybill_work_no",    :limit => 10
    t.string  "inv_work_no",        :limit => 10
    t.string  "waybill_line_no",    :limit => 5
    t.string  "pincas",             :limit => 10
    t.integer "piqppk"
    t.string  "co_packing",         :limit => 1
    t.string  "pinrcv",             :limit => 12
  end

  create_table "unpick_transfers", :id => false, :force => true do |t|
    t.integer "mat_uid",                  :null => false
    t.string  "mat_serial", :limit => 40, :null => false
    t.integer "quantity",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "warehouse", :primary_key => "wh_address", :force => true do |t|
    t.integer "wh_zone_uid"
    t.string  "wh_subzone",  :limit => 40
  end

  create_table "warehouse_freq", :id => false, :force => true do |t|
    t.string  "wh_address",              :limit => 16, :null => false
    t.integer "wh_zone_uid",                           :null => false
    t.string  "wh_subzone",              :limit => 40, :null => false
    t.integer "warehouse_freq_type_uid",               :null => false
  end

  create_table "warehouse_freq_type", :primary_key => "warehouse_freq_type_uid", :force => true do |t|
    t.string "warehouse_freq_type_desc", :limit => 40, :null => false
    t.string "warehouse_freq_type_def",  :limit => 80
  end

  create_table "warehouse_mat", :primary_key => "wh_zone_uid", :force => true do |t|
    t.integer "mat_uid",  :null => false
    t.integer "quantity"
  end

  create_table "warehouse_type", :primary_key => "warehouse_type_uid", :force => true do |t|
    t.string "warehouse_type_desc",   :limit => 80,  :null => false
    t.string "warehouse_type_short",  :limit => 2
    t.string "warehouse_type_layout", :limit => 100
    t.string "warehouse_type_def",    :limit => 256
  end

  create_table "warehouse_zone", :primary_key => "wh_zone_uid", :force => true do |t|
    t.integer "wh_type_uid",                         :default => 1, :null => false
    t.string  "wh_zone_alias",         :limit => 40,                :null => false
    t.boolean "wh_zone_ns_direction"
    t.boolean "wh_zone_we_direction"
    t.integer "wh_zone_width"
    t.integer "wh_zone_height"
    t.string  "wh_zone_color",         :limit => 10
    t.boolean "wh_zone_max_level"
    t.integer "wh_subzone_row"
    t.integer "wh_subzone_col"
    t.string  "wh_zone_start_address", :limit => 10
  end

  add_index "warehouse_zone", ["wh_zone_alias"], :name => "pk_wh_alias", :unique => true

  create_table "warehouse_zone_rules", :id => false, :force => true do |t|
    t.integer "wh_zone_uid",               :null => false
    t.integer "rule_uid",                  :null => false
    t.string  "rule_param",  :limit => 40
  end

  create_table "waybill", :id => false, :force => true do |t|
    t.string    "waybill",      :limit => 40,                :null => false
    t.integer   "mat_uid",                                   :null => false
    t.integer   "supp_uid",                                  :null => false
    t.integer   "w_quantity",                                :null => false
    t.integer   "quantity",                   :default => 0, :null => false
    t.timestamp "waybill_date",                              :null => false
    t.boolean   "w_status"
  end

  create_table "waybill_case", :id => false, :force => true do |t|
    t.string  "waybill",      :limit => 40,                :null => false
    t.integer "ca_no",                                     :null => false
    t.string  "orderid",      :limit => 40,                :null => false
    t.integer "mat_uid",                                   :null => false
    t.integer "supp_id",                                   :null => false
    t.integer "quantity",                                  :null => false
    t.boolean "w_status",                                  :null => false
    t.integer "ca_style_uid",               :default => 0
    t.string  "waybill_date", :limit => 40
  end

  create_table "waybill_emp", :id => false, :force => true do |t|
    t.integer   "emp_uid",                           :null => false
    t.string    "waybill",             :limit => 40, :null => false
    t.timestamp "waybill_date",                      :null => false
    t.timestamp "waybill_start_time"
    t.timestamp "waybill_finish_time"
  end

  create_table "weekday", :primary_key => "wd_id", :force => true do |t|
    t.string "wd", :limit => 15, :null => false
  end

  create_table "workarea", :primary_key => "workarea_uid", :force => true do |t|
    t.string "workarea_desc", :limit => 40
    t.string "workarea_def",  :limit => 256
  end

  add_index "workarea", ["workarea_uid", "workarea_desc"], :name => "idx909241426280000", :unique => true

  create_table "workarea_equipment", :primary_key => "workarea_uid", :force => true do |t|
    t.integer "equi_uid", :null => false
  end

  create_table "years", :primary_key => "years_uid", :force => true do |t|
    t.string "years_desc", :limit => 40, :null => false
    t.string "years_def",  :limit => 40
  end

  create_table "zone_type", :primary_key => "zone_type_uid", :force => true do |t|
    t.string "zone_type_desc", :limit => 80,  :null => false
    t.string "zone_type_def",  :limit => 256
  end

end
