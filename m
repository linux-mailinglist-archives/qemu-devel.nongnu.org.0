Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20D13A836
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:21:36 +0100 (CET)
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irKGN-00076Q-E7
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1irJzs-00044j-0L
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:04:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1irJzq-000867-Vn
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:04:31 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34065)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1irJzq-00085o-MM
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:04:30 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so11739228wrr.1
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 03:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B60rghVsmUyeupVC4Y1MNfVn6ltZlF1FDZzj11ztXfg=;
 b=QMu7kSPC3+DhjrE9DpE/2poJPvXrgS1LtEf8aFBAoqD7Cnk5AsIS5lM9ah+hjd0U0i
 L7kiL1XsyglcVzc1VUR6yynvceDibdLBknp/f2xP90iv80Rn5BeBQvtmSK50He5qGjVx
 Dczm1KlGfCS4v+2O040h7gcOY8pVe7TckfQzQmm7uPODIaK1J7Ivc954CBsOwbOlVm3L
 Sgf3u2x5btWWoA8yl4CvAbQk0ydHAK8cNdF2pNIE0iahZdS2U83Gvpmc99ahc3/kys6A
 QH68nFl4b7Zs2cqnRZ1uf9zSDW246+9ZkAOFujl2aeL/m2HE3cwaGUQd3EWydzdoKOKa
 lkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B60rghVsmUyeupVC4Y1MNfVn6ltZlF1FDZzj11ztXfg=;
 b=EndnqkYIolfKHodDBo6FBx6JX3u8yMlUu3YAlEkrpKMKtQ1zcvsymqUvsdhdnT9UVh
 AxNsnQGLqoPpl6v/c9Qz2VyWP7mXA1V9E8pPSpMZKDoG7cwZd1NuDvQ8kYpdfYSr9Jhe
 R9OV/jWaIYk9ZGmRAhEweD/NX3m8PORMdk6wHOf0dnrokLZgOF1Qq/EOlT8dNqI0tJk2
 8UfP9TD8ddpa0tIcbKyiyWJrohA+RGKo9dB9ZkIXdmhzix282wBdEZ0kqqDvCHh3RzaY
 OjVwGmX8Kw4P1ahgeqT1JUZtYT/t5KWrc0H2ldA6WQgLs76s413v38t3LkG5tGDwj8jK
 gHIA==
X-Gm-Message-State: APjAAAUeIRJRUFBtAUkUfhJ4VY7oU2FDJs3rajXJQIEcokA4yFX/zh0S
 aqSCISScjKBmqFRwaNZ6Y9A=
X-Google-Smtp-Source: APXvYqzxlvpyhJSMBznq+zLsuUDvjpxVVQiEfntPiGfb8BVEPKxV+mr+kfqjaNom8xSD2ATDhQ64lA==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr25481970wrx.26.1578999869486; 
 Tue, 14 Jan 2020 03:04:29 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id m10sm19364271wrx.19.2020.01.14.03.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 03:04:28 -0800 (PST)
Date: Tue, 14 Jan 2020 11:04:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] docs/devel: fix stable process doc formatting
Message-ID: <20200114110427.GD118882@stefanha-x1.localdomain>
References: <20200113103023.31255-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline
In-Reply-To: <20200113103023.31255-1-cohuck@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:30:23AM +0100, Cornelia Huck wrote:
> Enumeration of stable criteria needs proper bullet points.
>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/devel/stable-process.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4doDoACgkQnKSrs4Gr
c8hl9Af/fblsJavf/Wq+CDWRtgT8EHaGqdLg4IYxvAtynYll0zQNnhutEhFNr4Vj
GvOovX/K15QROV2CVd+jLr67jYYpOsVkVJeWfV0sUK1oXrpwwO56myL0b95rMTNl
oWbV3EzRWrs7bVYNnUfNxet0ELY5mYevix+zG+3oZF6BjV7hXXYcBY3KGmYuE92V
oSUgFFVu9y0VCcBvkTULpF90VAWirPrx2+zK2Y8fNpgcoIoG2SKlFMgXG3y1zSFC
tRELg3BXr3To+ollstmfqUijQutF7MAdONDqTgVinWOcfg/pxJwTaVFhoRM+sie3
uwipqSfhCxftPldGTEGoY30v6zS6Tg==
=NbbU
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--

