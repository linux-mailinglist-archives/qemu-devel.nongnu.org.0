Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02B04D19DE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 14:59:01 +0100 (CET)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaMe-0004lZ-LO
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 08:59:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRa6W-0000nC-70
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:42:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRa6U-0003HK-2u
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646746937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sIchwQI1yR3nDMUQRY1AkJJgv7CPJwb5XMSkk9uKpbI=;
 b=Oz3YTjmvTTw2+C2h2NCmqZtnIvJe4aT9CvOTQSNQFsHPHG/PmrsX9cyUw51N1X9d96eXfF
 k3d0fI8/IYB11Jgc4E7FN3sFqG25GFS9KT5lk0l/ZaZ23zBfbB/XSM/rDwVfws9pI6YhfN
 ueON6nxgXVORoBPygnzMzAa5YhmCaoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-D3enF_0XOB2QpeguzUVgjQ-1; Tue, 08 Mar 2022 08:42:14 -0500
X-MC-Unique: D3enF_0XOB2QpeguzUVgjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D301854E21;
 Tue,  8 Mar 2022 13:42:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08BB678879;
 Tue,  8 Mar 2022 13:41:51 +0000 (UTC)
Date: Tue, 8 Mar 2022 13:41:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 18/20] jobs: protect job.aio_context with BQL and
 job_mutex
Message-ID: <YiddHpzrhH+h/bNH@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-19-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ldEeeSRwbqC6OhWK"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-19-eesposit@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ldEeeSRwbqC6OhWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:11AM -0500, Emanuele Giuseppe Esposito wrote:
>  static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>  {
>      BlockJob *job =3D c->opaque;
> +    assert(qemu_in_main_thread());
> =20
>      return job->job.aio_context;
>  }

It's not clear to me that .get_parent_aio_context() should only be
called from the main thread. The API is read-only so someone might try
to call from I/O code in the future expecting it to work like other
read-only graph APIs that are available from I/O code.

Currently the assertion is true because the only user is
bdrv_attach_child_*() but please document this invariant for
bdrv_child_get_parent_aio_context() and the callback. Maybe move the
assertion into a higher-level function like
bdrv_child_get_parent_aio_context() (if that still covers all cases).

> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index dfbf2ea501..ca46e46f5b 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -75,7 +75,12 @@ typedef struct Job {
>      ProgressMeter progress;
> =20
> =20
> -    /** AioContext to run the job coroutine in */
> +    /**
> +     * AioContext to run the job coroutine in.
> +     * This field can be read when holding either the BQL (so we are in
> +     * the main loop) or the job_mutex.
> +     * Instead, it can be only written when we hold *both* BQL and job_m=
utex.

s/Instead,//

(It sounds weird because "instead" means "replacement" or "substitution"
We're comparing "read" and "write" here, not substituting them.
Something like "on the other hand" or "conversely" works.)

> +     */
>      AioContext *aio_context;
> =20
>      /** Reference count of the block job */
> @@ -706,4 +711,16 @@ void job_dismiss_locked(Job **job, Error **errp);
>  int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
>                             Error **errp);
> =20
> +/**
> + * Sets the @job->aio_context.
> + * Called with job_mutex *not* held.
> + *
> + * This function must run in the main thread to protect against
> + * concurrent read in job_finish_sync_locked(),
> + * takes the job_mutex lock to protect against the read in
> + * job_do_yield_locked(), and must be called when the coroutine
> + * is quiescent.
> + */
> +void job_set_aio_context(Job *job, AioContext *ctx);
> +
>  #endif
> diff --git a/job.c b/job.c
> index f05850a337..7a07d25ec3 100644
> --- a/job.c
> +++ b/job.c
> @@ -354,6 +354,17 @@ Job *job_get_locked(const char *id)
>      return NULL;
>  }
> =20
> +void job_set_aio_context(Job *job, AioContext *ctx)
> +{
> +    /* protect against read in job_finish_sync_locked and job_start */
> +    assert(qemu_in_main_thread());
> +    /* protect against read in job_do_yield_locked */
> +    JOB_LOCK_GUARD();
> +    /* ensure the coroutine is quiescent while the AioContext is changed=
 */
> +    assert(job->pause_count > 0);
> +    job->aio_context =3D ctx;
> +}
> +
>  /* Called with job_mutex *not* held. */
>  static void job_sleep_timer_cb(void *opaque)
>  {
> @@ -1256,6 +1267,7 @@ int job_finish_sync_locked(Job *job, void (*finish)=
(Job *, Error **errp),
>  {
>      Error *local_err =3D NULL;
>      int ret;
> +    assert(qemu_in_main_thread());
> =20
>      job_ref_locked(job);
> =20
> --=20
> 2.31.1
>=20

--ldEeeSRwbqC6OhWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInXR4ACgkQnKSrs4Gr
c8it6Af/Xy32g6EQALPkbhnVrhQl86HdtxORXkLh7E4HZew9Q11zms3lIr5zoJFl
QGQYcJQl1KsCRfCHRyKyH4PXpaVrDl7Mcyru4WPQ4xCKFzgkhM705XTth/ElO3hv
EIghGhXEvj20OYozwY2JTRM49Iu2iw1fIhsCtxaRAMOdfm5teXREQM1ENV2q0TzC
KdhA2RJGSwVOXF2634o/nSRIpfUcx6l84TyUjOhjcnT8Za0kUMhN6a2Ut7IXrYKB
POZGyMrNtuKDUsqA3am8gXi4PvoK78ullsNKI0mlE6BOTHvaeX2FySfIINXQ0vva
40hkyXLZrONBGLAaDJ5vJY5mpiMU4Q==
=zaRt
-----END PGP SIGNATURE-----

--ldEeeSRwbqC6OhWK--


