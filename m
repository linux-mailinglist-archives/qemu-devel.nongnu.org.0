Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC4240376A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:59:05 +0200 (CEST)
Received: from localhost ([::1]:42980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuMC-0003OE-7G
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuKH-00015R-Ey
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuKF-0004pS-Lg
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631095022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZGgCq61S+zDgkF/a4TH+ljikOpV4hThUJnuESxl2o8=;
 b=X87E0EFnprMVRcm+gI2nRq8SdpSwkA11NltgQ+rWQ9m3AzGEUI2qmSp3Z6YTSVX1oexI6B
 P8GkoG3GaBwa1+8dP2UmjaCkMXcME2G1IRiLKIMEvZOEcpRbbg6x6DAPGE8Ylqw95r81t4
 MnvciQzT6YsIyQF/fQhQf1Tv+IZb7X0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-NzWez7b0Mxixqvwq3bu-Gg-1; Wed, 08 Sep 2021 05:57:00 -0400
X-MC-Unique: NzWez7b0Mxixqvwq3bu-Gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F8C410066F3;
 Wed,  8 Sep 2021 09:56:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20D4068D7D;
 Wed,  8 Sep 2021 09:56:53 +0000 (UTC)
Date: Wed, 8 Sep 2021 10:56:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 15/16] vfio-user: pci reset
Message-ID: <YTiI5dDC2phNsB07@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <a988ef2657256ec70bf34c673b5348fd350b556e.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a988ef2657256ec70bf34c673b5348fd350b556e.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MFJ6+GQQh+5LAJWM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MFJ6+GQQh+5LAJWM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:48AM -0700, Elena Ufimtseva wrote:
> From: John Johnson <john.g.johnson@oracle.com>
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/user.h |  1 +
>  hw/vfio/pci.c  | 29 ++++++++++++++++++++++++++---
>  hw/vfio/user.c | 12 ++++++++++++
>  3 files changed, 39 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 32e8b70d28..5d4d0a43ba 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -86,6 +86,7 @@ int vfio_user_region_read(VFIODevice *vbasedev, uint32_=
t index, uint64_t offset,
>                            uint32_t count, void *data);
>  int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
>                             uint64_t offset, uint32_t count, void *data);
> +void vfio_user_reset(VFIODevice *vbasedev);
>  void vfio_user_drain_reqs(VFIOProxy *proxy);
> =20
>  #endif /* VFIO_USER_H */
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 29a874c066..4b933ed10f 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2229,8 +2229,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
> =20
>  static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
>  {
> +    VFIODevice *vbasedev =3D &vdev->vbasedev;
>      Error *err =3D NULL;
> -    int nr;
> +    int ret, nr;
> =20
>      vfio_intx_enable(vdev, &err);
>      if (err) {
> @@ -2238,11 +2239,18 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vd=
ev)
>      }
> =20
>      for (nr =3D 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
> -        off_t addr =3D vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * n=
r);
> +        off_t addr =3D PCI_BASE_ADDRESS_0 + (4 * nr);
>          uint32_t val =3D 0;
>          uint32_t len =3D sizeof(val);
> =20
> -        if (pwrite(vdev->vbasedev.fd, &val, len, addr) !=3D len) {
> +        if (vbasedev->proxy !=3D NULL) {
> +            ret =3D vfio_user_region_write(vbasedev, VFIO_PCI_CONFIG_REG=
ION_INDEX,
> +                                         addr, len, &val);
> +        } else {
> +            ret =3D pwrite(vdev->vbasedev.fd, &val, len,
> +                         vdev->config_offset + addr);
> +        }
> +        if (ret !=3D len) {
>              error_report("%s(%s) reset bar %d failed: %m", __func__,
>                           vdev->vbasedev.name, nr);

The %m format string assumes vfio_user_region_write() sets errno. I
don't think it does. We're relying on vfio_user_region_write() never
failing here, which is true at the moment but not nice.

>          }
> @@ -3684,6 +3692,20 @@ static void vfio_user_instance_finalize(Object *ob=
j)
>      vfio_user_disconnect(vbasedev->proxy);
>  }
> =20
> +static void vfio_user_pci_reset(DeviceState *dev)
> +{
> +    VFIOPCIDevice *vdev =3D VFIO_PCI_BASE(dev);
> +    VFIODevice *vbasedev =3D &vdev->vbasedev;
> +
> +    vfio_pci_pre_reset(vdev);
> +
> +    if (vbasedev->reset_works) {
> +        vfio_user_reset(vbasedev);
> +    }
> +
> +    vfio_pci_post_reset(vdev);
> +}
> +
>  static Property vfio_user_pci_dev_properties[] =3D {
>      DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
>      DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false)=
,
> @@ -3695,6 +3717,7 @@ static void vfio_user_pci_dev_class_init(ObjectClas=
s *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *pdc =3D PCI_DEVICE_CLASS(klass);
> =20
> +    dc->reset =3D vfio_user_pci_reset;
>      device_class_set_props(dc, vfio_user_pci_dev_properties);
>      dc->desc =3D "VFIO over socket PCI device assignment";
>      pdc->realize =3D vfio_user_pci_realize;
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index fcc041959c..7de2125346 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -1045,3 +1045,15 @@ int vfio_user_region_write(VFIODevice *vbasedev, u=
int32_t index,
> =20
>      return count;
>  }
> +
> +void vfio_user_reset(VFIODevice *vbasedev)
> +{
> +    VFIOUserHdr msg;

Maybe add "=3D {}" to ensure it's zero-initialized?

> +
> +    vfio_user_request_msg(&msg, VFIO_USER_DEVICE_RESET, sizeof(msg), 0);
> +
> +    vfio_user_send_recv(vbasedev->proxy, &msg, NULL, 0, 0);
> +    if (msg.flags & VFIO_USER_ERROR) {
> +        error_printf("reset reply error %d\n", msg.error_reply);
> +    }
> +}
> --=20
> 2.25.1
>=20

--MFJ6+GQQh+5LAJWM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4iOUACgkQnKSrs4Gr
c8i+wAf/RQ6SNbnURGCurvzmX4V2QVM6XQtHXimSLh6/Sk3qcWB7RU0qgHBdXRNi
1EitNIZKevLJNmuQK9fkNfuWRq/Oyjx7+D2iF5ce06uEelN5DXdPgar1X4G8PzT8
Fv4hPRWFzOfnCSErkF8cDJ1bBVW63shykIrUnMQ6bKeZCQbhxdgQySvNPBGrDD7F
AlNImpqSIYRJ6/vJcQiZM8FtH4heIwdOqa0pqqtBPfj5BOi/1RBqApS8uaVK6dHl
HY3mmkFFty0uk+0EmiJSOQckbwebitnEYpcUw9B5+xDawQp4QVhbHZqrDmMbBDTV
5jlHjyaRigPx1nODxpBm14NK8peRxQ==
=l0Ly
-----END PGP SIGNATURE-----

--MFJ6+GQQh+5LAJWM--


