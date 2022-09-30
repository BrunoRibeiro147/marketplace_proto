defmodule OrdersGRPC.ListOrdersRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :aggregate_suppliers, 1,
    repeated: true,
    type: OrdersGRPC.AggregateSuppliers,
    json_name: "aggregateSuppliers"

  field :status, 2, type: :string
end

defmodule OrdersGRPC.AggregateSuppliers do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :suppliers, 1, repeated: true, type: :string
  field :stale_days, 2, type: :int32, json_name: "staleDays"
end

defmodule OrdersGRPC.ListOrdersResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :orders, 1, repeated: true, type: OrdersGRPC.Order
end

defmodule OrdersGRPC.Order do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :code, 1, type: :string
  field :supplier_id, 2, type: :int32, json_name: "supplierId"
end

defmodule OrdersGRPC.ListStaleOrders.Service do
  @moduledoc false
  use GRPC.Service, name: "OrdersGRPC.ListStaleOrders", protoc_gen_elixir_version: "0.11.0"

  rpc :execute, OrdersGRPC.ListOrdersRequest, OrdersGRPC.ListOrdersResponse
end

defmodule OrdersGRPC.ListStaleOrders.Stub do
  @moduledoc false
  use GRPC.Stub, service: OrdersGRPC.ListStaleOrders.Service
end