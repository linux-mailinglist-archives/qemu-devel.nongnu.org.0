Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1CE58C2A1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 06:52:54 +0200 (CEST)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKul3-0002S8-Ft
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 00:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKubn-0006IT-SI
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 00:43:19 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41997
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKubj-0006gq-TO
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 00:43:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1Nqd6zBXz4xMW; Mon,  8 Aug 2022 14:43:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659933789;
 bh=SWOqglpE6cBCOOZJKEKrTJJze7lF9lEDt5IEfLpxoXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oXk2epMLFS0ZT4nq1yRQ0oU+Raebw9bXDgZ6jVENcrEmpbTDkWnWI8+o2Y+MCIF/P
 cX4vfuGCNIvOc7D5oRjhA2HE84D7QJwcS6BQWe+QfXoAEBPs5tS2gHFsEDmEEl2fO7
 GbPVtXd/Qw36ToVa5KQXH5q+Brj9ddhevNimaqiY=
Date: Mon, 8 Aug 2022 14:21:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v2 15/20] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Message-ID: <YvCPT8eZSKMM4zk5@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-16-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bFswNCOxS1+UaCCd"
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-16-danielhb413@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bFswNCOxS1+UaCCd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 06:39:43AM -0300, Daniel Henrique Barboza wrote:
> Reading the FDT requires that the user saves the fdt_blob and then use
> 'dtc' to read the contents. Saving the file and using 'dtc' is a strong
> use case when we need to compare two FDTs, but it's a lot of steps if
> you want to do quick check on a certain node or property.
>=20
> 'info fdt' retrieves FDT nodes (and properties, later on) and print it
> to the user. This can be used to check the FDT on running machines
> without having to save the blob and use 'dtc'.
>=20
> The implementation is based on the premise that the machine thas a FDT
> created using libfdt and pointed by 'machine->fdt'. As long as this
> pre-requisite is met the machine should be able to support it.
>=20
> For now we're going to add the required QMP/HMP boilerplate and the
> capability of printing the name of the properties of a given node. Next
> patches will extend 'info fdt' to be able to print nodes recursively,
> and then individual properties.
>=20
> 'info fdt' is not something that we expect to be used aside from debuggin=
g,
> so we're implementing it in QMP as 'x-query-fdt'.
>=20
> This is an example of 'info fdt' fetching the '/chosen' node of the
> pSeries machine:
>=20
> (qemu) info fdt /chosen
> chosen {
>     ibm,architecture-vec-5;
>     rng-seed;
>     ibm,arch-vec-5-platform-support;
>     linux,pci-probe-only;
>     stdout-path;
>     linux,stdout-path;
>     qemu,graphic-depth;
>     qemu,graphic-height;
>     qemu,graphic-width;
> }
>=20
> And the same node for the aarch64 'virt' machine:
>=20
> (qemu) info fdt /chosen
> chosen {
>     stdout-path;
>     rng-seed;
>     kaslr-seed;
> }

So... it's listing the names of the properties, but not the contents?
That seems kind of odd.

