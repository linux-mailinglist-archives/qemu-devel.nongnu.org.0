Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F2315CEF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 03:11:21 +0100 (CET)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9eyO-00072A-DV
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 21:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ewK-0006R0-NN; Tue, 09 Feb 2021 21:09:15 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ewD-0005TR-4n; Tue, 09 Feb 2021 21:09:12 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db38p5DpFz9sVF; Wed, 10 Feb 2021 13:08:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612922938;
 bh=oi2rk+ITw3XbmilxQ9VB4OWQfM7HGbI8mjcoEURkzxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fhyZrLMqyhl9bVU7zMWcwYalpT1k2ESiodUV8RURDWmHZL9ZWsbRLy2R37hSrfiXZ
 Is6nLNHLDm1qhtVRqOegeNNJvE2yjZKBTAmIJoK1vxkrmBCegAYnXMVNLQarRyw3fv
 xwdNPyt5MEIBruBVag9hNpIDJLn74GWCQQorlVd0=
Date: Wed, 10 Feb 2021 13:08:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] target/ppc: Add E500 L2CSR0 write helper
Message-ID: <20210210020852.GG4450@yekko.fritz.box>
References: <1612777258-23354-1-git-send-email-bmeng.cn@gmail.com>
 <20210210014159.GE4450@yekko.fritz.box>
 <CAEUhbmWeH5CDRodyYtYs-f0G-SUdksop4MRiHTocntbcWM3rmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline
In-Reply-To: <CAEUhbmWeH5CDRodyYtYs-f0G-SUdksop4MRiHTocntbcWM3rmA@mail.gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 09:53:53AM +0800, Bin Meng wrote:
> Hi David,
>=20
> On Wed, Feb 10, 2021 at 9:50 AM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Mon, Feb 08, 2021 at 05:40:58PM +0800, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > There are several bits in L2CSR0 (exists in the e500mc/e5500/e6500
> > > core) that should be self-cleared when written:
> > >
> > > - L2FI  (L2 cache flash invalidate)
> > > - L2FL  (L2 cache flush)
> > > - L2LFC (L2 cache lock flash clear)
> > >
> > > Add a write helper to emulate this behavior.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > IIUC, these are essentially write-only bits - they have some side
> > effect when written on real hardware, but won't ever be read back.  Is
> > that correct?  Do you have a reference to hardware docs describing
> > this behaviour?
> >
>=20
> Please see https://www.nxp.com/files-static/32bit/doc/ref_manual/EREFRM.p=
df,
> chapter 3.11.2

Ah, thanks.  So these actually don't operate quite how I was
suggesting - they are readable, and return 1 until the operation is
completed.

So what you're effectively doing here is simulating the cache
operations completing instantly - which is correct because we don't
model the cache.

Can you please clarify that in your commit message, including the
pointer to the chip doc.

> > I'm assuming that because we don't model the L2 cache, it's ok that
> > your implementation just ignores writing these bits, rather than
> > performing the cache operations requested?
>=20
> Yes, guests may read back these bits to confirm the operation is done
> by hardware after writing 1 to these bits.
>=20
> >
> > Is that still true for the flash clear operation?
>=20
> Yes.

Ah, yes, I see.  The name made me think this might be something like
dcbz, which has visible effects on architected state.  This is just
clearing cache locks, which we don't model in any case.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjQDMACgkQbDjKyiDZ
s5J/pw/+MTzxxoDPg0UyBfT2C8nqXE6CnKVY0FKc5K1Cy4zYV1Af8/afHYCEOLN7
Ekds5gIrfZYU/t/iV2a15lVxmsXVvN+Y/fPFgAKyzfAwUgbYB9t5+zqp92DfBlmN
O8w1vsiDdbhyrRgX4+c3woHd+HxeYbRIaI2xwYzV73l8RJohSBr3dy8Rr1Qu9JjE
QG0lUf00UXIw8qzaKocCC4msSiqFVvONoAUCOGpBEZrSwL1t7DZQ9O5sq9ru+32Y
zwD+MdjoAAucIL7MffLbz0xXfBlbpnSQdLd5rOVAGh96PoNjW+qOjw81ZmhDnsGt
nwRMK763jKSN//ky9VsNC67Cb70+2tFfrcGb3P07TYuj7W3wUZmNcII6dvcwrfBM
wmnyPlgYOvtN4ekQ7yhsvqNLgNemzcSu+bXLeK5bcYaFjCYBSqMtEkZfy1OTtlyG
ywpA7I5w9gcj9HL/27vgZ55tPMiCCPyNFMB12+zSy7guddMioPnJo44iIZwXNfxg
B4exPba0MVLesbryU9uRg1Nrz//3wVudwWYSHdPfxgRgj/qMTmAyp1kzqbQ3XaVR
dUCSqafmJgwqDb9Li5a2/mAVKnNMiCAg9NoRwIpugag/uafBkdhrMib6l5/sGKJC
61hNywtjsYXkkkD4t39JFZEaEaxdE0S5/DFRaqlWJ0rtffIrm9k=
=0GLy
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--

