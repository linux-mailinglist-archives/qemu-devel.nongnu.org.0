Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131A5A5932
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 04:15:45 +0200 (CEST)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSqmx-0001GV-0C
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 22:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oSqim-0006jc-GW; Mon, 29 Aug 2022 22:11:20 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:46081
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oSqih-0006fS-SW; Mon, 29 Aug 2022 22:11:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MGrQ36FqXz4xGC; Tue, 30 Aug 2022 12:11:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1661825467;
 bh=qhnIF1cwgwFynHH2YS8/XeyLclwE0aamjQA1lDPYeFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pKtK2jSAZZSd1BVlxQj+S+2CYYfcSYkKZItuK7iU8VCWaNV92tKRiyM04vk1O2l07
 aaWO1zyTTfqUqHeL/rwmuWs3HuZzHsMoXp/0UlolilGrpQJKiwGI1Xi81SpQUPhEbx
 2oLqXT3EHjpesPQciey+6kO7JmncJhm31wh3u+qs=
Date: Tue, 30 Aug 2022 11:50:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v4 15/21] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Message-ID: <Yw1s6A3zCa8hjFAl@yekko>
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-16-danielhb413@gmail.com>
 <YwwzyxSCB8rP/usi@yekko>
 <45bd4519-1529-c147-cd99-c68e1045d2f2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dkP0ovGRocktSI15"
Content-Disposition: inline
In-Reply-To: <45bd4519-1529-c147-cd99-c68e1045d2f2@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--dkP0ovGRocktSI15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2022 at 07:00:55PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/29/22 00:34, David Gibson wrote:
> > On Fri, Aug 26, 2022 at 11:11:44AM -0300, Daniel Henrique Barboza wrote:
> > > Reading the FDT requires that the user saves the fdt_blob and then use
> > > 'dtc' to read the contents. Saving the file and using 'dtc' is a stro=
ng
> > > use case when we need to compare two FDTs, but it's a lot of steps if
> > > you want to do quick check on a certain node or property.
> > >=20
> > > 'info fdt' retrieves FDT nodes (and properties, later on) and print it
> > > to the user. This can be used to check the FDT on running machines
> > > without having to save the blob and use 'dtc'.
> > >=20
> > > The implementation is based on the premise that the machine thas a FDT
> > > created using libfdt and pointed by 'machine->fdt'. As long as this
> > > pre-requisite is met the machine should be able to support it.
> > >=20
> > > For now we're going to add the required QMP/HMP boilerplate and the
> > > capability of printing the name of the properties of a given node. Ne=
xt
> > > patches will extend 'info fdt' to be able to print nodes recursively,
> > > and then individual properties.
> > >=20
> > > This command will always be executed in-band (i.e. holding BQL),
> > > avoiding potential race conditions with machines that might change the
> > > FDT during runtime (e.g. PowerPC 'pseries' machine).
> > >=20
> > > 'info fdt' is not something that we expect to be used aside from debu=
gging,
> > > so we're implementing it in QMP as 'x-query-fdt'.
> > >=20
> > > This is an example of 'info fdt' fetching the '/chosen' node of the
> > > pSeries machine:
> > >=20
> > > (qemu) info fdt /chosen
> > > chosen {
> > >      ibm,architecture-vec-5;
> > >      rng-seed;
> > >      ibm,arch-vec-5-platform-support;
> > >      linux,pci-probe-only;
> > >      stdout-path;
> > >      linux,stdout-path;
> > >      qemu,graphic-depth;
> > >      qemu,graphic-height;
> > >      qemu,graphic-width;
> > > };
> > >=20
> > > And the same node for the aarch64 'virt' machine:
> > >=20
> > > (qemu) info fdt /chosen
> > > chosen {
> > >      stdout-path;
> > >      rng-seed;
> > >      kaslr-seed;
> > > };
> >=20
> > So, I'm reasonably convinced allowing dumping the whole dtb from
> > qmp/hmp is useful.  I'm less convined that info fdt is worth the
> > additional complexity it incurs.  Note that as well as being able to
> > decompile a whole dtb using dtc, you can also extract and list
> > specific properties from a dtb blob using the 'fdtget' tool which is
> > part of the dtc tree.
>=20
> What's your opinion on patch 21/21, where 'dumpdtb' can write a formatted
> FDT in a file with an extra option? That was possible because of the
> format helpers introduced for 'info fdt'. The idea is that since we're
> able to format a FDT in DTS format, we can also write the FDT in text
> format without relying on DTC to decode it.

Since it's mostly the same code, I think it's reasonable to throw in
if the info fdt stuff is there, but I don't think it's worth including
without that.  As a whole, I remain dubious that (info fdt + dumpdts)
is worth the complexity cost.

People with more practical experience debugging the embedded ARM
platforms might have a different opinion if they thing info fdt would
be really useful though.

