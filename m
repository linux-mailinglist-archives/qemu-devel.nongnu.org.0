Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBFF5A8D72
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:41:48 +0200 (CEST)
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTcxX-0005wN-8R
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oTcmK-0001t5-0k; Thu, 01 Sep 2022 01:30:13 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:34387
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oTcmE-000848-54; Thu, 01 Sep 2022 01:30:10 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MJ8kY64T0z4xG6; Thu,  1 Sep 2022 15:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1662010197;
 bh=ZBYGA86CgP11bysP2aDumIBQPBPeXg7J63v4bVu20/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SY6Lt65yu9gOvOiSipb7t4xa/DY8ks6lzJlUw3YdIKSDo7xezZkDizK8T2p6ODfpZ
 I6sFjYt0fgN9nYrTJL3Qk5h1C2YiX01rm4rIUF11iL52z9HWvyLPfkvGtlGBhcrDT4
 +4bxOtvHrQ87GByfcpjBlimCTrzX2d2u3cbVudqM=
Date: Thu, 1 Sep 2022 12:10:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v4 15/21] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Message-ID: <YxAUeLCztdVOEjpU@yekko>
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-16-danielhb413@gmail.com>
 <YwwzyxSCB8rP/usi@yekko>
 <45bd4519-1529-c147-cd99-c68e1045d2f2@gmail.com>
 <Yw1s6A3zCa8hjFAl@yekko> <877d2qj9kk.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/mILAeYlS0yYyYSK"
Content-Disposition: inline
In-Reply-To: <877d2qj9kk.fsf@pond.sub.org>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
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


--/mILAeYlS0yYyYSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2022 at 12:43:23PM +0200, Markus Armbruster wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Aug 29, 2022 at 07:00:55PM -0300, Daniel Henrique Barboza wrote:
> >>=20
> >>=20
> >> On 8/29/22 00:34, David Gibson wrote:
> >> > On Fri, Aug 26, 2022 at 11:11:44AM -0300, Daniel Henrique Barboza wr=
ote:
> >> > > Reading the FDT requires that the user saves the fdt_blob and then=
 use
> >> > > 'dtc' to read the contents. Saving the file and using 'dtc' is a s=
trong
> >> > > use case when we need to compare two FDTs, but it's a lot of steps=
 if
> >> > > you want to do quick check on a certain node or property.
> >> > >=20
> >> > > 'info fdt' retrieves FDT nodes (and properties, later on) and prin=
t it
> >> > > to the user. This can be used to check the FDT on running machines
> >> > > without having to save the blob and use 'dtc'.
> >> > >=20
> >> > > The implementation is based on the premise that the machine thas a=
 FDT
> >> > > created using libfdt and pointed by 'machine->fdt'. As long as this
> >> > > pre-requisite is met the machine should be able to support it.
> >> > >=20
> >> > > For now we're going to add the required QMP/HMP boilerplate and the
> >> > > capability of printing the name of the properties of a given node.=
 Next
> >> > > patches will extend 'info fdt' to be able to print nodes recursive=
ly,
> >> > > and then individual properties.
> >> > >=20
> >> > > This command will always be executed in-band (i.e. holding BQL),
> >> > > avoiding potential race conditions with machines that might change=
 the
