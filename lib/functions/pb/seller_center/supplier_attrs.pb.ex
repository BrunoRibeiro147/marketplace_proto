defmodule OrdersGRPC.SupplierAttrs do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :supplier_id, 1, type: :int32, json_name: "supplierId"
  field :supplier_name, 2, type: :string, json_name: "supplierName"
  field :supplier_email, 3, type: :string, json_name: "supplierEmail"
end
