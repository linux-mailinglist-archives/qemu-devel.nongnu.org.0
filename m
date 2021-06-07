Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BF39D3B1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:56:35 +0200 (CEST)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6NO-0007qB-AY
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6I5-0003w6-1I; Sun, 06 Jun 2021 23:51:05 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52101 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hu-0002mb-3y; Sun, 06 Jun 2021 23:51:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt24B0Vz9sXb; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=vmGc7mzDhbRFkaw3A8+4ss25uD5lV6eJSkVJZLY0Xwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BmEyYLtulST83Wotsw0j12Qpw0nRlY/6qHSkYMiNf7yCwgudo+kB0QPvnptI6b+KU
 ZUpuN30f3PLK5FEGyTzIoHz/UIQu++2xPQMWGlfWr8A4s5wvP4BQfXR71ZvLH1LcjJ
 4k+fa1SNtlXtCzONU1r0IOEAW0P3O01OpTpwnz1I=
Date: Mon, 7 Jun 2021 13:05:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YL2M+XP3Kw6w0UMr@yekko>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu>
 <YLnF/9H6aFzNhu5+@yekko>
 <537a6990-4f18-746e-a1da-5dfa51f23dbd@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ieJaEtcxVvxKJuJ"
Content-Disposition: inline
In-Reply-To: <537a6990-4f18-746e-a1da-5dfa51f23dbd@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4ieJaEtcxVvxKJuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 03:50:28PM +0200, BALATON Zoltan wrote:
> On Fri, 4 Jun 2021, David Gibson wrote:
> > On Sun, May 30, 2021 at 07:33:01PM +0200, BALATON Zoltan wrote:
[snip]
> > > MorphOS checks the name property of the root node ("/") to decide what
> > > platform it runs on so we may need to be able to set this property on=
 /
