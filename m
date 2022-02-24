Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0EA4C31D1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:50:10 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHJg-00056b-V4
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:50:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNHIF-0004Jb-FM
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNHIC-0001r1-7d
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645721314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Ob38RyLSgRhOPQbrpX4rziqofNWt9SY9AIGtBEuT24=;
 b=YoHFB0/H+QWR4LpzTk5gdtLIaaALWNhhir2um1b7EkxpDoV+UzDg/SEciR31I1KqHV0QA/
 cPrefLj8kAfOSyEsHP9u6Aba9AnjSVXBcGsUVEhLuA0mhgDF8OXgaHKGMQXriR+yJPx3nR
 1e5AhDUQF2XKtinAsQ4bceG7TPW46Yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-9gQqcSD5Mq2HjCYHsLcZyQ-1; Thu, 24 Feb 2022 11:48:32 -0500
X-MC-Unique: 9gQqcSD5Mq2HjCYHsLcZyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 745C8800425;
 Thu, 24 Feb 2022 16:48:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F03D80687;
 Thu, 24 Feb 2022 16:48:15 +0000 (UTC)
Date: Thu, 24 Feb 2022 16:48:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 08/20] jobs: protect jobs with job_lock/unlock
Message-ID: <Yhe2zihPZARQbEDJ@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-9-eesposit@redhat.com>
 <Yg5gTbnNsbUpwD7P@stefanha-x1.localdomain>
 <fe90032a-0fe1-a368-8ce9-084b338623e6@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ubjIRzb3vJ5E8RK0"
