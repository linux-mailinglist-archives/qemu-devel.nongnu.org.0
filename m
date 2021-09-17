Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF040F688
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:09:13 +0200 (CEST)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBk0-0003F1-7E
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRBej-00010N-MB
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:03:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:45201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRBeg-0002K0-AH
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631876617;
 bh=jrYlGjRoy5hhpxwdL7v/Yq3vlH/FRt9A6RpfD+UHwYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c2j9lPjt47QSvG9bMXHWNzn5lBrQ+uRP/8HaKQeV+4BseSOSeqOBBtTauc0tVrYZC
 RI5yeCtvncrHry18ebHog07Av6j9jQS86X7XFu9icrdq7cbuZtsJ/Q8b7eRCrjO7XR
 8fWL0qbWx3WZvhQWURWIfyIKPFmhLFCgfzByXLUQ=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H9rfd5GfWz9sW4; Fri, 17 Sep 2021 21:03:37 +1000 (AEST)
Date: Fri, 17 Sep 2021 20:56:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUR0em243+ohOM2r@yekko>
References: <YURYvaOpya498Xx2@yekko>
 <87k0jfh88i.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uUdW+nPUmmfRRRo2"
Content-Disposition: inline
In-Reply-To: <87k0jfh88i.fsf@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, slp@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, alex.bennee@linaro.org, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uUdW+nPUmmfRRRo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 11:17:01AM +0200, Cornelia Huck wrote:
> On Fri, Sep 17 2021, David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > Hi all,
> >
> > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > whether Rust supported all the host/build platforms that qemu does,
> > which is obviously vital if we want to make Rust a non-optional
> > component of the build.
> >
> > I've added the information to our wiki at:
> > 	https://wiki.qemu.org/RustInQemu
>=20
> Thank you for doing that!
>=20
> >
> > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > Windows are pretty much ok, with the exception of Linux on Sparc.
> > There are a lot of gaps in *BSD support, however.
>=20
> Yes :(
>=20
> Do we actually have an idea what we would require?

Not t this stage.  This is just based on the ticks in the table on the
Rust page, I haven't tried to look closer at any of the cases.

> I'm surprised that
> there are so many targets without host tools or without std support (but
> maybe they are only missing small things.)

Right.  So, it makes sense that Rust has a bunch of targets without
that support: a lot of them are embedded systems, where you'd expect
to be cross-compiling.  The intersection of that with the qemu build
platforms is weirder.

> > I've included some notes on where the information comes from, and some
> > uncertainties in there.
> >
> > I've made an effort to get the information correct, but double
> > checking would be appreciated.
>=20
> I did not spot any errors on a quick cross check, but I'm not really
> sure about what the BSDs support.
>=20
> >
> > I haven't yet looked into the packaging situation for the Rust
> > toolchain on various platforms and distros, but I still intend to do
> > so.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uUdW+nPUmmfRRRo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFEdHgACgkQbDjKyiDZ
s5KxABAAlAXARl1d9UZFPJru4JQevdIbnjGIPwEjyJJWzmTnG+3YN1mv6adHmVyY
eCS4iS7/XyukfMIsdjRzQxnoxRkoEIzl9OARFWO1uf0z+GJ8qzLBYi1Wh0+V70P+
Jl46HsCRT/2J/UMNdShtrHwcNaDuhTopGGjyj7HYXLaJHPKurt8/6jWDm1qGIucu
xwRmSgToD1SkudmV01/DBom0XMH4swMzSjT6Caq1Yrofhvy56sWa4vuBoy9E7jns
6tLdFQJiV3oHt95L0OSanu2Bwfmu8ThADJfq0vtZj/5w5ABEZtKMfdaiUULPsQeN
M9phTgMyZRT/tLiSgG0z6/OjJTZS4SfQIqRne2/ZqDlbgVCysLSGuuyuDwsn46Lq
NCyvyP4hRfynS6ILiVVGtRtZV9N9wcuKjVJEacQkmcg8kD0kt0uOjtaefjIXgJbZ
Ll4mdy8jnbuwiXwI4IJQEsj7QHP+4oUm6EY8RVQZeWMOl/ZATg0H8lvP2juhcUAf
WSCh9KiKfrvLVdjXvFWMtFqe2KshQoaEGS7NGoepU06DB3WDDsLB+6RJtwcLDTWV
9fY4RvAsaMhquMMFTyUq0AkfBpTpjBhc0MPLEtlw6tVm0NkfMN0eWCjO98smA4bm
kNpc+a/TgX0uTgyjPa107I8QhmRqHtCtAoJWT0xklowXoELfnIg=
=E8HX
-----END PGP SIGNATURE-----

--uUdW+nPUmmfRRRo2--

