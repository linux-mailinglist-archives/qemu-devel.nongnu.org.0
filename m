Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A22348D8C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 10:58:38 +0100 (CET)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPMlB-0003EA-9E
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 05:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPMjC-0002ca-7I
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:56:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPMjA-0001qF-E0
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616666191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjkh+Y+ETkOaaIQSCHeSeNv7pcIusoCRphROytH2DXY=;
 b=WQBtddulCRmw9AujyKGNDoqZgzEQML3qPdcMjWuBviqIShG7NZqq9ywKANav3MDVKBeDdz
 chOzqG1IrSS7SUaco+pDOlEgZLhGUGXEHcgh3CZSII+Qpd/UcrWoREyXDqT1+G2l9U4J81
 2rKMKnvUGyJe9MNgA6bXJ66QZ0T3dYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Y-erARnmPuaRIZzt5oZS9A-1; Thu, 25 Mar 2021 05:56:27 -0400
X-MC-Unique: Y-erARnmPuaRIZzt5oZS9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA4E680006E;
 Thu, 25 Mar 2021 09:56:25 +0000 (UTC)
Received: from localhost (ovpn-114-246.ams2.redhat.com [10.36.114.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2205119C71;
 Thu, 25 Mar 2021 09:56:21 +0000 (UTC)
Date: Thu, 25 Mar 2021 09:56:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] Block patches
Message-ID: <YFxeRen934TdLvs0@stefanha-x1.localdomain>
References: <20210324145202.430759-1-stefanha@redhat.com>
 <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
 <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
 <CAFEAcA9AGoggABhV8wduAaSce3v-+zED2_QFW7QgNgGOjDJV1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9AGoggABhV8wduAaSce3v-+zED2_QFW7QgNgGOjDJV1g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XMNnke8ucD3SD5ht"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XMNnke8ucD3SD5ht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 08:42:27PM +0000, Peter Maydell wrote:
> On Wed, 24 Mar 2021 at 20:18, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
> >
> > 24.03.2021 21:05, Peter Maydell wrote:
> > > On Wed, 24 Mar 2021 at 14:52, Stefan Hajnoczi <stefanha@redhat.com> w=
rote:
> > >>
> > >> Vladimir Sementsov-Ogievskiy (2):
> > >>    migration/block-dirty-bitmap: make incoming disabled bitmaps busy
> > >>    migrate-bitmaps-postcopy-test: check that we can't remove in-flig=
ht
> > >>      bitmaps
> > >
> > > This failed the 'qsd-jobs' iotest on s390x:
>=20
> > I can't believe it related. My commit modifies bitmap status during bit=
maps migration on target vm. There is no kind of migration in qsd-jobs test=
.
>=20
> It's possible it's an intermittent, but it's not one I've seen
> before. We still have lots of time this release cycle to figure
> out the issue and get this fix in.

Vladimir: I'll get hold of an s390 machine and try to reproduce the
failure. I should have some news by Monday.

Let's put the pull request on hold for now.

Stefan

--XMNnke8ucD3SD5ht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBcXkQACgkQnKSrs4Gr
c8g05AgAiYiY6/qPk4FiaE8R0ycFhON1pH6j0Ovv+a/9bj5bMD5Aau4lqhnQteWa
qU6mLjwYd7aS7msyOMUoxf3eWE3AX8cGFbiVTjhJpp6FD/0v7V1tPl2lbmZulcVd
nyeb1shyd/cGuUhGSKDZMZVTglnO3W2Ke7P4ptcveCB7Qxcb9XYUKRwj9JTa813S
C9tH+mL3qI70wl2pV+iFAgVU09idcdpahPmij9HVc+bRYwoC9l5u4ZuZt+NvJ7vr
sBZ0kRAcCJhOiyvRKRkn+B+5H/HFh4es9oHGQ3wsMK5GmgoRK5L8a3M8ikC8/Ukn
1DhjGYzESvxuDBHU8wFORsfTzJyw6Q==
=2FQF
-----END PGP SIGNATURE-----

--XMNnke8ucD3SD5ht--


