Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341F44DA8D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:35:35 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlD30-0006M3-1p
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:35:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mlD0l-00032w-U8
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mlD0k-0005hN-7v
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636648393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJZnahNn26y4DOmG4N8ik+9QeD3oJL+tpDJ3a8zsHAs=;
 b=FtcZA0f4GyAOkHES3HYU4J9/82ig5RJmbo+oPuNL3jnl/0IlwYj62yRrod3BiuruH2Pn1j
 AbJ8jO3e/VuUjQ7O92vcu0SJUbE9LJ4bFlymAQs7PZrYzWvXqALJG41NA43yzXXx+Md/FP
 2hkW/lIduVT7sx3/cpHSLN3boOgyClY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-rTb9zuf2OEOl8oHIa4hw8Q-1; Thu, 11 Nov 2021 11:33:10 -0500
X-MC-Unique: rTb9zuf2OEOl8oHIa4hw8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DCE18D6A2C;
 Thu, 11 Nov 2021 16:33:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1E7660FFD;
 Thu, 11 Nov 2021 16:31:53 +0000 (UTC)
Date: Thu, 11 Nov 2021 16:31:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <YY1FeMyvTOOWYEhV@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <2300275.fgjvgC56zr@silver>
 <YYvhy5Lm7YaqCWix@stefanha-x1.localdomain>
 <1965987.S3ubrJPkfX@silver>
MIME-Version: 1.0
In-Reply-To: <1965987.S3ubrJPkfX@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8umAcu99m7SDsc3t"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8umAcu99m7SDsc3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 04:53:33PM +0100, Christian Schoenebeck wrote:
> On Mittwoch, 10. November 2021 16:14:19 CET Stefan Hajnoczi wrote:
> > On Wed, Nov 10, 2021 at 02:14:43PM +0100, Christian Schoenebeck wrote:
> > > On Mittwoch, 10. November 2021 11:05:50 CET Stefan Hajnoczi wrote:
> > > As you are apparently reluctant for changing the virtio specs, what a=
bout
> > > introducing those discussed virtio capabalities either as experimenta=
l
> > > ones
> > > without specs changes, or even just as 9p specific device capabilitie=
s for
> > > now. I mean those could be revoked on both sides at any time anyway.
> >=20
> > I would like to understand the root cause before making changes.
> >=20
> > "It's faster when I do X" is useful information but it doesn't
> > necessarily mean doing X is the solution. The "it's faster when I do X
> > because Y" part is missing in my mind. Once there is evidence that show=
s
> > Y then it will be clearer if X is a good solution, if there's a more
> > general solution, or if it was just a side-effect.
>=20
> I think I made it clear that the root cause of the observed performance g=
ain=20
> with rising transmission size is latency (and also that performance is no=
t the=20
> only reason for addressing this queue size issue).
>=20
> Each request roundtrip has a certain minimum latency, the virtio ring alo=
ne=20
> has its latency, plus latency of the controller portion of the file serve=
r=20
> (e.g. permissions, sandbox checks, file IDs) that is executed with *every=
*=20
> request, plus latency of dispatching the request handling between threads=
=20
> several times back and forth (also for each request).
>=20
> Therefore when you split large payloads (e.g. reading a large file) into=
=20
> smaller n amount of chunks, then that individual latency per request=20
> accumulates to n times the individual latency, eventually leading to degr=
aded=20
> transmission speed as those requests are serialized.

It's easy to increase the blocksize in benchmarks, but real applications
offer less control over the I/O pattern. If latency in the device
implementation (QEMU) is the root cause then reduce the latency to speed
up all applications, even those that cannot send huge requests.

One idea is request merging on the QEMU side. If the application sends
10 sequential read or write requests, coalesce them together before the
main part of request processing begins in the device. Process a single
large request to spread the cost of the file server over the 10
requests. (virtio-blk has request merging to help with the cost of lots
of small qcow2 I/O requests.) The cool thing about this is that the
guest does not need to change its I/O pattern to benefit from the
optimization.

Stefan

--8umAcu99m7SDsc3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGNRXgACgkQnKSrs4Gr
c8iGFggAv4oGiMttfre5NapGzSdD/VF4Pm7sQUgs7v3CBlUtsyiBSExNrEtTpWdw
/9RDjpLVxcsStB5rnQtQ6Dk8AqAFuetwRdVMUMUmjouY1sGl263h78L6LeWJ9HnC
5QYd7Hy600+ldKtRoFqHOwpqpoGtTOStfxiOFiR0ievwkX0kUeHE81EBmkqbjBEm
Mlmgu+BdJWGxtpPQm/1m2vG21+xOXWxuwOzDwIx7mpZGUaNUqteueBhdw1Fl0n1y
GwviY3a4sW00x1n31by8KQ2laZbxnV5hwMwJ9Kae+aPDdNvSPi5HqD3OqHrn3eBI
Lg5js5lrBMIjm0FH15JRAFUeiDJ49g==
=xKav
-----END PGP SIGNATURE-----

--8umAcu99m7SDsc3t--


