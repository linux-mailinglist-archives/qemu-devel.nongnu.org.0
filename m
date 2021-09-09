Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CFB40580B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:53:56 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOKV1-0006CT-98
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOKRZ-00023s-Gx
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:50:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOKRV-0007hO-7b
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631195416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KMyQm1BX5XzBm8vt4O1zhIYsl57xpye5Nt7uceTh1DM=;
 b=PuzEUqv9ZwGsJ3zpWQt4HtyaJR9dK3llKu1Ht4SZ8HZmRdUKYIIFtW7LUzhQ5l9L/9TvS2
 MeoieGltpnCQLrM0HdWNkwYE/uQKJktrPv7if+/iQ3aKj07tHmUX8gc5MAhy6d0bCg89hY
 +CaUcoMkD5k1yW809yAj+UZ8uUrkehU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-O1kNXF0XOcGkLJ6ma3nE8Q-1; Thu, 09 Sep 2021 09:50:15 -0400
X-MC-Unique: O1kNXF0XOcGkLJ6ma3nE8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B70B5835DE3;
 Thu,  9 Sep 2021 13:50:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B4BF1B400;
 Thu,  9 Sep 2021 13:50:08 +0000 (UTC)
Date: Thu, 9 Sep 2021 14:50:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 11/16] vfio-user: get and set IRQs
Message-ID: <YToRENDJGm12/49b@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <4d292fab645b18b8a20f0f5a83356ae7fc0efa28.1629131628.git.elena.ufimtseva@oracle.com>
 <YTeB4n1CkgutJJmA@stefanha-x1.localdomain>
 <A90BF938-BEF6-42DF-BF14-DE3BED7F1986@oracle.com>
MIME-Version: 1.0
In-Reply-To: <A90BF938-BEF6-42DF-BF14-DE3BED7F1986@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NMCPfG4mSjtafaqg"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NMCPfG4mSjtafaqg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 05:50:39AM +0000, John Johnson wrote:
>=20
>=20
> > On Sep 7, 2021, at 8:14 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >=20
> > On Mon, Aug 16, 2021 at 09:42:44AM -0700, Elena Ufimtseva wrote:
> >> From: John Johnson <john.g.johnson@oracle.com>
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/vfio/user-protocol.h |  25 ++++++++++
> >> hw/vfio/user.h          |   2 +
> >> hw/vfio/common.c        |  26 ++++++++--
> >> hw/vfio/pci.c           |  31 ++++++++++--
> >> hw/vfio/user.c          | 106 ++++++++++++++++++++++++++++++++++++++++
> >> 5 files changed, 181 insertions(+), 9 deletions(-)
> >>=20
> >> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> >> index 56904cf872..5614efa0a4 100644
> >> --- a/hw/vfio/user-protocol.h
> >> +++ b/hw/vfio/user-protocol.h
> >> @@ -109,6 +109,31 @@ typedef struct {
> >>     uint64_t offset;
> >> } VFIOUserRegionInfo;
> >>=20
> >> +/*
> >> + * VFIO_USER_DEVICE_GET_IRQ_INFO
> >> + * imported from struct vfio_irq_info
> >> + */
> >> +typedef struct {
> >> +    VFIOUserHdr hdr;
> >> +    uint32_t argsz;
> >> +    uint32_t flags;
> >> +    uint32_t index;
> >> +    uint32_t count;
> >> +} VFIOUserIRQInfo;
> >> +
> >> +/*
> >> + * VFIO_USER_DEVICE_SET_IRQS
> >> + * imported from struct vfio_irq_set
> >> + */
> >> +typedef struct {
> >> +    VFIOUserHdr hdr;
> >> +    uint32_t argsz;
> >> +    uint32_t flags;
> >> +    uint32_t index;
> >> +    uint32_t start;
> >> +    uint32_t count;
> >> +} VFIOUserIRQSet;
> >> +
> >> /*
> >>  * VFIO_USER_REGION_READ
> >>  * VFIO_USER_REGION_WRITE
> >> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> >> index 02f832a173..248ad80943 100644
> >> --- a/hw/vfio/user.h
> >> +++ b/hw/vfio/user.h
> >> @@ -74,6 +74,8 @@ int vfio_user_validate_version(VFIODevice *vbasedev,=
 Error **errp);
> >> int vfio_user_get_info(VFIODevice *vbasedev);
> >> int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
> >>                               struct vfio_region_info *info, VFIOUserF=
Ds *fds);
> >> +int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info=
 *info);
> >> +int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq=
);
> >> int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64=
_t offset,
> >>                           uint32_t count, void *data);
> >> int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index a8b1ea9358..9fe3e05dc6 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -71,7 +71,11 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, in=
t index)
> >>         .count =3D 0,
> >>     };
> >>=20
> >> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> >> +    if (vbasedev->proxy !=3D NULL) {
> >> +        vfio_user_set_irqs(vbasedev, &irq_set);
> >> +    } else {
> >> +        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> >> +    }
> >> }
> >>=20
> >> void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
> >> @@ -84,7 +88,11 @@ void vfio_unmask_single_irqindex(VFIODevice *vbased=
ev, int index)
> >>         .count =3D 1,
> >>     };
> >>=20
> >> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> >> +    if (vbasedev->proxy !=3D NULL) {
> >> +        vfio_user_set_irqs(vbasedev, &irq_set);
> >> +    } else {
> >> +        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> >> +    }
> >> }
> >>=20
> >> void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
> >> @@ -97,7 +105,11 @@ void vfio_mask_single_irqindex(VFIODevice *vbasede=
v, int index)
> >>         .count =3D 1,
> >>     };
> >>=20
> >> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> >> +    if (vbasedev->proxy !=3D NULL) {
> >> +        vfio_user_set_irqs(vbasedev, &irq_set);
> >> +    } else {
> >> +        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> >> +    }
> >> }
> >>=20
> >> static inline const char *action_to_str(int action)
> >> @@ -178,8 +190,12 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, =
int index, int subindex,
> >>     pfd =3D (int32_t *)&irq_set->data;
> >>     *pfd =3D fd;
> >>=20
> >> -    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
> >> -        ret =3D -errno;
> >> +    if (vbasedev->proxy !=3D NULL) {
> >> +        ret =3D vfio_user_set_irqs(vbasedev, irq_set);
> >> +    } else {
> >> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
> >> +            ret =3D -errno;
> >> +        }
> >>     }
> >>     g_free(irq_set);
> >>=20
> >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> >> index ea0df8be65..282de6a30b 100644
> >> --- a/hw/vfio/pci.c
> >> +++ b/hw/vfio/pci.c
> >> @@ -403,7 +403,11 @@ static int vfio_enable_vectors(VFIOPCIDevice *vde=
v, bool msix)
> >>         fds[i] =3D fd;
> >>     }
> >>=20
> >> -    ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
> >> +    if (vdev->vbasedev.proxy !=3D NULL) {
> >> +        ret =3D vfio_user_set_irqs(&vdev->vbasedev, irq_set);
> >> +    } else {
> >> +        ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_se=
t);
> >> +    }
> >>=20
> >>     g_free(irq_set);
> >>=20
> >> @@ -2675,7 +2679,13 @@ static void vfio_populate_device(VFIOPCIDevice =
*vdev, Error **errp)
> >>=20
> >>     irq_info.index =3D VFIO_PCI_ERR_IRQ_INDEX;
> >>=20
> >> -    ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_i=
nfo);
> >> +    if (vbasedev->proxy !=3D NULL) {
> >> +        ret =3D vfio_user_get_irq_info(vbasedev, &irq_info);
> >> +    } else {
> >> +        ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &i=
rq_info);
> >> +    }
> >> +
> >> +
> >>     if (ret) {
> >>         /* This can fail for an old kernel or legacy PCI dev */
> >>         trace_vfio_populate_device_get_irq_info_failure(strerror(errno=
));
> >> @@ -2794,8 +2804,16 @@ static void vfio_register_req_notifier(VFIOPCID=
evice *vdev)
> >>         return;
> >>     }
> >>=20
> >> -    if (ioctl(vdev->vbasedev.fd,
> >> -              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.co=
unt < 1) {
> >> +    if (vdev->vbasedev.proxy !=3D NULL) {
> >> +        if (vfio_user_get_irq_info(&vdev->vbasedev, &irq_info) < 0) {
> >> +            return;
> >> +        }
> >> +    } else {
> >> +        if (ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_i=
nfo) < 0) {
> >> +            return;
> >> +        }
> >> +    }
> >> +    if (irq_info.count < 1) {
> >>         return;
> >>     }
> >>=20
> >> @@ -3557,6 +3575,11 @@ static void vfio_user_pci_realize(PCIDevice *pd=
ev, Error **errp)
> >>         }
> >>     }
> >>=20
> >> +    vfio_register_err_notifier(vdev);
> >> +    vfio_register_req_notifier(vdev);
> >> +
> >> +    return;
> >> +
> >> out_deregister:
> >>     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
> >>     kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier)=
;
> >> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> >> index 83235b2411..b68ca1279d 100644
> >> --- a/hw/vfio/user.c
> >> +++ b/hw/vfio/user.c
> >> @@ -768,6 +768,112 @@ int vfio_user_get_region_info(VFIODevice *vbased=
ev, int index,
> >>     return 0;
> >> }
> >>=20
> >> +int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info=
 *info)
