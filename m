Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C34AD53A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:54:41 +0100 (CET)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNCp-0002dF-UI
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHL2U-0006Ub-31
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:35:54 -0500
Received: from [2a00:1450:4864:20::633] (port=43729
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHL2L-0003jE-5K
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:35:47 -0500
Received: by mail-ej1-x633.google.com with SMTP id d10so49711898eje.10
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LQ5RBggx61FZMqdtuuPyAWr+5/LRekaqmd7uXU0KhM=;
 b=QkXUgeY925c66Ha0Fgqju6MpYi/XdlPjdwMlHmpPaKw28YlhDApCLo8uOWYFuUqCcO
 GcMJLc7Vg+wEg9wTtFNY/TG8w0FZtPotnuW1MLI37KJ7iRG7kAwjVTrV53OLRLpTcGIq
 2v6kd00hgZ1eKM9hrGamivHVjSzri4zS4HNuSbSBmnXzIVh7kFBf+QH8G/m3Ff4B2Ykr
 GqKgF7VL7jVOr1eZS1t+LTALSH3zj70+8Pc3moygVWHF41EsfUp8bL0S/19H7aYk4kp4
 WGa2E3mVdUdWwY+IbQ6s/TjRXrGHB2bLZNi752aDCRYPmF1giUyGiZMNF5P3PBAtVTDd
 r/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LQ5RBggx61FZMqdtuuPyAWr+5/LRekaqmd7uXU0KhM=;
 b=boS+HRNxKgcjXhzSxL/C9uBgyDuiO6lEmNvG579zVtbb1odR6mAOmS9/AJWvfjgk7A
 98oKM6AJgMt3OVdgxYxQ5iRGAo7SevZYdXURQKloBR46zxz/ZLm143C6h7Ub/ykjpEZ+
 ScC26FjaXJaewHqT+fa1KRZGbZCuheHfh6+GDkciYE4PRxSnLQZ3N1j8GAqk3MZv9AIw
 iWCT3toJLFrhuZAohVXJerBHMHy+2ATSgJTwXqqrWO4u4j4g0IrQygIJAadgbg6MyBU8
 xQNvZeYSoWKzLizAfH6q49leffRqkNd3ofgRsI3UBXXQOj/Z5iaWHJ+Ol5d4TRz8HvJr
 37YQ==
X-Gm-Message-State: AOAM532QzYkDs453tIVNcZvRoHKrW5opd6A3X3oPAujXz6Q/LAYQP44H
 vAs0F+VhXeQLpoZx6fs30cr9ooo923oQaLaCl3+p
X-Google-Smtp-Source: ABdhPJxQdHHnPfj5sEPJz604YinPPgRZkpGR1GhWuG/BolC5tI5ldZvmVtnQ3uEYvx4gpkRjXtI9HC4orWKUQXw4LF0=
X-Received: by 2002:a17:907:1b21:: with SMTP id
 mp33mr2589199ejc.374.1644305738276; 
 Mon, 07 Feb 2022 23:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-6-xieyongji@bytedance.com>
 <YgEvInUC/upRN3py@stefanha-x1.localdomain>
In-Reply-To: <YgEvInUC/upRN3py@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 8 Feb 2022 15:35:27 +0800
Message-ID: <CACycT3sMFpt92xtJ2xwRtLVfx3ZS-3jo0SPhfe4tZjOfb_j9Fw@mail.gmail.com>
Subject: Re: [PATCH 5/5] libvduse: Add support for reconnecting
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 10:39 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Jan 25, 2022 at 09:18:00PM +0800, Xie Yongji wrote:
> > To support reconnecting after restart or crash, VDUSE backend
> > might need to resubmit inflight I/Os. This stores the metadata
> > such as the index of inflight I/O's descriptors to a shm file so
> > that VDUSE backend can restore them during reconnecting.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  block/export/vduse-blk.c        |   4 +-
> >  subprojects/libvduse/libvduse.c | 254 +++++++++++++++++++++++++++++++-
> >  subprojects/libvduse/libvduse.h |   4 +-
> >  3 files changed, 254 insertions(+), 8 deletions(-)
> >
> > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > index 83845e9a9a..bc14fd798b 100644
> > --- a/block/export/vduse-blk.c
> > +++ b/block/export/vduse-blk.c
> > @@ -232,6 +232,8 @@ static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
> >
> >      aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
> >                         true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
> > +    /* Make sure we don't miss any kick afer reconnecting */
> > +    eventfd_write(vduse_queue_get_fd(vq), 1);
> >  }
> >
> >  static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
> > @@ -388,7 +390,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> >                                       features, num_queues,
> >                                       sizeof(struct virtio_blk_config),
> >                                       (char *)&config, &vduse_blk_ops,
> > -                                     vblk_exp);
> > +                                     g_get_tmp_dir(), vblk_exp);
> >      if (!vblk_exp->dev) {
> >          error_setg(errp, "failed to create vduse device");
> >          return -ENOMEM;
> > diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
> > index 7671864bca..ce2f6c7949 100644
> > --- a/subprojects/libvduse/libvduse.c
> > +++ b/subprojects/libvduse/libvduse.c
> > @@ -41,6 +41,8 @@
> >  #define VDUSE_VQ_ALIGN 4096
> >  #define MAX_IOVA_REGIONS 256
> >
> > +#define LOG_ALIGNMENT 64
> > +
> >  /* Round number down to multiple */
> >  #define ALIGN_DOWN(n, m) ((n) / (m) * (m))
> >
> > @@ -51,6 +53,31 @@
> >  #define unlikely(x)   __builtin_expect(!!(x), 0)
> >  #endif
> >
> > +typedef struct VduseDescStateSplit {
> > +    uint8_t inflight;
> > +    uint8_t padding[5];
> > +    uint16_t next;
> > +    uint64_t counter;
> > +} VduseDescStateSplit;
> > +
> > +typedef struct VduseVirtqLogInflight {
> > +    uint64_t features;
> > +    uint16_t version;
> > +    uint16_t desc_num;
> > +    uint16_t last_batch_head;
> > +    uint16_t used_idx;
> > +    VduseDescStateSplit desc[];
> > +} VduseVirtqLogInflight;
> > +
> > +typedef struct VduseVirtqLog {
> > +    VduseVirtqLogInflight inflight;
> > +} VduseVirtqLog;
> > +
> > +typedef struct VduseVirtqInflightDesc {
> > +    uint16_t index;
> > +    uint64_t counter;
> > +} VduseVirtqInflightDesc;
> > +
> >  typedef struct VduseRing {
> >      unsigned int num;
> >      uint64_t desc_addr;
> > @@ -73,6 +100,10 @@ struct VduseVirtq {
> >      bool ready;
> >      int fd;
> >      VduseDev *dev;
> > +    VduseVirtqInflightDesc *resubmit_list;
> > +    uint16_t resubmit_num;
> > +    uint64_t counter;
> > +    VduseVirtqLog *log;
> >  };
> >
> >  typedef struct VduseIovaRegion {
> > @@ -96,8 +127,67 @@ struct VduseDev {
> >      int fd;
> >      int ctrl_fd;
> >      void *priv;
> > +    char *shm_log_dir;
> > +    void *log;
> > +    bool reconnect;
> >  };
> >
> > +static inline size_t vduse_vq_log_size(uint16_t queue_size)
> > +{
> > +    return ALIGN_UP(sizeof(VduseDescStateSplit) * queue_size +
> > +                    sizeof(VduseVirtqLogInflight), LOG_ALIGNMENT);
> > +}
> > +
> > +static void *vduse_log_get(const char *dir, const char *name, size_t size)
> > +{
> > +    void *ptr = MAP_FAILED;
> > +    char *path;
> > +    int fd;
> > +
> > +    path = (char *)malloc(strlen(dir) + strlen(name) +
> > +                          strlen("/vduse-log-") + 1);
> > +    if (!path) {
> > +        return ptr;
> > +    }
> > +    sprintf(path, "%s/vduse-log-%s", dir, name);
>
> Please use g_strdup_printf() and g_autofree in QEMU code. In libvduse
> code it's okay to use malloc(3), but regular QEMU code should use glib.
>

But this code resides in libvduse currently.

> > +
> > +    fd = open(path, O_RDWR | O_CREAT, 0600);
> > +    if (fd == -1) {
> > +        goto out;
> > +    }
> > +
> > +    if (ftruncate(fd, size) == -1) {
> > +        goto out;
> > +    }
> > +
> > +    ptr = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> > +    if (ptr == MAP_FAILED) {
> > +        goto out;
> > +    }
> > +out:
> > +    if (fd > 0) {
> > +        close(fd);
> > +    }
> > +    free(path);
> > +
> > +    return ptr;
> > +}
> > +
> > +static void vduse_log_destroy(const char *dir, const char *name)
> > +{
> > +    char *path;
> > +
> > +    path = (char *)malloc(strlen(dir) + strlen(name) +
> > +                          strlen("/vduse-log-") + 1);
> > +    if (!path) {
> > +        return;
> > +    }
> > +    sprintf(path, "%s/vduse-log-%s", dir, name);
> > +
> > +    unlink(path);
> > +    free(path);
> > +}
> > +
> >  static inline bool has_feature(uint64_t features, unsigned int fbit)
> >  {
> >      assert(fbit < 64);
> > @@ -139,6 +229,98 @@ static int vduse_inject_irq(VduseDev *dev, int index)
> >      return ioctl(dev->fd, VDUSE_VQ_INJECT_IRQ, &index);
> >  }
> >
> > +static int inflight_desc_compare(const void *a, const void *b)
> > +{
> > +    VduseVirtqInflightDesc *desc0 = (VduseVirtqInflightDesc *)a,
> > +                           *desc1 = (VduseVirtqInflightDesc *)b;
> > +
> > +    if (desc1->counter > desc0->counter &&
> > +        (desc1->counter - desc0->counter) < VIRTQUEUE_MAX_SIZE * 2) {
> > +        return 1;
> > +    }
> > +
> > +    return -1;
> > +}
> > +
> > +static int vduse_queue_check_inflights(VduseVirtq *vq)
> > +{
> > +    int i = 0;
> > +    VduseDev *dev = vq->dev;
> > +
> > +    vq->used_idx = vq->vring.used->idx;
>
> Is this reading struct vring_used->idx without le16toh()?
>
> > +    vq->resubmit_num = 0;
> > +    vq->resubmit_list = NULL;
> > +    vq->counter = 0;
> > +
> > +    if (unlikely(vq->log->inflight.used_idx != vq->used_idx)) {
> > +        vq->log->inflight.desc[vq->log->inflight.last_batch_head].inflight = 0;
>
> I suggest validating vq->log->inflight fields before using them.
> last_batch_head must be less than the virtqueue size. Although the log
> file is somewhat trusted, there may still be ways to corrupt it or
> confuse the new process that loads it.
>

I can validate the last_batch_head field. But it's hard to validate
the inflight field, so we might still meet some issues if the file is
corrupted.

> > +
> > +        barrier();
> > +
> > +        vq->log->inflight.used_idx = vq->used_idx;
> > +    }
> > +
> > +    for (i = 0; i < vq->log->inflight.desc_num; i++) {
> > +        if (vq->log->inflight.desc[i].inflight == 1) {
> > +            vq->inuse++;
> > +        }
> > +    }
> > +
> > +    vq->shadow_avail_idx = vq->last_avail_idx = vq->inuse + vq->used_idx;
> > +
> > +    if (vq->inuse) {
> > +        vq->resubmit_list = calloc(vq->inuse, sizeof(VduseVirtqInflightDesc));
> > +        if (!vq->resubmit_list) {
> > +            return -1;
> > +        }
> > +
> > +        for (i = 0; i < vq->log->inflight.desc_num; i++) {
> > +            if (vq->log->inflight.desc[i].inflight) {
> > +                vq->resubmit_list[vq->resubmit_num].index = i;
> > +                vq->resubmit_list[vq->resubmit_num].counter =
> > +                                        vq->log->inflight.desc[i].counter;
> > +                vq->resubmit_num++;
> > +            }
> > +        }
> > +
> > +        if (vq->resubmit_num > 1) {
> > +            qsort(vq->resubmit_list, vq->resubmit_num,
> > +                  sizeof(VduseVirtqInflightDesc), inflight_desc_compare);
> > +        }
> > +        vq->counter = vq->resubmit_list[0].counter + 1;
> > +    }
> > +
> > +    vduse_inject_irq(dev, vq->index);
> > +
> > +    return 0;
> > +}
> > +
> > +static int vduse_queue_inflight_get(VduseVirtq *vq, int desc_idx)
> > +{
> > +    vq->log->inflight.desc[desc_idx].counter = vq->counter++;
> > +    vq->log->inflight.desc[desc_idx].inflight = 1;
> > +
> > +    return 0;
> > +}
> > +
> > +static int vduse_queue_inflight_pre_put(VduseVirtq *vq, int desc_idx)
> > +{
> > +    vq->log->inflight.last_batch_head = desc_idx;
> > +
> > +    return 0;
> > +}
> > +
> > +static int vduse_queue_inflight_post_put(VduseVirtq *vq, int desc_idx)
> > +{
> > +    vq->log->inflight.desc[desc_idx].inflight = 0;
> > +
> > +    barrier();
> > +
> > +    vq->log->inflight.used_idx = vq->used_idx;
> > +
> > +    return 0;
> > +}
> > +
> >  static void vduse_iova_remove_region(VduseDev *dev, uint64_t start,
> >                                       uint64_t last)
> >  {
> > @@ -578,11 +760,24 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
> >      unsigned int head;
> >      VduseVirtqElement *elem;
> >      VduseDev *dev = vq->dev;
> > +    int i;
> >
> >      if (unlikely(!vq->vring.avail)) {
> >          return NULL;
> >      }
> >
> > +    if (unlikely(vq->resubmit_list && vq->resubmit_num > 0)) {
> > +        i = (--vq->resubmit_num);
> > +        elem = vduse_queue_map_desc(vq, vq->resubmit_list[i].index, sz);
> > +
> > +        if (!vq->resubmit_num) {
> > +            free(vq->resubmit_list);
> > +            vq->resubmit_list = NULL;
> > +        }
>
> resubmit_list is only freed when vduse_queue_pop() is called often
> enough to empty the list. Please free the list when the vduse instance
> is destroyed too, just in case vduse_queue_pop() wasn't called often
> enough to free it.
>

Will do it.

> > +
> > +        return elem;
> > +    }
> > +
> >      if (vduse_queue_empty(vq)) {
> >          return NULL;
> >      }
> > @@ -610,6 +805,8 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
> >
> >      vq->inuse++;
> >
> > +    vduse_queue_inflight_get(vq, head);
> > +
> >      return elem;
> >  }
> >
> > @@ -667,7 +864,9 @@ void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
> >                        unsigned int len)
> >  {
> >      vduse_queue_fill(vq, elem, len, 0);
> > +    vduse_queue_inflight_pre_put(vq, elem->index);
> >      vduse_queue_flush(vq, 1);
> > +    vduse_queue_inflight_post_put(vq, elem->index);
> >  }
> >
> >  static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
> > @@ -740,12 +939,11 @@ static void vduse_queue_enable(VduseVirtq *vq)
> >      }
> >
> >      vq->fd = fd;
> > -    vq->shadow_avail_idx = vq->last_avail_idx = vq_info.split.avail_index;
> > -    vq->inuse = 0;
> > -    vq->used_idx = 0;
> >      vq->signalled_used_valid = false;
> >      vq->ready = true;
> >
> > +    vduse_queue_check_inflights(vq);
> > +
> >      dev->ops->enable_queue(dev, vq);
> >  }
> >
> > @@ -903,13 +1101,18 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size)
> >          return -errno;
> >      }
> >
> > +    if (dev->reconnect) {
> > +        vduse_queue_enable(vq);
> > +    }
> > +
> >      return 0;
> >  }
> >
> >  VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >                             uint32_t vendor_id, uint64_t features,
> >                             uint16_t num_queues, uint32_t config_size,
> > -                           char *config, const VduseOps *ops, void *priv)
> > +                           char *config, const VduseOps *ops,
> > +                           const char *shm_log_dir, void *priv)
> >  {
> >      VduseDev *dev;
> >      int i, ret, ctrl_fd, fd = -1;
> > @@ -918,6 +1121,8 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >      VduseVirtq *vqs = NULL;
> >      struct vduse_dev_config *dev_config = NULL;
> >      size_t size = offsetof(struct vduse_dev_config, config);
> > +    size_t log_size = num_queues * vduse_vq_log_size(VIRTQUEUE_MAX_SIZE);
> > +    void *log = NULL;
> >
> >      if (!name || strlen(name) > VDUSE_NAME_MAX || !config ||
> >          !config_size || !ops || !ops->enable_queue || !ops->disable_queue) {
> > @@ -932,6 +1137,15 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >      }
> >      memset(dev, 0, sizeof(VduseDev));
> >
> > +    if (shm_log_dir) {
> > +        dev->log = log = vduse_log_get(shm_log_dir, name, log_size);
> > +        if (!log) {
> > +            fprintf(stderr, "Failed to get vduse log\n");
> > +            goto err_ctrl;
> > +        }
> > +        dev->shm_log_dir = strdup(shm_log_dir);
> > +    }
> > +
> >      ctrl_fd = open("/dev/vduse/control", O_RDWR);
> >      if (ctrl_fd < 0) {
> >          fprintf(stderr, "Failed to open /dev/vduse/control: %s\n",
> > @@ -964,7 +1178,11 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >
> >      ret = ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
> >      free(dev_config);
> > -    if (ret < 0) {
> > +    if (!ret && log) {
> > +        memset(log, 0, log_size);
> > +    } else if (errno == EEXIST && log) {
> > +        dev->reconnect = true;
> > +    } else {
> >          fprintf(stderr, "Failed to create vduse dev %s: %s\n",
> >                  name, strerror(errno));
> >          goto err_dev;
> > @@ -978,6 +1196,12 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >          goto err;
> >      }
> >
> > +    if (dev->reconnect &&
> > +        ioctl(fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
> > +        fprintf(stderr, "Failed to get features: %s\n", strerror(errno));
> > +        goto err;
> > +    }
> > +
> >      vqs = calloc(sizeof(VduseVirtq), num_queues);
> >      if (!vqs) {
> >          fprintf(stderr, "Failed to allocate virtqueues\n");
> > @@ -988,6 +1212,12 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >          vqs[i].index = i;
> >          vqs[i].dev = dev;
> >          vqs[i].fd = -1;
> > +        if (log) {
> > +            vqs[i].log = log;
> > +            vqs[i].log->inflight.desc_num = VIRTQUEUE_MAX_SIZE;
> > +            log = (void *)((char *)log +
> > +                  vduse_vq_log_size(VIRTQUEUE_MAX_SIZE));
>
> The size of the log needs to be verified. The file is mmapped but
> there's no guarantee that the size matches num_queues *
> vduse_vq_log_size(VIRTQUEUE_MAX_SIZE).
>

We will call ftruncate() in vduse_log_get(). Is it enough?

Thanks,
Yongji