> > > where it should return "bplan,Pegasos2", therefore the above maybe sh=
ould do
> > > getprop first and only generate name property if it's not set (or at =
least
> > > check if we're on the root node and allow setting name property there=
). (On
> > > Macs the root node is named "device-tree" and this was before found t=
o be
> > > needed for MorphOS.)
> >=20
> > Ah.  Hrm.  Have to think about what to do about that.
>=20
> This is easy to fix, this seems to allow setting a name property or retur=
n a
> default:
>=20
> > diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index b47bbd509d..746842593e 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -163,14 +163,14 @@ static uint32_t vof_finddevice(const void *fdt,
> uint32_t nodeaddr)
>  static const void *getprop(const void *fdt, int nodeoff, const char *pro=
pname,
>                             int *proplen, bool *write0)
>  {
> -    const char *unit, *prop;
> +    const char *unit, *prop =3D fdt_getprop(fdt, nodeoff, propname, prop=
len);
>=20
>      /*
>       * The "name" property is not actually stored as a property in the F=
DT,
>       * we emulate it by returning a pointer to the node's name and adjust
>       * proplen to include only the name but not the unit.
>       */
> -    if (strcmp(propname, "name") =3D=3D 0) {
> +    if (!prop && strcmp(propname, "name") =3D=3D 0) {
>          prop =3D fdt_get_name(fdt, nodeoff, proplen);
>          if (!prop) {
>              *proplen =3D 0;
> @@ -196,7 +196,7 @@ static const void *getprop(const void *fdt, int nodeo=
ff, const char *propname,
>      if (write0) {
>          *write0 =3D false;
>      }
> -    return fdt_getprop(fdt, nodeoff, propname, proplen);
> +    return prop;
>  }

Kind of a hack, but it'll do for now.

> This allows adding a name property to "/" different from the default but
> this does not yet fix MorphOS booting with VOF on pegasos2. I think it tr=
ies
> to query name on / and check if it's called "device-tree" in which case it
> assumes Mac hardware otherwise it goes with pegasos2 so even if we return
> nothing for name it would not matter in this case as we don't use VOF on
> Mac. If we wanted that then this would become a problem so it could be fi=
xed
> now in advance just in case other guests may need it.
>=20
> > > Other than the above two problems, I've found that getting the device=
 tree
> > > from vof returns it in reverse order compared to the board firmware i=
f I add
> > > it the expected order. This may or may not be a problem but to avoid =
it I
> > > can build the tree in reverse order then it comes out right so unless
> > > there's an easy fix this should not cause a problem but may worth a c=
omment
> > > somewhere.
> >=20
> > The order of things in the device tree *should* never matter.  If it
> > does, that's definitely a client bug... but of course that doesn't
> > necessarily mean we won't have to work around it in practice.
>=20
> I don't know if it matters or not but having the device tree in the same
> order as the firmware ROM helps with comparing it for debugging but I've
> found I can solve this by building the tree in reverse order so no changes
> to VOF is needed for this, just thought adding a comment somewhere may
> clarify it but it's not really a problem.
>=20
> I still don't know what's MorphOS is missing, I've tried adding almost all
> misssing properties, checked what hardware is init by the firmware and tr=
ied
> to do the same in board reset code and even after that MorphOS still take=
s a
> different route with VOF and crashes but boots with the board firmware. I=
'm
> now thinking it may be either different memory organisation or the missing
> name properties that are not returned by nextprop in VOF so they are only
> appearing when explicitely queried whereas with the board firmware they a=
re
> present as properties. With the above patch I could explicitely set it on
> nodes and test if that makes a difference.
>=20
> I got to this because adding more missing props or init more devices did =
not
> make a difference so I'm guessing it may be something else then and the o=
nly
> difference I can see compared to board firmware are the different memory
> ranges in claimed (VOF puts itself to 0 for example); and the missing name
> and additional phandle props in the device tree. MorphOS copies the whole
> device tree on startup then later it uses this copy of the device tree af=
ter
> shutting down OF with quiesce. I can imagine it may use some name props l=
ike
> that on the cpu node without checking assuming it's always there and if
> we're missing that it may cause a NULL dereference. I have no better idea
> what else could be missing so I'll test this next. If it helps I can try =
to
> come up with a patch to VOF to return these name props or allow setting t=
hem
> as above.
>=20
> Regards,
> BALATON Zoltan
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4ieJaEtcxVvxKJuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9jPgACgkQbDjKyiDZ
s5Jbkg//bcWbloz/fXw1JxdCHAxdBypSEN9/lsHmgNNbK3O82soaWHTiDH2Utc6Y
hfGd/AY0BmxhIuMUW5hvj6Og9sgdXw067n1QcGW2P46libbqysFAwCvz/pajTHsv
oTwBEXZcpzWHPf/1d/b4W8SOwmzCa0v+FZbLT8LS9uMLlPRiJGmsvkQ4hGVlPOB8
0ndYT7J8N6F+jjJefAjB16/t0ER1YxugXUm9wZa4MTL+w0ogClwOTbaeINU+nR33
xZADE3f2JgzqcV9Oj5NV/XnlpfiXilfva28pZ+o8gMQDIKwsE3Qk02nLoUAVxC+w
8jGjEsLcKnl7T5qc99budYJ3gB2v9q+zGkr0oD//bJ8TTjeoQ9L1Qn3DVWDh0Orw
B/qVACCeAddVAEYwONFrHrnrvLLN4bqwWA41u7dTEOUbjrBtYyfac8JkTb4HJ3IH
oA9XBrKWIOGUMXQksZ+bvntn1FJgMivX3UdvqNTIo5Yb31DEWZU2y7PFk4f6MSO4
2MSQ9bsq5HC44+/kuF7Kto7E2afdJcWwtndWymsZR1hawPsFGr4j+I5tIFpjE7HY
VSq6fEBh+NCuAP/wgtUr+yErFC8FTa1f5/wCmB0kfQgkBdAgLDAzjJKvhbNjFRVo
a7qLZSUyzv9uic9cMte6LnQKDJLMhC/mj0umMpsaprkGwLpiVgE=
=ySRp
-----END PGP SIGNATURE-----

--4ieJaEtcxVvxKJuJ--

