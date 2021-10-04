Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B62421186
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:34:33 +0200 (CEST)
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXP31-0003PD-A5
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXOze-0002eX-RZ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXOza-0004HM-A6
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633357856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j5pLxFLtUq2/zlwwFCHOyMztQhIB/Qu2JV3XfWlSuI4=;
 b=cypOqTN7fIsjaV8hA4o1svsj2EVrBBXOhaDrqDXJ7Zyw8W92WEnb52VDIBcjUzFut6FapB
 NjX8ddFvdeGsqR54+cHAZXt+Qk0WLBS5izgm3vwyzOixoj6nsXid6rJ3F4QDtzWM68H3y2
 WMGf2XmEU35FCDwT0mnoaLuu6dK328E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-as8TI98YMLSnKaIdoUpatg-1; Mon, 04 Oct 2021 10:30:52 -0400
X-MC-Unique: as8TI98YMLSnKaIdoUpatg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CE271006AA2;
 Mon,  4 Oct 2021 14:30:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 289AF5F707;
 Mon,  4 Oct 2021 14:30:39 +0000 (UTC)
Date: Mon, 4 Oct 2021 15:30:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 08/13] virtiofsd: Create a notification queue
Message-ID: <YVsQDkoNPyvC/Uoo@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-9-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-9-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Sspt1vEZS1yJ0dJA"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sspt1vEZS1yJ0dJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:32AM -0400, Vivek Goyal wrote:
> Add a notification queue which will be used to send async notifications
> for file lock availability.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> ---
>  hw/virtio/vhost-user-fs-pci.c     |  4 +-
>  hw/virtio/vhost-user-fs.c         | 62 +++++++++++++++++++++++++--
>  include/hw/virtio/vhost-user-fs.h |  2 +
>  tools/virtiofsd/fuse_i.h          |  1 +
>  tools/virtiofsd/fuse_virtio.c     | 70 +++++++++++++++++++++++--------
>  5 files changed, 116 insertions(+), 23 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.=
c
> index 2ed8492b3f..cdb9471088 100644
> --- a/hw/virtio/vhost-user-fs-pci.c
> +++ b/hw/virtio/vhost-user-fs-pci.c
> @@ -41,8 +41,8 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *v=
pci_dev, Error **errp)
>      DeviceState *vdev =3D DEVICE(&dev->vdev);
> =20
>      if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> -        /* Also reserve config change and hiprio queue vectors */
> -        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 2;
> +        /* Also reserve config change, hiprio and notification queue vec=
tors */
> +        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 3;
>      }
> =20
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index d1efbc5b18..6bafcf0243 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -31,6 +31,7 @@ static const int user_feature_bits[] =3D {
>      VIRTIO_F_NOTIFY_ON_EMPTY,
>      VIRTIO_F_RING_PACKED,
>      VIRTIO_F_IOMMU_PLATFORM,
> +    VIRTIO_FS_F_NOTIFICATION,
> =20
>      VHOST_INVALID_FEATURE_BIT
>  };
> @@ -147,7 +148,7 @@ static void vuf_handle_output(VirtIODevice *vdev, Vir=
tQueue *vq)
>       */
>  }
> =20
> -static void vuf_create_vqs(VirtIODevice *vdev)
> +static void vuf_create_vqs(VirtIODevice *vdev, bool notification_vq)
>  {
>      VHostUserFS *fs =3D VHOST_USER_FS(vdev);
>      unsigned int i;
> @@ -155,6 +156,15 @@ static void vuf_create_vqs(VirtIODevice *vdev)
>      /* Hiprio queue */
>      fs->hiprio_vq =3D virtio_add_queue(vdev, fs->conf.queue_size,
>                                       vuf_handle_output);
> +    /*
> +     * Notification queue. Feature negotiation happens later. So at this
> +     * point of time we don't know if driver will use notification queue
> +     * or not.
> +     */
> +    if (notification_vq) {
> +        fs->notification_vq =3D virtio_add_queue(vdev, fs->conf.queue_si=
ze,
> +                                               vuf_handle_output);
> +    }
> =20
>      /* Request queues */
>      fs->req_vqs =3D g_new(VirtQueue *, fs->conf.num_request_queues);
> @@ -163,8 +173,12 @@ static void vuf_create_vqs(VirtIODevice *vdev)
>                                            vuf_handle_output);
>      }
> =20
> -    /* 1 high prio queue, plus the number configured */
> -    fs->vhost_dev.nvqs =3D 1 + fs->conf.num_request_queues;
> +    /* 1 high prio queue, 1 notification queue plus the number configure=
d */
> +    if (notification_vq) {
> +        fs->vhost_dev.nvqs =3D 2 + fs->conf.num_request_queues;
> +    } else {
> +        fs->vhost_dev.nvqs =3D 1 + fs->conf.num_request_queues;
> +    }
>      fs->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, fs->vhost_dev.n=
vqs);
>  }
> =20
> @@ -176,6 +190,11 @@ static void vuf_cleanup_vqs(VirtIODevice *vdev)
>      virtio_delete_queue(fs->hiprio_vq);
>      fs->hiprio_vq =3D NULL;
> =20
> +    if (fs->notification_vq) {
> +        virtio_delete_queue(fs->notification_vq);
> +    }
> +    fs->notification_vq =3D NULL;
> +
>      for (i =3D 0; i < fs->conf.num_request_queues; i++) {
>          virtio_delete_queue(fs->req_vqs[i]);
>      }
> @@ -194,9 +213,43 @@ static uint64_t vuf_get_features(VirtIODevice *vdev,
>  {
>      VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> =20
> +    virtio_add_feature(&features, VIRTIO_FS_F_NOTIFICATION);
> +
>      return vhost_get_features(&fs->vhost_dev, user_feature_bits, feature=
s);
>  }
> =20
> +static void vuf_set_features(VirtIODevice *vdev, uint64_t features)
> +{
> +    VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> +
> +    if (virtio_has_feature(features, VIRTIO_FS_F_NOTIFICATION)) {
> +        fs->notify_enabled =3D true;
> +        /*
> +         * If guest first booted with no notification queue support and
> +         * later rebooted with kernel which supports notification, we
> +         * can end up here
> +         */
> +        if (!fs->notification_vq) {
> +            vuf_cleanup_vqs(vdev);
> +            vuf_create_vqs(vdev, true);
> +        }

I would simplify things by unconditionally creating the notification vq
for the device and letting the vhost-user device backend decide whether
it wants to handle the vq or not. If the backend doesn't implement the
vq then it also won't advertise VIRTIO_FS_F_NOTIFICATION so the guest
driver won't submit virtqueue buffers.

I'm not 100% sure if that approach works. It should be tested with a
virtiofsd that doesn't implement the notification vq, for example. But I
think it's worth exploring that because the code will be simpler than
worrying about whether notifications are enabled or disabled.

> +        return;
> +    }
> +
> +    fs->notify_enabled =3D false;
> +    if (!fs->notification_vq) {
> +        return;
> +    }
> +    /*
> +     * Driver does not support notification queue. Reconfigure queues
> +     * and do not create notification queue.
> +     */
> +    vuf_cleanup_vqs(vdev);
> +
> +    /* Create queues again */
> +    vuf_create_vqs(vdev, false);
> +}
> +
>  static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
>                                              bool mask)
>  {
> @@ -262,7 +315,7 @@ static void vuf_device_realize(DeviceState *dev, Erro=
r **errp)
>      virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
>                  sizeof(struct virtio_fs_config));
> =20
> -    vuf_create_vqs(vdev);
> +    vuf_create_vqs(vdev, true);
>      ret =3D vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> @@ -327,6 +380,7 @@ static void vuf_class_init(ObjectClass *klass, void *=
data)
>      vdc->realize =3D vuf_device_realize;
>      vdc->unrealize =3D vuf_device_unrealize;
>      vdc->get_features =3D vuf_get_features;
> +    vdc->set_features =3D vuf_set_features;
>      vdc->get_config =3D vuf_get_config;
>      vdc->set_status =3D vuf_set_status;
>      vdc->guest_notifier_mask =3D vuf_guest_notifier_mask;
> diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-=
user-fs.h
> index 0d62834c25..95dc0dd402 100644
> --- a/include/hw/virtio/vhost-user-fs.h
> +++ b/include/hw/virtio/vhost-user-fs.h
> @@ -39,7 +39,9 @@ struct VHostUserFS {
>      VhostUserState vhost_user;
>      VirtQueue **req_vqs;
>      VirtQueue *hiprio_vq;
> +    VirtQueue *notification_vq;
>      int32_t bootindex;
> +    bool notify_enabled;
> =20
>      /*< public >*/
>  };
> diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
> index 492e002181..4942d080da 100644
> --- a/tools/virtiofsd/fuse_i.h
> +++ b/tools/virtiofsd/fuse_i.h
> @@ -73,6 +73,7 @@ struct fuse_session {
>      int   vu_socketfd;
>      struct fv_VuDev *virtio_dev;
>      int thread_pool_size;
> +    bool notify_enabled;
>  };
> =20
>  struct fuse_chan {
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.=
c
> index baead08b28..f5b87a508a 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -14,6 +14,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/iov.h"
>  #include "qapi/error.h"
> +#include "standard-headers/linux/virtio_fs.h"
>  #include "fuse_i.h"
>  #include "standard-headers/linux/fuse.h"
>  #include "fuse_misc.h"
> @@ -85,12 +86,25 @@ struct fv_VuDev {
>  /* Callback from libvhost-user */
>  static uint64_t fv_get_features(VuDev *dev)
>  {
> -    return 1ULL << VIRTIO_F_VERSION_1;
> +    uint64_t features;
> +
> +    features =3D 1ull << VIRTIO_F_VERSION_1 |
> +               1ull << VIRTIO_FS_F_NOTIFICATION;
> +
> +    return features;
>  }
> =20
>  /* Callback from libvhost-user */
>  static void fv_set_features(VuDev *dev, uint64_t features)
>  {
> +    struct fv_VuDev *vud =3D container_of(dev, struct fv_VuDev, dev);
> +    struct fuse_session *se =3D vud->se;
> +
> +    if ((1ull << VIRTIO_FS_F_NOTIFICATION) & features) {
> +        se->notify_enabled =3D true;
> +    } else {
> +        se->notify_enabled =3D false;
> +    }
>  }
> =20
>  /*
> @@ -719,22 +733,25 @@ static void fv_queue_cleanup_thread(struct fv_VuDev=
 *vud, int qidx)
>  {
>      int ret;
>      struct fv_QueueInfo *ourqi;
> +    struct fuse_session *se =3D vud->se;
> =20
>      assert(qidx < vud->nqueues);
>      ourqi =3D vud->qi[qidx];
> =20
> -    /* Kill the thread */
> -    if (eventfd_write(ourqi->kill_fd, 1)) {
> -        fuse_log(FUSE_LOG_ERR, "Eventfd_write for queue %d: %s\n",
> -                 qidx, strerror(errno));
> -    }
> -    ret =3D pthread_join(ourqi->thread, NULL);
> -    if (ret) {
> -        fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err %d\=
n",
> -                 __func__, qidx, ret);
> +    /* qidx =3D=3D 1 is the notification queue if notifications are enab=
led */
> +    if (!se->notify_enabled || qidx !=3D 1) {
> +        /* Kill the thread */
> +        if (eventfd_write(ourqi->kill_fd, 1)) {
> +            fuse_log(FUSE_LOG_ERR, "Eventfd_read for queue: %m\n");
> +        }
> +        ret =3D pthread_join(ourqi->thread, NULL);
> +        if (ret) {
> +            fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err=
"
> +                     " %d\n", __func__, qidx, ret);
> +        }
> +        close(ourqi->kill_fd);
>      }
>      pthread_mutex_destroy(&ourqi->vq_lock);
> -    close(ourqi->kill_fd);
>      ourqi->kick_fd =3D -1;
>      g_free(vud->qi[qidx]);
>      vud->qi[qidx] =3D NULL;
> @@ -757,6 +774,9 @@ static void fv_queue_set_started(VuDev *dev, int qidx=
, bool started)
>  {
>      struct fv_VuDev *vud =3D container_of(dev, struct fv_VuDev, dev);
>      struct fv_QueueInfo *ourqi;
> +    int valid_queues =3D 2; /* One hiprio queue and one request queue */
> +    bool notification_q =3D false;
> +    struct fuse_session *se =3D vud->se;
> =20
>      fuse_log(FUSE_LOG_INFO, "%s: qidx=3D%d started=3D%d\n", __func__, qi=
dx,
>               started);
> @@ -768,10 +788,19 @@ static void fv_queue_set_started(VuDev *dev, int qi=
dx, bool started)
>       * well-behaved client in mind and may not protect against all types=
 of
>       * races yet.
>       */
> -    if (qidx > 1) {
> -        fuse_log(FUSE_LOG_ERR,
> -                 "%s: multiple request queues not yet implemented, pleas=
e only "
> -                 "configure 1 request queue\n",
> +    if (se->notify_enabled) {
> +        valid_queues++;
> +        /*
> +         * If notification queue is enabled, then qidx 1 is notificaiton=
 queue.

s/notificaiton/notification/

> +         */
> +        if (qidx =3D=3D 1) {
> +            notification_q =3D true;
> +        }
> +    }
> +
> +    if (qidx >=3D valid_queues) {
> +        fuse_log(FUSE_LOG_ERR, "%s: multiple request queues not yet"
> +                 "implemented, please only configure 1 request queue\n",
>                   __func__);
>          exit(EXIT_FAILURE);
>      }
> @@ -793,11 +822,18 @@ static void fv_queue_set_started(VuDev *dev, int qi=
dx, bool started)
>              assert(vud->qi[qidx]->kick_fd =3D=3D -1);
>          }
>          ourqi =3D vud->qi[qidx];
> +        pthread_mutex_init(&ourqi->vq_lock, NULL);
> +        /*
> +         * For notification queue, we don't have to start a thread yet.
> +         */
> +        if (notification_q) {
> +            return;
> +        }
> +
>          ourqi->kick_fd =3D dev->vq[qidx].kick_fd;
> =20
>          ourqi->kill_fd =3D eventfd(0, EFD_CLOEXEC | EFD_SEMAPHORE);
>          assert(ourqi->kill_fd !=3D -1);
> -        pthread_mutex_init(&ourqi->vq_lock, NULL);
> =20
>          if (pthread_create(&ourqi->thread, NULL, fv_queue_thread, ourqi)=
) {
>              fuse_log(FUSE_LOG_ERR, "%s: Failed to create thread for queu=
e %d\n",
> @@ -1048,7 +1084,7 @@ int virtio_session_mount(struct fuse_session *se)
>      se->vu_socketfd =3D data_sock;
>      se->virtio_dev->se =3D se;
>      pthread_rwlock_init(&se->virtio_dev->vu_dispatch_rwlock, NULL);
> -    if (!vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, NUL=
L,
> +    if (!vu_init(&se->virtio_dev->dev, 3, se->vu_socketfd, fv_panic, NUL=
L,

The guest driver can invoke fv_queue_set_started() with qidx=3D2 even when
VIRTIO_FS_F_NOTIFICATION is off. Luckily the following check protects
fv_queue_set_started():

  if (qidx >=3D valid_queues) {
      fuse_log(FUSE_LOG_ERR, "%s: multiple request queues not yet"
               "implemented, please only configure 1 request queue\n",
               __func__);
      exit(EXIT_FAILURE);
  }

However, the error message suggests this is related to multiqueue. In
fact, we'll need to keep this check even once multiqueue has been
implemented. Maybe the error message should be tweaked or at least a
comment needs to be added to the code so this check isn't accidentally
removed once multiqueue is implemented.

--Sspt1vEZS1yJ0dJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFbEA0ACgkQnKSrs4Gr
c8g5ggf+I0rtO1QMD7rSt76SrKvyQE0tXDLs42K6MtG1bQ0wp8oTEUUae53geMlY
rtQYjvdI0yFJhM/V23P8b/wAoR5w3Hd+zwlllnfM5n4THJpJs9B0EUj6XfJLnlLZ
AJ0WUOLjHpuDqfb0sXl0lPK2eGRfFUobrFYBo0HRviy+bwa9D6GOidGBwg0eEDV6
mPhiHjWDiu9uR0S4yvE4H3AMRek1qj+CzWJtM2e2lnQUqLw5t1iSbIntsECsioHr
WgGfbIoShLO6J4mjZMlTgvDYU3K05fwQB641YxGMsITfMCS/Sd/M0zkMZ8oEsVKU
OuHmT/jnc1ndMK+gfQ98P7yXoZgiYQ==
=vasF
-----END PGP SIGNATURE-----

--Sspt1vEZS1yJ0dJA--


