Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEBA36B5E4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:36:20 +0200 (CEST)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3HW-0005fz-MO
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb3FS-0004mc-1Y
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb3FP-00075y-3f
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619451245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIYBKQAyEoDn31Voe/IbMePtmhnYWi7ifqrUPIqimmc=;
 b=Pe/sVFn6nxdr5Kb+7OyTc2Hya68tLn/khMr7rROUuz7+A/9JuJhAMYVQnbGAVC8G/J7xDs
 qE3tTRd3b9iE6I7ynmU1rWKR1btF9OAjzg+mFB/hbcg5rNARMzmKQRSTUuZi73rHdZQXmM
 x4AlO2NsHKCbjOrQdI3o2B/0HgEkt7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-FyfeVZyTPYOP8U8rXRNksQ-1; Mon, 26 Apr 2021 11:34:00 -0400
X-MC-Unique: FyfeVZyTPYOP8U8rXRNksQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D7A51B2C981;
 Mon, 26 Apr 2021 15:33:59 +0000 (UTC)
Received: from localhost (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 028725C234;
 Mon, 26 Apr 2021 15:33:54 +0000 (UTC)
Date: Mon, 26 Apr 2021 16:33:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 0/3] Introduce vhost-vdpa block device
Message-ID: <YIbdYdxD0CDcX+C2@stefanha-x1.localdomain>
References: <20210408101252.552-1-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210408101252.552-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Jm7Ciki182PVpWZf"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: kwolf@redhat.com, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com, lingshan.zhu@intel.com,
 mreitz@redhat.com, changpeng.liu@intel.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Jm7Ciki182PVpWZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 06:12:49PM +0800, Xie Yongji wrote:
> Since we already have some ways to emulate vDPA block device
> in kernel[1] or userspace[2]. This series tries to introduce a
> new vhost-vdpa block device for that. To use it, we can add
> something like:
>=20
> qemu-system-x86_64 \
>     -device vhost-vdpa-blk-pci,vdpa-dev=3D/dev/vhost-vdpa-0

This device is similar to vhost-user-blk. QEMU does not see it as a
block device so storage migration, I/O throttling, image formats, etc
are not supported. Stefano Garzarella and I discussed how vdpa-blk
devices could integrate more deeply with QEMU's block layer. The QEMU
block layer could be enabled only when necessary and otherwise bypassed
for maximum performance.

This alternative approach is similar to how vhost-net is implemented in
QEMU. A BlockDriver would handle the vdpa-blk device and the regular
virtio-blk-pci device would still be present. The virtqueues could be
delegated to the vdpa-blk device in order to bypass the QEMU block
layer.

I wanted to mention this since it's likely that this kind of vdpa-blk
device implementation will be posted in the future and you might be
interested. It makes live migration with non-shared storage possible,
for example.

An issue with vhost-user-blk is that the ownership of qdev properties
and VIRTIO Configuration Space fields was not clearly defined. Some
things are handled by QEMU's vhost-user-blk code, some things are
handled by the vhost-user device backend, and some things are negotiated
between both entities. This patch series follows the existing
vhost-user-blk approach, which I think will show serious issues as the
device is more widely used and whenever virtio-blk or the implementation
is extended with new features. It is very hard to provide backwards
compatibility with the current approach where the ownership of qdev
properties and VIRTIO Configuration Space fields is ad-hoc and largely
undefined.

Since vDPA has VIRTIO Configuration Space APIs, I suggest that the
vhost-vDPA device controls the entire configuration space. QEMU should
simply forward accesses between the guest and vhost-vdpa.

Regarding qdev properties, it's a little trickier because QEMU needs to
do the emulated VIRTIO device setup (allocating virtqueues, setting
their sizes, etc). Can QEMU query this information from the vDPA device?
If not, which qdev properties are read-only and must match the
configuration of the vDPA device and which are read-write and can
control the vDPA device?

Stefan

--Jm7Ciki182PVpWZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCG3WEACgkQnKSrs4Gr
c8gpjggAkqnp5+euRN9fOigAKZybZPlYVhXVawsWnO3f7TeDaDFpbSodAcM+NvU4
SHjOeTz6fFLMeo6RJ0dUbuK1T5LcuVN80dg8+lM5qCWKeznPOmHQc5sD4zP68YPM
HJn5+oH4KiU4K4rrd1hXV7Gqwak9zJuzVB0XWqJQ1osTI5WUarUgvXy5CpyiCaQl
yPWVLchUwOueS889ZLrUiVAurKZ9bu2ZsW9lgYu1Pw/RxAhf2sLL1yc5/7HmxnWe
FcjVzMpsn6vvSIZGeAwjSCL9LEPHbxByLxWvAFqDtJnLCbDk93KFC8li8j7V3o3E
JU4CbCiSPLXU96vxdE2Bz7AiEMkp3g==
=Ck22
-----END PGP SIGNATURE-----

--Jm7Ciki182PVpWZf--