> >> +{
> >> +    VFIOUserIRQInfo msg;
> >> +
> >> +    memset(&msg, 0, sizeof(msg));
> >> +    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
> >> +                          sizeof(msg), 0);
> >> +    msg.argsz =3D info->argsz;
> >> +    msg.index =3D info->index;
> >> +
> >> +    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0, 0);
> >> +    if (msg.hdr.flags & VFIO_USER_ERROR) {
> >> +        return -msg.hdr.error_reply;
> >> +    }
> >> +
> >> +    memcpy(info, &msg.argsz, sizeof(*info));
> >=20
> > Should this be info.count =3D msg.count instead? Not sure why argsz is
> > used here.
>=20
> =09It=E2=80=99s copying the entire returned vfio_irq_info struct, which s=
tarts
> at &msg.argsz.

That makes sense, I missed it. Thanks!

Stefan

--NMCPfG4mSjtafaqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE6EQ8ACgkQnKSrs4Gr
c8iqAwgApluVjVVr4BA3Ju+bYyI40K6WS+zueEjFENcWk8P8uKGTGufegrzLI6DX
4g3KjNdD/NF25giHA+Em6iiaVPfZWIWrNI7AMiBx5bsryz1gOhSk0JhOoYrYFKoG
O5WdRQlJFszc9mbH/W1Z0ksIx0sy8QNMLnctiCEmPJfcsNWB0pHM7fumvfFMrSBT
v173ro7zXXCaNdBYdpueznd3nDr5dMvyb0V3Frup1j4zldg2lWmNRyqPX3ScUhoX
ak/O+uPVBz6knaJpHks+/VoriUG9hzsGBJ78xehwBbG2/VaR6dNRAgsfuwE1EG/c
Er7ZSpi+oI6lzPYuICPYq9QZLENqKA==
=FmeL
-----END PGP SIGNATURE-----

--NMCPfG4mSjtafaqg--


