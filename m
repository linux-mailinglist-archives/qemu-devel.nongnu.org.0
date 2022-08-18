Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F6597ED7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:58:39 +0200 (CEST)
Received: from localhost ([::1]:51202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZUC-0001b0-BL
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYo4-0004ub-Bj
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:15:07 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:36379
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYo1-0007Sn-75
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:15:03 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M7ZNj69P2z4xTs; Thu, 18 Aug 2022 16:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660803285;
 bh=YW44XBCJhMqXEkkVxlZjYOCPAuthYFxCXEqREfHkRaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtvAVSN/uUaf7ijRZYvgeQjUdCNNduvPNY35J2/Gg+hxbBDMSXzSOgpi5UW/5epmk
 HDgOtdhEcdhKyYi9KXdS+vI60hn6a23nvbKdXj2x8fFmbzzPVXyapVJWPSN5zfIU9k
 6HbM8DooAXuWgFMOgbOzXuJa0r/exgiRrMTxt4Hs=
Date: Thu, 18 Aug 2022 12:46:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v2 15/20] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Message-ID: <Yv2oBI7p1qK7pGx7@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-16-danielhb413@gmail.com>
 <YvCPT8eZSKMM4zk5@yekko>
 <2e4509e2-db98-70ff-fb12-9d753127bd64@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hbjf5/cM4DcAhEmy"
Content-Disposition: inline
In-Reply-To: <2e4509e2-db98-70ff-fb12-9d753127bd64@gmail.com>
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


--hbjf5/cM4DcAhEmy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 07:48:14PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/8/22 01:21, David Gibson wrote:
> > On Fri, Aug 05, 2022 at 06:39:43AM -0300, Daniel Henrique Barboza wrote:
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
> > > }
> > >=20
> > > And the same node for the aarch64 'virt' machine:
> > >=20
> > > (qemu) info fdt /chosen
> > > chosen {
> > >      stdout-path;
> > >      rng-seed;
> > >      kaslr-seed;
> > > }
> >=20
> > So... it's listing the names of the properties, but not the contents?
> > That seems kind of odd.
> >=20
> > >=20
> > > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
> > > index d23ec85f9d..accde90380 100644
> > > --- a/monitor/hmp-cmds.c
> > > +++ b/monitor/hmp-cmds.c
> > > @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qd=
ict)
> > >           error_report_err(local_err);
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
> >=20
> >=20
> > A QMP command that returns human readable text, rather than something
> > JSON structured seems... odd.
> >=20
> > Admittedly, *how* you'd JSON structure the results gets a bit tricky.
> > Listing nodes or property names would be easy enough, but getting the
> > property contents is hairy, since JSON strings are supposed to be
> > Unicode, but DT properties can be arbitrary bytestrings.
> >=20
> > > diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> > > index cd487ddd4d..3fb07b537f 100644
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
> > > +    g_string_append_printf(buf, "%*s}\n", padding, "");
> >=20
> > So, this lists it in dts format... kind of.  Because you don't include
> > the property values, it makes it look like all properties are binary
> > (either absent or present-but-empty).  I think that's misleading.  If
> > you're only going to list properties, I think you'd be better off
> > using different formatting (and maybe a more specific command name as
> > well).
>=20
> As you've already noticed in the next patch, I decided to split between Q=
MP/HMP
> introduction and the dts formatting to avoid clogging everything in a sin=
gle patch.
> In the end the whole fdt tree can be printed with all the properties type=
s.
>=20
> As for using HumanReadableText, I tried to imagine a structured output for
> 'info fdt'. It would be something like:
>=20
> - struct Property: an union of the possible types (none, string, uint32 a=
rray,
> byte array)

I don't think it's wise to try to interpret the property any further
than a raw bytestring in a machine oriented interface.  You can't
really know the type of a property without knowing all the DT bindings
that apply to it, what we do for formatting in this patch series, and
in dtc is a heuristic only.  That's useful for debuging output aimed
at humans, but not a good idea for a structured interface.

Note that even for the human interface it might be a better compromise
to just always emit properties essentially as a hexdump.  I wouldn't
suggest approximating dts format in this case though, to make the
distinction clearer.

> - struct Node: an array of properties and subnodes
>=20
> And then 'info fdt <node>' would return a struct node and  'info fdt <nod=
e> <prop>'
> would return a struct Property

Well, for a "native" QMP interface, I'd suggest splitting up the
operations more.  Say "fdt-ls" (takes a path, returns array of subnode
names), "fdt-properties" (takes a path, returns array of property names), a=
nd getprop
(takes a path and a property name, returns bytestring).  I guess a
"dump" operation of some sort to get the whole thing without a million
commands might be a good idea too.

> Adding this stable ABI sounded like too much extra work for a command tha=
t would be
> used mostly for debug/development purposes. Every other command that outp=
uts
> internal guest state (info roms, info rdma, info irq, info numa ...) are =
happy with
> returning HumanReadableFormat and being considered debug only. I decided =
to do the
> same thing.

Ok, I hadn't realized there was precedent for this approach.  If
that's the case I'm less bothered by this.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hbjf5/cM4DcAhEmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL9p/0ACgkQgypY4gEw
YSLDjg//R8GsKZwd25Mo4ZSLrLL2pNeQe+BfQD+SndYiFnxMfcAM+fRhM3ev+U3E
Ebd8ty9teY2TKWP70OAGvYGsOb8JynGcLkOpL0fcKLD8yIPZ9st6PJupVs06sOaX
hq/rTqw7cTKZkYyiZradCkTa36NeljzMXdISljOpnqblmoFbnQuarA8oYfN/JtYh
PQNPW35TCWftPMlTpB0GWt0OyuGYyQaFx4ps4kbDwVQbSt51YtHrMZQmqKTcBr53
KrNIctEz9QoF0hRkQkSCh+uILnanzkcv0QUI8k/DUnfkN2bhvMYAA+Lue7zXDXdp
bgBp6r5DINoFgAHNhdJRRFVc9V+cPNR7YKO8pcJfg7//b58Vwh5xxz4HwJDyCskV
qnmvYTymGRC/PJ+C61894KPq37+nGMp9HF1CSS6HaO5ivEKNQJy+FRJxJhedvX2r
m6C6rUO6VIYfhWQ+i5ozjG/K89YElWGG+fusSQZIJcNwvYZ5IkYWEmAmhU02glOI
FabOZo/w6TttfNgJ+T7cWKg6YyYf3yE+4NlHjIKuQ9cb/os+HaCcfPOjF8V02728
jKISZ5vufermEwTzFHemxAnC7fldUd/6WNvtgauSplhUbKjMsvnr4q3Xq1XHZr1q
cNtc2URxQW8C3MXkD+mD3JxJd3N7Wz1NxgIYWzULRFbj1zkKBbo=
=NZ6A
-----END PGP SIGNATURE-----

--hbjf5/cM4DcAhEmy--

