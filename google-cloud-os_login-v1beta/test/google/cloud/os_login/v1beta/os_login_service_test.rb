# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/oslogin/v1beta/oslogin_pb"
require "google/cloud/oslogin/v1beta/oslogin_services_pb"
require "google/cloud/os_login/v1beta/os_login_service"

class Google::Cloud::OsLogin::V1beta::OsLoginService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_delete_posix_account
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_posix_account_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_posix_account, name
      assert_kind_of Google::Cloud::OsLogin::V1beta::DeletePosixAccountRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_posix_account_client_stub do
      # Create client
      client = Google::Cloud::OsLogin::V1beta::OsLoginService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_posix_account({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_posix_account name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_posix_account Google::Cloud::OsLogin::V1beta::DeletePosixAccountRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_posix_account({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_posix_account Google::Cloud::OsLogin::V1beta::DeletePosixAccountRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_posix_account_client_stub.call_rpc_count
    end
  end

  def test_delete_ssh_public_key
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_ssh_public_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_ssh_public_key, name
      assert_kind_of Google::Cloud::OsLogin::V1beta::DeleteSshPublicKeyRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_ssh_public_key_client_stub do
      # Create client
      client = Google::Cloud::OsLogin::V1beta::OsLoginService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_ssh_public_key({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_ssh_public_key name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_ssh_public_key Google::Cloud::OsLogin::V1beta::DeleteSshPublicKeyRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_ssh_public_key({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_ssh_public_key Google::Cloud::OsLogin::V1beta::DeleteSshPublicKeyRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_ssh_public_key_client_stub.call_rpc_count
    end
  end

  def test_get_login_profile
    # Create GRPC objects.
    grpc_response = Google::Cloud::OsLogin::V1beta::LoginProfile.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    project_id = "hello world"
    system_id = "hello world"

    get_login_profile_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_login_profile, name
      assert_kind_of Google::Cloud::OsLogin::V1beta::GetLoginProfileRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.system_id
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_login_profile_client_stub do
      # Create client
      client = Google::Cloud::OsLogin::V1beta::OsLoginService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_login_profile({ name: name, project_id: project_id, system_id: system_id }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_login_profile name: name, project_id: project_id, system_id: system_id do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_login_profile Google::Cloud::OsLogin::V1beta::GetLoginProfileRequest.new(name: name, project_id: project_id, system_id: system_id) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_login_profile({ name: name, project_id: project_id, system_id: system_id }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_login_profile Google::Cloud::OsLogin::V1beta::GetLoginProfileRequest.new(name: name, project_id: project_id, system_id: system_id), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_login_profile_client_stub.call_rpc_count
    end
  end

  def test_get_ssh_public_key
    # Create GRPC objects.
    grpc_response = Google::Cloud::OsLogin::Common::SshPublicKey.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_ssh_public_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_ssh_public_key, name
      assert_kind_of Google::Cloud::OsLogin::V1beta::GetSshPublicKeyRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_ssh_public_key_client_stub do
      # Create client
      client = Google::Cloud::OsLogin::V1beta::OsLoginService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_ssh_public_key({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_ssh_public_key name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_ssh_public_key Google::Cloud::OsLogin::V1beta::GetSshPublicKeyRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_ssh_public_key({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_ssh_public_key Google::Cloud::OsLogin::V1beta::GetSshPublicKeyRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_ssh_public_key_client_stub.call_rpc_count
    end
  end

  def test_import_ssh_public_key
    # Create GRPC objects.
    grpc_response = Google::Cloud::OsLogin::V1beta::ImportSshPublicKeyResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    ssh_public_key = {}
    project_id = "hello world"

    import_ssh_public_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :import_ssh_public_key, name
      assert_kind_of Google::Cloud::OsLogin::V1beta::ImportSshPublicKeyRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::OsLogin::Common::SshPublicKey), request.ssh_public_key
      assert_equal "hello world", request.project_id
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, import_ssh_public_key_client_stub do
      # Create client
      client = Google::Cloud::OsLogin::V1beta::OsLoginService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.import_ssh_public_key({ parent: parent, ssh_public_key: ssh_public_key, project_id: project_id }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.import_ssh_public_key parent: parent, ssh_public_key: ssh_public_key, project_id: project_id do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.import_ssh_public_key Google::Cloud::OsLogin::V1beta::ImportSshPublicKeyRequest.new(parent: parent, ssh_public_key: ssh_public_key, project_id: project_id) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.import_ssh_public_key({ parent: parent, ssh_public_key: ssh_public_key, project_id: project_id }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.import_ssh_public_key Google::Cloud::OsLogin::V1beta::ImportSshPublicKeyRequest.new(parent: parent, ssh_public_key: ssh_public_key, project_id: project_id), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, import_ssh_public_key_client_stub.call_rpc_count
    end
  end

  def test_update_ssh_public_key
    # Create GRPC objects.
    grpc_response = Google::Cloud::OsLogin::Common::SshPublicKey.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    ssh_public_key = {}
    update_mask = {}

    update_ssh_public_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_ssh_public_key, name
      assert_kind_of Google::Cloud::OsLogin::V1beta::UpdateSshPublicKeyRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::OsLogin::Common::SshPublicKey), request.ssh_public_key
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_ssh_public_key_client_stub do
      # Create client
      client = Google::Cloud::OsLogin::V1beta::OsLoginService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_ssh_public_key({ name: name, ssh_public_key: ssh_public_key, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_ssh_public_key name: name, ssh_public_key: ssh_public_key, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_ssh_public_key Google::Cloud::OsLogin::V1beta::UpdateSshPublicKeyRequest.new(name: name, ssh_public_key: ssh_public_key, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_ssh_public_key({ name: name, ssh_public_key: ssh_public_key, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_ssh_public_key Google::Cloud::OsLogin::V1beta::UpdateSshPublicKeyRequest.new(name: name, ssh_public_key: ssh_public_key, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_ssh_public_key_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::OsLogin::V1beta::OsLoginService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::OsLogin::V1beta::OsLoginService::Client::Configuration, config
  end
end
