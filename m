Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A384503E1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 12:57:10 +0100 (CET)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmabl-0003dS-Ce
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 06:57:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmaaR-00022n-71
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 06:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmaaM-0004L1-TR
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 06:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636977339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mb5V43T+aAUHDY3aa8lN8+oX9/JUIkSku6T6RwQOyqw=;
 b=HD/356t52SH0L+uDnmiU3XLkZqYdhqMW/DviaDe2F1/0Yw+f6rtD5QJEboAlAd15kgfqOI
 V//fkVwrro9wzTICkPHfDpzZD8cNXRGyoyCpcLuLON3D8DprwVx5Frhxvz4bIUe8xyBS7u
 hsuF+octgoXehQg7+YhXklmmZZpeTsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-laYZc5WUMvKtuTMibsTJzQ-1; Mon, 15 Nov 2021 06:55:36 -0500
X-MC-Unique: laYZc5WUMvKtuTMibsTJzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 082561B2C98C;
 Mon, 15 Nov 2021 11:55:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7978F5DEFB;
 Mon, 15 Nov 2021 11:54:33 +0000 (UTC)
Date: Mon, 15 Nov 2021 11:54:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <YZJKeNOxcm3ZxHj6@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <1965987.S3ubrJPkfX@silver>
 <YY1FeMyvTOOWYEhV@stefanha-x1.localdomain>
 <2186445.RDNOEBgitd@silver>
MIME-Version: 1.0
In-Reply-To: <2186445.RDNOEBgitd@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vMkU3+x04lFVUpSM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vMkU3+x04lFVUpSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 06:54:03PM +0100, Christian Schoenebeck wrote:
> On Donnerstag, 11. November 2021 17:31:52 CET Stefan Hajnoczi wrote:
> > On Wed, Nov 10, 2021 at 04:53:33PM +0100, Christian Schoenebeck wrote:
> > > On Mittwoch, 10. November 2021 16:14:19 CET Stefan Hajnoczi wrote:
> > > > On Wed, Nov 10, 2021 at 02:14:43PM +0100, Christian Schoenebeck wro=
te:
> > > > > On Mittwoch, 10. November 2021 11:05:50 CET Stefan Hajnoczi wrote=
:
> > > > > As you are apparently reluctant for changing the virtio specs, wh=
at
> > > > > about
> > > > > introducing those discussed virtio capabalities either as experim=
ental
> > > > > ones
> > > > > without specs changes, or even just as 9p specific device capabil=
ities
> > > > > for
> > > > > now. I mean those could be revoked on both sides at any time anyw=
ay.
> > > >=20
> > > > I would like to understand the root cause before making changes.
> > > >=20
> > > > "It's faster when I do X" is useful information but it doesn't
> > > > necessarily mean doing X is the solution. The "it's faster when I d=
o X
> > > > because Y" part is missing in my mind. Once there is evidence that =
shows
> > > > Y then it will be clearer if X is a good solution, if there's a mor=
e
> > > > general solution, or if it was just a side-effect.
> > >=20
> > > I think I made it clear that the root cause of the observed performan=
ce
> > > gain with rising transmission size is latency (and also that performa=
nce
> > > is not the only reason for addressing this queue size issue).
> > >=20
> > > Each request roundtrip has a certain minimum latency, the virtio ring
> > > alone
> > > has its latency, plus latency of the controller portion of the file s=
erver
> > > (e.g. permissions, sandbox checks, file IDs) that is executed with *e=
very*
> > > request, plus latency of dispatching the request handling between thr=
eads
> > > several times back and forth (also for each request).
> > >=20
> > > Therefore when you split large payloads (e.g. reading a large file) i=
nto
> > > smaller n amount of chunks, then that individual latency per request
> > > accumulates to n times the individual latency, eventually leading to
> > > degraded transmission speed as those requests are serialized.
> >=20
> > It's easy to increase the blocksize in benchmarks, but real application=
s
> > offer less control over the I/O pattern. If latency in the device
> > implementation (QEMU) is the root cause then reduce the latency to spee=
d
> > up all applications, even those that cannot send huge requests.
>=20
> Which I did, still do, and also mentioned before, e.g.:
>=20
> 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4 9pfs: reduce latency of Twalk
> 0c4356ba7dafc8ecb5877a42fc0d68d45ccf5951 9pfs: T_readdir latency optimiza=
tion
>=20
> Reducing overall latency is a process that is ongoing and will still take=
 a=20
> very long development time. Not because of me, but because of lack of=20
> reviewers. And even then, it does not make the effort to support higher=
=20
> transmission sizes obsolete.
>=20
> > One idea is request merging on the QEMU side. If the application sends
> > 10 sequential read or write requests, coalesce them together before the
> > main part of request processing begins in the device. Process a single
> > large request to spread the cost of the file server over the 10
> > requests. (virtio-blk has request merging to help with the cost of lots
> > of small qcow2 I/O requests.) The cool thing about this is that the
> > guest does not need to change its I/O pattern to benefit from the
> > optimization.
> >=20
> > Stefan
>=20
> Ok, don't get me wrong: I appreciate that you are suggesting approaches t=
hat=20
> could improve things. But I could already hand you over a huge list of mi=
ne.=20
> The limiting factor here is not the lack of ideas of what could be improv=
ed,=20
> but rather the lack of people helping out actively on 9p side:
> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06452.html
>=20
> The situation on kernel side is the same. I already have a huge list of w=
hat=20
> could & should be improved. But there is basically no reviewer for 9p pat=
ches=20
> on Linux kernel side either.
>=20
> The much I appreciate suggestions of what could be improved, I would=20
> appreciate much more if there was *anybody* actively assisting as well. I=
n the=20
> time being I have to work the list down in small patch chunks, priority b=
ased.

I see request merging as an alternative to this patch series, not as an
additional idea.

My thoughts behind this is that request merging is less work than this
patch series and more broadly applicable. It would be easy to merge (no
idea how easy it is to implement though) in QEMU's virtio-9p device
implementation, does not require changes across the stack, and benefits
applications that can't change their I/O pattern to take advantage of
huge requests.

There is a risk that request merging won't pan out, it could have worse
performance than submitting huge requests.

Stefan

--vMkU3+x04lFVUpSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGSSncACgkQnKSrs4Gr
c8hZFwf+Ocqw2z3EY/fQMEb7XiF8h942ZWPOixUQg/cnnP1Ho84lRvtBcBv4OQmI
2WroxYspLKykFC5G/FaDT2UlfuAISpEbMLZ3fKOwf1iho2Evwjx2liMgKvj/eSu8
WcapNEpWVHuK/rbRFPMTYaKSz0QOGchVZuPXRwy+wrSWeT8p84+uI+6Yi4z1YxbN
NHzBvCOvce7iwtQGaHujA+SuTuqW0dkDWG/logTiUXEgx4GF4/CriUPMiIzRNlI8
yMX+liJYqxNKmjfP6JPdqbClpUzQR30YXefEBx5vIQP+fA/jBhYfRMR82yBoJbwf
0gVWUI8PYKK/FdxqWh1z6rqLlFglqw==
=N92g
-----END PGP SIGNATURE-----

--vMkU3+x04lFVUpSM--


