Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028417924A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 15:26:10 +0100 (CET)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9UyO-0004E7-Vi
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 09:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jtomko@redhat.com>) id 1j9UxF-0003ZL-NF
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 09:24:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jtomko@redhat.com>) id 1j9UxE-0007zu-Qz
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 09:24:57 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38313
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jtomko@redhat.com>) id 1j9UxE-0007zE-NV
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 09:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583331896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vX6AURFdpJnTrZ1TcMyKiLdPpHqu9czXZkdZAeoJXk8=;
 b=fghvNVO6epATYsdO196lVDDaS4urwODldk+/nFZNYbYRrFmqJaZJ2rLzdRWwWhqoFtWr/T
 NT1MxqP/61+lEJG4YhBri2g5xbm0i/hJ7o9H1dON2ykjb3/3jYWtPhZT+RpBxexSGtMswW
 nXTKvCAGBaqVMJmrK1irnB1K8CKDyAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Xrk8837EOeumaezFGya7vA-1; Wed, 04 Mar 2020 09:24:52 -0500
X-MC-Unique: Xrk8837EOeumaezFGya7vA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14F94802576;
 Wed,  4 Mar 2020 14:24:51 +0000 (UTC)
Received: from lpt (unknown [10.43.2.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 860141BC6D;
 Wed,  4 Mar 2020 14:24:49 +0000 (UTC)
Date: Wed, 4 Mar 2020 15:24:47 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block/qcow2-threads: fix qcow2_decompress
Message-ID: <20200304142447.GD3045166@lpt>
References: <20200302150930.16218-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200302150930.16218-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, mreitz@redhat.com, dplotnikov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Monday in 2020, Vladimir Sementsov-Ogievskiy wrote:
>On success path we return what inflate() returns instead of 0. And it
>most probably works for Z_STREAM_END as it is positive, but is
>definitely broken for Z_BUF_ERROR.
>
>While being here, switch to errno return code, to be closer to
>qcow2_compress API (and usual expectations).
>
>Revert condition in if to be more positive. Drop dead initialization of
>ret.
>
>Cc: qemu-stable@nongnu.org # v4.0
>Fixes: 341926ab83e2b
>Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>---
>
>Hi!
>
>Reviewing Den's series about zstd in qcow2 support, I found an existing
>bug. Let's fix it. This is to be a new base of zstd series.
>
> block/qcow2-threads.c | 12 +++++++-----
> 1 file changed, 7 insertions(+), 5 deletions(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl5fuisACgkQ+YPwO/Ma
t52MRQf/Z9TLPs34Q5VnnJEVtH0pnguXNLxmPJ/WDPWwz7SVbfFVBu5Xe0qxrQT8
sIWkY0c2kaY935LVIYicfcSzrzjDb6XzwpoFrSM4Yzn8G+W7b2aM66jlZ7z73sM1
V2DbFkNVpPqhcNIEAHJ862bfI3sgcrSZ8CQKIZKOwnOuvPYaoikNIpqr+fn1rgua
LCBMPfhJLF7QbFogbM3t1wCTDrPPnegHHdBxUHRGQA7EVYvdnliLukHgV3YGRGYf
5ON2TbCs+RD8XplX10bbtT0oHufURGzGZaqCY0wpp+Uj+8+QcvuVy/UWP5cLd6Lr
+FUei/LeYcvdIhaZJ4lBDnsVufDooQ==
=t5xx
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--


