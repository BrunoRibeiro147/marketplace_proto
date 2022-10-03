defmodule SuppliersGRPC.GetSupplierRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:id, 1, type: :int32)
end

defmodule SuppliersGRPC.GetSupplierResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:supplier, 1, type: SuppliersGRPC.Supplier)
end

defmodule SuppliersGRPC.Supplier do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:contact_name, 2, type: :string, json_name: "contactName")
  field(:active, 3, type: :bool)
  field(:trading_fee, 4, type: :int32, json_name: "tradingFee")
  field(:cnpj, 5, type: :string)
  field(:email, 6, type: :string)
  field(:company_name, 7, type: :string, json_name: "companyName")
  field(:nf_stale_days, 8, type: :int32, json_name: "nfStaleDays")
  field(:confirmation_stale_days, 9, type: :int32, json_name: "confirmationStaleDays")
  field(:id, 10, type: :int32)
end

defmodule SuppliersGRPC.GetSupplier.Service do
  @moduledoc false
  use GRPC.Service, name: "SuppliersGRPC.GetSupplier", protoc_gen_elixir_version: "0.11.0"

  rpc(:execute, SuppliersGRPC.GetSupplierRequest, SuppliersGRPC.GetSupplierResponse)
end

defmodule SuppliersGRPC.GetSupplier.Stub do
  @moduledoc false
  use GRPC.Stub, service: SuppliersGRPC.GetSupplier.Service
end
