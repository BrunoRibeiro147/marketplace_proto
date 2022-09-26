defmodule OrdersGrpc.ListOrdersRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :aggregate_suppliers, 1,
    repeated: true,
    type: OrdersGrpc.AggregateSuppliers,
    json_name: "aggregateSuppliers"

  field :status, 2, type: :string
end

defmodule OrdersGrpc.AggregateSuppliers do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :suppliers, 1, repeated: true, type: :string
  field :stale_days, 2, type: :int32, json_name: "staleDays"
end

defmodule OrdersGrpc.ListOrdersResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :orders, 1, repeated: true, type: OrdersGrpc.Order
end

defmodule OrdersGrpc.Order do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :code, 1, type: :string
  field :supplier_id, 2, type: :int32, json_name: "supplierId"
end

defmodule OrdersGrpc.OrderService.Service do
  @moduledoc false
  use GRPC.Service, name: "orders_grpc.OrderService", protoc_gen_elixir_version: "0.11.0"

  rpc :ListStaleOrders, OrdersGrpc.ListOrdersRequest, OrdersGrpc.ListOrdersResponse
end

defmodule OrdersGrpc.OrderService.Stub do
  @moduledoc false
  use GRPC.Stub, service: OrdersGrpc.OrderService.Service
end