> >> > > FDT during runtime (e.g. PowerPC 'pseries' machine).
> >> > >=20
> >> > > 'info fdt' is not something that we expect to be used aside from d=
ebugging,
> >> > > so we're implementing it in QMP as 'x-query-fdt'.
> >> > >=20
> >> > > This is an example of 'info fdt' fetching the '/chosen' node of the
> >> > > pSeries machine:
> >> > >=20
> >> > > (qemu) info fdt /chosen
> >> > > chosen {
> >> > >      ibm,architecture-vec-5;
> >> > >      rng-seed;
> >> > >      ibm,arch-vec-5-platform-support;
> >> > >      linux,pci-probe-only;
> >> > >      stdout-path;
> >> > >      linux,stdout-path;
> >> > >      qemu,graphic-depth;
> >> > >      qemu,graphic-height;
> >> > >      qemu,graphic-width;
> >> > > };
> >> > >=20
> >> > > And the same node for the aarch64 'virt' machine:
> >> > >=20
> >> > > (qemu) info fdt /chosen
> >> > > chosen {
> >> > >      stdout-path;
> >> > >      rng-seed;
> >> > >      kaslr-seed;
> >> > > };
> >> >=20
> >> > So, I'm reasonably convinced allowing dumping the whole dtb from
> >> > qmp/hmp is useful.  I'm less convined that info fdt is worth the
> >> > additional complexity it incurs.  Note that as well as being able to
> >> > decompile a whole dtb using dtc, you can also extract and list
> >> > specific properties from a dtb blob using the 'fdtget' tool which is
> >> > part of the dtc tree.
> >>=20
> >> What's your opinion on patch 21/21, where 'dumpdtb' can write a format=
ted
> >> FDT in a file with an extra option? That was possible because of the
> >> format helpers introduced for 'info fdt'. The idea is that since we're
> >> able to format a FDT in DTS format, we can also write the FDT in text
> >> format without relying on DTC to decode it.
> >
> > Since it's mostly the same code, I think it's reasonable to throw in
> > if the info fdt stuff is there, but I don't think it's worth including
> > without that.  As a whole, I remain dubious that (info fdt + dumpdts)
> > is worth the complexity cost.
>=20
> How much code does it take, and who's going to maintain it?

It's not especially big, but it's not negligible.  Perhaps the part
that I'm most uncomfortable about is that it requires a bunch of messy
heuristics to guess how to format the output - DT properties are just
bytestrings, any internal interpretation is based on the specific
bindings for them.

dtc already has these and I don't love having a second, potentially
different copy of necessarily imperfect heuristics out in the wild.

> > People with more practical experience debugging the embedded ARM
> > platforms might have a different opinion if they thing info fdt would
> > be really useful though.
>=20
> They better speak up then :)

Just so.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/mILAeYlS0yYyYSK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMQFHEACgkQgypY4gEw
YSKkag/9H11vOv1NyWXog9KoatPhzyJiVQBObArDrzBDgEEXDCU2zCc8XsbPqD65
N80UWmBb9zva5KC2jov1tbqxzmXdpBgWHK6tITiIh4Z9Jov3f78GEAx279lZTTPq
rQOqx34EkocWu4aDfpAPQhmDxdlffEAzO7n/c5zqRiANf+SokbH6EhaMx8zona9k
FQwRYcZYTrH1FTzVIw4QhNdJgAo1w1e5QL1HlASX68CUM0RCPDH7nP9DtmKuWVkE
rSB94aKZHSzM2vK+AwTqZ6Xe/EXMO3bsfNoy/jEW2W+gkSu1x8Dr/EwhqRDh2U89
Dqi8Or2c4fnpbj5T+MVHUOZn/I7e9/fytS6mLTuE4CDMZyIj6vdNBRcdElYhtVQr
rTgFGCzNVy4qpNE2DRSiiHsACVP5yYOOCOHexDh2v6AIZwC/HkGuYebtGXf7D1HM
Axl88dkRuKlGIoNL6CHR2VE0nF2qFNPZQQ6V68aqaKJgkkzohzZDMgKHYFA3rk+b
spW2FvDtLDC1Ky9fDo22U9c8OlqtwLV3QM1abgOIGopEWDKiLsdFA5wmpX9XXkIK
tSNJbCKaUVnXBgUHyCg12fumtoqnmHY1D6Gv4sgt/brvPRAg4S+bnOam6K95R/Lq
gIq0VrE9jkp/16pjkY8kOqY7NKXj4tk3W3F9Wq55nW/zsk1FSDY=
=rPmq
-----END PGP SIGNATURE-----

--/mILAeYlS0yYyYSK--

