Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD0597EC0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:43:06 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZFB-0001uj-Br
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYo1-0004tG-TG; Thu, 18 Aug 2022 02:15:03 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56599
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYnv-0007RE-S5; Thu, 18 Aug 2022 02:15:01 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M7ZNj5nPdz4xFy; Thu, 18 Aug 2022 16:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660803285;
 bh=7qtY1LpOzI77kWHLLjcwXciQfloi1dzozklCKTZjK+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RMBBpn4xwnKf0A9BpHThETuDRbJOyHmRM8JB8CC5l1FQPUpTkeG5kZKpuzxHT7zuV
 tIz2CQ4AyY5PGu5gyRXzRUR9QK4Go+Ppav1npNcNkH/r1B9/jvDQv9pS58XMMwttyK
 X9A4JVtTDvkb+KMFImIuwDtOl7fVMqfbnwkBqs98=
Date: Thu, 18 Aug 2022 11:34:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v3 20/20] hmp, device_tree.c: add 'info fdt
 <property>' support
Message-ID: <Yv2XOd3kDB+fgHDi@yekko>
References: <20220816173428.157304-1-danielhb413@gmail.com>
 <20220816173428.157304-21-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/fDoOP9EdkhKXTFB"
Content-Disposition: inline
In-Reply-To: <20220816173428.157304-21-danielhb413@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--/fDoOP9EdkhKXTFB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 02:34:28PM -0300, Daniel Henrique Barboza wrote:
> 'info fdt' is only able to print full nodes so far. It would be good to
> be able to also print single properties, since ometimes we just want
> to verify a single value from the FDT.
>=20
> libfdt does not have support to find a property given its full path, but
> it does have a way to return a fdt_property given a prop name and its
> subnode.
>=20
> Add a new optional 'propname' parameter to x-query-fdt to specify the
> property of a given node. If it's present, we'll proceed to find the
> node as usual but, instead of printing the node, we'll attempt to find
> the property and print it standalone.
>=20
> After this change, if an user wants to print just the value of 'cpu' insi=
de
> /cpu/cpu-map(...) from an ARM FDT, we can do it:
>=20
> (qemu) info fdt /cpus/cpu-map/socket0/cluster0/core0 cpu
> /cpus/cpu-map/socket0/cluster0/core0/cpu =3D <0x8001>
>=20
> Or the 'ibm,my-dma-window' from the v-scsi device inside the pSeries
> FDT:
>=20
> (qemu) info fdt /vdevice/v-scsi@71000003 ibm,my-dma-window
> /vdevice/v-scsi@71000003/ibm,my-dma-window =3D <0x71000003 0x0 0x0 0x0 0x=
10000000>

nit: dts property definitions also include a terminating ';'
	prop =3D "foobar";

> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands-info.hx         |  9 +++++----
>  include/sysemu/device_tree.h |  2 ++
>  monitor/hmp-cmds.c           |  5 ++++-
>  monitor/qmp-cmds.c           |  8 +++++---
>  qapi/machine.json            |  4 +++-
>  softmmu/device_tree.c        | 29 ++++++++++++++++++++++++-----
>  6 files changed, 43 insertions(+), 14 deletions(-)
>=20
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 743b48865d..17d6ee4d30 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -924,13 +924,14 @@ ERST
> =20
>      {
>          .name       =3D "fdt",
> -        .args_type  =3D "nodepath:s",
> -        .params     =3D "nodepath",
> -        .help       =3D "show firmware device tree node given its path",
> +        .args_type  =3D "nodepath:s,propname:s?",
> +        .params     =3D "nodepath [propname]",
> +        .help       =3D "show firmware device tree node or property give=
n its path",
>          .cmd        =3D hmp_info_fdt,
>      },
> =20
>  SRST
>    ``info fdt``
> -    Show a firmware device tree node given its path. Requires libfdt.
> +    Show a firmware device tree node or property given its path.
> +    Requires libfdt.
>  ERST
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 057d13e397..551a02dee2 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -140,6 +140,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>  void qemu_fdt_dumpdtb(void *fdt, int size);
>  void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>  HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> +                                          bool has_propname,
> +                                          const char *propname,
>                                            Error **errp);
> =20
>  /**
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index accde90380..df8493adc5 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2488,8 +2488,11 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>  void hmp_info_fdt(Monitor *mon, const QDict *qdict)
>  {
>      const char *nodepath =3D qdict_get_str(qdict, "nodepath");
> +    const char *propname =3D qdict_get_try_str(qdict, "propname");
>      Error *err =3D NULL;
> -    g_autoptr(HumanReadableText) info =3D qmp_x_query_fdt(nodepath, &err=
);
> +    g_autoptr(HumanReadableText) info =3D NULL;
> +
> +    info =3D qmp_x_query_fdt(nodepath, propname !=3D NULL, propname, &er=
r);
> =20
>      if (hmp_handle_error(mon, err)) {
>          return;
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index db2c6aa7da..ca2a96cdf7 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -604,9 +604,10 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>      return qemu_fdt_qmp_dumpdtb(filename, errp);
>  }
> =20
> -HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propna=
me,
> +                                   const char *propname, Error **errp)
>  {
> -    return qemu_fdt_qmp_query_fdt(nodepath, errp);
> +    return qemu_fdt_qmp_query_fdt(nodepath, has_propname, propname, errp=
);
>  }
>  #else
>  void qmp_dumpdtb(const char *filename, Error **errp)
> @@ -614,7 +615,8 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>      error_setg(errp, "dumpdtb requires libfdt");
>  }
> =20
> -HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propna=
me,
> +                                   const char *propname, Error **errp)
>  {
>      error_setg(errp, "this command requires libfdt");
> =20
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 96cff541ca..c15ce60f46 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1688,6 +1688,7 @@
>  # Query for FDT element (node or property). Requires 'libfdt'.
>  #
>  # @nodepath: the path of the FDT node to be retrieved
> +# @propname: name of the property inside the node
>  #
>  # Features:
>  # @unstable: This command is meant for debugging.
> @@ -1697,6 +1698,7 @@
>  # Since: 7.2
>  ##
>  { 'command': 'x-query-fdt',
> -  'data': { 'nodepath': 'str' },
> +  'data': { 'nodepath': 'str',
> +            '*propname': 'str' },
>    'returns': 'HumanReadableText',
>    'features': [ 'unstable' ]  }
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 9e681739bd..523c9b8d4d 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -823,23 +823,42 @@ static void fdt_format_node(GString *buf, int node,=
 int depth,
>      g_string_append_printf(buf, "%*s}\n", padding, "");
>  }
> =20
> -HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **=
errp)
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> +                                          bool has_propname,
> +                                          const char *propname,
> +                                          Error **errp)
>  {
>      g_autoptr(GString) buf =3D g_string_new("");
> -    int node;
> +    const struct fdt_property *prop =3D NULL;
> +    void *fdt =3D current_machine->fdt;
> +    int node, prop_size;
> =20
> -    if (!current_machine->fdt) {
> +    if (!fdt) {
>          error_setg(errp, "Unable to find the machine FDT");
>          return NULL;
>      }
> =20
> -    node =3D fdt_path_offset(current_machine->fdt, nodepath);
> +    node =3D fdt_path_offset(fdt, nodepath);
>      if (node < 0) {
>          error_setg(errp, "node '%s' not found in FDT", nodepath);
>          return NULL;
>      }
> =20
> -    fdt_format_node(buf, node, 0, nodepath);
> +    if (!has_propname) {
> +        fdt_format_node(buf, node, 0, nodepath);
> +    } else {
> +        g_autofree char *proppath =3D g_strdup_printf("%s/%s", nodepath,
> +                                                    propname);
> +
> +        prop =3D fdt_get_property(fdt, node, propname, &prop_size);
> +        if (!prop) {
> +            error_setg(errp, "property '%s' not found in node '%s' in FD=
T",
> +                       propname, nodepath);
> +            return NULL;
> +        }
> +
> +        fdt_format_property(buf, proppath, prop->data, prop_size, 0);
> +    }
> =20
>      return human_readable_text_from_str(buf);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/fDoOP9EdkhKXTFB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL9lzMACgkQgypY4gEw
YSJkjBAAgxEqQQwS7pZBksg0FEBiXswkJEz31LDHn+IVfC6a8lmKjWuMI68+NhkS
mJPyA5Ek0d4kUruqMOJQaQZbw09Qgsoc6DT2Nex2s9iwwPq33G8n1Cr6v3Ah7qXD
4z/9pnRkseCLErK4T9sHFaXrgaQHR70tZHx/zbaMWPGvmoYQTXeeP7Y0Rxxk32NY
uKc0FmtNpjj7E+5afHdP7Omfql7r2QbKs8DgaNk3mJqQa6/5xY8PygpqaNFH4Ku1
WDOHE4VNvk8Wqh8YY0SKaleobFbUmXPuU4MILMeuDlFNb28JWt3LNutaWaWpGRuU
DTJ8t4Mbj585x4dZutcokpeS+2hwn0ZS0VQpIlrABsmzjNxEFdqTV337puwZm4qz
XpimC41BklIrrRbt2zT/r75/AqHHbQE0aNlAx4Jt/qUxBG7O6BgfmnRmta1+Lhcl
DgXSKHyXJ7q1z6sTAq+FGGAHzJploG79+uvfpEH3jUsqQi1mSsTfnMy5XG6g1HF/
aZ8yQVLx788cLA5dx0H2ucO2kMsGueu+rszM1Iru+CLz6YDD4d6Gwja3J1uVfzeH
ZH7ApaqtfaUC5VWqGTjLbnYLV0ozmA8UbX+/6ZZUJg01eWM1mrB9uFrn6U1ntWZN
NabTlH6dQi764ZQagaTrSvsIWzYnC+qhuqmBICiTXuSbPG9SdmY=
=g/mG
-----END PGP SIGNATURE-----

--/fDoOP9EdkhKXTFB--

