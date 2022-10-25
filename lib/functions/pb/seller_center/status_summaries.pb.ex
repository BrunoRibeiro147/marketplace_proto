defmodule OrdersGRPC.ListSummariesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:supplier_ids, 1, repeated: true, type: :int32, json_name: "supplierIds")
end

defmodule OrdersGRPC.ListSummariesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:summaries, 1, repeated: true, type: Grpc.Orders.Summary)
end

defmodule OrdersGRPC.Summary do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:supplier_id, 1, type: :int32, json_name: "supplierId")
  field(:amount_created, 2, type: :int32, json_name: "amountCreated")
  field(:amount_confirmed, 3, type: :int32, json_name: "amountConfirmed")
  field(:amount_paid, 4, type: :int32, json_name: "amountPaid")
end

defmodule OrdersGRPC.ListOrderStatusSummaries.Service do
  use GRPC.Service,
    name: "OrdersGRPC.ListOrderStatusSummaries",
    protoc_gen_elixir_version: "0.11.0"

  rpc(:execute, OrdersGRPC.ListSummariesRequest, ListSummariesResponse)
end

defmodule OrdersGRPC.ListOrderStatusSummaries.Stub do
  @moduledoc false
  use GRPC.Stub, service: OrdersGRPC.ListOrderStatusSummaries.Service
end
