Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2C3453A3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 01:13:16 +0100 (CET)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOUfb-0005ag-LG
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 20:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUc3-0004Qy-8i; Mon, 22 Mar 2021 20:09:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49569 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUbz-0006ZV-SV; Mon, 22 Mar 2021 20:09:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4BYz1pjBz9sWC; Tue, 23 Mar 2021 11:09:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616458167;
 bh=iKLPHJFvKpoEjXpxCfXOyO4++tGfEVXXPFtdkJo7V5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WckNZkGbicfShMh0bs8lGBruZAdBeD5RICqUytY79aQeMzelTllQKO7Hly3j5t3ok
 I+BEQ4/dH7Eo8cDd+f7vC8WnswtysNp6NK11dxAarpjVnFpReQQSQDXF9S2bsR2gyf
 Rr5XyRzBLSQTYPIx3JaXRLgxqDSUm+9t6jEu/Kt4=
Date: Tue, 23 Mar 2021 11:08:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
Message-ID: <YFkxbegInaEHdqwG@yekko.fritz.box>
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
 <YFgNZFAKjVhder2R@yekko.fritz.box>
 <CAEUhbmV4=yz1Df9YDxsM1Evjd4dJA2rM8xoiSUvxEtOoL2z2xg@mail.gmail.com>
 <YFgoXU8tRCKWd0pk@yekko.fritz.box>
 <CAEUhbmUrJYx-yOyVTVOV4M-+9gS5VtaSbTzMzvHVTvDqEkb8Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eT+kP3jP0QXE02ne"
Content-Disposition: inline
In-Reply-To: <CAEUhbmUrJYx-yOyVTVOV4M-+9gS5VtaSbTzMzvHVTvDqEkb8Lg@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eT+kP3jP0QXE02ne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 01:48:07PM +0800, Bin Meng wrote:
> Hi David,
>=20
> On Mon, Mar 22, 2021 at 1:24 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Mon, Mar 22, 2021 at 12:33:06PM +0800, Bin Meng wrote:
> > > Hi David,
> > >
> > > On Mon, Mar 22, 2021 at 12:11 PM David Gibson
> > > <david@gibson.dropbear.id.au> wrote:
> > > >
> > > > On Tue, Mar 16, 2021 at 04:15:05PM +0800, Bin Meng wrote:
> > > > > As the comment of tx_padding_and_crc() says: "Never add CRC in QE=
MU",
> > > > > min_frame_len should excluce CRC, so it should be 60 instead of 6=
4.
> > > >
> > > > Sorry, your reasoning still isn't clear to me.  If qemu is not addi=
ng
> > > > the CRC, what is?
> > >
> > > No one is padding CRC in QEMU. QEMU network backends pass payload
> > > without CRC in between.
> >
> > Ok, but the CRCs must be added if the packets are bridged onto a real
> > device, yes?  Where does that happen?
>=20
> I've never used it like that before. What's the command line to test that?
>=20
> > >
> > > > Will it always append a CRC after this padding is complete?
> > >
> > > No.
> >
> > If that's true, then won't the packets still be shorter than expected
> > if we only pad to 60 bytes?
>=20
> In QEMU packets are transmitted without CRC between network backends,
> and when a NIC receives a packet, the minimum required payload length
> is 60 bytes without a CRC.

Ok, I see what you're saying, and indeed it already pads to 60 bytes,
rather than 64 on the Rx side.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eT+kP3jP0QXE02ne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZMW0ACgkQbDjKyiDZ
s5LQOg//QqFkJAuxU+i4SQa7xfdbqkh4sI8pbNgM+jpjg9LfAAyTtARkIvxGo9/s
GiXMW0EkaKH9B7fVK0fvGP/g/ziiHxLU7SQSAR8wK84upv2e7Fqd2/a9uesCKLa7
DiVpTdhQZTHU5IrseIIqYcI5JnESHLVmS2ddogCw9cZvLz52pMS0R2PYPBDKcJn/
vbMIiuXoC8GmtqTmghkacqcMXaLF8yyYSZe+wFugHFM0O443HpXrzt1upyLikTe1
pJebzLHMwP78bksWRm3YfaIWvlQyjmgyG9WlCFeSPOpD1PxZOjCmipxfONZFCQiF
ITRCdalSzG3Ftm8FYkiLw4Y44+UymYDh+7J01X/dpoDkKnAqeU25x7ecA/sih4lx
R2ZKKiCEWMJJDl08Q78perzP4MMtgR3KLY8MvPE4pg7zn258p/QDGVyKcjzLy5Ce
RFDBD+Wn74U15i3N6/Z3Rg38OeZWq0okMiI9s75Zm/Con8Z5lujXJnyf1DPBFbzi
b+ND5DNyGjJKWi5DR9TxkwEbtDxKGkUzXUDiEQ8AJFnUZ0aIstYHf1iVZmgLixOK
e3pM1ksK17zEY7JhkgacyLOvS40Dd3CG54RApRwbrZkxd5ttuqfDhZgWiJiP45oq
eE290gGxd/34ap1IB3TEl2qp3mX0iJ1ir8VriqF4W7+DCKbSCvM=
=/gb2
-----END PGP SIGNATURE-----

--eT+kP3jP0QXE02ne--

