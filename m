Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5E4BA4AC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:42:37 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKivU-0005W7-Bg
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:42:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKi5a-0000Zv-W3
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKi5Z-0003iW-AE
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645109336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9JgQORVWCBgVY7bY/UZBLNDtmvjNpTQ/H8W6t5XzYY=;
 b=WLk/zajkm6+L8O3NYEGo+OxCANTreyyJgHA74ZVeP8tTdKkQW/AGjhg+SbxyGJV8iX94ud
 imOE1+NKUOzVl39A/551heAhkhniSllnKUugtRMXksNmMCInkssdX3qvg/5lV31GwSBydq
 27PTURMq472lgwjXKe0pJ+BiyOzkzcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-l61gMOfOODuvBPQIGeuADQ-1; Thu, 17 Feb 2022 09:48:53 -0500
X-MC-Unique: l61gMOfOODuvBPQIGeuADQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF06F814245;
 Thu, 17 Feb 2022 14:48:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF527D723;
 Thu, 17 Feb 2022 14:48:46 +0000 (UTC)
Date: Thu, 17 Feb 2022 14:48:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 08/20] jobs: protect jobs with job_lock/unlock
Message-ID: <Yg5gTbnNsbUpwD7P@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-9-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qZ12Regby1xc9GcU"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--qZ12Regby1xc9GcU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:01AM -0500, Emanuele Giuseppe Esposito wrote:
> diff --git a/block/replication.c b/block/replication.c
> index 55c8f894aa..a03b28726e 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
>      if (s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
>          commit_job =3D &s->commit_job->job;
>          assert(commit_job->aio_context =3D=3D qemu_get_current_aio_conte=
xt());

Is it safe to access commit_job->aio_context outside job_mutex?

> @@ -1838,7 +1840,9 @@ static void drive_backup_abort(BlkActionState *comm=
on)
>          aio_context =3D bdrv_get_aio_context(state->bs);
>          aio_context_acquire(aio_context);
> =20
> -        job_cancel_sync(&state->job->job, true);
> +        WITH_JOB_LOCK_GUARD() {
> +            job_cancel_sync(&state->job->job, true);
> +        }

Maybe job_cancel_sync() should take the lock internally since all
callers in this patch seem to need the lock?

I noticed this patch does not add WITH_JOB_LOCK_GUARD() to
tests/unit/test-blockjob.c:cancel_common(). Was that an oversight or is
there a reason why job_mutex is not needed around the job_cancel_sync()
call there?

> @@ -252,7 +258,13 @@ int block_job_add_bdrv(BlockJob *job, const char *na=
me, BlockDriverState *bs,
> =20
>  static void block_job_on_idle(Notifier *n, void *opaque)
>  {
> +    /*
> +     * we can't kick with job_mutex held, but we also want
> +     * to protect the notifier list.
> +     */
> +    job_unlock();
>      aio_wait_kick();
> +    job_lock();

I don't understand this. aio_wait_kick() looks safe to call with a mutex
held?

> @@ -292,7 +304,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed=
, Error **errp)
>      job->speed =3D speed;
> =20
>      if (drv->set_speed) {
> +        job_unlock();
>          drv->set_speed(job, speed);
> +        job_lock();

What guarantees that job stays alive during drv->set_speed(job)? We
don't hold a ref here. Maybe the assumption is that
block_job_set_speed() only gets called from the main loop thread and
nothing else will modify the jobs list while we're in drv->set_speed()?

> @@ -545,10 +566,15 @@ BlockErrorAction block_job_error_action(BlockJob *j=
ob, BlockdevOnError on_err,
>                                          action);
>      }
>      if (action =3D=3D BLOCK_ERROR_ACTION_STOP) {
> -        if (!job->job.user_paused) {
> -            job_pause(&job->job);
> -            /* make the pause user visible, which will be resumed from Q=
MP. */
> -            job->job.user_paused =3D true;
> +        WITH_JOB_LOCK_GUARD() {
> +            if (!job->job.user_paused) {
> +                job_pause(&job->job);
> +                /*
> +                 * make the pause user visible, which will be
> +                 * resumed from QMP.
> +                 */
> +                job->job.user_paused =3D true;
> +            }
>          }
>          block_job_iostatus_set_err(job, error);

Does this need the lock? If not, why is block_job_iostatus_reset()
called with the hold?

--qZ12Regby1xc9GcU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOYE0ACgkQnKSrs4Gr
c8hdqwf/c7hL70EcjaPLGKIGuSRlZf4zpfzrkR6yMLh437acIJp1pg/yH4IZlPow
zWiohu5tYwCUimBFNIEwmphniFMsbhXHIuLi4tDc18RRsSJzzTi3CBT5fzedtOkJ
a3qEmn8Bv+gcNG1MpbgkL4O0EL4Ky7K9ExnMmrzdstnX2LqLDUSEAuJX6+3N2c4l
EXJOYOhXa9NcMPjWVAENlyNFWYm7y2sGkDSkWs+RudnQT1o18wC8Ec2aZHZ5znRu
keladXM0wnt6zIlREbIaNojp1iq7dGKFZxDzbZvG6l9+yLxCrbw0bDpONUGLBoOo
FMLTR3vFQikrk/5zWWw7svb0iUKA/g==
=nfWD
-----END PGP SIGNATURE-----

--qZ12Regby1xc9GcU--


