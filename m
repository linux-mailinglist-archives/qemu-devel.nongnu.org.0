Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8E36774D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 04:18:24 +0200 (CEST)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZOv9-0005fa-4C
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 22:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZOtW-0004iK-3g; Wed, 21 Apr 2021 22:16:42 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:32785 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZOtT-0003kw-HL; Wed, 21 Apr 2021 22:16:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FQgyn5FTFz9sV5; Thu, 22 Apr 2021 12:16:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619057793;
 bh=P8Fv8uSBv0cP5dn+Q9RbqTiNCKFLjcE8Ep1/zO9u8sE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UJYJ3a0+F8m7IulqOKP1akHZ+HoTo0WtLsyZEf2pDtmjpdMxtjUC10Eb0jHosH1uE
 BHtz+yO14Aame59+/gjUpR2rThksf9Byy4gduLry0oRcHacHQ7B1joutIZ/LrDZaVE
 /drNQrjDUC8WlRQ0VAfSP8E3O3pYwh+FiDiSxW/U=
Date: Thu, 22 Apr 2021 12:00:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v18] spapr: Implement Open Firmware client interface
Message-ID: <YIDYy14pXebXpuKL@yekko.fritz.box>
References: <20210331025308.29387-1-aik@ozlabs.ru>
 <YH5HCBE9moRuIpZZ@yekko.fritz.box>
 <a51df3f5-4b46-31a7-a526-a5d48f299e35@ozlabs.ru>
 <YH+30xHgYU6oVeCY@yekko.fritz.box>
 <85770051-50df-7d5c-966e-a6e80797b39d@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KD7mao4yV4/QC8sr"
Content-Disposition: inline
In-Reply-To: <85770051-50df-7d5c-966e-a6e80797b39d@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KD7mao4yV4/QC8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 04:50:12PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 4/21/21 15:27, David Gibson wrote:
> > On Tue, Apr 20, 2021 at 07:16:35PM +1000, Alexey Kardashevskiy wrote:
> > > On 20/04/2021 13:14, David Gibson wrote:
[snip]
> > > > > diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> > > > > new file mode 100644
> > > > > index 000000000000..1451e0551818
> > > > > --- /dev/null
> > > > > +++ b/pc-bios/vof/Makefile
> > > > > @@ -0,0 +1,18 @@
> > > > > +all: build-all
> > > > > +
> > > > > +build-all: vof.bin
> > > > > +
> > > > > +%.o: %.S
> > > > > +	cc -m32 -mbig-endian -c -o $@ $<
> > > >=20
> > > > Should probably use a $(CC) variable to make it easier for people to
> > > > point this at a cross-compiler.
> > >=20
> > >=20
> > >=20
> > > CROSS ?=3D
> > > CC =3D $(CROSS)gcc
> > > LD =3D $(CROSS)ld
> > > OBJCOPY =3D $(CROSS)objcopy
> > >=20
> > >=20
> > > ?
> > >=20
> > > Works with
> > >=20
> > > make CROSS=3D/opt/cross/gcc-10.1.0-nolibc/powerpc64-linux/bin/powerpc=
64-linux-
> >=20
> > I was just thinking "CC =3D cc" etc. so someone can override it from the
> > command line, but your suggestion is even better.
>=20
>=20
> I am not sure why (there is no "?" in "CC=3D"/etc) but this works too wit=
h the
> change above:

The command line overrides variables in the Makefile by default, using
?=3D just lets environment variables override them as well.

