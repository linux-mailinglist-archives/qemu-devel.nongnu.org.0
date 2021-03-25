Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012CF34987D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:43:04 +0100 (CET)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPU0d-0008CY-2v
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPTyg-0007fl-Kn
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPTyX-0008EH-92
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616694050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDU+1xw6rO5hDq43xNIHqnpsD2N7O92QleZPuxe6asE=;
 b=SnsCz2a5fXDaswdXI/v3Gr/TQrZOFP731ecMMM+gDMRkHHlj/78IMQSQayqwIrzpbKH1+d
 6tWzRWeA8YWUA3ccuBGG6mFSybcPOimBzdZSQjXgpRWbaw780DLyVi73eB/KkAZsfLPFpg
 dRr6cpMgs103VgaFY82C7rBhp+7S+Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-eUGAgFqHMQOyV9jnn20Efg-1; Thu, 25 Mar 2021 13:40:48 -0400
X-MC-Unique: eUGAgFqHMQOyV9jnn20Efg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1D589CDAD;
 Thu, 25 Mar 2021 17:40:46 +0000 (UTC)
Received: from localhost (ovpn-114-246.ams2.redhat.com [10.36.114.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711F213470;
 Thu, 25 Mar 2021 17:40:46 +0000 (UTC)
Date: Thu, 25 Mar 2021 17:40:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] Block patches
Message-ID: <YFzLHVhvkg1w3nSH@stefanha-x1.localdomain>
References: <20210324145202.430759-1-stefanha@redhat.com>
 <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
 <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
 <CAFEAcA9AGoggABhV8wduAaSce3v-+zED2_QFW7QgNgGOjDJV1g@mail.gmail.com>
 <YFxeRen934TdLvs0@stefanha-x1.localdomain>
 <43869a87-cf42-30b2-16ea-4effb913e01e@virtuozzo.com>
 <YFy6FNLz+uUemP9s@stefanha-x1.localdomain>
 <CAFEAcA9ZxUhbz=T0bNt=yFT-hChGWP6P5Lc4FqwTbs=jPsb9rQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ZxUhbz=T0bNt=yFT-hChGWP6P5Lc4FqwTbs=jPsb9rQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QZMuUA8DBgz0H0Vj"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QZMuUA8DBgz0H0Vj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:36:43PM +0000, Peter Maydell wrote:
> On Thu, 25 Mar 2021 at 16:28, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >
> > On Thu, Mar 25, 2021 at 01:17:50PM +0300, Vladimir Sementsov-Ogievskiy =
wrote:
> > > Thanks! My path modifies migration/block-dirty-bitmap.c. qsd-jobs run=
s block-commit and block-stream jobs and don't start any kind of migration =
or snapshot or savevm, so it seems impossible that qsd-jobs runs the code t=
ouched by my patch..
> >
> > Confirmed. The failure is not related to this pull request.
> >
> > I reproduced the same s390x host failure on commit
> > 9e2e9fe3df9f539f8b6941ceb96d25355fdae47e (HEAD -> master, tag:
> > v6.0.0-rc0, origin/master, origin/HEAD):
> >
> > qsd-jobs                        fail       [11:04:58] [11:04:58]   0.1s=
                 output mismatch (see qsd-jobs.out.bad)
> > --- /root/qemu/tests/qemu-iotests/tests/qsd-jobs.out
> > +++ qsd-jobs.out.bad
> > @@ -9,11 +9,11 @@
> >  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> >  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> >  {"return": {}}
> > +{"return": {}}
> > +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "paused", "id": "job0"}}
> > +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
> >  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
> >  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, =
"speed": 0, "type": "commit"}}
> > -{"return": {}}
> > -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "job0"}}
> > -{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
> >  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
> >  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "job0"}}
> >  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "ev=
ent": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset":=
 0, "speed": 0, "type": "commit"}}
> >
> > Peter: Please merge this pull request since the failure is pre-existing=
.
>=20
> OK, I'll run the pullreq through merge testing again.
>=20
> Could somebody on the block team look at this s390 host intermittent ?

I need to look into more s390x stuff on Monday so I'd be happy to dig
deeper then.

Stefan

--QZMuUA8DBgz0H0Vj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBcyx0ACgkQnKSrs4Gr
c8jA4ggAyN9PmBHedY/xuqDkJEcQe6pjeOj+vuWBbodYOUolkuMUreE+Hc0f8F9x
asnR7XEQgBuXR2JxTbAEcIfZFsOknXBOwyXm9BFDA3IfqD/EOm3fK0H9hrB44rKo
2xk64TyRLqCB25OlDKZ9AAGQPOE45d2zOBMc5T4hHDoH7bJR4Fxexp+FivGq4gZK
lyvhgZN/ir811XY3zuqUW9DYz015KPF9fdWPNp2JE2W0dDp1fTg4Ss8J8DWN4elt
ISUvw2IXN1pUMMA3ovgqfZs/krUW5gBI4DYGGDQghxdfmP1p8YMwbfSOAuexJb6T
drgtf2K2sJeeInVMfBDPQvh+ah0xJg==
=zV6f
-----END PGP SIGNATURE-----

--QZMuUA8DBgz0H0Vj--


