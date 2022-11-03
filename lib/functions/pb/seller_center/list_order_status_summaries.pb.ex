defmodule Grpc.Orders.ListSummariesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Grpc.Orders.ListSummariesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :summaries, 1, repeated: true, type: Grpc.Orders.Summary
end

defmodule Grpc.Orders.Summary do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :supplier_id, 1, type: :int32, json_name: "supplierId"
  field :amount_created, 2, type: :int32, json_name: "amountCreated"
  field :amount_confirmed, 3, type: :int32, json_name: "amountConfirmed"
  field :amount_paid, 4, type: :int32, json_name: "amountPaid"
end

defmodule Grpc.Orders.ListOrderStatusSummaries.Service do
  @moduledoc false
  use GRPC.Service,
    name: "grpc.orders.ListOrderStatusSummaries",
    protoc_gen_elixir_version: "0.11.0"

  rpc :execute, Grpc.Orders.ListSummariesRequest, Grpc.Orders.ListSummariesResponse
end

defmodule Grpc.Orders.ListOrderStatusSummaries.Stub do
  @moduledoc false
  use GRPC.Stub, service: Grpc.Orders.ListOrderStatusSummaries.Service
end