[snip]
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    g_array_sort(claimed, of_claimed_compare_func);
> > > > > +    vof_claimed_dump(claimed);
> > > > > +
> > > > > +    /*
> > > > > +     * VOF resides in the first page so we do not need to check =
if there is
> > > > > +     * available memory before the first claimed block
> > > > > +     */
> > > > > +    g_assert(claimed->len && (g_array_index(claimed, OfClaimed, =
0).start =3D=3D 0));
> > > > > +
> > > > > +    avail =3D g_malloc0(sizeof(avail[0]) * claimed->len);
> > > > > +    for (i =3D 0, n =3D 0; i < claimed->len; ++i) {
> > > > > +        OfClaimed c =3D g_array_index(claimed, OfClaimed, i);
> > > > > +        uint64_t start, size;
> > > > > +
> > > > > +        start =3D c.start + c.size;
> > > > > +        if (i < claimed->len - 1) {
> > > > > +            OfClaimed cn =3D g_array_index(claimed, OfClaimed, i=
 + 1);
> > > > > +
> > > > > +            size =3D cn.start - start;
> > > > > +        } else {
> > > > > +            size =3D be64_to_cpu(mem0_reg[1]) - start;
> > > >=20
> > > > Don't you have vof->top_addr for the end of the ram you care about,=
 so
> > > > you don't need to go poking at the memory node?
> > >=20
> > >=20
> > > top_addr is limited by 4GB but memory@0 is not and I'd like "availabl=
e" to
> > > report free memory till the end of the memory@0 node part of which
> > > "available" is.
> >=20
> > Hmmm.  AIUI the purpose of 'available' is so the client can know what
> > things it can claim, but IIUC claim only works in the 32-bit arena up
> > to top_addr.  So, does it really make sense to have it include stuff
> > beyond that?
>=20
>=20
> I am really not sure. The format uses 2 cells for an address. The client
> cannot claim memory above 4GB as the CLI ABI returns only cells but the
> firmware may run 64bit, use some memory above 4GB and report this use to =
the
> client so the client would have to avoid using that memory until ... I do
> not know... quiesce?

Huh.. yeah, that's pretty confusing.

> It is all very theoretical of course but still feels safer to stretch
> "available" till the end of the node.

Ok, you've convinced me.

[snip]
> > > > > +void vof_build_dt(void *fdt, Vof *vof)
> > > > > +{
> > > > > +    uint32_t phandle;
> > > > > +    int i, offset, proplen =3D 0;
> > > > > +    const void *prop;
> > > > > +    bool found =3D false;
> > > > > +    GArray *phandles =3D g_array_new(false, false, sizeof(uint32=
_t));
> > > > > +
> > > > > +    /* Find all predefined phandles */
> > > > > +    for (offset =3D fdt_next_node(fdt, -1, NULL);
> > > > > +         offset >=3D 0;
> > > > > +         offset =3D fdt_next_node(fdt, offset, NULL)) {
> > > > > +        prop =3D fdt_getprop(fdt, offset, "phandle", &proplen);
> > > > > +        if (prop && proplen =3D=3D sizeof(uint32_t)) {
> > > > > +            phandle =3D fdt32_ld(prop);
> > > > > +            g_array_append_val(phandles, phandle);
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    /* Assign phandles skipping the predefined ones */
> > > > > +    for (offset =3D fdt_next_node(fdt, -1, NULL), phandle =3D 1;
> > > > > +         offset >=3D 0;
> > > > > +         offset =3D fdt_next_node(fdt, offset, NULL), ++phandle)=
 {
> > > > > +        prop =3D fdt_getprop(fdt, offset, "phandle", &proplen);
> > > > > +        if (prop) {
> > > > > +            continue;
> > > > > +        }
> > > > > +        /* Check if the current phandle is not allocated already=
 */
> > > > > +        for ( ; ; ++phandle) {
> > > > > +            for (i =3D 0, found =3D false; i < phandles->len; ++=
i) {
> > > > > +                if (phandle =3D=3D g_array_index(phandles, uint3=
2_t, i)) {
> > > > > +                    found =3D true;
> > > > > +                    break;
> > > > > +                }
> > > > > +            }
> > > > > +            if (!found) {
> > > > > +                break;
> > > > > +            }
> > > > > +        }
> > > > > +        _FDT(fdt_setprop_cell(fdt, offset, "phandle", phandle));
> > > >=20
> > > > I still think this is needlessly complicated, and you should just f=
ind
> > > > max phandle and work from there.
> > >=20
> > >=20
> > > I still think this is more developer's tool than anything else and ha=
ving
> > > random phandles is not helping. With less random phandles you can set
> > > conditional breakpoints in gdb scripts and they do not need to change=
 when,
> > > for example, you switch from ibmvscsi to virtio-scsi.
> >=20
> > Um... I don't seew how this logic's phandles are any less "random" than
> > starting from the max existing one.  What you allocate still depends
> > on what existing phandles happen to be in the tree.
>=20
>=20
> I was thinking that all PCI devices get phandles via PHANDLE_PCIDEV() but
> this is only for NVLink which we are removing now. Well. Ok. I'll do it y=
our
> way for now and see if anybody cares. At least this is faster, Nick is go=
ing
> to like it :) Thanks,

:)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KD7mao4yV4/QC8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCA2MsACgkQbDjKyiDZ
s5LHLg//ezq/RFF2ZadCLY6eqEE80w/MrZqSQj5CeV7Bg7Su1u5x+QenQm0fUKpP
thY2wxWK5ifcLxrqAJkONTHS7yLxol49w0i8baraXJZ+tp/2QLRVs2uhCu5U2WUE
kFu0v+dEVwzvIm/Xac0CLgSnJQe5gRuRB8yfpeJJRRHJH8/MCqjKcI44sThZb0uQ
uN+EJEgNYuB78iQHSP9q/Sfcs98N6X0Z/ytS39itNNBxNNhmzo8RlT56T/JPEaGK
8m4wlL8pX0LmSnn6D1qR03uyRD+umXrz+TGp4E/BXJx1mzXnFK/Th3C2cd9/Jgas
SCy9YsAQo/NLpSYNWOrX89bfHIF5xPdca8xCYSZEyw/PLNID2gF1DgkX3g3WDUht
NlaSYHLdUxMCZ4hSpvKhdqxkUPfO8PZSJLtn18hoJN3FllZ05ROMVsrqSVlBs0CL
KKHsM2bK5FNKhXA2y4xzj6VkoEqHXDiegUhW9duum7I1kluZikJUqa/0nTjmzHHH
UqfoUKi1BTIVHm0OtrLt0gFUbZOWfiUP5hrA6Fiug9GgHl/v55yP5YfCWPKeNYx9
Sj3RHf/MUptSRD/IIJH8s37/pnHo71RPhVPK/7yUNnRJZ5P+1C6oMROISOMOb0WM
4W61/NHRFQJxvyWEIRCSPisZ5Sg7TmorEfW2Kkji8c64S0ssUak=
=nW1i
-----END PGP SIGNATURE-----

--KD7mao4yV4/QC8sr--

