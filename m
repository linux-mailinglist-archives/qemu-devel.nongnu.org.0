Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C2485099
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:05:26 +0100 (CET)
Received: from localhost ([::1]:55522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53Ab-00017r-3z
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:05:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n536a-0005yO-QR
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:01:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n536X-0005EM-ST
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641376872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSd6sN3Lqnzqp6irJquLXJRutlLnPNj3SDsWSg7XOm4=;
 b=LpJgyIIpmsG5zUDH7XCFkAIpg5/ezqmotb7lvQFY29I88EecgPiex6DlDgGhrVRPhUHNZ8
 O0VD/1d9nRWFxueeHzTAfwHfBVwFkg4OUkU3NKtX0DL4whvaLq5UlhiI9YPbAj8p7M/QaG
 1wRI+3kKTpOVUCpGNA93urA3edyJ2Ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-SHu6FfStNCiShbPhYvq_DQ-1; Wed, 05 Jan 2022 05:01:09 -0500
X-MC-Unique: SHu6FfStNCiShbPhYvq_DQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FDD31006AA9;
 Wed,  5 Jan 2022 10:01:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE747CD64;
 Wed,  5 Jan 2022 10:00:45 +0000 (UTC)
Date: Wed, 5 Jan 2022 10:00:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Message-ID: <YdVsTKr7Ceed6nn7@stefanha-x1.localdomain>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-5-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220105005900.860-5-longpeng2@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8efvm+iczZEPuuhM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, yechuan@huawei.com, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8efvm+iczZEPuuhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 08:58:54AM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
>=20
> Implements the .instance_init and the .class_init interface.
>=20
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/vdpa-dev-pci.c     | 80 +++++++++++++++++++++++++++++++++++-
>  hw/virtio/vdpa-dev.c         | 68 +++++++++++++++++++++++++++++-
>  include/hw/virtio/vdpa-dev.h |  2 +
>  3 files changed, 146 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
> index a5a7b528a9..0af54a26d4 100644
> --- a/hw/virtio/vdpa-dev-pci.c
> +++ b/hw/virtio/vdpa-dev-pci.c
> @@ -23,14 +23,90 @@ struct VhostVdpaDevicePCI {
>      VhostVdpaDevice vdev;
>  };
> =20
> +static uint32_t
> +vdpa_dev_pci_get_info(const char *name, uint64_t cmd, Error **errp)

vdpa_dev_pci_get_u32() might be a clearer name.

> +{
> +    int device_fd;
> +    uint32_t val;
> +    int ret;
> +
> +    device_fd =3D qemu_open(name, O_RDWR, errp);
> +    if (device_fd =3D=3D -1) {
> +        return (uint32_t)-1;
> +    }
> +
> +    ret =3D ioctl(device_fd, cmd, &val);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-device-pci: cmd 0x%lx failed: %s",
> +                   cmd, strerror(errno));
> +        goto out;
> +    }
> +
> +out:
> +    close(device_fd);

Race conditions are possible if the device node is replaced between
calls. Why not open the file once and reuse the fd across ioctl calls?

Both VhostVdpaDevicePCI and VhostVdpaDevice need the fd but
VhostVdpaDevicePCI needs it first. I suggest passing ownership of the fd
to the VhostVdpaDevice. One way of doing this is using QOM properties so
that VhostVdpaDevice can use the given fd instead of reopening the file.
(If fd is -1 then VhostVdpaDevice can try to open the file. That is
necessary when VhostVdpaDevice is used directly with virtio-mmio because
there is no proxy object.)

--8efvm+iczZEPuuhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVbEsACgkQnKSrs4Gr
c8hibAf5Adh/oWnlL5RvMoyzGGRpO5mnPr1PDhL8pOp+jKmrciwv18SwomWcndbP
iHIRh3o2EZDP1pb58qW3fO4eqxMYDBKt3uGUT3DaR7wY5OUQ5Cra7kxDO6/LdoU/
Zt+i33oeZbBn0z94WiH1CDS2HbD9uYG0kSwWR/oM4FL6nRV0DvKF/06bopmTd1er
LF3rHsAW7ThE/U4WSDLfX2RaR6elfrKGbs0udf01UDt69tgo1bN8ewGTfLW7GD0t
gsXWW1LRUGzyEh8lkEX6bg7VgJ/FYoa8uSwGZTvbiNvO+vuYzVqqgYhhrs420DGp
uxH3K1FvGMelYDy9kNkI6PT8SdXEPQ==
=v/Se
-----END PGP SIGNATURE-----

--8efvm+iczZEPuuhM--


