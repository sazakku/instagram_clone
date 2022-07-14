class ProfileLinkablesService < ApplicationService
  attr_accessor :profile_linkable_external

  def initialize(profile_id, profile_linkable_external, kind, action)
    @profile_id = profile_id
    @profile_linkable_external = profile_linkable_external
    @kind = kind
    @action = action
  end

  def call
    case @action
    when :create
      create
    when :destroy
      destroy
    end
  end

  private

  # create button
  def create
    ProfileLinkable.new(
      profile_id: @profile_id, profile_linkable_external: @profile_linkable_external, kind: @kind
    )
  end

  # destroy button
  def destroy
    ProfileLinkable.find_by(kind: @kind, profile_id: @profile_id,
                            profile_linkable_external_id: @profile_linkable_external.id).destroy
  end
end
