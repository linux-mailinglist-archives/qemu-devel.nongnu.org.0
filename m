Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928926231
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:46:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTOlm-0007At-6e
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:46:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hTOjl-0006PA-Mh
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hTOjk-00081A-OJ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:44:45 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hTOjk-000805-Hp
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:44:44 -0400
Received: by mail-wr1-x444.google.com with SMTP id t7so1408890wrr.10
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OvgHGTQewo2Ou44WpDeXjaQ9A0EyK0HaeagaIyZ/ToA=;
	b=LoLz8o6IpfgsBkeLqZaI5M571O51Qn6gEVa/2MLn9FufV/GRYXMGbtPSF8Yxo8BZvA
	1uy/v77FpC526+rqXZguEyvalm8bJAWeHt5KV0jY1JJjD4wJnCPv5yvMqamlOjr2xil7
	orit5m2TwZ+WSNF2y47hNwZNNPnT+4tqEEKMBFPztAkg71Rk6uBa6NEwH0HzgjpgzjLL
	zPwKFhW8B93nqRsvybVZuy0RxBvwKavkrCb0ncuzcHP7Tc42gI/oICQL3+te7OjyoiYr
	BRKgxdZZS2ZGVRVcP9eYQFWdZv2vqwUX2IZQ5a83qk82vG+DN/o3S2g55SppfiZEKW9Y
	tX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OvgHGTQewo2Ou44WpDeXjaQ9A0EyK0HaeagaIyZ/ToA=;
	b=hU2Rl4KGNLzurp7Bg2Kq7g7as8Akot2Zd+n2hz9/Jt2I15YHx8M9EiKpyYnXWT0jNU
	dELEUmalrYTCGGbWUuKqPLPfQmNqdeB6Dj3jnlemIUuIw6lUDWUw73vmyyOeUiok3KdR
	xGA5vQvaxsUQvi63md89r/RLRrK1cX+N9vkkLg4lgu410d/Ny93dfeNrDmNZ/7yws8ft
	iFBeHJpbHcVlvyOAuVIFTjuUfjCRBo93EEGD24sN4l0xl/HdukaFlTvpYv4LJJU7YVRC
	JM7LqG+rYKfm+Egkqm5kD1znRT8jE8ALQES/KsHTUcM8bAVwdELtM/7vUuO66XfhMRHH
	rG2g==
X-Gm-Message-State: APjAAAVXO+ezWgtRjJpCKzdO9vAuqRFWiuSYzXMrSajrKuyIlDpYJzCi
	ltNcfH4GyCiQLjgI0av6OKE=
X-Google-Smtp-Source: APXvYqzme8xZMkVUEBl86GQwL1e21NMN5MV2DgXTDZ5KuU55Dn9MI+mHw7sR45FQ4PHA960UhpT/eA==
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr53861126wrn.120.1558521882469;
	Wed, 22 May 2019 03:44:42 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id n2sm2511583wro.13.2019.05.22.03.44.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 03:44:40 -0700 (PDT)
Date: Wed, 22 May 2019 11:44:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190522104439.GF27900@stefanha-x1.localdomain>
References: <20190521082010.29756-1-stefanha@redhat.com>
	<76f165e8-a657-03d1-2b62-77f7d3b2ca26@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline
In-Reply-To: <76f165e8-a657-03d1-2b62-77f7d3b2ca26@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH qemu-web] Add a blog post about micro:bit
 emulation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jim@groklearning.com, qemu-devel@nongnu.org, qemu.ml@steffen-goertz.de,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 10:48:21AM +0200, Thomas Huth wrote:
> On 21/05/2019 10.20, Stefan Hajnoczi wrote:
> > QEMU 4.0 ships the core micro:bit emulation that was implemented during
> > Outreachy and GSoC 2018.  This blog posts explains how to use it and
> > describes the current status.
> [...]
> > +* Boot, device driver, and language runtime code can be tested
>=20
> Nit: "run-time" instead of "runtime" ... at least according to my spell
> checker here.
>=20
> > diff --git a/screenshots/makecode.png b/screenshots/makecode.png
> > new file mode 100644
> > index 0000000..f675768
> > Binary files /dev/null and b/screenshots/makecode.png differ
>=20
> The PNG is missing - could you please either attach it, or create a
> proper git binary patch for it?

Thanks, I have fixed these issues in v2.

Stefan

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzlKBcACgkQnKSrs4Gr
c8hQEgf/cjEOI/u7SmPbDL88wNYLF+JDpo5Z9IqsRKk+8XTpmTjEHBP7mDqlkaJQ
HZisumXxi1aF6ojCAcsXBxL4Pp5X2DIzb5aOSDhfgTmPWon8mG/52Muh0k64Qn/q
0opLpXWnIybeZZpZR8NjoP64XijpT37ErZV1t7fWsZbozmT+JQ3W00af9Js/TSAn
A/G3UcG8lMItWijWFeGCaTARCuPmZqjNJmqxsUJbVTi+WwS60OHqcXCrPDvk/2t6
WxTtTOtRyM557QLQskc88ai83Ovx7DRSOg3dXiILnnED/vREcxAAwojk8NIwE+M0
qssnLLgO8E1yHL3O+jArZonuCyUC3g==
=dvWA
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--

