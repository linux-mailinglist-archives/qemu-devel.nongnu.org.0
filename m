Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB36568505
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:17:46 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o926K-0003m3-NX
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9220-0000BW-Q7
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o921x-0005cb-Ly
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657102392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2pblBfQLh6l+VnXM7hKL/iDmE+Cxwl/ctNYwNiOLm9o=;
 b=UXPhbn5GKODUj9TWVcuYlYFYIumq0rduHhXNZukfE93aw/2eHBTbWkfUhP1Qu2m5R4UXQH
 i9osLvCMJA8qIVU7pqv58GYZMuaQ8EdtDKUoqR4KjOcjc9JKt9HBeQjoezXDS1cMyZeU3f
 sE5FjPCNF+Z40dqZ0uTvFUyzvCMRP+k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-WVUb6TGOPcGKDYF3uC5a7Q-1; Wed, 06 Jul 2022 06:13:09 -0400
X-MC-Unique: WVUb6TGOPcGKDYF3uC5a7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F15BB299E75A;
 Wed,  6 Jul 2022 10:13:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77831140EBE3;
 Wed,  6 Jul 2022 10:13:08 +0000 (UTC)
Date: Wed, 6 Jul 2022 11:13:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 13/20] jobs: group together API calls under the same
 job lock
Message-ID: <YsVgMtM9hl0lB26k@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-14-eesposit@redhat.com>
 <YsPyzyOItXg9Y4c0@stefanha-x1.localdomain>
 <85eb06db-15ab-1451-c420-ec4956febe98@redhat.com>
 <fa3e1d40-fe1c-7ae8-81da-d0122c753cc8@redhat.com>
 <197ee109-450a-746a-e46e-a1ca511c3455@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oBLU475sOaA6tw34"
Content-Disposition: inline
In-Reply-To: <197ee109-450a-746a-e46e-a1ca511c3455@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oBLU475sOaA6tw34
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 04:22:41PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> On 7/5/22 16:01, Emanuele Giuseppe Esposito wrote:
> >=20
> >=20
> > Am 05/07/2022 um 10:17 schrieb Emanuele Giuseppe Esposito:
> > >=20
> > >=20
> > > Am 05/07/2022 um 10:14 schrieb Stefan Hajnoczi:
> > > > On Wed, Jun 29, 2022 at 10:15:31AM -0400, Emanuele Giuseppe Esposit=
o wrote:
> > > > > diff --git a/blockdev.c b/blockdev.c
> > > > > index 71f793c4ab..5b79093155 100644
> > > > > --- a/blockdev.c
> > > > > +++ b/blockdev.c
> > > > > @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *b=
lk)
> > > > >           return;
> > > > >       }
> > > > > -    for (job =3D block_job_next(NULL); job; job =3D block_job_ne=
xt(job)) {
> > > > > +    JOB_LOCK_GUARD();
> > > > > +
> > > > > +    for (job =3D block_job_next_locked(NULL); job;
> > > > > +         job =3D block_job_next_locked(job)) {
> > > > >           if (block_job_has_bdrv(job, blk_bs(blk))) {
> > > > >               AioContext *aio_context =3D job->job.aio_context;
> > > > >               aio_context_acquire(aio_context);
> > > >=20
> > > > Is there a lock ordering rule for job_mutex and the AioContext lock=
? I
> > > > haven't audited the code, but there might be ABBA lock ordering iss=
ues.
> > >=20
> > > Doesn't really matter here, as lock is nop. To be honest I forgot whi=
ch
> > > one should go first, probably job_lock because the aiocontext lock can
> > > be taken and released in callbacks.
> > >=20
> > > Should I resend with ordering fixed? Just to have a consistent logic
> >=20
> > Well actually how do I fix that? I would just add useless additional
> > changes into the diff, because for example in the case below I am not
> > even sure what exactly is the aiocontext protecting.
> >=20
> > So I guess I'll leave as it is. I will just update the commit message to
> > make sure it is clear that the lock is nop and ordering is mixed.
> >=20
>=20
> Yes, I think it's OK.
>=20
> As far as I understand, our final ordering rule is that job_mutex can be =
taken under aio context lock but not visa-versa.

I'm also fine with resolving the ordering in a later patch.

Stefan

--oBLU475sOaA6tw34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLFYDIACgkQnKSrs4Gr
c8gE2gf+MSONfdPcMHZ22ggzE0E/NtwR/M5dOXHBjpjF4Wq7v6hhuHtJMNv0kWL+
3WcKGw2sbjEYHzzWd0Ipec9Z5ag+m28TMiCTwMkt2kkSCK3FKwrELxA4rPrd4vmY
SnWHFQ9JZCuV68qsUdW5AeIVsJ/v2cfbmVRGDwxfl4j/jvjqRiiG9JdTjJ5DilYO
L0+vNArgBVsWtQRHrKfBonC/n9+f6vXx85wFjcoDecFsk7nmKCga51ba/o/TQ3PG
3iW64379qYC9bHzRiNf1/sxKX2UUfDSaefeNYIs1NvnvAWyWjAVJqkJX2NDRTVpx
A1FWydvDhiDDKfPtizuiIRUAaO5ReQ==
=K3DF
-----END PGP SIGNATURE-----

--oBLU475sOaA6tw34--


