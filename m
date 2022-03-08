Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DF4D1629
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:22:40 +0100 (CET)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXvL-0005ih-Tj
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRXsO-0003AX-Nb
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRXsM-00030P-OX
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646738373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4SurBzF05RIJucpEre2GY8N2HACUkfB8GkSDgrOnuEM=;
 b=HuHq6oS6j8kFISmitvZpx3LjKlKijWS9ytY27jxe2qzcyKOYWuY2rv3s1a12Z7DLFYUHuv
 YppH3FNwsXPXHrubbm25JbRniHXAElrAsAMtugD9rlx+pGEjsbBQ6LMAkkWfaaOuvPFL+V
 GHYn7yGziLJ94DQXeXKVBoo9sGxCreU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-NTYhtnMPOhOCXM9mPL00zw-1; Tue, 08 Mar 2022 06:19:30 -0500
X-MC-Unique: NTYhtnMPOhOCXM9mPL00zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4BA8145F6;
 Tue,  8 Mar 2022 11:19:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFFEF7B6EE;
 Tue,  8 Mar 2022 11:19:28 +0000 (UTC)
Date: Tue, 8 Mar 2022 11:19:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 17/20] job: detect change of aiocontext within job
 coroutine
Message-ID: <Yic7v9tAVdxGml5v@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-18-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="caObCPKF/6WU9MBs"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-18-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--caObCPKF/6WU9MBs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:10AM -0500, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> We want to make sure access of job->aio_context is always done
> under either BQL or job_mutex. The problem is that using
> aio_co_enter(job->aiocontext, job->co) in job_start and job_enter_cond
> makes the coroutine immediately resume, so we can't hold the job lock.
> And caching it is not safe either, as it might change.
>=20
> job_start is under BQL, so it can freely read job->aiocontext, but
> job_enter_cond is not. In order to fix this, use aio_co_wake():
> the advantage is that it won't use job->aiocontext, but the
> main disadvantage is that it won't be able to detect a change of
> job AioContext.
>=20
> Calling bdrv_try_set_aio_context() will issue the following calls
> (simplified):
> * in terms of  bdrv callbacks:
>   .drained_begin -> .set_aio_context -> .drained_end
> * in terms of child_job functions:
>   child_job_drained_begin -> child_job_set_aio_context -> child_job_drain=
ed_end
> * in terms of job functions:
>   job_pause_locked -> job_set_aio_context -> job_resume_locked
>=20
> We can see that after setting the new aio_context, job_resume_locked
> calls again job_enter_cond, which then invokes aio_co_wake(). But
> while job->aiocontext has been set in job_set_aio_context,
> job->co->ctx has not changed, so the coroutine would be entering in
> the wrong aiocontext.
>=20
> Using aio_co_schedule in job_resume_locked() might seem as a valid
> alternative, but the problem is that the bh resuming the coroutine
> is not scheduled immediately, and if in the meanwhile another
> bdrv_try_set_aio_context() is run (see test_propagate_mirror() in
> test-block-iothread.c), we would have the first schedule in the
> wrong aiocontext, and the second set of drains won't even manage
> to schedule the coroutine, as job->busy would still be true from
> the previous job_resume_locked().
>=20
> The solution is to stick with aio_co_wake(), but then detect every time
> the coroutine resumes back from yielding if job->aio_context
> has changed. If so, we can reschedule it to the new context.
>=20
> Check for the aiocontext change in job_do_yield_locked because:
> 1) aio_co_reschedule_self requires to be in the running coroutine
> 2) since child_job_set_aio_context allows changing the aiocontext only
>    while the job is paused, this is the exact place where the coroutine
>    resumes, before running JobDriver's code.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  job.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--caObCPKF/6WU9MBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInO78ACgkQnKSrs4Gr
c8gh1QgAwZ4mdKjTSpDXNKHENv6CBFNC9wz0mXJLeEoWJ1eknx5o+LDgm+OCIKV7
uzuBcilnvF2ziiAi4R3D0fHDTah4AvMqBH7sgw6UCsZ0zfCJAKZZ2SJk9pC5uDuc
tzIFhxzhGzVh8dImpNtu1+1XPvW/SyD/7xx0Srzv6aiUFAWhfvnVcflmZu5RcpU8
8EQdf8qr21ncO7H3lv27uKa7N4i9JxfLuGGkV2fWNT1rN5/Vz06WxSh+SZyF6kZl
yQGWUzP+TEslBAphx2sJgUCxspFw3FGWVvDtoFXG1vCee+U0iBjmd2CGmsn18Ne7
AQPfyd5ZTUnkv/XJhiHzlPxdgtG31g==
=eA5h
-----END PGP SIGNATURE-----

--caObCPKF/6WU9MBs--


