Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445253496D7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:31:52 +0100 (CET)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPStj-0004YR-9M
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPSqZ-0003SL-Mv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPSqW-0001Wb-4c
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616689708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aSwIsqqnJtffZas+xQAoZEsSu8OiOjB9PSCi/sulmro=;
 b=djJzkxlTPv0N/unV+1Rj24cXKskuYr0Dee30GisA33WYjwEyJKf2DMwwN6kuqS6ttZUvyZ
 KTTAS4FaFiZKZCltr/f28ZUNb4o9T4rBtz+0J/ecHKutJ9I+OgR+aF6FhYHWo94g39y/sb
 Fx5Mbo0G80rxJvHYU4/jF6wm6dMRp8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-GTMqKYasNrefvC-a50f-zg-1; Thu, 25 Mar 2021 12:28:25 -0400
X-MC-Unique: GTMqKYasNrefvC-a50f-zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 661EB9CDB1;
 Thu, 25 Mar 2021 16:28:24 +0000 (UTC)
Received: from localhost (ovpn-114-246.ams2.redhat.com [10.36.114.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 696F45C6BD;
 Thu, 25 Mar 2021 16:28:05 +0000 (UTC)
Date: Thu, 25 Mar 2021 16:28:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PULL 0/2] Block patches
Message-ID: <YFy6FNLz+uUemP9s@stefanha-x1.localdomain>
References: <20210324145202.430759-1-stefanha@redhat.com>
 <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
 <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
 <CAFEAcA9AGoggABhV8wduAaSce3v-+zED2_QFW7QgNgGOjDJV1g@mail.gmail.com>
 <YFxeRen934TdLvs0@stefanha-x1.localdomain>
 <43869a87-cf42-30b2-16ea-4effb913e01e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <43869a87-cf42-30b2-16ea-4effb913e01e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OUH2qHWx2HSSRpkw"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OUH2qHWx2HSSRpkw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 01:17:50PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 25.03.2021 12:56, Stefan Hajnoczi wrote:
> > On Wed, Mar 24, 2021 at 08:42:27PM +0000, Peter Maydell wrote:
> > > On Wed, 24 Mar 2021 at 20:18, Vladimir Sementsov-Ogievskiy
> > > <vsementsov@virtuozzo.com> wrote:
> > > >=20
> > > > 24.03.2021 21:05, Peter Maydell wrote:
> > > > > On Wed, 24 Mar 2021 at 14:52, Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
> > > > > >=20
> > > > > > Vladimir Sementsov-Ogievskiy (2):
> > > > > >     migration/block-dirty-bitmap: make incoming disabled bitmap=
s busy
> > > > > >     migrate-bitmaps-postcopy-test: check that we can't remove i=
n-flight
> > > > > >       bitmaps
> > > > >=20
> > > > > This failed the 'qsd-jobs' iotest on s390x:
> > >=20
> > > > I can't believe it related. My commit modifies bitmap status during=
 bitmaps migration on target vm. There is no kind of migration in qsd-jobs =
test.
> > >=20
> > > It's possible it's an intermittent, but it's not one I've seen
> > > before. We still have lots of time this release cycle to figure
> > > out the issue and get this fix in.
> >=20
> > Vladimir: I'll get hold of an s390 machine and try to reproduce the
> > failure. I should have some news by Monday.
>=20
> Thanks! My path modifies migration/block-dirty-bitmap.c. qsd-jobs runs bl=
ock-commit and block-stream jobs and don't start any kind of migration or s=
napshot or savevm, so it seems impossible that qsd-jobs runs the code touch=
ed by my patch..

Confirmed. The failure is not related to this pull request.

I reproduced the same s390x host failure on commit
9e2e9fe3df9f539f8b6941ceb96d25355fdae47e (HEAD -> master, tag:
v6.0.0-rc0, origin/master, origin/HEAD):

qsd-jobs                        fail       [11:04:58] [11:04:58]   0.1s    =
             output mismatch (see qsd-jobs.out.bad)
--- /root/qemu/tests/qemu-iotests/tests/qsd-jobs.out
+++ qsd-jobs.out.bad
@@ -9,11 +9,11 @@
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {"return": {}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "paused", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, "spe=
ed": 0, "type": "commit"}}
-{"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "job0"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, =
"speed": 0, "type": "commit"}}

Peter: Please merge this pull request since the failure is pre-existing.

Thanks,
Stefan

--OUH2qHWx2HSSRpkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBcuhQACgkQnKSrs4Gr
c8gX6wf/Q9L+8nbbNVYC7xOT/Wm3vX96eJoWRQ0ocTu7AhVKyvpZYwOYtXV8mOjM
MYLwuuv8Owvqxik4la70VKYoTpVWhjBH1G3oa1dkhqEm7yytRYSFTtNTOO3pV0rZ
CyPanAL/fsHVKfH3saWJvPrV4YzNKgxT5tui9AkLXI+DNMSVuCIrgN1cEhEHYb8E
78TpEYjyVOotz1drOGr1zWKempiTkr49p6vsAuuRoEF24FtB9QwU4GoDoNPLAd/1
Rx14pSY7jMZUHsqFIkqIQ12Gv6hiqDrd9sVNi4OSgoDugr6aVw/nK7QbXN2iUMiw
u1RdKx42nge+hyj5C63fta1BDqOgMQ==
=X2EV
-----END PGP SIGNATURE-----

--OUH2qHWx2HSSRpkw--


