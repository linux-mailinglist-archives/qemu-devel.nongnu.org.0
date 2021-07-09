Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F243C1CF8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 03:12:52 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1f4V-0004vY-6y
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 21:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eyv-0006nI-Cs; Thu, 08 Jul 2021 21:07:06 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eys-0003Cw-Jl; Thu, 08 Jul 2021 21:07:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLZkT4sqHz9sjJ; Fri,  9 Jul 2021 11:06:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625792817;
 bh=21kZzSZ0hrfLstTR0ukEYAqq817pGlIiqr1nv+I+1bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7iY9fc+ApHnWtzwYP9m2y3y5lee0xy+QIuX4SVB+ieMLxdXId//xQZM9gM8+8Cec
 aARu9aOywdg9PFTw8FL/lxDHkP8DY53uVik3XRmR2uS/OeiFIQpWXUfAedKtWE1cVW
 wfSEE8bNM+5MsERStxtM9dhvLLAuoWEV09tTU/Ew=
Date: Fri, 9 Jul 2021 10:54:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
Message-ID: <YOeeR6Uj9mhqG0j2@yekko>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <22b9ae49-7252-b664-ea98-99bb7baf4680@eik.bme.hu>
 <07d3a270-6d44-591d-d0ee-0264d3b4c7f2@ozlabs.ru>
 <4a903fde-4ea-a296-3132-bae249d261a@eik.bme.hu>
 <6a25eed6-22db-7d5c-6686-67322b70a83f@ozlabs.ru>
 <70991a4-7d9-3a1c-dd53-4b7da2c39a0@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0n7X6r0xpgvYOuU2"
Content-Disposition: inline
In-Reply-To: <70991a4-7d9-3a1c-dd53-4b7da2c39a0@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0n7X6r0xpgvYOuU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 03:00:22PM +0200, BALATON Zoltan wrote:
> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
> > On 08/07/2021 20:39, BALATON Zoltan wrote:
> > > On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
> > > > On 08/07/2021 20:18, BALATON Zoltan wrote:
> > > > > On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
> > > > > > This addresses the comments from v22.
> > > > > >=20
> > > > > > The functional changes are (the VOF ones need retesting with Pe=
gasos2):
> > > > > >=20
> > > > > > (VOF) setprop will start failing if the machine class callback
> > > > > > did not handle it;
> > > > >=20
> > > > > I'll try this later but I think I've seen guests using
> > > > > setprop (Linux also does that for some property). How should
> > > > > I allow that? Do I need a new callback for this? Could it be
> > > > > allower unless there's a callback that could deby it? But
> > > > > that was the previous way I think.
> > > >=20
> > > > A simple defined callback which always returns "true" should do.
> > >=20
> > > Yes but what's the point? That would just effectiverly disable this
> > > change so if we need that, we could just as well keep the previous
> > > behaviour which is to allow setprop unless there's a callback that
> > > can decide otherwise. The spapr machine has such a callback so it
> > > already does not allow all setprop and if I'll have a callback in
> > > pegasos2 returning true that will allow what's allowed now so this
> > > part of this patch does nothing indeed.
> > >=20
> > > Since guests could do all kinds of things that we don't know without
> > > trying them restricting setprop is a good way to run into problems
> > > with guests that were not tested that could otherwise just work.
> > > Then we'll need another patch to enable that guest adding some more
> > > properties to the list of allowed ones. Why it it a problem to allow
> > > this by default in the first place and only reject changes for
> > > machines that have a callback? Then I would not need more empty
> > > callbacks in pegasos2.
> >=20
> >=20
> > From here:
> > https://patchwork.ozlabs.org/project/qemu-devel/patch/20210625055155.22=
52896-1-aik@ozlabs.ru/#2714158
> >=20
> > =3D=3D=3D
> >=20
> > > > > +    if (vmo) {
> > > > > +        VofMachineIfClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> > > > > +
> > > > > +        if (vmc->setprop &&
> > > > > +            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
> > > > > +            goto trace_exit;
> > > >=20
> > > > This defaults to allowing the setprop if the machine doesn't provid=
e a
> > > > setprop callback.  I think it would be safer to default to prohibit=
ing
> > > > all setprops except those the machine explicitly allows.
> > >=20
> > >=20
> > > Mmmm... I can imagine the client using the device tree as a temporary
> > > storage. I'd rather add a trace for such cases.
> >=20
> > If they do, I think that's something we'll need to consider and
> > account for that platform, rather than something we want to allow to
> > begin with.
>=20
> I've seen that, yet I don't understand why. If I'll just add an empty
> callback in pegasos2 to disable it then we're back to where we were befor=
e.
> So my question is why do we want to explicitely enable setprop for every
> guest when we encounter it one by one (especially if this works on other =
OF
> implementations so guests are free to change the device tree therefore we
> don't know in advance what are allowable properties). If you don't want it
> for spapr I think you already have the callback for it that disallows it =
for
> all but at a few properties but why change the default for other machines
> that don't have a callback? If I can still add an empty callback that cou=
ld
> well be the default just to avoid more boilerplate in board code.

Because I think hitting the failure and deciphering that we need to
add setprop logic is likely to be less pain in the long run, than
allowing setprop by default, then discovering things break because the
guest expected that setprop to have some semantic effect beyond just
changing the dt, and we never even realized it was doing it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0n7X6r0xpgvYOuU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDnnkcACgkQbDjKyiDZ
s5KlchAAyfl/Dyit2XOQUc9QvPjF6D/SYsWj4SrTY1qG7xjtlqfiNyiWlKJyDoNr
8GM9iah7qKSlukL1H0pP+H7qBz2yqixu/+2ChtS3NC4X7bfK0liH90XeUK4AN1W1
8Z29WgqhHWXvWrwQAJfvGrzuJA28GRaz3ghgSi6ur4z0RXdlo7IxYic1wTdKLcit
rA/nriqvge9VS98bAcEtroC74m2inKN1Ashvo0Sq06ptzW/xV7lXo9BW665eq5IV
uve/AR6f9KYLt1KeaE37loMG7hA6pV4TRGY16lC4YMdEgtkW0+h3ozvUFyrwusSQ
JZIwuItfKC6+G/uzmgudOsBEofUUvmtnKrN/1TF//WrgXaJqOiilcNQaz3eDrKRe
TTnRq2RQX8hwG/Dehi4dmb36PaHJ+S45XWNi+6e9mDHmZ4bKSyVz6+97s9Yi2i+J
TrFyo1LfY3tQ5RvefZSQdWuS3QZQDU57QRqVhnOMDOx/r/jQe+Yu5USjrSNrqe6O
kdvX0eG3rf+aoMeu5jsFc5IG7nc3uIhxIWwibTor07wyR9bdHEx9jGVhEHKM00zA
V2I6xLVY078bqx2zQZeTqxaNifAwf7E9y99Iz8EPHbs3bVYHySvXK/1CJ6JaC+Ip
mxxS2x7sqvkRwWPyBoA4UX8k1KJaeth001IeMYBkULyLms/K0DQ=
=CaTp
-----END PGP SIGNATURE-----

--0n7X6r0xpgvYOuU2--

