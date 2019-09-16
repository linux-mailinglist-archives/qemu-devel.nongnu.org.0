Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C35B3E7F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 18:12:47 +0200 (CEST)
Received: from localhost ([::1]:36554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9tcM-00058a-74
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 12:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1i9tGg-0000Ui-NP
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1i9tGf-0001xr-9p
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:50:22 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44246)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1i9tGf-0001xc-2k
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:50:21 -0400
Received: by mail-wr1-x444.google.com with SMTP id i18so8756584wru.11
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/ZdCR+1Fqzp/JHdAUoeYm4eaM2qCJx/e9ila3IZMGQU=;
 b=FtEZhGI6MNIQp95B6Is6oaNfkcWxp9HtUZ2ZLfxhJSYUEj+MHoXMtjJp/SJvx3WEte
 JOd06laFDA80Tw1QwS4H7ihRfPoc3UREnl3HfTNWebA7WPGLrax+pR5cabPRrxbqzwwX
 yQz9nq1+9BadnjIe/84kwz+CjJdPK1sCSQEHe6sl9/ejY9t2u/YvX2hIYUNXltU6YH8G
 Ek6HQ07ZkPR1bdZonPf/KGJLkLtzEht0aqMLw0U56CY7GenSSs+qvwPZDGiAwpU2499K
 tRaDHPJUk2/yFqkW2xwXK3Hl5p3gogsAt5/AvY6OqHxo/EmfNRF9iqdPTFs1z5whK3DQ
 vB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/ZdCR+1Fqzp/JHdAUoeYm4eaM2qCJx/e9ila3IZMGQU=;
 b=mtNdT25BeW/WpJFOrrXu7IaX/DjLB3caGmXg9rAw3moBNIMoHILChZs7abXq7sR6WJ
 2e8i6mN4dl3SYRrwZlRsqmAk3QU0PEbaGmbVUAxU2EHy8kjU+RBkmQ5EggVYfaPgEbD9
 iGJ0ybgdyJKrOY25W9R+mIoy6JgOT+GnBGtPKiu95sj3Pt9tfP8yybI75ufog1T57Txd
 Rk6aL9p5fZ0BFJCnAkbAkqmiyK3LW0FfRyqnr5KjLNNtjRFjjODGoRKjBL9PkDaTe4Bd
 9dVcAKytryUi65OLyusIBx4K8eKYy2l2tXCJ7o7za5cJyXfXWu1ihhUBqulN573rwbG0
 37eA==
X-Gm-Message-State: APjAAAWXjYHS///lYNPonC4aUvL1WtR7ebHfHR1ANtZzKMfOVOP/6TXc
 O/B5reZ1nAKyvo4Ib46MUZE=
X-Google-Smtp-Source: APXvYqw3fw6/EdfhfZJV3QONXM6y0tTdDiCR7SpPqZxjJYPI+wstsx6z+Awf7o0I9VWbVlJo2UpPqQ==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr386325wro.93.1568649019929;
 Mon, 16 Sep 2019 08:50:19 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id a192sm342263wma.1.2019.09.16.08.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:50:18 -0700 (PDT)
Date: Mon, 16 Sep 2019 16:50:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20190916155017.GE25552@stefanha-x1.localdomain>
References: <20190613050937.124903-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Content-Disposition: inline
In-Reply-To: <20190613050937.124903-1-aik@ozlabs.ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH qemu] loader: Trace loaded images
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 03:09:37PM +1000, Alexey Kardashevskiy wrote:
> This adds a trace point which prints every loaded image. This includes
> bios/firmware/kernel/initradmdisk/pcirom.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>=20
> The example for a pseries guest:
>=20
> loader_write_rom slof.bin: @0x0 size=3D0xe22e0 ROM=3D0
> loader_write_rom phdr #0: /home/aik/t/vml4120le: @0x400000 size=3D0x13df0=
00 ROM=3D0
> loader_write_rom /home/aik/t/le.cpio: @0x1ad0000 size=3D0x9463a00 ROM=3D0
>=20
> Sadly "spapr-rtas.bin" does not show up because it is loaded from
> the spapr machine reset handler rather than via rom_reset(), may be needs
> to be fixed.
>=20
> ---
>  Makefile.objs        | 1 +
>  hw/core/loader.c     | 3 +++
>  hw/core/trace-events | 2 ++
>  3 files changed, 6 insertions(+)
>  create mode 100644 hw/core/trace-events

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1/rzkACgkQnKSrs4Gr
c8jEPQf/Rt2cEAZX6lsvgpQwAqki1MCBQ3wOF/BN5+X+DFDM4I+SlIDDBdfQfYlb
K6x8CMQIFOvu+7RAMEgCEFc6R262IBBtLMbTV2aDDIhuWtiDQ4RU93jhDl96KQbs
9qYgdlB6DcCNS7+yb61eDn9p4SkifS3N4cE8jJ9mYGuBqvwLo1a4cpeVtb6hi+Rl
YkXU7AUVppy9nTEeH1t8wAmR5qoa8A0Y9qU5gIkAYeQ8XwzGUYrmX534S3ZfoDpQ
bzi9L2tl3+Q0+vq7FD0OPGSKFJe/3fAYK18pmZW8ZNeFbKIYkmG6MZ1KVwY7lNFt
cz2yqfk2mRQoBWkbHMZGE8l+4OIRsg==
=eYIz
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--