Content-Disposition: inline
In-Reply-To: <fe90032a-0fe1-a368-8ce9-084b338623e6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--ubjIRzb3vJ5E8RK0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 01:45:48PM +0100, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> On 17/02/2022 15:48, Stefan Hajnoczi wrote:
> > On Tue, Feb 08, 2022 at 09:35:01AM -0500, Emanuele Giuseppe Esposito wr=
ote:
> >> diff --git a/block/replication.c b/block/replication.c
> >> index 55c8f894aa..a03b28726e 100644
> >> --- a/block/replication.c
> >> +++ b/block/replication.c
> >> @@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
> >>      if (s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
> >>          commit_job =3D &s->commit_job->job;
> >>          assert(commit_job->aio_context =3D=3D qemu_get_current_aio_co=
ntext());
> >=20
> > Is it safe to access commit_job->aio_context outside job_mutex?
>=20
> No, but it is currently not done. Patch 18 takes care of protecting
> aio_context. Remember again that job lock API is still nop.
> >=20
> >> @@ -1838,7 +1840,9 @@ static void drive_backup_abort(BlkActionState *c=
ommon)
> >>          aio_context =3D bdrv_get_aio_context(state->bs);
> >>          aio_context_acquire(aio_context);
> >> =20
> >> -        job_cancel_sync(&state->job->job, true);
> >> +        WITH_JOB_LOCK_GUARD() {
> >> +            job_cancel_sync(&state->job->job, true);
> >> +        }
> >=20
> > Maybe job_cancel_sync() should take the lock internally since all
> > callers in this patch seem to need the lock?
>=20
> The _locked version is useful because it is used when lock guards are
> already present, and cover multiple operations. There are only 3 places
> where a lock guard is added to cover job_cance_sync_locked. Is it worth
> defining another additional function?
>=20
>=20
> >=20
> > I noticed this patch does not add WITH_JOB_LOCK_GUARD() to
> > tests/unit/test-blockjob.c:cancel_common(). Was that an oversight or is
> > there a reason why job_mutex is not needed around the job_cancel_sync()
> > call there?
>=20
> No, locks in unit tests are added in patch 10 "jobs: protect jobs with
> job_lock/unlock".

I see, it's a question of how to split up the patches. When patches
leave the code in a state with broken invariants it becomes difficult to
review. I can't distinguish between actual bugs and temporary violations
that will be fixed in a later patch (unless they are clearly marked).

If you can structure patches so they are self-contained and don't leave
the broken invariants then that would make review easier, but in this
case it is tricky so I'll do the best I can to review it if you cannot
restructure the sequence of commits.

> >=20
> >> @@ -252,7 +258,13 @@ int block_job_add_bdrv(BlockJob *job, const char =
*name, BlockDriverState *bs,
> >> =20
> >>  static void block_job_on_idle(Notifier *n, void *opaque)
> >>  {
> >> +    /*
> >> +     * we can't kick with job_mutex held, but we also want
> >> +     * to protect the notifier list.
> >> +     */
> >> +    job_unlock();
> >>      aio_wait_kick();
> >> +    job_lock();
> >=20
> > I don't understand this. aio_wait_kick() looks safe to call with a mutex
> > held?
> You are right. It should be safe.
>=20
> >=20
> >> @@ -292,7 +304,9 @@ bool block_job_set_speed(BlockJob *job, int64_t sp=
eed, Error **errp)
> >>      job->speed =3D speed;
> >> =20
> >>      if (drv->set_speed) {
> >> +        job_unlock();
> >>          drv->set_speed(job, speed);
> >> +        job_lock();
> >=20
> > What guarantees that job stays alive during drv->set_speed(job)? We
> > don't hold a ref here. Maybe the assumption is that
> > block_job_set_speed() only gets called from the main loop thread and
> > nothing else will modify the jobs list while we're in drv->set_speed()?
>=20
> What guaranteed this before? I am not sure.

I guess the reason is the one I suggested. It should be documented in
the comments.

>=20
> >=20
> >> @@ -545,10 +566,15 @@ BlockErrorAction block_job_error_action(BlockJob=
 *job, BlockdevOnError on_err,
> >>                                          action);
> >>      }
> >>      if (action =3D=3D BLOCK_ERROR_ACTION_STOP) {
> >> -        if (!job->job.user_paused) {
> >> -            job_pause(&job->job);
> >> -            /* make the pause user visible, which will be resumed fro=
m QMP. */
> >> -            job->job.user_paused =3D true;
> >> +        WITH_JOB_LOCK_GUARD() {
> >> +            if (!job->job.user_paused) {
> >> +                job_pause(&job->job);
> >> +                /*
> >> +                 * make the pause user visible, which will be
> >> +                 * resumed from QMP.
> >> +                 */
> >> +                job->job.user_paused =3D true;
> >> +            }
> >>          }
> >>          block_job_iostatus_set_err(job, error);
> >=20
> > Does this need the lock? If not, why is block_job_iostatus_reset()
> > called with the hold?
> >=20
> block_job_iostatus_set_err does not touch any Job fields. On the other
> hand block_job_iostatus_reset reads job.user_paused and job.pause_count.

BlockJob->iostatus requires no locking?

--ubjIRzb3vJ5E8RK0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIXts4ACgkQnKSrs4Gr
c8hm+Af+Nim8cayQE1tzLkI1wZyiTe2YZHhnqnlNl+z/lbKbyO/xzSnPeNtx/gxU
uXjhVQRfbZH/Cmo1SNp4elTpwazFbWd03KWeX3A6HxBDngEMsJJRstCkim02GggP
yBHDPci5559CjeEKsQAwq9ckt7+9OJ2itnYS3SeQatxNPO6sRMjZW29i8XZv+A6l
rgQqhalAGUzcbEIwobMmaqOrm2c1J99mAZ6QOtCbT+HvVz73s+EhqvpYmaaa95nj
Y/fLAasWis5e2XNwBTDLIvP/Je6sfP7QYnCaQZBfv2UyVnCcNH36Sa5zMPBfThvX
Ot8d7/yDxkY/RhMN7yowCVxijjlMHA==
=LrpS
-----END PGP SIGNATURE-----

--ubjIRzb3vJ5E8RK0--


