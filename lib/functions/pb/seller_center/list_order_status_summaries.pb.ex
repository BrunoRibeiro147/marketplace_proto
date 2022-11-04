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

  field :supplier_name, 1, type: :string, json_name: "supplierName"
  field :supplier_email, 2, type: :string, json_name: "supplierEmail"
  field :amount_created, 3, type: :int32, json_name: "amountCreated"
  field :amount_confirmed, 4, type: :int32, json_name: "amountConfirmed"
  field :amount_paid, 5, type: :int32, json_name: "amountPaid"
end

defmodule OrdersGRPC.ListOrderStatusSummaries.Service do
  @moduledoc false
  use GRPC.Service,
    name: "OrdersGRPC.ListOrderStatusSummaries",
    protoc_gen_elixir_version: "0.11.0"

  rpc :execute, OrdersGRPC.ListSummariesRequest, Grpc.Orders.ListSummariesResponse
end

defmodule OrdersGRPC.ListOrderStatusSummaries.Stub do
  @moduledoc false
  use GRPC.Stub, service: OrdersGRPC.ListOrderStatusSummaries.Service
end