> If we think that this 'dumpdtb' capability is worth having, I can respin
> the patches without 'info fdt' but adding these helpers to enable this
> 'dumpdtb' support. If not, then we can just remove patches 15-21 and
> be done with it.
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
> >=20
> > >=20
> > > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   hmp-commands-info.hx         | 13 ++++++++++
> > >   include/monitor/hmp.h        |  1 +
> > >   include/sysemu/device_tree.h |  4 +++
> > >   monitor/hmp-cmds.c           | 13 ++++++++++
> > >   monitor/qmp-cmds.c           | 12 +++++++++
> > >   qapi/machine.json            | 19 +++++++++++++++
> > >   softmmu/device_tree.c        | 47 +++++++++++++++++++++++++++++++++=
+++
> > >   7 files changed, 109 insertions(+)
> > >=20
> > > diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> > > index 188d9ece3b..743b48865d 100644
> > > --- a/hmp-commands-info.hx
> > > +++ b/hmp-commands-info.hx
> > > @@ -921,3 +921,16 @@ SRST
> > >     ``stats``
> > >       Show runtime-collected statistics
> > >   ERST
> > > +
> > > +    {
> > > +        .name       =3D "fdt",
> > > +        .args_type  =3D "nodepath:s",
> > > +        .params     =3D "nodepath",
> > > +        .help       =3D "show firmware device tree node given its pa=
th",
> > > +        .cmd        =3D hmp_info_fdt,
> > > +    },
> > > +
> > > +SRST
> > > +  ``info fdt``
> > > +    Show a firmware device tree node given its path. Requires libfdt.
> > > +ERST
> > > diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> > > index d7f324da59..c0883dd1e3 100644
> > > --- a/include/monitor/hmp.h
> > > +++ b/include/monitor/hmp.h
> > > @@ -135,6 +135,7 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const=
 QDict *qdict);
