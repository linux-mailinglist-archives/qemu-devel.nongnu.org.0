Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E651C280
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:25:34 +0200 (CEST)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmcQ9-0006LZ-LA
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmcOV-0005bW-0c
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:23:52 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:36112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmcOT-0005VV-G4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651760628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F3Ekez7QXBJgYBG8aASxs0AeI8UaBsRkSmSU3tjfR7I=;
 b=eKnB931hR8tNwuKonlxzjUih+0Fnkty/hpiR0oX+9pxe1uoXl/IMVlGDS5w6idOmTKKJpC
 EELNZcsQESkQqbLCO3jFmUMMK9MIXW65w3t284/zZF4OI01RKxsVF0o8Fll4ljom9wh2C3
 to3dY9LJFznurJyJ5Fws7iPDkfZOOck=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-iNwhUuPXMHy14KnUafw-Qw-1; Thu, 05 May 2022 10:23:45 -0400
X-MC-Unique: iNwhUuPXMHy14KnUafw-Qw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 284C33AF42A3;
 Thu,  5 May 2022 14:23:45 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5D4BC28103;
 Thu,  5 May 2022 14:23:44 +0000 (UTC)
Date: Thu, 5 May 2022 15:23:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, longpeng2@huawei.com,
 =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: [PATCH] thread-pool: replace semaphore with condition variable
Message-ID: <YnPd79qEDIgcY7EJ@stefanha-x1.localdomain>
References: <20220505131346.823941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1+qsuPBAIzzeitpO"
Content-Disposition: inline
In-Reply-To: <20220505131346.823941-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1+qsuPBAIzzeitpO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2022 at 03:13:46PM +0200, Paolo Bonzini wrote:
> Since commit f9fc8932b1 ("thread-posix: remove the posix semaphore
> support", 2022-04-06) QemuSemaphore has its own mutex and condition
> variable; this adds unnecessary overhead on I/O with small block sizes.
>=20
> Check the QTAILQ directly instead of adding the indirection of a
> semaphore's count.  Using a semaphore has not been necessary since
> qemu_cond_timedwait was introduced; the new code has to be careful about
> spurious wakeups but it is simpler, for example thread_pool_cancel does
> not have to worry about synchronizing the semaphore count with the number
> of elements of pool->request_list.
>=20
> Note that the return value of qemu_cond_timedwait (0 for timeout, 1 for
> signal or spurious wakeup) is different from that of qemu_sem_timedwait
> (-1 for timeout, 0 for success).
>=20
> Reported-by: Luk=C3=A1=C5=A1 Doktor <ldoktor@redhat.com>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/thread-pool.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)

Thanks for writing the patch so quickly, Paolo!

Luk=C3=A1=C5=A1: please try this patch to see if it solves the regression. =
Thanks!

> @@ -337,15 +330,14 @@ void thread_pool_free(ThreadPool *pool)
> =20
>      /* Wait for worker threads to terminate */
>      pool->stopping =3D true;
> +    qemu_cond_broadcast(&pool->request_cond);
>      while (pool->cur_threads > 0) {
> -        qemu_sem_post(&pool->sem);
>          qemu_cond_wait(&pool->worker_stopped, &pool->lock);
>      }
> =20
>      qemu_mutex_unlock(&pool->lock);
> =20
>      qemu_bh_delete(pool->completion_bh);
> -    qemu_sem_destroy(&pool->sem);
>      qemu_cond_destroy(&pool->worker_stopped);
>      qemu_mutex_destroy(&pool->lock);
>      g_free(pool);

Missing qemu_cond_destroy(&pool->request_cond);?

Otherwise:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1+qsuPBAIzzeitpO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz3e8ACgkQnKSrs4Gr
c8gQmAgArZECYqBW5rs/OJS5waRHZkMKKoYgar7ybg7300yUWUGi8ZBhSHWWjmlK
6FS90YjI0jtC6LoayVgi9wNUEK3+O0riqViWyDnzYWuCP45UeAFW7/MnjcAiII+D
VUOFDYm8kSApsUeG24jxZpY6Kxv9feicpqhcxOkvkfuUuD4T9pyxgDZRUCtPZSHm
GSCafzCdLPPpJzSUdoCeD7H9USOsKF5riBA0Tv5iyxJ/u/KXjvgbzAwEZpJ4QWtv
V8u1ttVTaL2hzBjCr/SQK1MAW/NCXcC907L/mBiAL6rBOOxcb7NAo7LDOgLZBfCO
vcrQJVbAF+TPcn9X9GnCxvRZbrhnhA==
=Apns
-----END PGP SIGNATURE-----

--1+qsuPBAIzzeitpO--