>=20
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands-info.hx         | 13 ++++++++++
>  include/monitor/hmp.h        |  1 +
>  include/sysemu/device_tree.h |  4 +++
>  monitor/hmp-cmds.c           | 13 ++++++++++
>  monitor/qmp-cmds.c           | 12 +++++++++
>  qapi/machine.json            | 19 +++++++++++++++
>  softmmu/device_tree.c        | 47 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 109 insertions(+)
>=20
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 188d9ece3b..743b48865d 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -921,3 +921,16 @@ SRST
>    ``stats``
>      Show runtime-collected statistics
>  ERST
> +
> +    {
> +        .name       =3D "fdt",
> +        .args_type  =3D "nodepath:s",
> +        .params     =3D "nodepath",
> +        .help       =3D "show firmware device tree node given its path",
> +        .cmd        =3D hmp_info_fdt,
> +    },
> +
> +SRST
> +  ``info fdt``
> +    Show a firmware device tree node given its path. Requires libfdt.
> +ERST
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index d7f324da59..c0883dd1e3 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -135,6 +135,7 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDi=
ct *qdict);
>  void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
> +void hmp_info_fdt(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Er=
ror **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index bf7684e4ed..057d13e397 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -14,6 +14,8 @@
>  #ifndef DEVICE_TREE_H
>  #define DEVICE_TREE_H
> =20
> +#include "qapi/qapi-types-common.h"
> +
>  void *create_device_tree(int *sizep);
>  void *load_device_tree(const char *filename_path, int *sizep);
>  #ifdef CONFIG_LINUX
> @@ -137,6 +139,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
> =20
>  void qemu_fdt_dumpdtb(void *fdt, int size);
>  void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> +                                          Error **errp);
> =20
>  /**
>   * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index d23ec85f9d..accde90380 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>          error_report_err(local_err);
>      }
>  }
> +
> +void hmp_info_fdt(Monitor *mon, const QDict *qdict)
> +{
> +    const char *nodepath =3D qdict_get_str(qdict, "nodepath");
> +    Error *err =3D NULL;
> +    g_autoptr(HumanReadableText) info =3D qmp_x_query_fdt(nodepath, &err=
);
> +
> +    if (hmp_handle_error(mon, err)) {
> +        return;
> +    }
> +
> +    monitor_printf(mon, "%s", info->human_readable_text);
> +}
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 8415aca08c..db2c6aa7da 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -603,9 +603,21 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>  {
>      return qemu_fdt_qmp_dumpdtb(filename, errp);
>  }
> +
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +{
> +    return qemu_fdt_qmp_query_fdt(nodepath, errp);
> +}
>  #else
>  void qmp_dumpdtb(const char *filename, Error **errp)
>  {
>      error_setg(errp, "dumpdtb requires libfdt");
>  }
> +
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +{
> +    error_setg(errp, "this command requires libfdt");
> +
> +    return NULL;
> +}
>  #endif
> diff --git a/qapi/machine.json b/qapi/machine.json
> index aeb013f3dd..96cff541ca 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1681,3 +1681,22 @@
>  ##
>  { 'command': 'dumpdtb',
>    'data': { 'filename': 'str' } }
> +
> +##
> +# @x-query-fdt:
> +#
> +# Query for FDT element (node or property). Requires 'libfdt'.
> +#
> +# @nodepath: the path of the FDT node to be retrieved
> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: FDT node
> +#
> +# Since: 7.2
> +##
> +{ 'command': 'x-query-fdt',
> +  'data': { 'nodepath': 'str' },
> +  'returns': 'HumanReadableText',
> +  'features': [ 'unstable' ]  }


A QMP command that returns human readable text, rather than something
JSON structured seems... odd.

Admittedly, *how* you'd JSON structure the results gets a bit tricky.
Listing nodes or property names would be easy enough, but getting the
property contents is hairy, since JSON strings are supposed to be
Unicode, but DT properties can be arbitrary bytestrings.

> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index cd487ddd4d..3fb07b537f 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -18,6 +18,7 @@
>  #endif
> =20
>  #include "qapi/error.h"
> +#include "qapi/type-helpers.h"
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "qemu/bswap.h"
> @@ -661,3 +662,49 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Erro=
r **errp)
> =20
>      error_setg(errp, "Error when saving machine FDT to file %s", filenam=
e);
>  }
> +
> +static void fdt_format_node(GString *buf, int node, int depth)
> +{
> +    const struct fdt_property *prop =3D NULL;
> +    const char *propname =3D NULL;
> +    void *fdt =3D current_machine->fdt;
> +    int padding =3D depth * 4;
> +    int property =3D 0;
> +    int prop_size;
> +
> +    g_string_append_printf(buf, "%*s%s {\n", padding, "",
> +                           fdt_get_name(fdt, node, NULL));
> +
> +    padding +=3D 4;
> +
> +    fdt_for_each_property_offset(property, fdt, node) {
> +        prop =3D fdt_get_property_by_offset(fdt, property, &prop_size);
> +        propname =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> +
> +        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
> +    }
> +
> +    padding -=3D 4;
> +    g_string_append_printf(buf, "%*s}\n", padding, "");

So, this lists it in dts format... kind of.  Because you don't include
the property values, it makes it look like all properties are binary
(either absent or present-but-empty).  I think that's misleading.  If
you're only going to list properties, I think you'd be better off
using different formatting (and maybe a more specific command name as
well).

> +}
> +
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **=
errp)
> +{
> +    g_autoptr(GString) buf =3D g_string_new("");
> +    int node;
> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "Unable to find the machine FDT");
> +        return NULL;
> +    }
> +
> +    node =3D fdt_path_offset(current_machine->fdt, nodepath);
> +    if (node < 0) {
> +        error_setg(errp, "node '%s' not found in FDT", nodepath);
> +        return NULL;
> +    }
> +
> +    fdt_format_node(buf, node, 0);
> +
> +    return human_readable_text_from_str(buf);
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bFswNCOxS1+UaCCd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwj0kACgkQgypY4gEw
YSL58w/+JMHUpbm+NfpLH/CLL/IFqDoOZCz8nvU+uQ6o/v0Z4DPAaJD6jlm1Fa7u
sikkwDsaKwcqFq/4wuRHFw2p+ddXvOq8tVmdAS/KLfyM61rXKgwaqCyHqsIfUWHF
dVli2ZBs14WkIq0UzfeRGzWaw0r6yI87b2Gmp8Bl90iuKo2OqGrZsa5ZhvXmO68t
YtHauANyqpOjCNoobilJaUmQS1xMhMrqqBZ8BTBGO5blsp4TX3NyIBBT91Uh0zQV
D3SOUxwB08dlanEX/PoEbH0Siioq4a1tFLDQ5YSuNMeTi77m1orWgm9nC7M3h7A1
TJPX9Qs1sUudSkIInR+bHukRWQYKDsdn7Tpj7RFSwi7hKF1dmv4qofLine99bBrH
+MomG1myTGt8HTm8688Ei0tSFTvv2BccHaA2jILSMBuvMADtnkBMO8cjy0VWbxd/
hbcCroQUAoeBmvoMWzi5/beiUivu+Horr6Hl12k+6cJPTkZPD0UOM6hkcvBJmq/7
ho+XpW5iUClkU3Ek2xaEQ9dX57/HabyZ7wUI4MfMoVO6U1SoCaVP0mX2a/q/2loD
RIRrXHe1T2dCI5NXdrQCQuHOC4obnR91ZdE9xqx5BIxCAddjPwgodqPGXlxBzz3S
jFTH1HRfEB0rDW5dsba6id4p/CDiIHCqGUFAokTRZAu5iI7+6bo=
=MKFU
-----END PGP SIGNATURE-----

--bFswNCOxS1+UaCCd--

