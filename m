Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC34D86E6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:24:26 +0100 (CET)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlcX-0002cl-7O
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:24:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTkrk-0004lA-2w
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTkrZ-0001Mm-PT
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647264949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=75N8YSPti1TGUkPscPO6UogmuZxqyibsmxK8JxvlZYA=;
 b=DWchNVt4Db2c04Wa5Y4kZzqBySWXs69/C1DjRLgqmn6VZPiOpUEJabaUUuvdQKXANh7UWn
 QtqCZAje8eb2Hxam330QajRQb+TD69kSA2lQ/WrI8cDqVdzPUwYPn4iVfGjqJmMYePDnTF
 9IQACjJ1fYtTw0fjJLFTORpGVOc6I8M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-4TIQ9c5FMpO-3acNoko6AQ-1; Mon, 14 Mar 2022 09:35:47 -0400
X-MC-Unique: 4TIQ9c5FMpO-3acNoko6AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F7C91C01503;
 Mon, 14 Mar 2022 13:35:47 +0000 (UTC)
Received: from localhost (unknown [10.39.195.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10F67C28131;
 Mon, 14 Mar 2022 13:35:46 +0000 (UTC)
Date: Mon, 14 Mar 2022 13:35:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v2 4/4] util/event-loop-base: Introduce options to set
 the thread pool size
Message-ID: <Yi9EsuqHBDT6z6x+@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303151307.558607-1-nsaenzju@redhat.com>
 <YinWxsS+gF9kt1hb@stefanha-x1.localdomain>
 <93fee44e8b4aa58dcfd8c088a0f03ec2dedd3b03.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qt9c3Yps0BOdIlrv"
Content-Disposition: inline
In-Reply-To: <93fee44e8b4aa58dcfd8c088a0f03ec2dedd3b03.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


--qt9c3Yps0BOdIlrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2022 at 11:40:30AM +0100, Nicolas Saenz Julienne wrote:
> On Thu, 2022-03-10 at 10:45 +0000, Stefan Hajnoczi wrote:
> > On Thu, Mar 03, 2022 at 04:13:07PM +0100, Nicolas Saenz Julienne wrote:
> > > @@ -537,10 +546,19 @@
> > >  #                 0 means that the engine will use its default
> > >  #                 (default:0, since 6.1)
> > >  #
> > > +# @thread-pool-min: minimum number of threads readily available in t=
he thread
> > > +#                   pool
> > > +#                   (default:0, since 6.2)
> > > +#
> > > +# @thread-pool-max: maximum number of threads the thread pool can co=
ntain
> > > +#                   (default:64, since 6.2)
> >=20
> > Here and elsewhere:
> > s/6.2/7.1/
>=20
> Yes, forgot to mention it was a placeholder, as I wasn't sure what versio=
n to
> target.
>=20
> > > @@ -294,6 +314,36 @@ void thread_pool_submit(ThreadPool *pool, Thread=
PoolFunc *func, void *arg)
> > >      thread_pool_submit_aio(pool, func, arg, NULL, NULL);
> > >  }
> > > =20
> > > +void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
> > > +{
> > > +    qemu_mutex_lock(&pool->lock);
> > > +
> > > +    pool->min_threads =3D ctx->thread_pool_min;
> > > +    pool->max_threads =3D ctx->thread_pool_max;
> > > +
> > > +    /*
> > > +     * We either have to:
> > > +     *  - Increase the number available of threads until over the mi=
n_threads
> > > +     *    threshold.
> > > +     *  - Decrease the number of available threads until under the m=
ax_threads
> > > +     *    threshold.
> > > +     *  - Do nothing. the current number of threads fall in between =
the min and
> > > +     *    max thresholds. We'll let the pool manage itself.
> > > +     */
> > > +    for (int i =3D pool->cur_threads; i < pool->min_threads; i++) {
> > > +        spawn_thread(pool);
> > > +    }
> > > +
> > > +    while (pool->cur_threads > pool->max_threads) {
> > > +        qemu_sem_post(&pool->sem);
> > > +        qemu_mutex_unlock(&pool->lock);
> > > +        qemu_cond_wait(&pool->worker_stopped, &pool->lock);
> > > +        qemu_mutex_lock(&pool->lock);
> >=20
> > Same question as Patch 1. This looks incorrect because qemu_cond_wait()
> > already drops pool->lock if it needs to block.
>=20
> Yes, I'll fix that.
>=20
> > Also, why wait? If worker threads are blocked for some reason then our
> > thread will block too.
>=20
> Exiting thread_pool_update_params() before honoring the new constraints i=
s a
> source of potential race conditions (having to worry for situations where
> cur_threads > max_threads), and on systems where determinism is important=
 it's
> crucial to have a clear boundary between 'unsafe' and 'safe' states.

On the other hand it creates a reliability problem where a random worker
thread can block all of QEMU. Maybe it's better to let a blocked worker
thread terminate eventually than to hang QEMU?

Stefan

--qt9c3Yps0BOdIlrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIvRLIACgkQnKSrs4Gr
c8gh9gf+JBPlXthSMc9b4FyzrFV3ad8N4Z+BdlNMrzH982j9wRoU8dkJbfDKH+Vd
+707EtAG5Rr8nVcQ3DIbseD7YzFFZ8T1f7rg3EpDgMosJiB8EsFlFNPvlIJKpf7h
iansciYBjlsQqmzTzEu2BaPob9O/+bkWxGeSuv3whL25vDW3s9r3xVdZHcrrDqOH
C8H5n6XpMTX6+h/ssaoF09PvyZQNS/MbwgDz9nBRhHHx1q4y9LBEimCsWBzjRWN0
ln3eHqcZi3cyKUqARfzS0BEIPi1Df/4YuPUp3yQBWNhsRWsEESsRSv4BI8ZYPyx2
2KTbfK4tBwIQPXy55MgORkrl89kPsA==
=WSTf
-----END PGP SIGNATURE-----

--qt9c3Yps0BOdIlrv--


