Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E164AC1DD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:49:55 +0100 (CET)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5L0-0007FO-7V
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH5BL-0005sZ-Fu
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:39:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH5BF-0000GV-4K
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644244787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dFO5S/Nm4qXRPF+2GpP/HPtUeZjbEd3On8KYVOGS5FQ=;
 b=dSh/FvieTB9zsxSukByVyKE4fQsyJPaK7hnkKjdYvDAMq9tTeovFMhOPIXGlcGrbyMCn+C
 e4qvqLTSU9zCA4iPWNLLNv4VVTJR6IXdqaqqIdsx2v152HP+/92xo1j3op+bfYpMiSK7m5
 Rva7IoDb2TsIf8uC0RipacwpNDQhx/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-ICYhz7SxNmOdJ2oD1L7OjQ-1; Mon, 07 Feb 2022 09:39:46 -0500
X-MC-Unique: ICYhz7SxNmOdJ2oD1L7OjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC4F593A8;
 Mon,  7 Feb 2022 14:39:45 +0000 (UTC)
Received: from localhost (unknown [10.39.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D28FE6E21C;
 Mon,  7 Feb 2022 14:39:31 +0000 (UTC)
Date: Mon, 7 Feb 2022 14:39:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 5/5] libvduse: Add support for reconnecting
Message-ID: <YgEvInUC/upRN3py@stefanha-x1.localdomain>
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-6-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qExG03e1dcXsrpYv"
Content-Disposition: inline
In-Reply-To: <20220125131800.91-6-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qExG03e1dcXsrpYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 09:18:00PM +0800, Xie Yongji wrote:
> To support reconnecting after restart or crash, VDUSE backend
> might need to resubmit inflight I/Os. This stores the metadata
> such as the index of inflight I/O's descriptors to a shm file so
> that VDUSE backend can restore them during reconnecting.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/export/vduse-blk.c        |   4 +-
>  subprojects/libvduse/libvduse.c | 254 +++++++++++++++++++++++++++++++-
>  subprojects/libvduse/libvduse.h |   4 +-
>  3 files changed, 254 insertions(+), 8 deletions(-)
>=20
> diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> index 83845e9a9a..bc14fd798b 100644
> --- a/block/export/vduse-blk.c
> +++ b/block/export/vduse-blk.c
> @@ -232,6 +232,8 @@ static void vduse_blk_enable_queue(VduseDev *dev, Vdu=
seVirtq *vq)
> =20
>      aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
>                         true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
> +    /* Make sure we don't miss any kick afer reconnecting */
> +    eventfd_write(vduse_queue_get_fd(vq), 1);
>  }
> =20
>  static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
> @@ -388,7 +390,7 @@ static int vduse_blk_exp_create(BlockExport *exp, Blo=
ckExportOptions *opts,
>                                       features, num_queues,
>                                       sizeof(struct virtio_blk_config),
>                                       (char *)&config, &vduse_blk_ops,
> -                                     vblk_exp);
> +                                     g_get_tmp_dir(), vblk_exp);
>      if (!vblk_exp->dev) {
>          error_setg(errp, "failed to create vduse device");
>          return -ENOMEM;
> diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvd=
use.c
> index 7671864bca..ce2f6c7949 100644
> --- a/subprojects/libvduse/libvduse.c
> +++ b/subprojects/libvduse/libvduse.c
> @@ -41,6 +41,8 @@
>  #define VDUSE_VQ_ALIGN 4096
>  #define MAX_IOVA_REGIONS 256
> =20
> +#define LOG_ALIGNMENT 64
> +
>  /* Round number down to multiple */
>  #define ALIGN_DOWN(n, m) ((n) / (m) * (m))
> =20
> @@ -51,6 +53,31 @@
>  #define unlikely(x)   __builtin_expect(!!(x), 0)
>  #endif
> =20
> +typedef struct VduseDescStateSplit {
> +    uint8_t inflight;
> +    uint8_t padding[5];
> +    uint16_t next;
> +    uint64_t counter;
> +} VduseDescStateSplit;
> +
> +typedef struct VduseVirtqLogInflight {
> +    uint64_t features;
> +    uint16_t version;
> +    uint16_t desc_num;
> +    uint16_t last_batch_head;
> +    uint16_t used_idx;
> +    VduseDescStateSplit desc[];
> +} VduseVirtqLogInflight;
> +
> +typedef struct VduseVirtqLog {
> +    VduseVirtqLogInflight inflight;
> +} VduseVirtqLog;
> +
> +typedef struct VduseVirtqInflightDesc {
> +    uint16_t index;
> +    uint64_t counter;
> +} VduseVirtqInflightDesc;
> +
>  typedef struct VduseRing {
>      unsigned int num;
>      uint64_t desc_addr;
> @@ -73,6 +100,10 @@ struct VduseVirtq {
>      bool ready;
>      int fd;
>      VduseDev *dev;
> +    VduseVirtqInflightDesc *resubmit_list;
> +    uint16_t resubmit_num;
> +    uint64_t counter;
> +    VduseVirtqLog *log;
>  };
> =20
>  typedef struct VduseIovaRegion {
> @@ -96,8 +127,67 @@ struct VduseDev {
>      int fd;
>      int ctrl_fd;
>      void *priv;
> +    char *shm_log_dir;
> +    void *log;
> +    bool reconnect;
>  };
> =20
> +static inline size_t vduse_vq_log_size(uint16_t queue_size)
> +{
> +    return ALIGN_UP(sizeof(VduseDescStateSplit) * queue_size +
> +                    sizeof(VduseVirtqLogInflight), LOG_ALIGNMENT);
> +}
> +
> +static void *vduse_log_get(const char *dir, const char *name, size_t siz=
e)
> +{
> +    void *ptr =3D MAP_FAILED;
> +    char *path;
> +    int fd;
> +
> +    path =3D (char *)malloc(strlen(dir) + strlen(name) +
> +                          strlen("/vduse-log-") + 1);
> +    if (!path) {
> +        return ptr;
> +    }
> +    sprintf(path, "%s/vduse-log-%s", dir, name);

Please use g_strdup_printf() and g_autofree in QEMU code. In libvduse
code it's okay to use malloc(3), but regular QEMU code should use glib.

> +
> +    fd =3D open(path, O_RDWR | O_CREAT, 0600);
> +    if (fd =3D=3D -1) {
> +        goto out;
> +    }
> +
> +    if (ftruncate(fd, size) =3D=3D -1) {
> +        goto out;
> +    }
> +
> +    ptr =3D mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +    if (ptr =3D=3D MAP_FAILED) {
> +        goto out;
> +    }
> +out:
> +    if (fd > 0) {
> +        close(fd);
> +    }
> +    free(path);
> +
> +    return ptr;
> +}
> +
> +static void vduse_log_destroy(const char *dir, const char *name)
> +{
> +    char *path;
> +
> +    path =3D (char *)malloc(strlen(dir) + strlen(name) +
> +                          strlen("/vduse-log-") + 1);
> +    if (!path) {
> +        return;
> +    }
> +    sprintf(path, "%s/vduse-log-%s", dir, name);
> +
> +    unlink(path);
> +    free(path);
> +}
> +
>  static inline bool has_feature(uint64_t features, unsigned int fbit)
>  {
>      assert(fbit < 64);
> @@ -139,6 +229,98 @@ static int vduse_inject_irq(VduseDev *dev, int index)
>      return ioctl(dev->fd, VDUSE_VQ_INJECT_IRQ, &index);
>  }
> =20
> +static int inflight_desc_compare(const void *a, const void *b)
> +{
> +    VduseVirtqInflightDesc *desc0 =3D (VduseVirtqInflightDesc *)a,
> +                           *desc1 =3D (VduseVirtqInflightDesc *)b;
> +
> +    if (desc1->counter > desc0->counter &&
> +        (desc1->counter - desc0->counter) < VIRTQUEUE_MAX_SIZE * 2) {
> +        return 1;
> +    }
> +
> +    return -1;
> +}
> +
> +static int vduse_queue_check_inflights(VduseVirtq *vq)
> +{
> +    int i =3D 0;
> +    VduseDev *dev =3D vq->dev;
> +
> +    vq->used_idx =3D vq->vring.used->idx;

Is this reading struct vring_used->idx without le16toh()?

> +    vq->resubmit_num =3D 0;
> +    vq->resubmit_list =3D NULL;
> +    vq->counter =3D 0;
> +
> +    if (unlikely(vq->log->inflight.used_idx !=3D vq->used_idx)) {
> +        vq->log->inflight.desc[vq->log->inflight.last_batch_head].inflig=
ht =3D 0;

I suggest validating vq->log->inflight fields before using them.
last_batch_head must be less than the virtqueue size. Although the log
file is somewhat trusted, there may still be ways to corrupt it or
confuse the new process that loads it.

> +
> +        barrier();
> +
> +        vq->log->inflight.used_idx =3D vq->used_idx;
> +    }
> +
> +    for (i =3D 0; i < vq->log->inflight.desc_num; i++) {
> +        if (vq->log->inflight.desc[i].inflight =3D=3D 1) {
> +            vq->inuse++;
> +        }
> +    }
> +
> +    vq->shadow_avail_idx =3D vq->last_avail_idx =3D vq->inuse + vq->used=
_idx;
> +
> +    if (vq->inuse) {
> +        vq->resubmit_list =3D calloc(vq->inuse, sizeof(VduseVirtqInfligh=
tDesc));
> +        if (!vq->resubmit_list) {
> +            return -1;
> +        }
> +
> +        for (i =3D 0; i < vq->log->inflight.desc_num; i++) {
> +            if (vq->log->inflight.desc[i].inflight) {
> +                vq->resubmit_list[vq->resubmit_num].index =3D i;
> +                vq->resubmit_list[vq->resubmit_num].counter =3D
> +                                        vq->log->inflight.desc[i].counte=
r;
> +                vq->resubmit_num++;
> +            }
> +        }
> +
> +        if (vq->resubmit_num > 1) {
> +            qsort(vq->resubmit_list, vq->resubmit_num,
> +                  sizeof(VduseVirtqInflightDesc), inflight_desc_compare);
> +        }
> +        vq->counter =3D vq->resubmit_list[0].counter + 1;
> +    }
> +
> +    vduse_inject_irq(dev, vq->index);
> +
> +    return 0;
> +}
> +
> +static int vduse_queue_inflight_get(VduseVirtq *vq, int desc_idx)
> +{
> +    vq->log->inflight.desc[desc_idx].counter =3D vq->counter++;
> +    vq->log->inflight.desc[desc_idx].inflight =3D 1;
> +
> +    return 0;
> +}
> +
> +static int vduse_queue_inflight_pre_put(VduseVirtq *vq, int desc_idx)
> +{
> +    vq->log->inflight.last_batch_head =3D desc_idx;
> +
> +    return 0;
> +}
> +
> +static int vduse_queue_inflight_post_put(VduseVirtq *vq, int desc_idx)
> +{
> +    vq->log->inflight.desc[desc_idx].inflight =3D 0;
> +
> +    barrier();
> +
> +    vq->log->inflight.used_idx =3D vq->used_idx;
> +
> +    return 0;
> +}
> +
>  static void vduse_iova_remove_region(VduseDev *dev, uint64_t start,
>                                       uint64_t last)
>  {
> @@ -578,11 +760,24 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
>      unsigned int head;
>      VduseVirtqElement *elem;
>      VduseDev *dev =3D vq->dev;
> +    int i;
> =20
>      if (unlikely(!vq->vring.avail)) {
>          return NULL;
>      }
> =20
> +    if (unlikely(vq->resubmit_list && vq->resubmit_num > 0)) {
> +        i =3D (--vq->resubmit_num);
> +        elem =3D vduse_queue_map_desc(vq, vq->resubmit_list[i].index, sz=
);
> +
> +        if (!vq->resubmit_num) {
> +            free(vq->resubmit_list);
> +            vq->resubmit_list =3D NULL;
> +        }

resubmit_list is only freed when vduse_queue_pop() is called often
enough to empty the list. Please free the list when the vduse instance
is destroyed too, just in case vduse_queue_pop() wasn't called often
enough to free it.

> +
> +        return elem;
> +    }
> +
>      if (vduse_queue_empty(vq)) {
>          return NULL;
>      }
> @@ -610,6 +805,8 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
> =20
>      vq->inuse++;
> =20
> +    vduse_queue_inflight_get(vq, head);
> +
>      return elem;
>  }
> =20
> @@ -667,7 +864,9 @@ void vduse_queue_push(VduseVirtq *vq, const VduseVirt=
qElement *elem,
>                        unsigned int len)
>  {
>      vduse_queue_fill(vq, elem, len, 0);
> +    vduse_queue_inflight_pre_put(vq, elem->index);
>      vduse_queue_flush(vq, 1);
> +    vduse_queue_inflight_post_put(vq, elem->index);
>  }
> =20
>  static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
> @@ -740,12 +939,11 @@ static void vduse_queue_enable(VduseVirtq *vq)
>      }
> =20
>      vq->fd =3D fd;
> -    vq->shadow_avail_idx =3D vq->last_avail_idx =3D vq_info.split.avail_=
index;
> -    vq->inuse =3D 0;
> -    vq->used_idx =3D 0;
>      vq->signalled_used_valid =3D false;
>      vq->ready =3D true;
> =20
> +    vduse_queue_check_inflights(vq);
> +
>      dev->ops->enable_queue(dev, vq);
>  }
> =20
> @@ -903,13 +1101,18 @@ int vduse_dev_setup_queue(VduseDev *dev, int index=
, int max_size)
>          return -errno;
>      }
> =20
> +    if (dev->reconnect) {
> +        vduse_queue_enable(vq);
> +    }
> +
>      return 0;
>  }
> =20
>  VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
>                             uint32_t vendor_id, uint64_t features,
>                             uint16_t num_queues, uint32_t config_size,
> -                           char *config, const VduseOps *ops, void *priv)
> +                           char *config, const VduseOps *ops,
> +                           const char *shm_log_dir, void *priv)
>  {
>      VduseDev *dev;
>      int i, ret, ctrl_fd, fd =3D -1;
> @@ -918,6 +1121,8 @@ VduseDev *vduse_dev_create(const char *name, uint32_=
t device_id,
>      VduseVirtq *vqs =3D NULL;
>      struct vduse_dev_config *dev_config =3D NULL;
>      size_t size =3D offsetof(struct vduse_dev_config, config);
> +    size_t log_size =3D num_queues * vduse_vq_log_size(VIRTQUEUE_MAX_SIZ=
E);
> +    void *log =3D NULL;
> =20
>      if (!name || strlen(name) > VDUSE_NAME_MAX || !config ||
>          !config_size || !ops || !ops->enable_queue || !ops->disable_queu=
e) {
> @@ -932,6 +1137,15 @@ VduseDev *vduse_dev_create(const char *name, uint32=
_t device_id,
>      }
>      memset(dev, 0, sizeof(VduseDev));
> =20
> +    if (shm_log_dir) {
> +        dev->log =3D log =3D vduse_log_get(shm_log_dir, name, log_size);
> +        if (!log) {
> +            fprintf(stderr, "Failed to get vduse log\n");
> +            goto err_ctrl;
> +        }
> +        dev->shm_log_dir =3D strdup(shm_log_dir);
> +    }
> +
>      ctrl_fd =3D open("/dev/vduse/control", O_RDWR);
>      if (ctrl_fd < 0) {
>          fprintf(stderr, "Failed to open /dev/vduse/control: %s\n",
> @@ -964,7 +1178,11 @@ VduseDev *vduse_dev_create(const char *name, uint32=
_t device_id,
> =20
>      ret =3D ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
>      free(dev_config);
> -    if (ret < 0) {
> +    if (!ret && log) {
> +        memset(log, 0, log_size);
> +    } else if (errno =3D=3D EEXIST && log) {
> +        dev->reconnect =3D true;
> +    } else {
>          fprintf(stderr, "Failed to create vduse dev %s: %s\n",
>                  name, strerror(errno));
>          goto err_dev;
> @@ -978,6 +1196,12 @@ VduseDev *vduse_dev_create(const char *name, uint32=
_t device_id,
>          goto err;
>      }
> =20
> +    if (dev->reconnect &&
> +        ioctl(fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
> +        fprintf(stderr, "Failed to get features: %s\n", strerror(errno));
> +        goto err;
> +    }
> +
>      vqs =3D calloc(sizeof(VduseVirtq), num_queues);
>      if (!vqs) {
>          fprintf(stderr, "Failed to allocate virtqueues\n");
> @@ -988,6 +1212,12 @@ VduseDev *vduse_dev_create(const char *name, uint32=
_t device_id,
>          vqs[i].index =3D i;
>          vqs[i].dev =3D dev;
>          vqs[i].fd =3D -1;
> +        if (log) {
> +            vqs[i].log =3D log;
> +            vqs[i].log->inflight.desc_num =3D VIRTQUEUE_MAX_SIZE;
> +            log =3D (void *)((char *)log +
> +                  vduse_vq_log_size(VIRTQUEUE_MAX_SIZE));

The size of the log needs to be verified. The file is mmapped but
there's no guarantee that the size matches num_queues *
vduse_vq_log_size(VIRTQUEUE_MAX_SIZE).

> +        }
>      }
> =20
>      dev->vqs =3D vqs;
> @@ -1008,16 +1238,28 @@ err_dev:
>      close(ctrl_fd);
>  err_ctrl:
>      free(dev);
> +    if (log) {
> +        munmap(log, log_size);
> +    }
> =20
>      return NULL;
>  }
> =20
>  void vduse_dev_destroy(VduseDev *dev)
>  {
> +    size_t log_size =3D dev->num_queues * vduse_vq_log_size(VIRTQUEUE_MA=
X_SIZE);
> +
> +    if (dev->log) {
> +        munmap(dev->log, log_size);
> +    }
>      free(dev->vqs);
>      close(dev->fd);
>      dev->fd =3D -1;
> -    ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name);
> +    if (!ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name) &&
> +        dev->shm_log_dir) {
> +        vduse_log_destroy(dev->shm_log_dir, dev->name);
> +    }
> +    free(dev->shm_log_dir);
>      free(dev->name);
>      close(dev->ctrl_fd);
>      dev->ctrl_fd =3D -1;
> diff --git a/subprojects/libvduse/libvduse.h b/subprojects/libvduse/libvd=
use.h
> index f6bcb51b5a..a46e71e0c2 100644
> --- a/subprojects/libvduse/libvduse.h
> +++ b/subprojects/libvduse/libvduse.h
> @@ -171,6 +171,7 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, i=
nt max_size);
>   * @config_size: the size of the configuration space
>   * @config: the buffer of the configuration space
>   * @ops: the operation of VDUSE backend
> + * @shm_log_dir: directory to store the metadata file for reconnect
>   * @priv: private pointer
>   *
>   * Create VDUSE device.
> @@ -180,7 +181,8 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, i=
nt max_size);
>  VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
>                             uint32_t vendor_id, uint64_t features,
>                             uint16_t num_queues, uint32_t config_size,
> -                           char *config, const VduseOps *ops, void *priv=
);
> +                           char *config, const VduseOps *ops,
> +                           const char *shm_log_dir, void *priv);
> =20
>  /**
>   * vduse_dev_destroy:
> --=20
> 2.20.1
>=20

--qExG03e1dcXsrpYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIBLyEACgkQnKSrs4Gr
c8jrLAf9EuPcTerxlX213SL2VXOm7hTxN05uMsXUk73GG/Hi2h3fNZVccOeGDStJ
RCFMvYZPXbLlebzUnVeXIJXoMUKj8BpwzwbB1hFu7tSIuym0IRxoBHrSFFsIjKpG
yw483MrhLiZ3nUxucDJR8w6/dEmBTj8v+sjwzLFAk1L2XMX3VnV7Wdgm25ZDeNSk
coU/xRY96kVPouDLAWMEKnbHFyJp3Gg8zWSWB0hoGQ9ctVhnrvxbiy6OuMhzrAT/
KTB4uKESZpuobwdbhUfzuzigHCSpg7h8Fhh7HJRn4xpO3FYEB6OYJP+gEQTN+Wff
BPLBPBhpRGJj8zf0QB+zaLqFsr1P4g==
=oTq5
-----END PGP SIGNATURE-----

--qExG03e1dcXsrpYv--


