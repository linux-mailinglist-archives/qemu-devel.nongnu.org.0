Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F5F5664FB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:28:27 +0200 (CEST)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dv0-0002so-Ex
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dhI-0002jP-46
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dhG-0000zB-Pz
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWst998IXEc3DLyeqGyxuDu0xib8QwtUweoigxKoFNs=;
 b=YRG0zuVtCFxxZXQH4WqQKLUm8OoW5CYiZhXcp1IsM7O7cyRN/Fy9hha8aXj4GqJ+4Hily2
 gj6S+FfDqxnu+1TKfNAopSih9hB9pLxFvq1rkRfuvc51PxseMZqL3/qTD0znIsTPdo19iO
 1gRmYIcQBy0HR9ZIrv3Yv8pKRgiK62Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-4zMnZrhnPZmKnzg5HlEcHA-1; Tue, 05 Jul 2022 04:14:10 -0400
X-MC-Unique: 4zMnZrhnPZmKnzg5HlEcHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FCBB101A592;
 Tue,  5 Jul 2022 08:14:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 203702166B26;
 Tue,  5 Jul 2022 08:14:08 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:14:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 13/20] jobs: group together API calls under the same
 job lock
Message-ID: <YsPyzyOItXg9Y4c0@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-14-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8SQ9KPbS0AKq1JjU"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-14-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8SQ9KPbS0AKq1JjU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:31AM -0400, Emanuele Giuseppe Esposito wrote:
> diff --git a/blockdev.c b/blockdev.c
> index 71f793c4ab..5b79093155 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>          return;
>      }
> =20
> -    for (job =3D block_job_next(NULL); job; job =3D block_job_next(job))=
 {
> +    JOB_LOCK_GUARD();
> +
> +    for (job =3D block_job_next_locked(NULL); job;
> +         job =3D block_job_next_locked(job)) {
>          if (block_job_has_bdrv(job, blk_bs(blk))) {
>              AioContext *aio_context =3D job->job.aio_context;
>              aio_context_acquire(aio_context);

Is there a lock ordering rule for job_mutex and the AioContext lock? I
haven't audited the code, but there might be ABBA lock ordering issues.

> diff --git a/qemu-img.c b/qemu-img.c
> index 4cf4d2423d..289d88a156 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error **er=
rp)
>      int ret =3D 0;
> =20
>      aio_context_acquire(aio_context);
> -    job_ref(&job->job);
> -    do {
> -        float progress =3D 0.0f;
> -        aio_poll(aio_context, true);
> +    WITH_JOB_LOCK_GUARD() {

Here the lock order is the opposite of above.

--8SQ9KPbS0AKq1JjU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD8s8ACgkQnKSrs4Gr
c8jeowf/YcElucwcDR9egVss6OnepGz7xAU130jx825bKDs0WmfvNjeP8Chq+0DB
7+LRaWGZBPvHqW4Stimie/hrGLeLRA5UVKhDm0okuVSwE9o5wk8KVoN5P7CWjbwp
4trWfKozISIGvAFMPfVt/VilZdNP3MKPQUQxBZi1QmoevBFPg/8Vv1BB2AzMxB6J
gHYDeiK8/8UGtr3Et5l3JCWOktfcLuoByBmly8EOTunVhkVs8Gq3L+drSnZhpODu
UzYaeG+BGzLYtZuXqk77F6AGo9PtYDhce94f806wGfpPpGO4FO3Nt/71LUkvUdyj
9enTLBoyqUrkfNHxAivuCJ5af6howQ==
=+o0k
-----END PGP SIGNATURE-----

--8SQ9KPbS0AKq1JjU--


