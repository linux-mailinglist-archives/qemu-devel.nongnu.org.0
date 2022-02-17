Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0984BA673
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:54:24 +0100 (CET)
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKk2x-0003IW-BZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKk1o-0002CW-W3
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKk1m-0007Bt-5l
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645116789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uz8ikP+tv+gH+w9F7uOv4qesEFI68perrZFSUKI96a8=;
 b=VnuYJ/C6I7bzPy2fl2sjF4qWNDZGfy6XQDM1G4Nuqw1art91rTlHq5QptOfAbypVlthESp
 f49Xjy5YK0xRUAXAL6IhtzWT1jhWuWlXekSf6QACZi1BCMqv0+yProKBeki8KEhxcq1Ncj
 yYoGRbr3BHgXBo4fc59smuhF9h0SNz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-4jXchySwM8-WiwIw972C-Q-1; Thu, 17 Feb 2022 11:53:05 -0500
X-MC-Unique: 4jXchySwM8-WiwIw972C-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8267B344E0;
 Thu, 17 Feb 2022 16:53:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A4B278AB1;
 Thu, 17 Feb 2022 16:53:03 +0000 (UTC)
Date: Thu, 17 Feb 2022 16:53:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 11/20] block/mirror.c: use of job helpers in drivers
 to avoid TOC/TOU
Message-ID: <Yg59bohalymEAfvp@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-12-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a+FKwuzjR0ZBQjDU"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-12-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a+FKwuzjR0ZBQjDU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:04AM -0500, Emanuele Giuseppe Esposito wrote:
> Once job lock is used and aiocontext is removed, mirror has
> to perform job operations under the same critical section,
> using the helpers prepared in previous commit.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/mirror.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)

My understanding is that MirrorBlockJob itself does need a lock because
it's only access from the coroutines - and they run in only one thread.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--a+FKwuzjR0ZBQjDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOfW4ACgkQnKSrs4Gr
c8glZQgAwHuJX+TKA8ghR4n0h2OmFr9BD4ZRiJqvBinghoBmmICBxRPdyBhX6jlU
/X9FM1gr57FS/s3ukW5RprSrvvasZhulf4tfedxWDIB7FUNDHMGX9FhBm24raXzq
ZZRSmXp5vL75GHbqXESN/p0OVu9pb2NdUmWbCyWPT54NvoQv5we4k/1mfPg1KAv6
/IHG2svW4NXYUnAqCAAI+sbtA0XSrwDvJEK0msS+XqEO6bfQTddo9mHJZfXgh6eo
9C6U+o/EZqEoxjjE1Jzabtv4SU6E8CIBDHw9Danw3Lc2YQmZShWrFg4XPiLhEk4s
J4fQgVHrsTnFn31d9t494QnfzFuWHQ==
=fLX5
-----END PGP SIGNATURE-----

--a+FKwuzjR0ZBQjDU--


