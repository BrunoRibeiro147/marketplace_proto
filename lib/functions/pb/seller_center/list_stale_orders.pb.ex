defmodule Grpc.Orders.ListOrdersRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :status, 1, type: :string
end

defmodule Grpc.Orders.ListOrdersResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :orders, 1, repeated: true, type: Grpc.Orders.Order
end

defmodule Grpc.Orders.Order do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :code, 1, type: :string
  field :supplier_id, 2, type: :int32, json_name: "supplierId"
end

defmodule Grpc.Orders.ListStaleOrders.Service do
  @moduledoc false
  use GRPC.Service, name: "grpc.orders.ListStaleOrders", protoc_gen_elixir_version: "0.11.0"

  rpc :execute, Grpc.Orders.ListOrdersRequest, Grpc.Orders.ListOrdersResponse
end

defmodule Grpc.Orders.ListStaleOrders.Stub do
  @moduledoc false
  use GRPC.Stub, service: Grpc.Orders.ListStaleOrders.Service
end