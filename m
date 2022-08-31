Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D135A86FC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:51:39 +0200 (CEST)
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTkQ-0002C4-I0
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTTdN-0002gT-8N
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 15:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTTdL-0007MT-Qb
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 15:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661975057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oj1Vxtv9cqNzOiPgqoepi9Mws/jh6WtyWlv1vHcT27E=;
 b=gxKkT7Hkdwq5+7Wg3N1uTcY3DettztGpHZhFcgNLrcExL9aUpJbue/1Rk6bWyKLE8+6HMr
 8308SZ///IUBjjbsGp2equ86b1IwIA0mALodR5cNHFV6QDI9CmOn2NMP4kgXFPJqMzajVz
 1LFNvCh5q42C8RdWDaa2EyHThtkbKEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-PVhTh7czNkmdRMSwnvoB2Q-1; Wed, 31 Aug 2022 15:44:14 -0400
X-MC-Unique: PVhTh7czNkmdRMSwnvoB2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7421A294EDDD;
 Wed, 31 Aug 2022 19:44:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8A78112131E;
 Wed, 31 Aug 2022 19:44:12 +0000 (UTC)
Date: Wed, 31 Aug 2022 15:44:10 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Xie Changlong <xiechanglong.d@gmail.com>
Subject: Re: [RFC v4 00/11] blkio: add libblkio BlockDriver
Message-ID: <Yw+6CrmP7CKk1PZy@fedora>
References: <20220822222402.176088-1-stefanha@redhat.com>
 <15ad1a46-00e5-ccc8-1c7e-f6061bc68c0c@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="661EKS1Y5rttSm9r"
Content-Disposition: inline
In-Reply-To: <15ad1a46-00e5-ccc8-1c7e-f6061bc68c0c@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--661EKS1Y5rttSm9r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 08:31:03PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> On 8/23/22 01:23, Stefan Hajnoczi wrote:
> > The remainder of the patch series reworks the existing QEMU bdrv_regist=
er_buf()
> > API so virtio-blk emulation efficiently map guest RAM for libblkio - so=
me
> > libblkio drivers require that I/O buffer memory is pre-registered (thin=
k VFIO,
> > vhost, etc).
>=20
> Hi!
>=20
> So patches 01-11 are for performance optimization? Don't you have some pe=
rformance measurements for it?

Hi Vladimir,
I ran the patches against qemu-storage-daemon's vhost-user-blk export
with iodepth=3D1 bs=3D512 to see the per-request overhead due to bounce
buffer allocation/mapping:

Name                                   IOPS   Error
bounce-buf                          4373.81 =B1 0.01%
registered-buf                     13062.80 =B1 0.67%

The BDRV_REQ_REGISTERED_BUF optimization version is about 3x faster.

Note that IOPS is low because the vhost-user-blk vq is not passed
through to the guest yet (Stefano is working on this). The guest is
also using interrupts, not polling (recent Linux virtio_blk.ko drivers
support poll queues).

I'll also include performance results in the next revision of the patch
series.

Stefan

--661EKS1Y5rttSm9r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMPugkACgkQnKSrs4Gr
c8gWQggAsA7NmhLqrCPbfHLhKb2rnSP0ywEDn2Cy/PqjFDeG2DZRvItq/NA4v1AD
Wso40BZx6Khiw3Y7zxViLvcY6WukZQw+6gDlnO6Hbz0oi3tYAcPCRnKM3YRlI1WH
uW7cGnlvwK6XPOFhIc+46fYhXztMBIWDiDRi30x16clyEBXBBcW2aQ3xt8pMdhdd
A8Vtxmaef1UKGgr18FHgqF7YpB4EuUDzw2diogHtWTWlOlJbC1/IizJqnhUBlbO7
ym3oUkSIaB6Vk+n3nQclHXm9dF1S7e+iHHMe5ZFHnbIzqOQxnkgPys8kauk87vIG
lruRfiZ8af4hNnh1ryOSNbZwr/LUww==
=tnOX
-----END PGP SIGNATURE-----

--661EKS1Y5rttSm9r--


