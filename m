Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9E6477868
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:21:04 +0100 (CET)
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtV9-0003Lz-LJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:21:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtSz-0001CB-KZ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:18:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxtSx-00035w-Vj
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639671526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dszhbhfu5YCJ1lWcLX28oZPtYz6NIA3kODREhFY2cjk=;
 b=LWXv03kernNQWPW10PjFHZJkJGoiIrTfm08UE5O2VKNk/4a9TskX9xqGY+78YXuXz+QtN7
 DTvg0lYcU4eyiEL1kkgucK3C/ulBR2mq786vLAYMAWV0QOnfZE3GXHnRunr+1z8erzFeC5
 feaN6azq2UJ1Vq+GaepL5DkE7zNKln0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124--zysk8vGOtOWwI0NGd4wxA-1; Thu, 16 Dec 2021 11:18:42 -0500
X-MC-Unique: -zysk8vGOtOWwI0NGd4wxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA00100CC85;
 Thu, 16 Dec 2021 16:18:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37A3357CD2;
 Thu, 16 Dec 2021 16:18:40 +0000 (UTC)
Date: Thu, 16 Dec 2021 16:18:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 01/14] job.c: make job_lock/unlock public
Message-ID: <Ybtm3zOxRgFeZclm@stefanha-x1.localdomain>
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104145334.1346363-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s9Od4gNUle3ku+zU"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--s9Od4gNUle3ku+zU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 10:53:21AM -0400, Emanuele Giuseppe Esposito wrote:
> job mutex will be used to protect the job struct elements and list,
> replacing AioContext locks.
>=20
> Right now use a shared lock for all jobs, in order to keep things
> simple. Once the AioContext lock is gone, we can introduce per-job
> locks.
>=20
> To simplify the switch from aiocontext to job lock, introduce
> *nop* lock/unlock functions and macros. Once everything is protected
> by jobs, we can add the mutex and remove the aiocontext.
> Since job_mutex is already being used, add static
> _job_{lock/unlock}.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/qemu/job.h | 18 ++++++++++++++++++
>  job.c              | 39 +++++++++++++++++++++++++++------------
>  2 files changed, 45 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 7e9e59f4b8..ccf7826426 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -297,6 +297,24 @@ typedef enum JobCreateFlags {
>      JOB_MANUAL_DISMISS =3D 0x04,
>  } JobCreateFlags;
> =20
> +/**
> + * job_lock:
> + *
> + * Take the mutex protecting the list of jobs and their status.
> + * Most functions called by the monitor need to call job_lock
> + * and job_unlock manually.  On the other hand, function called
> + * by the block jobs themselves and by the block layer will take the
> + * lock for you.
> + */
> +void job_lock(void);
> +
> +/**
> + * job_unlock:
> + *
> + * Release the mutex protecting the list of jobs and their status.
> + */
> +void job_unlock(void);
> +
>  /**
>   * Allocate and return a new job transaction. Jobs can be added to the
>   * transaction using job_txn_add_job().
> diff --git a/job.c b/job.c
> index 94b142684f..0e4dacf028 100644
> --- a/job.c
> +++ b/job.c
> @@ -32,6 +32,12 @@
>  #include "trace/trace-root.h"
>  #include "qapi/qapi-events-job.h"
> =20
> +/*
> + * job_mutex protects the jobs list, but also makes the
> + * struct job fields thread-safe.
> + */
> +static QemuMutex job_mutex;
> +
>  static QLIST_HEAD(, Job) jobs =3D QLIST_HEAD_INITIALIZER(jobs);
> =20
>  /* Job State Transition Table */
> @@ -74,17 +80,26 @@ struct JobTxn {
>      int refcnt;
>  };
> =20
> -/* Right now, this mutex is only needed to synchronize accesses to job->=
busy
> - * and job->sleep_timer, such as concurrent calls to job_do_yield and
> - * job_enter. */
> -static QemuMutex job_mutex;
> +#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
> +
> +#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
> +
> +void job_lock(void)
> +{
> +    /* nop */
> +}
> +
> +void job_unlock(void)
> +{
> +    /* nop */
> +}
> =20
> -static void job_lock(void)
> +static void _job_lock(void)

QEMU code does not use leading underscores because the C standard
reserves them. real_job_lock()?

See "7.1.3 Reserved identifiers" in C99.

--s9Od4gNUle3ku+zU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7Zt8ACgkQnKSrs4Gr
c8iq5ggAtAffiN1QgExadDGpu6wJ0Yk3uG6uYMEmZ5I7XRshGWxU4/9ve+xw3tsJ
kvcdkuvjOChjofeVmvroYkGwkSiRgFsDa1dQRAUU2jDhakUXvxPZpqhHuD6EefEc
waoTPbQspYot/4fH/GMoAenK1p0737dc8nDd6BIqcepgPVuu7LS95tNOgjRfGu51
/6cJ66syiqzrg1GDSKcYR4MK2nvPyzctMnhC9WlQXmynQkwdp9HzICvbu13GI6q5
ukgKw6OlXvFC5yHWMR9OgtLvDUEAEt21eN7OZXJ3wz7b8EbLqNChwrCfNY7PMSyx
ZU76wXEuCP4cFXK6PEh90r/urZ6fyA==
=fmQo
-----END PGP SIGNATURE-----

--s9Od4gNUle3ku+zU--


