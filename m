Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E23C714B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:36:37 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IaS-0007GW-Al
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3IYz-00063S-J6
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3IYx-0002Hk-Nr
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626183302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QvIqSS50qhx262IApXXzlTxqNvgB380SomwbqvYUCcw=;
 b=Cl+IDDuiDjSKCtTKmobV2nl6EuhyoNz39X//mC8dGCnYQ0Ns48OVlwdpQPTCgUjq35Zuls
 w3IYLxS4MIzjwSxj8bdaVHJNUTFWYSzdfML3bLKXLZNNx3Syl5Z9SaIbpHIx8E1KQes8rs
 emI4Sf6CrlXU1thjAT4/KsW2RbnWr1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-e5YdFhZ-MTKxs0_WoutcWw-1; Tue, 13 Jul 2021 09:33:31 -0400
X-MC-Unique: e5YdFhZ-MTKxs0_WoutcWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB8FC1084F63;
 Tue, 13 Jul 2021 13:32:15 +0000 (UTC)
Received: from localhost (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46F53179B3;
 Tue, 13 Jul 2021 13:32:15 +0000 (UTC)
Date: Tue, 13 Jul 2021 14:32:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 2/6] job: _locked functions and public
 job_lock/unlock for next patch
Message-ID: <YO2V3mSEVVj987lS@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-3-eesposit@redhat.com>
 <YObYaIAatXp9g41G@stefanha-x1.localdomain>
 <1df55204-89ea-6e5b-e698-d985e85702a4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1df55204-89ea-6e5b-e698-d985e85702a4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eDPTLipb22+bSrfB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eDPTLipb22+bSrfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 10:43:07AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> On 08/07/2021 12:50, Stefan Hajnoczi wrote:
> > On Wed, Jul 07, 2021 at 06:58:09PM +0200, Emanuele Giuseppe Esposito wr=
ote:
> > > diff --git a/job.c b/job.c
> > > index 872bbebb01..96fb8e9730 100644
> > > --- a/job.c
> > > +++ b/job.c
> > > @@ -32,6 +32,10 @@
> > >   #include "trace/trace-root.h"
> > >   #include "qapi/qapi-events-job.h"
> > > +/* job_mutex protexts the jobs list, but also the job operations. */
> > > +static QemuMutex job_mutex;
> >=20
> > It's unclear what protecting "job operations" means. I would prefer a
> > fine-grained per-job lock that protects the job's fields instead of a
> > global lock with an unclear scope.
>=20
> As I wrote in the cover letter, I wanted to try to keep things as simple =
as
> possible with a global lock. It is possible to try and have a per-job loc=
k,
> but I don't know how complex will that be then.
> I will try and see what I can do.
>=20
> Maybe "job_mutex protexts the jobs list, but also makes the job API
> thread-safe"?

That's clearer, thanks. I thought "job operations" meant the processing
that the actual block jobs do (commit, mirror, stream, backup).

>=20
> >=20
> > > +
> > > +/* Protected by job_mutex */
> > >   static QLIST_HEAD(, Job) jobs =3D QLIST_HEAD_INITIALIZER(jobs);
> > >   /* Job State Transition Table */
> > > @@ -64,27 +68,22 @@ bool JobVerbTable[JOB_VERB__MAX][JOB_STATUS__MAX]=
 =3D {
> > >   /* Transactional group of jobs */
> > >   struct JobTxn {
> > > -    /* Is this txn being cancelled? */
> > > +    /* Is this txn being cancelled? Atomic.*/
> > >       bool aborting;
> >=20
> > The comment says atomic but this field is not accessed using atomic
> > operations (at least at this point in the patch series)?
>=20
> Yes sorry I messed up the hunks in one-two patches. These comments were
> supposed to be on patch 4 "job.h: categorize job fields". Even though tha=
t
> might also not be ideal, since that patch just introduces the comments,
> without applying the locking/protection yet.
> On the other side, if I merge everything together in patch 5, it will be
> even harder to read.

The commit description can describe changes that currently have no
effect but are anticipating a later patch. That helps reviewers
understand whether the change is intentional/correct.

Stefan

--eDPTLipb22+bSrfB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtld4ACgkQnKSrs4Gr
c8iagAf+NMPa0OwqKgLG0QuqID3j7fjMaBX/DAa/M31augEBBdG8+4l9ktz5fydK
p9ZPRQbQ6DNSfjE9lT4KKHYBGEKKumEsGqrNRGJpAVsnboa7S5+YaRyVmV9EMKy+
f4m26SABQHz3oYDSLkN9uZjyR0pQ1dbam/Majb2j7Hl4CzfgJnG5yWZSIbOvlvag
5ZJXogYc+rBq/9CvTNswLBBIoGG1HWaUar42eArutrY9h5hEEM9lvjXLeiC/z0S4
/CwQmmdbf61sdid51QJU0NUTUid/3oeyCvWw2YoofZl4M4RcglqgNqFQrMynmLIC
hDUK3Jz/eI/9R+GQ46NFRz4J2CJSjA==
=MFqu
-----END PGP SIGNATURE-----

--eDPTLipb22+bSrfB--


