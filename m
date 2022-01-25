Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6749B849
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:12:03 +0100 (CET)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOQM-0003u9-MB
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:12:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCN7z-0008Bl-Ph
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:49:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCN7p-0002Df-6C
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643122128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L0L0R1MMW/5loq174vgkTrCaYlYNUT7TJ0kETJqRgTc=;
 b=IZzStPMaWoO1kY+X0C7jrMY9sU/nzIopYlV+mo4TLdbtLO3MoiWVsxRnZg6pUKQxDA78Iw
 nIUiFd6gQ022wGhuHsYKmL0RTshTwPIwwAaITOK1O0CmJw/KQ/Ia8HM13o29Glg6c4EuUK
 h9VpB9CyMQEZl+btgVF3QQHTKYXENHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-F7NK2f8VM7W2oQMNWDSn3A-1; Tue, 25 Jan 2022 09:48:44 -0500
X-MC-Unique: F7NK2f8VM7W2oQMNWDSn3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CC48814703;
 Tue, 25 Jan 2022 14:48:42 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 017537D3E8;
 Tue, 25 Jan 2022 14:48:01 +0000 (UTC)
Date: Tue, 25 Jan 2022 14:48:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 11/18] vfio-user: find and init PCI device
Message-ID: <YfANoO9sUaf7WCJv@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <01f4837eaa73d340542961cf36a6028f4a681a0e.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y044p4CBJwWstrn0"
Content-Disposition: inline
In-Reply-To: <01f4837eaa73d340542961cf36a6028f4a681a0e.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Y044p4CBJwWstrn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:42:00PM -0500, Jagannathan Raman wrote:
> Find the PCI device with specified id. Initialize the device context
> with the QEMU PCI device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 60 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 810a7c3943..10db78eb8d 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -44,6 +44,8 @@
>  #include "qemu/notify.h"
>  #include "sysemu/sysemu.h"
>  #include "libvfio-user.h"
> +#include "hw/qdev-core.h"
> +#include "hw/pci/pci.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -89,6 +91,10 @@ struct VfuObject {
>      Notifier machine_done;
> =20
>      vfu_ctx_t *vfu_ctx;
> +
> +    PCIDevice *pci_dev;
> +
> +    Error *unplug_blocker;
>  };
> =20
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> @@ -161,6 +167,9 @@ static void vfu_object_machine_done(Notifier *notifie=
r, void *data)
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp)
>  {
>      ERRP_GUARD();
> +    DeviceState *dev =3D NULL;
> +    vfu_pci_type_t pci_type =3D VFU_PCI_TYPE_CONVENTIONAL;
> +    int ret;
> =20
>      if (o->vfu_ctx || !o->socket || !o->device ||
>              !phase_check(PHASE_MACHINE_READY)) {
> @@ -179,6 +188,49 @@ static void vfu_object_init_ctx(VfuObject *o, Error =
**errp)
>          error_setg(errp, "vfu: Failed to create context - %s", strerror(=
errno));
>          return;
>      }
> +
> +    dev =3D qdev_find_recursive(sysbus_get_default(), o->device);
> +    if (dev =3D=3D NULL) {
> +        error_setg(errp, "vfu: Device %s not found", o->device);
> +        goto fail;
> +    }
> +
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_setg(errp, "vfu: %s not a PCI device", o->device);
> +        goto fail;
> +    }
> +
> +    o->pci_dev =3D PCI_DEVICE(dev);
> +
> +    if (pci_is_express(o->pci_dev)) {
> +        pci_type =3D VFU_PCI_TYPE_EXPRESS;
> +    }
> +
> +    ret =3D vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0=
);
> +    if (ret < 0) {
> +        error_setg(errp,
> +                   "vfu: Failed to attach PCI device %s to context - %s",
> +                   o->device, strerror(errno));
> +        goto fail;
> +    }
> +
> +    error_setg(&o->unplug_blocker, "%s is in use", o->device);

More detailed error message:
"x-vfio-user-server for %s must be deleted before unplugging"

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Y044p4CBJwWstrn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwDaAACgkQnKSrs4Gr
c8iy9Qf+OlyyFLyZP+wLsTBZfWZRo6IlImseQ7rGxDTg0r0HK95Yg2/yiTYrohg8
rH1hf3+cuhJlPBCv2n1xEA2x1hpvN74mwGiVqMQhhtTEDzTmZaGU8qutislF/Ib3
hbc6y+gOomvTx+4sC4XWGTx4M1kTTHgC4OTTzhIy2CogkxIcbO96aeqJqs26KBgo
j3lXOOSiI6fUqABqNxf2koVUa3JrWMz6SCnGJSjSK9nTTvBvqlr5Xf8R2irvnYCp
nmxEof61TibkLaEncires6i4GKZiF5ciypCT3vBBx3JPATtveJaUpOLSF3dQRCIC
aG0fa5G5v4p1aMJLyXStc1w777zpJA==
=xBlq
-----END PGP SIGNATURE-----

--Y044p4CBJwWstrn0--


