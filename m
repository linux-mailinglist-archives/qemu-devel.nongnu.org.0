Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A35132C7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:44:14 +0200 (CEST)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2ZB-0000Fa-LQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk21U-0004nE-PZ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk21R-00063A-3Q
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651144158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WXSAbofnMfvDdD4GKqz+Yicvwym3S7X0JrebhelP04U=;
 b=XzHHlR8yrB1MF0eGgiSuFnP+6BRG+yRdO0queq9uqRPfYYzzmYgPHDQEHrxT/yP673UGp0
 3BgwvoKsuF2+pp0k2nZUIQTvXsJEjsiOG4Zc4SoWeawBH5VVNU4osCpPEr6J/vM+4zdp7P
 YWAbeEA1X5U9fV4LGh3D32g1hXvNz+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-NNMEm3MpM6uGh7SAmuVZzg-1; Thu, 28 Apr 2022 07:09:15 -0400
X-MC-Unique: NNMEm3MpM6uGh7SAmuVZzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B0A685A5A8;
 Thu, 28 Apr 2022 11:09:15 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC37D4010A1B;
 Thu, 28 Apr 2022 11:09:13 +0000 (UTC)
Date: Thu, 28 Apr 2022 12:09:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 1/8] aio_wait_kick: add missing memory barrier
Message-ID: <Ymp12Ng5/mns+ngw@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ED8NYfK7ur90lQAt"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ED8NYfK7ur90lQAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:07AM -0400, Emanuele Giuseppe Esposito wrote:
> It seems that aio_wait_kick always required a memory barrier
> or atomic operation in the caller, but almost nobody actually
> took care of doing it.
>=20
> Let's put the barrier in the function instead.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  util/aio-wait.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/util/aio-wait.c b/util/aio-wait.c
> index bdb3d3af22..c0a343ac87 100644
> --- a/util/aio-wait.c
> +++ b/util/aio-wait.c
> @@ -35,7 +35,8 @@ static void dummy_bh_cb(void *opaque)
> =20
>  void aio_wait_kick(void)
>  {
> -    /* The barrier (or an atomic op) is in the caller.  */
> +    smp_mb();

What is the purpose of the barrier and what does it pair with?

I guess we want to make sure that all stores before aio_wait_kick() are
visible to the other thread's AIO_WAIT_WHILE() cond expression. that
would require smp_wmb(). I'm not sure why it's a full smp_mb() barrier.

> +
>      if (qatomic_read(&global_aio_wait.num_waiters)) {
>          aio_bh_schedule_oneshot(qemu_get_aio_context(), dummy_bh_cb, NUL=
L);
>      }
> --=20
> 2.31.1
>=20

--ED8NYfK7ur90lQAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqddgACgkQnKSrs4Gr
c8hoaQf9Fy8x9caLFF4oOzoPg3WL8cFSyRVqa/413QO/MhSZNR+uvkhfGmOLFIjq
KkKH9cXR+xPUosJoPxWU+e7YnRpzCaNGcfyfyi/sqmv0y3Bo9/aYTSXSiun79raw
y6mXvueABfRh9pT4IBoijn8xHQtgGvNmVFd/VdoU5kZHBQCrSazESbG7it8Bec2G
+kpD6WbC0sN1hREFGzJ8BR8x7WMyg22Ufc3/PG/YUPdCjLbvhO2LCeSepvqfq45c
9ot0tknUAZ4U4hWtwdxQpfOg9AOt0b6JlkS8YMRycnqbW9p+HwrBHD4EHCkXy5ES
vnXHmzOEAg6SA8kzvpetZgJ0YnT8fQ==
=Xlqt
-----END PGP SIGNATURE-----

--ED8NYfK7ur90lQAt--


