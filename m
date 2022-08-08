Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9B58C223
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 05:41:49 +0200 (CEST)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKteG-00082A-6Y
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 23:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZg-0003tq-VT
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 23:37:04 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:35413
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZd-0006a3-So
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 23:37:04 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1MM85clXz4xTs; Mon,  8 Aug 2022 13:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659929812;
 bh=bav+SXNlEwq6c4E5GGCxMQermKsP72je7CFSLe04KcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HlgjjKUqkDBYkoD46zO7fDwIIyeGTzEgTiAGmbMVysxKaTfQuzXNk/sgDd149/z6M
 N664IVIdl/ipJ6upGjIGdROA+bPzQLcZxwcFch+DZWToEXBv2wJGAETXAg4/e4EDNF
 56BeZOeRXrO02LqemAe69rXoKehcHADredoFj3IA=
Date: Mon, 8 Aug 2022 13:30:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v2 14/20] qmp/hmp, device_tree.c: introduce dumpdtb
Message-ID: <YvCDY6PCvMWG5rnr@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-15-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="41LhOsljIR3vCFoB"
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-15-danielhb413@gmail.com>
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


--41LhOsljIR3vCFoB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 06:39:42AM -0300, Daniel Henrique Barboza wrote:
> To save the FDT blob we have the '-machine dumpdtb=3D<file>' property.
> With this property set, the machine saves the FDT in <file> and exit.
> The created file can then be converted to plain text dts format using
> 'dtc'.
>=20
> There's nothing particularly sophisticated into saving the FDT that
> can't be done with the machine at any state, as long as the machine has
> a valid FDT to be saved.
>=20
> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
> FDT is available, it'll save it in a file 'filename'. In short, this is
> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>=20
> A valid FDT consists of a FDT that was created using libfdt being
> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
> met by most FDT users in QEMU.

On spapr at least, the fdt can change at runtime (due to hotplugs).
So we need to think about concurrency between fdt updates and dumping
it with this command.  I'm assuming it's protected by the BQL, but I'm
wondering if we should outright state that somewhere for clarity.

>=20
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands.hx              | 13 +++++++++++++
>  include/monitor/hmp.h        |  1 +
>  include/sysemu/device_tree.h |  1 +
>  monitor/hmp-cmds.c           | 12 ++++++++++++
>  monitor/qmp-cmds.c           | 13 +++++++++++++
>  qapi/machine.json            | 17 +++++++++++++++++
>  softmmu/device_tree.c        | 18 ++++++++++++++++++
>  7 files changed, 75 insertions(+)
>=20
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 182e639d14..d2554e9701 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1800,3 +1800,16 @@ ERST
>                        "\n\t\t\t\t\t limit on a specified virtual cpu",
>          .cmd        =3D hmp_cancel_vcpu_dirty_limit,
>      },
> +
> +SRST
> +``dumpdtb`` *filename*
> +  Save the FDT in the 'filename' file to be decoded using dtc.
> +  Requires 'libfdt' support.
> +ERST
> +    {
> +        .name       =3D "dumpdtb",
> +        .args_type  =3D "filename:s",
> +        .params     =3D "[filename] file to save the FDT",
> +        .help       =3D "save the FDT in the 'filename' file to be decod=
ed using dtc",
> +        .cmd        =3D hmp_dumpdtb,
> +    },
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index a618eb1e4e..d7f324da59 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -134,6 +134,7 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *q=
dict);
>  void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Er=
ror **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..bf7684e4ed 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>      } while (0)
> =20
>  void qemu_fdt_dumpdtb(void *fdt, int size);
> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
> =20
>  /**
>   * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c6cd6f91dd..d23ec85f9d 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2472,3 +2472,15 @@ exit:
>  exit_no_print:
>      error_free(err);
>  }
> +
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
> +{
> +    const char *filename =3D qdict_get_str(qdict, "filename");
> +    Error *local_err =3D NULL;
> +
> +    qmp_dumpdtb(filename, &local_err);
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
> +}
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 7314cd813d..8415aca08c 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -45,6 +45,7 @@
>  #include "hw/intc/intc.h"
>  #include "hw/rdma/rdma.h"
>  #include "monitor/stats.h"
> +#include "sysemu/device_tree.h"
> =20
>  NameInfo *qmp_query_name(Error **errp)
>  {
> @@ -596,3 +597,15 @@ bool apply_str_list_filter(const char *string, strLi=
st *list)
>      }
>      return false;
>  }
> +
> +#ifdef CONFIG_FDT
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    return qemu_fdt_qmp_dumpdtb(filename, errp);
> +}
> +#else
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    error_setg(errp, "dumpdtb requires libfdt");
> +}
> +#endif
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6afd1936b0..aeb013f3dd 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1664,3 +1664,20 @@
>       '*size': 'size',
>       '*max-size': 'size',
>       '*slots': 'uint64' } }
> +
> +##
> +# @dumpdtb:
> +#
> +# Save the FDT in dtb format. Requires 'libfdt' support.
> +#
> +# @filename: name of the FDT file to be created
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#   {"execute": "dumpdtb"}
> +#    "arguments": { "filename": "/tmp/fdt.dtb" } }
> +#
> +##
> +{ 'command': 'dumpdtb',
> +  'data': { 'filename': 'str' } }
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..cd487ddd4d 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -643,3 +643,21 @@ out:
>      g_free(propcells);
>      return ret;
>  }
> +
> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    int size;
> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "Unable to find the machine FDT");
> +        return;
> +    }
> +
> +    size =3D fdt_totalsize(current_machine->fdt);
> +
> +    if (g_file_set_contents(filename, current_machine->fdt, size, NULL))=
 {
> +        return;
> +    }
> +
> +    error_setg(errp, "Error when saving machine FDT to file %s", filenam=
e);
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--41LhOsljIR3vCFoB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwg1wACgkQgypY4gEw
YSKOAA//bgpA1q7HxBwMBFmXh4Y0TNnWRS4W2BID1bdo0w14L8v/cN2+ocDxGtvC
0Q5CjtWJSBaa8UjVGgWJb9qKJQlCjuHytobd0Kud9nKEnQDPhbUITouv3JGVEWem
xkX4JTQsNrT5WgRLCJvCIWRW0pIAZF2i0obEOvTP4z4arHunSuONgBNCRjyOBgOv
rxlJqV+N6OvW3dSdbEZtw49aQ1LDWcZaHNtCArOmRpEFRUCFvIdMa6sglovt5/kz
X5iOb3me9fM9BRd83kVAfYBFwPgZsZ04R8phTLT///S4p6n6ar0cLSKnoVcRG8fD
U+Mvqh8xZn7RWkhF2hxCSyLLNIg6KWIis+F2vKh+bmcsEDuMbccFCg2BSJPQCqmF
pD26gYWuE/EBMcvrhoS1LoGUcV7QoN5hlKDCleGUxMY+885XmT2cRDomSMNWpo9j
qVRmsJI7YOErqRgfpIwz5sDd1wVORXBSMLzHHNTnwvNC9InA8NfAoEptOmDvtzSp
TWST4d1bMKCWh1/x1jZQehJmn7zF8necmTOM/I6qLXSlapcWPZQfJ8IM27h32dxE
sAabdJIkmeAk9D9OGmW/1cn8ooKlLvNLw9TnI2+apCsRnX4ntj2ISVXF9hS23aWw
f0oJ0wCKZNu83fwZK3hSfirnO/n99154wLoAm6CMVzbhxzojx2o=
=oHws
-----END PGP SIGNATURE-----

--41LhOsljIR3vCFoB--

