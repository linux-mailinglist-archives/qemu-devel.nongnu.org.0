Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4BD17F0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 21:04:10 +0200 (CEST)
Received: from localhost ([::1]:54497 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIHFo-0002xS-B2
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 15:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iICVy-00078Z-4r
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 10:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iICVt-0000pI-6q
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 10:00:30 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50619)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iICVt-0000pA-0S
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 10:00:25 -0400
Received: by mail-wm1-x343.google.com with SMTP id 5so2764982wmg.0
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f/wDPKB8V/1hmOZKMr8IiE7dhi9zjZUGKPcXluUJdhE=;
 b=LGhcFV17e5bTwH+BJefz/APcnnAsdWhQMeImouMn1R9vWhIWlSiounj2Be+kkHXyIG
 QUOaSYOPltOKhbUfFlKkggHwFsZf7m1RInkqjv9VGIn1+D+7UEs4lnA6yqq+4lnqTBpE
 PDScbh/rgEiF2P5FU+9fla2tYsI+hhrTkqlUlNHHv0wiAnL4Vgpjd1isVcXN2FLsQZow
 gUdJL5qxRhy8AXtr6QQ6aQdeG9ogrgk8HO1t9apk/BLiYJyy8lHp+L59AltjNE0AjfLh
 L8iYAf/1+SlcrT3EHVskeEi7cDm7PVf1yrfg2eTIwxYJf9NhKpnWsl+JeE8V8/rJbuUi
 J/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f/wDPKB8V/1hmOZKMr8IiE7dhi9zjZUGKPcXluUJdhE=;
 b=jNRBfgDrhWuET+Hu4gyogsyrtFLozvwux5uW01x27W8kE760aSFA40eHDkcRnL4sQR
 BdWc1fBIZ1AM9/36ZxhsH0T2QGLz5I29oxgC1wD/f+0JVTslwOFcRECrF19zy8kSNb9+
 R6Z5PQxifh7F0uDT9Zc+UN07qBZ2frseQL76seEWs/0d/PLk6IUV+2PLeYjnNdXkJLEB
 pAY10mFsqi9IHYhsQxyX1GJGbBZYh58iu8uOlKGZmCytgWp41wSSs3KSIFcw1+VUzFUH
 F77LGKE0iGTmCy1R6XLcJA5cBoNnsWSooHOlomw3QVOolqD5PXiPJRrojnmtFkILWEej
 /T+Q==
X-Gm-Message-State: APjAAAXGGKtVPVMuaeXUfDl5aRtzLpA2tcgpUaW8vDzdIT4LCTy70W1y
 PVMj7JzIRFa+Vq0g9fYHr7I=
X-Google-Smtp-Source: APXvYqwXfw7MK5r5nAZ0a/DMWWOhcz5dVeOWI5e9/hLg7IIPClH8wiVH+wEl88FdvB0fVGBLMV3SEQ==
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr2958142wme.26.1570629623835; 
 Wed, 09 Oct 2019 07:00:23 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id d4sm2331927wrq.22.2019.10.09.07.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:00:22 -0700 (PDT)
Date: Wed, 9 Oct 2019 15:00:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [Qemu-devel] [RFC] contrib: add vhost-user-sim
Message-ID: <20191009140021.GQ5747@stefanha-x1.localdomain>
References: <20190917122644.15736-1-johannes@sipsolutions.net>
 <20190923092548.GA26219@stefanha-x1.localdomain>
 <24d18f1c38356b19461e77275b94a1ebf89838f1.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Content-Disposition: inline
In-Reply-To: <24d18f1c38356b19461e77275b94a1ebf89838f1.camel@sipsolutions.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 11:33:41AM +0200, Johannes Berg wrote:
> On Mon, 2019-09-23 at 10:25 +0100, Stefan Hajnoczi wrote:
> Note, I'm not happy with this code at all, it deadlocks all the time.
> Unfortunately I haven't really been able to figure out how to make glib
> do what I wanted.
>=20
> The first issue is that sometimes glib actually seems to reports an FD
> as readable when it's not, so I even put them into non-blocking mode :(

Strange.  Spurious wakeups are possible in general.  I think when using
fd monitoring (select(), poll(), etc) the fds should be in non-blocking
mode.

But if you're seeing this often it makes me wonder if something else is
unintentionally reading available bytes...

> The second is that I can't seem to understand how to do recursive
> mainloops.
>=20
> To really do this *well*, it should remain a single-threaded
> application, but would need a hook like
>=20
> run_mainloop_until_fd_readable(vdev->call_fd)
>=20
> inside the libvhost-user.c code, and that's a bit ugly ... if I even
> could figure out how to implement that in glib.

Recursive mainloops are tricky since usually event loop code isn't
written to be re-entrant.  It opens up a whole new dimension that
existing code usually wasn't designed for.  In this case you are writing
the code from scratch so maybe you can get it to work, but it makes me
wonder why the recursive mainloop is necessary.

Stefan

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2d5/UACgkQnKSrs4Gr
c8iPsQf+NIPSPW5o/8mGp+PCVNDDhBLt4UHyyjoFUCwMBA2CajLmm4Qci7s2Zzph
mLma3glrwar4xWH5FV5Ac7B3kxBQ/ZeiqQzQ4hFHCww7eCd2Wc3LXdRdjDopbBxx
Ch5kjRqClPn3ArIO6Lv7QkC3NEY3jHgafIDMXZjnIz1vEwsa0Cr5UlUc4NKZ9/5z
pNxOzTVUORAiVNvFmI3Otnpguo2FYfH31Q4lh5vAe3jyOp4RthF/GOy3ZgZUfYxj
9jslo50bk5yfFumTOOsFfryuwmd7E9Nc0xli6t2uCfIFWMpjW52HqXvSDuOz/ZtX
C1DXm2yzvaaZZZ3Sqi9WrtHCwlFvNQ==
=Ua7F
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--

