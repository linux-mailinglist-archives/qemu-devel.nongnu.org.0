Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED546E55F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:18:59 +0100 (CET)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFZq-0003F5-Ep
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvFY9-0001PF-UZ
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvFY7-0004Jg-NU
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639041430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DfW+JGNGe8VUDhw272aR4Nbz1dxQTme/hzDCF9gzksA=;
 b=FlJpocn5nRao7aDud71EeDmftVmfJTBPLuKg0C5NdWnhLuHd+rObmOdHj4TCCaLIdNHTuR
 Xopg3KHiF9kyFdLpd0KX1kGqA40GNX3u49CEfy85Oth3MGBokKU+Z8Z2xfiZ7LU4MEh4+Q
 c9Tpzkrdy4yYjxqXKMkRZmc1iofkW+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-198VWEzUPEGmrITdHck_YA-1; Thu, 09 Dec 2021 04:17:05 -0500
X-MC-Unique: 198VWEzUPEGmrITdHck_YA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E477F81CCB4;
 Thu,  9 Dec 2021 09:17:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06B3410016F5;
 Thu,  9 Dec 2021 09:16:59 +0000 (UTC)
Date: Thu, 9 Dec 2021 09:16:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
References: <20211208052010.1719-1-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211208052010.1719-1-longpeng2@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HXTbTWR+PQwj5wCK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 yechuan@huawei.com, xieyongji@bytedance.com, arei.gonglei@huawei.com,
 parav@nvidia.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HXTbTWR+PQwj5wCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
>=20
> Hi guys,
>=20
> This patch introduces vhost-vdpa-net device, which is inspired
> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
>=20
> I've tested this patch on Huawei's offload card:
> ./x86_64-softmmu/qemu-system-x86_64 \
>     -device vhost-vdpa-net-pci,vdpa-dev=3D/dev/vhost-vdpa-0
>=20
> For virtio hardware offloading, the most important requirement for us
> is to support live migration between offloading cards from different
> vendors, the combination of netdev and virtio-net seems too heavy, we
> prefer a lightweight way.
>=20
> Maybe we could support both in the future ? Such as:
>=20
> * Lightweight
>  Net: vhost-vdpa-net
>  Storage: vhost-vdpa-blk
>=20
> * Heavy but more powerful
>  Net: netdev + virtio-net + vhost-vdpa
>  Storage: bdrv + virtio-blk + vhost-vdpa
>=20
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html

Stefano presented a plan for vdpa-blk at KVM Forum 2021:
https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-sof=
tware-offload-for-virtio-blk-stefano-garzarella-red-hat

It's closer to today's virtio-net + vhost-net approach than the
vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
an offload feature rather than a completely separate code path that
needs to be maintained and tested. That way QEMU's block layer features
and live migration work with vDPA devices and re-use the virtio-blk
code. The key functionality that has not been implemented yet is a "fast
path" mechanism that allows the QEMU virtio-blk device's virtqueue to be
offloaded to vDPA.

The unified vdpa-blk architecture should deliver the same performance
as the vhost-vdpa-blk device you mentioned but with more features, so I
wonder what aspects of the vhost-vdpa-blk idea are important to you?

QEMU already has vhost-user-blk, which takes a similar approach as the
vhost-vdpa-blk device you are proposing. I'm not against the
vhost-vdpa-blk approach in priciple, but would like to understand your
requirements and see if there is a way to collaborate on one vdpa-blk
implementation instead of dividing our efforts between two.

Stefan

--HXTbTWR+PQwj5wCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGxyYoACgkQnKSrs4Gr
c8iziwgAtVAXiCBh7iqmWDgh4bbo3zgFm809qWf5/UzHRs2zABLZRQSBIYX+VbX7
6W+PXEmk4ZyQr2IKrj4Xmxd7QJP9MgyEhYZ/lOZcpCaamfcbjcdzaod/nOhlK61l
/3nOJ++yS9UvFYSqDJ7TR7mT+K9BzXJr8wDYiaSyrsAngpSBKYq70/RHwbaLhMc5
1bo+punMWN12M7ix9gUWUEpI99BCOmFk6m6PR+GElcJhgB4z1gO3HwILrORB2JcN
EmROzGMGYv+G5NbR1e13gSSspWyhE+h7NLvWIbWsjsa9NAvazjqcPaUvMVHts2H5
a+YKuzuGUT19KrNRqFHVQZ1VL2Pzlw==
=AW0a
-----END PGP SIGNATURE-----

--HXTbTWR+PQwj5wCK--


