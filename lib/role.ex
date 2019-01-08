alias Converge.Util

defmodule RoleAptConfirmChanges do
	require Util
	import Util, only: [conf_file: 1]
	Util.declare_external_resources("files")

	def role(_tags \\ []) do
		%{
			desired_packages:  ["apt-listchanges"],
			# TODO: implement an extra_apt_settings so that this gets removed
			# if the role is removed.
			post_install_unit: conf_file("/etc/apt/listchanges.conf"),
		}
	end
end
