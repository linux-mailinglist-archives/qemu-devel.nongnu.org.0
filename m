Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0743C424F5C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:36:18 +0200 (CEST)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOsy-0008B1-Sg
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYOpS-0002pP-Gw
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYOpO-00056T-E7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633595553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5GTR2dM1AkAO+O8oDPs1d5Me5yvxratZjJs0B4zTQ8=;
 b=NtI27dMyHH3GYoa0LEOK00eP9EQVh10tOfTawPm/9L4jn8IRzjlqYCBmTkeg9lBmd1G8eT
 RAB3RGOEcIDK1lhVSMWXV7+/5c78XcUF/yv1cddaWaBEdNffCt/uAN9J2uXunGwKCn4Kuh
 iDDmpfZZNaMpJv3H852EuBlKAOTTJ20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-rx79p6b_PTiCoy0l-U9HcA-1; Thu, 07 Oct 2021 04:32:28 -0400
X-MC-Unique: rx79p6b_PTiCoy0l-U9HcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EBDC101796F;
 Thu,  7 Oct 2021 08:32:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB11160583;
 Thu,  7 Oct 2021 08:32:26 +0000 (UTC)
Date: Thu, 7 Oct 2021 06:23:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <YV6EbwMFmcIEC+za@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
In-Reply-To: <cover.1633376313.git.qemu_oss@crudebyte.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LLz5XnO6Go+Dl95d"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Amit Shah <amit@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kurz <groug@kaod.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 virtio-fs@redhat.com, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LLz5XnO6Go+Dl95d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 09:38:00PM +0200, Christian Schoenebeck wrote:
> At the moment the maximum transfer size with virtio is limited to 4M
> (1024 * PAGE_SIZE). This series raises this limit to its maximum
> theoretical possible transfer size of 128M (32k pages) according to the
> virtio specs:
>=20
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html=
#x1-240006

Hi Christian,
I took a quick look at the code:

- The Linux 9p driver restricts descriptor chains to 128 elements
  (net/9p/trans_virtio.c:VIRTQUEUE_NUM)

- The QEMU 9pfs code passes iovecs directly to preadv(2) and will fail
  with EINVAL when called with more than IOV_MAX iovecs
  (hw/9pfs/9p.c:v9fs_read())

Unless I misunderstood the code, neither side can take advantage of the
new 32k descriptor chain limit?

Thanks,
Stefan

--LLz5XnO6Go+Dl95d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFehGkACgkQnKSrs4Gr
c8jj7gf9EP8iLDkVsPB3DsimosA2K+3PrRXVRZWUEysCY3blc2e8dVorH4rww8C/
vwch1sIXYASWLhrVEWFpMhKFQZCsh29C+t0q2frOrpnsjejrCJHlf+FLStR+FOiD
Db/ayZJHInR7nb6slwIB9gGPPNILC1xFQ/8WbLB6WjHIsG73Ur8vLK4+UT7/ch09
Ujos43uYCTYGpETa896a9cVxqAyo7BLzXng3uunl52Npwr77VQEvqzAoHAKGgZ1f
ByC8/QpNHVbyb/r5U85NOHBsmz7/a4xpAKY3Yhl/UO0fXeAeJ90ulxyLVVXxeeBn
f9aWXdSM66XYPVv3cMKPfTDpxys6Ag==
=RoOJ
-----END PGP SIGNATURE-----

--LLz5XnO6Go+Dl95d--


