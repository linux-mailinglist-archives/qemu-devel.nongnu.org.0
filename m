Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A574BA390
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:50:35 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKi77-0000qJ-RQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKhWZ-0002Uz-1R
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKhWX-0006oy-GI
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645107163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OaQjRcFhPdDPCJE7+4fugMZnAW8MqV8/DlME2/soBlU=;
 b=YT1wk8Y6bO73VCMwbyxQDo4HNFE1sz7lki3Hb4ZKqgCvLEmrrsSgmxlgvW5iHfgiY7oimk
 6BPIK9d0J2NanyfJdMDiYAAw+Dnk+fHrElRBbeDcYa39zRy4Ep9DJmE1fwwgs7euu0QgIk
 3iEcvo5I6cqHbftX6FzhLQVsrSFS3FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-smChv5SAO-yM0wV5ojZSoA-1; Thu, 17 Feb 2022 09:12:40 -0500
X-MC-Unique: smChv5SAO-yM0wV5ojZSoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CCBC2F4A;
 Thu, 17 Feb 2022 14:12:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C55FF106A7AF;
 Thu, 17 Feb 2022 14:12:38 +0000 (UTC)
Date: Thu, 17 Feb 2022 14:12:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 06/20] jobs: remove aiocontext locks since the
 functions are under BQL
Message-ID: <Yg5X1V1md25LOxaP@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vYqf68ODQ7+wLF8Y"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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


--vYqf68ODQ7+wLF8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:34:59AM -0500, Emanuele Giuseppe Esposito wrote:
> In preparation to the job_lock/unlock patch, remove these
> aiocontext locks.
> The main reason these two locks are removed here is because
> they are inside a loop iterating on the jobs list. Once the
> job_lock is added, it will have to protect the whole loop,
> wrapping also the aiocontext acquire/release.
>=20
> We don't want this, as job_lock must be taken inside the AioContext
> lock, and taking it outside would cause deadlocks.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockdev.c | 4 ----
>  job-qmp.c  | 4 ----
>  2 files changed, 8 deletions(-)
>=20
> diff --git a/blockdev.c b/blockdev.c
> index 8cac3d739c..e315466914 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3713,15 +3713,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **er=
rp)
> =20
>      for (job =3D block_job_next(NULL); job; job =3D block_job_next(job))=
 {

I'm confused. block_job_next() is supposed to be called with job_mutex
held since it iterates the jobs list.

The patch series might fix this later on but it's hard to review patches
with broken invariants.

Does this mean git-bisect(1) is broken since intermediate commits are
not thread-safe?

>          BlockJobInfo *value;
> -        AioContext *aio_context;
> =20
>          if (block_job_is_internal(job)) {
>              continue;
>          }
> -        aio_context =3D block_job_get_aio_context(job);
> -        aio_context_acquire(aio_context);
>          value =3D block_job_query(job, errp);

This function accesses fields that are protected by job_mutex, which we
don't hold.

--vYqf68ODQ7+wLF8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOV9UACgkQnKSrs4Gr
c8hFWggAhSI4gCSd6kwo3kttGmlIHzZaIjA4FRCT1ulAISElX9romT4QRhG7LHkE
zrdVbx9WsfEAI0/YSmL5+f49m6zl8taxnRaGBkp3nFkua4HMQz/IA0PahFUju6SB
DugMkiniHVGbV9dI2mSNvLnRcGcvv4niMmpZwF5/prutjx+g2vAuQGfjwhdC7O3f
BWJd2b1KHz9J/77ArNxQKLxcy+55CsjfSpDRPbNaBtwv53IMGRmfsy3i+LXkbkZp
ZacvYqD/GXZWaZ6KLr0TVP4KsgmNNjnTYPhuuRc28VPZrc8a6sh6/St5dkWoUmd7
RKmvZp8ID6yocVo50emct88PN3Nzlw==
=DvOY
-----END PGP SIGNATURE-----

--vYqf68ODQ7+wLF8Y--


