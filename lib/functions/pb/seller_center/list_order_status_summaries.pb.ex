defmodule OrdersGRPC.ListSummariesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule OrdersGRPC.ListSummariesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :summaries, 1, repeated: true, type: OrdersGRPC.Summary
end

defmodule OrdersGRPC.Summary do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :amount_created, 1, type: :int32, json_name: "amountCreated"
  field :amount_confirmed, 2, type: :int32, json_name: "amountConfirmed"
  field :amount_paid, 3, type: :int32, json_name: "amountPaid"
  field :supplier_attrs, 4, type: OrdersGRPC.SupplierAttrs, json_name: "supplierAttrs"
end

defmodule OrdersGRPC.ListOrderStatusSummaries.Service do
  @moduledoc false
  use GRPC.Service,
    name: "OrdersGRPC.ListOrderStatusSummaries",
    protoc_gen_elixir_version: "0.11.0"

  rpc :execute, OrdersGRPC.ListSummariesRequest, OrdersGRPC.ListSummariesResponse
end

defmodule OrdersGRPC.ListOrderStatusSummaries.Stub do
  @moduledoc false
  use GRPC.Stub, service: OrdersGRPC.ListOrderStatusSummaries.Service
end
