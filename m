Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9061C4D44F2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:47:54 +0100 (CET)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGKn-0008LT-ME
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSGIq-0007Dp-6a
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSGIo-0001Ad-Os
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646909150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sy4L3wWjWHrRk566Co3iDxBDngL+iyQb2fosEfShQ3Y=;
 b=WOgKPHGLcsw/wcvbPNMn8jqPpGnGTDan7l1pC5zGqYdDyI88nVRSsMu0N7ehvJPwbGvyLR
 r66wR2L3e3Rcwuc9gBpM0djW9pYd8qHHv3igQBDq8CAwHRpKu886KxJxOubVwFPpORs3Th
 N9OnU8Om5/GZXQpoKI8GYPiejj7Qo90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-lnslLTQrO7272z-qbuXqng-1; Thu, 10 Mar 2022 05:45:44 -0500
X-MC-Unique: lnslLTQrO7272z-qbuXqng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97556801AB2;
 Thu, 10 Mar 2022 10:45:43 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCD5776C22;
 Thu, 10 Mar 2022 10:45:27 +0000 (UTC)
Date: Thu, 10 Mar 2022 10:45:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v2 4/4] util/event-loop-base: Introduce options to set
 the thread pool size
Message-ID: <YinWxsS+gF9kt1hb@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303151307.558607-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aVZEPhxKias5M/XM"
Content-Disposition: inline
In-Reply-To: <20220303151307.558607-1-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aVZEPhxKias5M/XM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 04:13:07PM +0100, Nicolas Saenz Julienne wrote:
> @@ -537,10 +546,19 @@
>  #                 0 means that the engine will use its default
>  #                 (default:0, since 6.1)
>  #
> +# @thread-pool-min: minimum number of threads readily available in the t=
hread
> +#                   pool
> +#                   (default:0, since 6.2)
> +#
> +# @thread-pool-max: maximum number of threads the thread pool can contain
> +#                   (default:64, since 6.2)

Here and elsewhere:
s/6.2/7.1/

> @@ -294,6 +314,36 @@ void thread_pool_submit(ThreadPool *pool, ThreadPool=
Func *func, void *arg)
>      thread_pool_submit_aio(pool, func, arg, NULL, NULL);
>  }
> =20
> +void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
> +{
> +    qemu_mutex_lock(&pool->lock);
> +
> +    pool->min_threads =3D ctx->thread_pool_min;
> +    pool->max_threads =3D ctx->thread_pool_max;
> +
> +    /*
> +     * We either have to:
> +     *  - Increase the number available of threads until over the min_th=
reads
> +     *    threshold.
> +     *  - Decrease the number of available threads until under the max_t=
hreads
> +     *    threshold.
> +     *  - Do nothing. the current number of threads fall in between the =
min and
> +     *    max thresholds. We'll let the pool manage itself.
> +     */
> +    for (int i =3D pool->cur_threads; i < pool->min_threads; i++) {
> +        spawn_thread(pool);
> +    }
> +
> +    while (pool->cur_threads > pool->max_threads) {
> +        qemu_sem_post(&pool->sem);
> +        qemu_mutex_unlock(&pool->lock);
> +        qemu_cond_wait(&pool->worker_stopped, &pool->lock);
> +        qemu_mutex_lock(&pool->lock);

Same question as Patch 1. This looks incorrect because qemu_cond_wait()
already drops pool->lock if it needs to block.

Also, why wait? If worker threads are blocked for some reason then our
thread will block too.

--aVZEPhxKias5M/XM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIp1sYACgkQnKSrs4Gr
c8h4Ogf/dE4jlcFVywbOQPvHgL9n9RmMDblV4G+IgbNgzqrWwmRd098lyH9wfTFt
Odj1mTbHg1BqsGCEXKgz9cJDXVIDvX3pzXdyS7lwl6ByIlJaZ2QK4b00RO3BAamS
fdZUPM3oHDjnlZz5kIqtIpa9SKP0jfTGNP/fPL9kLXiB/J90WUOk5zDvPidHuOJt
qHIwXMo2wMBSxRRWt6HHisXBYsJefY/5ztPtUd/sLHFiCS0MFKyEE5b2/14klKma
QU972+EajHyIJi4ExrUBHVOKlMnfFfA5rXAgb2ECH8d1qYzXTnBRiLO8pWDA1gj+
6w6AFT9xj1W7mUlkkHUVQ8yEPlzHFA==
=N3Fw
-----END PGP SIGNATURE-----

--aVZEPhxKias5M/XM--


