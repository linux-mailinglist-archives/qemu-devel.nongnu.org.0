Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE758F6AD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 06:13:07 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLzZ9-0004fc-6I
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 00:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oLzVv-0002RQ-FA
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 00:09:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oLzVr-0005tQ-21
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 00:09:43 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M3CxN0rBsz4x1d; Thu, 11 Aug 2022 14:09:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660190968;
 bh=5c5+vcJ7dw0x0MxDpnUmqlb6rGeenAt3aFwseRbsbAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aIGYZQ4M+dw9mQG8CBKeMZ+TCARjiWwrfqljGG+SjDPGL7iBIi6XS7WJgqoy4Ki2p
 C7XG824qRG8tVe1IAyLp4joy7l0wqUsYjzI/nUJm4IB/BCALKD4mE17hHE9NLG/YZo
 CVTtanuzYAVn+AvMMBI58ZTTJNpk4ja4CHsjHIL4=
Date: Thu, 11 Aug 2022 14:09:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v2 16/20] device_tree.c: support string props in
 fdt_format_node()
Message-ID: <YvSA8RQE5ksAhHrl@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-17-danielhb413@gmail.com>
 <YvCSx8eV5jkMbD6C@yekko>
 <8512d624-d741-d4df-b729-9e3d4559e6c3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+heBkiyVmfO6kUl8"
Content-Disposition: inline
In-Reply-To: <8512d624-d741-d4df-b729-9e3d4559e6c3@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--+heBkiyVmfO6kUl8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2022 at 04:40:18PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/8/22 01:36, David Gibson wrote:
> > On Fri, Aug 05, 2022 at 06:39:44AM -0300, Daniel Henrique Barboza wrote:
> > > To support printing string properties in 'info fdt' we need to determ=
ine
> > > whether a void data might contain a string.
> >=20
> > Oh... sorry, obviously I hadn't read these later patches when I
> > complained about the command not printing property values.
> >=20
> > >=20
> > > We do that by casting the void data to a string array and:
> > >=20
> > > - check if the array finishes with a null character
> > > - check if all characters are printable
> >=20
> > This won't handle the case of the "string list" several strings tacked
> > together, separated by their terminating \0 characters.
>=20
> Hmmmm how is this printed? Should we concatenate them? Replace the \0
> with a whitespace? Or ignore the zero and concatenate them?
>=20
> E.g. this is a\0string\0list
>=20
> Should we print it as:
>=20
> this is astringlist
>=20
> or
>=20
> this is a string list ?

Well, if you're going for dts like output, which you seem to be, you
have two options:

1) Escape the medial nulls

	"this\0is\0a\0string\0list"

2) Multiple strings:

	"this", "is", "a", "string", "list"

Both forms are allowed in dts and will result in an identical
bytestring in the property.

> > > If both conditions are met, we'll consider it to be a string data type
> > > and print it accordingly. After this change, 'info fdt' is now able to
> > > print string properties. Here's an example with the ARM 'virt' machin=
e:
> > >=20
> > > (qemu) info fdt /chosen
> > > chosen {
> > >      stdout-path =3D '/pl011@9000000'
> > >      rng-seed;
> > >      kaslr-seed;
> > > }
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   softmmu/device_tree.c | 25 ++++++++++++++++++++++++-
> > >   1 file changed, 24 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> > > index 3fb07b537f..8691c3ccc0 100644
> > > --- a/softmmu/device_tree.c
> > > +++ b/softmmu/device_tree.c
> > > @@ -663,6 +663,24 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, =
Error **errp)
> > >       error_setg(errp, "Error when saving machine FDT to file %s", fi=
lename);
> > >   }
> > > +static bool fdt_prop_is_string(const void *data, int size)
> > > +{
> > > +    const char *str =3D data;
> > > +    int i;
> > > +
> > > +    if (size <=3D 0 || str[size - 1] !=3D '\0') {
> > > +        return false;
> > > +    }
> > > +
> > > +    for (i =3D 0; i < size - 1; i++) {
> > > +        if (!g_ascii_isprint(str[i])) {
> > > +            return false;
> > > +        }
> > > +    }
> > > +
> > > +    return true;
> > > +}
> > > +
> > >   static void fdt_format_node(GString *buf, int node, int depth)
> > >   {
> > >       const struct fdt_property *prop =3D NULL;
> > > @@ -681,7 +699,12 @@ static void fdt_format_node(GString *buf, int no=
de, int depth)
> > >           prop =3D fdt_get_property_by_offset(fdt, property, &prop_si=
ze);
> > >           propname =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> > > -        g_string_append_printf(buf, "%*s%s;\n", padding, "", propnam=
e);
> > > +        if (fdt_prop_is_string(prop->data, prop_size)) {
> > > +            g_string_append_printf(buf, "%*s%s =3D '%s'\n",
> > > +                                   padding, "", propname, prop->data=
);
> >=20
> > If you're going for dts like output, I'd suggest going all the way.
> > That means \" instead of \' and a ';' at the end of the line.
> >=20
> > > +        } else {
> > > +            g_string_append_printf(buf, "%*s%s;\n", padding, "", pro=
pname);
> > > +        }
> > >       }
> > >       padding -=3D 4;
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+heBkiyVmfO6kUl8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL0gNkACgkQgypY4gEw
YSIiQxAAjXw1NRUTacpcG6tvx/yq3s0bQXnuFrAXW+QD2bmrkEZtGLUlIWwrrx5+
kV55JWu+taux6dZzwoSTfIKH9pnCmSGL1uORdTUgh/SzRz1NbREOhtrAbSJF5j4S
SCtbXKKuQtMioKjLlPyW0FrePMXIV2jJgrFh4heRvNM8rBPOormWlpT92dJUIHCK
EfS5KzzXpuYqd8ot7aoRpSJFyYOyu3tFqkidYytKFAkhNoHN/E794fUK8LArkjyV
Iqmtlad1qhA/hTpUgYYFzivXCWzgSlKI+eNQBu5dI5Byd6Dqqm1nwK0izraG2JOx
+D+aDs9fMZt4H8jITULyviD4SXDh4PPXDnLqagpxXtlhWpudTBpKlHZ/FI0FraDf
AbaxxKpkrtO49WrnDx0BZc9l0Llr53Iqy0b4bcMOkznSBOkyVFmyN212SUAw65HY
YPJkKodqqUSjFfyrESpQbIPf7O0OBpQvJ7hHNqj1kZtJQEfWNxlsDl9i74oysCH6
AueVPfg2Mju3F+LmLtvegK2VOeeTyVR2/uigjRNDTubAYlXhvyvTES/XJWU9Bto2
qy8VNVsyeBCOGy1RMf1N5NrcG4DxxGEk6OuhHOegixBv0/S70DNA21Dv4JQdtQ+V
FT1vfDZKMcBtPcHy75Q5+v6Dr9HqPtz1N2bHq2GTvtIkKzlV01w=
=S0N0
-----END PGP SIGNATURE-----

--+heBkiyVmfO6kUl8--