> > >   void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> > >   void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> > >   void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
> > > +void hmp_info_fdt(Monitor *mon, const QDict *qdict);
> > >   void hmp_human_readable_text_helper(Monitor *mon,
> > >                                       HumanReadableText *(*qmp_handle=
r)(Error **));
> > >   void hmp_info_stats(Monitor *mon, const QDict *qdict);
> > > diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tre=
e.h
> > > index bf7684e4ed..057d13e397 100644
> > > --- a/include/sysemu/device_tree.h
> > > +++ b/include/sysemu/device_tree.h
> > > @@ -14,6 +14,8 @@
> > >   #ifndef DEVICE_TREE_H
> > >   #define DEVICE_TREE_H
> > > +#include "qapi/qapi-types-common.h"
> > > +
> > >   void *create_device_tree(int *sizep);
> > >   void *load_device_tree(const char *filename_path, int *sizep);
> > >   #ifdef CONFIG_LINUX
> > > @@ -137,6 +139,8 @@ int qemu_fdt_add_path(void *fdt, const char *path=
);
> > >   void qemu_fdt_dumpdtb(void *fdt, int size);
> > >   void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
> > > +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> > > +                                          Error **errp);
> > >   /**
> > >    * qemu_fdt_setprop_sized_cells_from_array:
> > > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > > index 1c7bfd3b9d..93a4103afa 100644
> > > --- a/monitor/hmp-cmds.c
> > > +++ b/monitor/hmp-cmds.c
> > > @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qd=
ict)
> > >           hmp_handle_error(mon, local_err);
> > >       }
> > >   }
> > > +
> > > +void hmp_info_fdt(Monitor *mon, const QDict *qdict)
> > > +{
> > > +    const char *nodepath =3D qdict_get_str(qdict, "nodepath");
> > > +    Error *err =3D NULL;
> > > +    g_autoptr(HumanReadableText) info =3D qmp_x_query_fdt(nodepath, =
&err);
> > > +
> > > +    if (hmp_handle_error(mon, err)) {
> > > +        return;
> > > +    }
> > > +
> > > +    monitor_printf(mon, "%s", info->human_readable_text);
> > > +}
> > > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> > > index 8415aca08c..db2c6aa7da 100644
> > > --- a/monitor/qmp-cmds.c
> > > +++ b/monitor/qmp-cmds.c
> > > @@ -603,9 +603,21 @@ void qmp_dumpdtb(const char *filename, Error **e=
rrp)
> > >   {
> > >       return qemu_fdt_qmp_dumpdtb(filename, errp);
> > >   }
> > > +
> > > +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **err=
p)
> > > +{
> > > +    return qemu_fdt_qmp_query_fdt(nodepath, errp);
> > > +}
> > >   #else
> > >   void qmp_dumpdtb(const char *filename, Error **errp)
> > >   {
> > >       error_setg(errp, "dumpdtb requires libfdt");
> > >   }
> > > +
> > > +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **err=
p)
> > > +{
> > > +    error_setg(errp, "this command requires libfdt");
> > > +
> > > +    return NULL;
> > > +}
> > >   #endif
> > > diff --git a/qapi/machine.json b/qapi/machine.json
> > > index aeb013f3dd..96cff541ca 100644
> > > --- a/qapi/machine.json
> > > +++ b/qapi/machine.json
> > > @@ -1681,3 +1681,22 @@
> > >   ##
> > >   { 'command': 'dumpdtb',
> > >     'data': { 'filename': 'str' } }
> > > +
> > > +##
> > > +# @x-query-fdt:
> > > +#
> > > +# Query for FDT element (node or property). Requires 'libfdt'.
> > > +#
> > > +# @nodepath: the path of the FDT node to be retrieved
> > > +#
> > > +# Features:
> > > +# @unstable: This command is meant for debugging.
> > > +#
> > > +# Returns: FDT node
> > > +#
> > > +# Since: 7.2
> > > +##
> > > +{ 'command': 'x-query-fdt',
> > > +  'data': { 'nodepath': 'str' },
> > > +  'returns': 'HumanReadableText',
> > > +  'features': [ 'unstable' ]  }
> > > diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> > > index cd487ddd4d..6b15f6ace2 100644
> > > --- a/softmmu/device_tree.c
> > > +++ b/softmmu/device_tree.c
> > > @@ -18,6 +18,7 @@
> > >   #endif
> > >   #include "qapi/error.h"
> > > +#include "qapi/type-helpers.h"
> > >   #include "qemu/error-report.h"
> > >   #include "qemu/option.h"
> > >   #include "qemu/bswap.h"
> > > @@ -661,3 +662,49 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, =
Error **errp)
> > >       error_setg(errp, "Error when saving machine FDT to file %s", fi=
lename);
> > >   }
> > > +
> > > +static void fdt_format_node(GString *buf, int node, int depth)
> > > +{
> > > +    const struct fdt_property *prop =3D NULL;
> > > +    const char *propname =3D NULL;
> > > +    void *fdt =3D current_machine->fdt;
> > > +    int padding =3D depth * 4;
> > > +    int property =3D 0;
> > > +    int prop_size;
> > > +
> > > +    g_string_append_printf(buf, "%*s%s {\n", padding, "",
> > > +                           fdt_get_name(fdt, node, NULL));
> > > +
> > > +    padding +=3D 4;
> > > +
> > > +    fdt_for_each_property_offset(property, fdt, node) {
> > > +        prop =3D fdt_get_property_by_offset(fdt, property, &prop_siz=
e);
> > > +        propname =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> > > +
> > > +        g_string_append_printf(buf, "%*s%s;\n", padding, "", propnam=
e);
> > > +    }
> > > +
> > > +    padding -=3D 4;
> > > +    g_string_append_printf(buf, "%*s};\n", padding, "");
> > > +}
> > > +
> > > +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Erro=
r **errp)
> > > +{
> > > +    g_autoptr(GString) buf =3D g_string_new("");
> > > +    int node;
> > > +
> > > +    if (!current_machine->fdt) {
> > > +        error_setg(errp, "Unable to find the machine FDT");
> > > +        return NULL;
> > > +    }
> > > +
> > > +    node =3D fdt_path_offset(current_machine->fdt, nodepath);
> > > +    if (node < 0) {
> > > +        error_setg(errp, "node '%s' not found in FDT", nodepath);
> > > +        return NULL;
> > > +    }
> > > +
> > > +    fdt_format_node(buf, node, 0);
> > > +
> > > +    return human_readable_text_from_str(buf);
> > > +}
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dkP0ovGRocktSI15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMNbOIACgkQgypY4gEw
YSIfghAAv5qjfRGYlyNrqR2kJ5np9+y+TmL8SpL8oBEhED7Ajlehp9rfP+HcsyGR
JPqY433q2qBomNop/0e9vK5ZLBeVHoyw0d48Zm6YoTdEqH7ZNa/uxbSy9O/M1i8K
nR6HttWijrBM6SBdWPn9PYTqMGg6OnQeEpCoHPyxq3oBmy6RTQMQw9+Rec8eQ0i/
Rq22dxexFKVyQUgjIkiBNhUod9cn0DkAZ8ThXl2m1NgjjlYxOVv1ix0n1m8MeKGy
yKEFBsESMeeiEoVLY8bD9wQ3GbpYcszSRYq+aUe3OkCzrG8RgfwcM2dY+f9+NonZ
9pEY8ZsZqUi64bAgif5ya37rqctowKD2vmik6f5dvRT5BkoUN0RR1qx3yezu3LPV
aLhsoOIUkOW1NsMoYMys9er+fB+rTuyr/4CNTiKqvQADP44dq4+sg1xdTl/3XrST
5CPGAYuKoPdUYlkxyDm0iRxuBDU8COG1/au6nHNDF/+0f+A5jJw3Y4FaXpR4SE1U
P4OODS/Qt4RsoNZxhR68TUtNxqVj6LsgTu+k4tlUxwJdh7W/fWCC/51L8yjH+l7V
10nHLY+QBxUl6XB8fwaqV1GvhC6OdBR+7sEKbmmFK34mZsrdk1vJlfuFhF+4uh/u
QoKIFxy/p6PFm0+k6RVmvsXKRHZSA2Pit9muKyLd6LgSxMbgmts=
=mPPc
-----END PGP SIGNATURE-----

--dkP0ovGRocktSI15--

