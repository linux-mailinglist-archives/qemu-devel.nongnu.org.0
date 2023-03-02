Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFAB6A85B8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlM8-00014J-Dn; Thu, 02 Mar 2023 11:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXlLt-00013T-LU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXlLr-0000nP-TD
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677772814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GlwxBcWtzRVreQhCR9//ht2cjZ0m/wpO0+fGFoLQOuI=;
 b=ZoksjRi3LoT6phDBfDqb476dXxWlH6kYgPVnKT5Gy2R7Njup2v3IvCLJdGDCG+5i7/BBRr
 5csRH/mZmo8bG89oVHtv7KAb3/AeqopOXrTIWNrWuU+D46JGE+cZ5/HkEIEUMj/USuT/mQ
 41sklUXCHumi2WybpwNcYr0Xjb2rfcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-znHySGT4OcaZqvniQpoMvg-1; Thu, 02 Mar 2023 11:00:10 -0500
X-MC-Unique: znHySGT4OcaZqvniQpoMvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 885F11875041;
 Thu,  2 Mar 2023 16:00:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0C9D140EBF6;
 Thu,  2 Mar 2023 16:00:07 +0000 (UTC)
Date: Thu, 2 Mar 2023 11:00:05 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Message-ID: <20230302160005.GB2497705@fedora>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-3-stefanha@redhat.com>
 <7c440fc8-d37b-b933-ed5f-02baf7136bca@linaro.org>
 <20230302130810.GA2485531@fedora>
 <2421dc87-026e-154c-02df-7ffd778da7be@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dbkhlOUG11o6TRfr"
Content-Disposition: inline
In-Reply-To: <2421dc87-026e-154c-02df-7ffd778da7be@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--dbkhlOUG11o6TRfr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2023 at 03:16:32PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/3/23 14:08, Stefan Hajnoczi wrote:
> > On Thu, Mar 02, 2023 at 11:36:03AM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> > > On 1/3/23 21:57, Stefan Hajnoczi wrote:
> > > > There is no change in behavior. Switch to AIO_WAIT_WHILE_UNLOCKED()
> > > > instead of AIO_WAIT_WHILE() to document that this code has already =
been
> > > > audited and converted. The AioContext argument is already NULL so
> > > > aio_context_release() is never called anyway.
> > >=20
> > > Shouldn't we assert(ctx && unlock) in AIO_WAIT_WHILE_INTERNAL() then?
> >=20
> > Can you show where you'd add that assertion? It's not clear to me what
> > the purpose is.
>=20
> Without your series applied, using:
>=20
> -- >8 --
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index dd9a7f6461..dc372e4c16 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -82,6 +82,8 @@ extern AioWait global_aio_wait;
>      bool waited_ =3D false;                                          \
>      AioWait *wait_ =3D &global_aio_wait;                             \
>      AioContext *ctx_ =3D (ctx);                                      \
> +    assert("Use AIO_WAIT_WHILE_UNLOCKED()" && !unlock              \
> +           || (ctx && strcmp(#ctx, "qemu_get_aio_context()")));    \
>      /* Increment wait_->num_waiters before evaluating cond. */     \
>      qatomic_inc(&wait_->num_waiters);                              \
>      /* Paired with smp_mb in aio_wait_kick(). */                   \
> ---

Ah, I see. You are suggesting adding an assertion to catch
AIO_WAIT_WHILE() usage in cases where AIO_WAIT_WHILE_UNLOCKED() should
be used instead.

I think it's a bit too clever, especially the strcmp trick, but we can
add it as the final patch. I have grepped the code and don't think there
are any remaining instances where the assertion fails.

Stefan

> I get:
>=20
> Assertion failed: ("Use AIO_WAIT_WHILE_UNLOCKED()" && !1 || (((void*)0) &&
> strcmp("((void*)0)", "qemu_get_aio_context()"))), function
> blk_exp_close_all_type, file export.c, line 309.
>=20
> -> [PATCH 2/6] block: convert blk_exp_close_all_type() to
> AIO_WAIT_WHILE_UNLOCKED()
>=20
> Assertion failed: ("Use AIO_WAIT_WHILE_UNLOCKED()" && !1 ||
> (qemu_get_aio_context() && strcmp("qemu_get_aio_context()",
> "qemu_get_aio_context()"))), function bdrv_graph_wrlock, file graph-lock.=
c,
> line 130.
>=20
> -> [PATCH 3/6] block: convert bdrv_graph_wrlock() to
> AIO_WAIT_WHILE_UNLOCKED()
>=20
> Assertion failed: ("Use AIO_WAIT_WHILE_UNLOCKED()" && !1 || (((void*)0) &&
> strcmp("((void*)0)", "qemu_get_aio_context()"))), function
> bdrv_drain_all_begin, file io.c, line 523.
>=20
> -> [PATCH 4/6] block: convert bdrv_drain_all_begin() to
> AIO_WAIT_WHILE_UNLOCKED()
>=20

--dbkhlOUG11o6TRfr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQAyAUACgkQnKSrs4Gr
c8g0lgf+JecBQdq6iINzsXkfYVC5A3jmNKWGsYeIViAi3b0bcEjf1xb97TVgivzN
+rNxie6XSpvQscTmATTAX/433y3epsZkq46oY72WdjIKEF0QQ/L2btLL/kfPgBf2
Ez1uKEdzf9rfR3MTJpLNILACyPu5rSIDw+zz9OqmfQljJSTswHIViMwSnunmaPnR
ymkMKySNe/120JUYM9t+7Fe457IWvhmbur6Zt2ZUgqNeCwAaegifsHVYF8Yl1glX
bEVxn04h0SMeD4X7E0DiR3S/KVq57CAskuouQ3L9+Gky96ZVJncac2Ku5zyxrZAu
I12PL2uaWHYpbF31Kgn/r/cdE836RQ==
=X8us
-----END PGP SIGNATURE-----

--dbkhlOUG11o6TRfr--


