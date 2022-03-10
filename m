Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BF4D4363
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:22:42 +0100 (CET)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSF0L-0006mh-Hj
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSEye-0005M8-4r
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSEyc-0003UH-Mk
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646904054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNDm/ltwGvO/EfmzSG5AXwuMzVzFaecV5LetaaeEXY8=;
 b=ObxQ2z04ynpIVOxbeCw2kzCkqCUb0a7gVZPK3CPX+ypRDPyw5AN1oeNJFZcyIbgQwcn9Ey
 PYpCNtMDvbQzvtFv0YcFOCkk9o2wr8iScB0Bf544oXC/l9ge7t7pYekhLbXkla0pZ8rCmp
 cxceOSGNYUyH56nMw82zom8SS6iucl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-wwSoH5c5MQa-B_rNw8mfhQ-1; Thu, 10 Mar 2022 04:20:50 -0500
X-MC-Unique: wwSoH5c5MQa-B_rNw8mfhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 859708145FA;
 Thu, 10 Mar 2022 09:20:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E8B1E709;
 Thu, 10 Mar 2022 09:20:48 +0000 (UTC)
Date: Thu, 10 Mar 2022 09:20:47 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v2 1/4] util/thread-pool: Fix thread pool freeing locking
Message-ID: <YinC7yUHgR+Ing+l@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303145822.518887-2-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dab3C28cv1QXvkqp"
Content-Disposition: inline
In-Reply-To: <20220303145822.518887-2-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Dab3C28cv1QXvkqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 03:58:19PM +0100, Nicolas Saenz Julienne wrote:
> Upon freeing a thread pool we need to get rid of any remaining worker.
> This is achieved by setting the thread pool's topping flag, waking the

s/topping/stopping/

> workers up, and waiting for them to exit one by one. The problem is that
> currently all this process happens with the thread pool lock held,
> effectively blocking the workers from exiting.
>=20
> So let's release the thread pool lock after signaling a worker thread
> that it's time to exit to give it a chance to do so.
>=20
> Fixes: f7311ccc63 ("threadpool: add thread_pool_new() and thread_pool_fre=
e()")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> ---
>  util/thread-pool.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/util/thread-pool.c b/util/thread-pool.c
> index d763cea505..fdb43c2d3b 100644
> --- a/util/thread-pool.c
> +++ b/util/thread-pool.c
> @@ -339,7 +339,9 @@ void thread_pool_free(ThreadPool *pool)
>      pool->stopping =3D true;
>      while (pool->cur_threads > 0) {
>          qemu_sem_post(&pool->sem);
> +        qemu_mutex_unlock(&pool->lock);
>          qemu_cond_wait(&pool->worker_stopped, &pool->lock);
> +        qemu_mutex_lock(&pool->lock);

This patch looks incorrect. qemu_cond_wait() (and pthread_cond_wait())
take a mutex as the second argument. This mutex is released and the
thread blocks to wait (this is done atomically with respect to the
condvar check so there are no races).

In other words, qemu_cond_wait(&pool->worker_stopped, &pool->lock)
already releases pool->lock. It is unnecessary to release/re-acquire it
manually plus it probably suffers from a race condition in case the
other thread signals the condvar between the time when we unlock and
before we block on the condvar.

Please check that this patch really solves a problem and if so, please
explain the root cause.

Stefan

--Dab3C28cv1QXvkqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIpwu8ACgkQnKSrs4Gr
c8iESAf+LalHRJIWpKuix66EvpaDB6CaEs2OWbUaSKwt2Av5yGO9FDpjHUYLJvVx
cUyhkBOsYDuEP8kX367FeYdv3Jeo17Wj+xpnc+WQJyw/hDCoH8mYhUXDxTRcJCge
rsXA88VBiZmEdu9LxPvVZx3cDVS26Qu6plvbvl1l1cHyB9uGFNJQYX2Z9AaZcN4k
5Pza8Y/UsNoOgXT4Sz58g6qVL768WaolU/Poc4qDENkBsysTtx33toWvxTR1c6By
Jv05zpPd1O70Qhhvy7dcVOxh8qO7Y3ofjBVT8SumBG5b9NcPaxxE/S5iiNnZsizl
Dx9zreyqeiq5IjPrY0kpoetnYVAkZg==
=8N0t
-----END PGP SIGNATURE-----

--Dab3C28cv1QXvkqp--


