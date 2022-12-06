Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90357644849
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2a96-0007kL-VZ; Tue, 06 Dec 2022 10:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2a91-0007k2-VV
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:46:10 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2a90-0004MT-0p
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:46:07 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id o127so19072050yba.5
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KzE6GlTkm9sO75wnFqHJR32glMFI83CzZvkJxYLbzFI=;
 b=NtORw2j81IEM6kK/bZU+A0uQ+XGvG4YGhs12oYTseZ14OfbglJlu2dC9Ny/n5+haFy
 rT1fpz5OC3HhwgVI2AmMAPi8kp7HTL8RZ3uo9myOxNam+lCj+QBAxdKqBiuIiUUpvczn
 c3J93YojaWlQEvGMVAVUOJpcQYQpr84X6ZBCk0ZYmqrWV3ngDI2ZTQCpu1DOq+Kt4TPO
 GYOrrQ6R/YIgn2GjyjgkeGD+8OIQ+M2qvtWmZKX+FqjfI/Oq4SqJIt+QOOiPqXblrosd
 NBDjkRzMSsOROoszGwWvDGOunE75X99deN0CIoYXkh8Dza22RqQABlpkGanJ9EUyWatz
 Ta9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KzE6GlTkm9sO75wnFqHJR32glMFI83CzZvkJxYLbzFI=;
 b=TxcQz7GlP8qLT54nEk0FDVrd0vNJK4KpHIu7TRdMWfeyaWU8gdL29tU3RQvTkow2uH
 I9C8Bt3I/U1Ed61WT6Fuq185mouhRGDdP3QBCrM3ZOdGE+ORfSpL/IZKGj8uM8zqp1mm
 jvXMdEjY32XS4iXZWpoUu2cddIoxe7Mj+Sca1SRubzkvc0tu3rxzOj0ysXnvBeapDbJe
 JyI6ANVVBR7X1xLAbvmz+QCSHb2XovMHKDxa225skU9B5RIP15UtzQaGdXPbL/hZvCOC
 lBZkokl5cT1vuo6TYvIIakb4Hn3pXCCtImCk2hrNWS9/SDO1092j2Hzj4KpuKnmkfYfE
 AbNQ==
X-Gm-Message-State: ANoB5plCfvPET2xpEquSrzQbhWX8DF/u2+ArM92031nupGxU1lJX+pzi
 jgtOekcmaEL65OYOzkP39i55HKFGC75Hw/SGQqo=
X-Google-Smtp-Source: AA0mqf5ABPSchY8q0b4I/U1Go6Py+RSzGxpFQnjm/lzGBDK69KdNUIzXroYdlFIola+WlM5OaaldvrvrFYqDtvEI5Wk=
X-Received: by 2002:a25:e746:0:b0:6f5:37ca:939a with SMTP id
 e67-20020a25e746000000b006f537ca939amr42663286ybh.207.1670341564506; Tue, 06
 Dec 2022 07:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-14-alex.bennee@linaro.org>
In-Reply-To: <20220321153037.3622127-14-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 6 Dec 2022 10:45:52 -0500
Message-ID: <CAJSP0QV8yOyteyTPKihY5pPSXxpKxHj+4cYDFfZsC+UendPj=w@mail.gmail.com>
Subject: Re: [PATCH v1 13/13] virtio/vhost-user: dynamically assign
 VhostUserHostNotifiers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mathieu.poirier@linaro.org, 
 mst@redhat.com, viresh.kumar@linaro.org, stefanha@redhat.com, 
 marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 21 Mar 2022 at 11:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> At a couple of hundred bytes per notifier allocating one for every
> potential queue is very wasteful as most devices only have a few
> queues. Instead of having this handled statically dynamically assign
> them and track in a GPtrArray.
>
> [AJB: it's hard to trigger the vhost notifiers code, I assume as it
> requires a KVM guest with appropriate backend]

I think vhost works with TCG. There is ioeventfd emulation in QEMU's
memory dispatch code, see memory_region_dispatch_write_eventfds().
There is irqfd emulation code for VIRTIO devices in
virtio_queue_set_guest_notifier_fd_handler().

Why do you say it's hard to trigger?

Stefan

>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/hw/virtio/vhost-user.h | 42 ++++++++++++++++-
>  hw/virtio/vhost-user.c         | 83 +++++++++++++++++++++++++++-------
>  hw/virtio/trace-events         |  1 +
>  3 files changed, 108 insertions(+), 18 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-use=
r.h
> index 6e0e8a71a3..c6e693cd3f 100644
> --- a/include/hw/virtio/vhost-user.h
> +++ b/include/hw/virtio/vhost-user.h
> @@ -11,21 +11,61 @@
>  #include "chardev/char-fe.h"
>  #include "hw/virtio/virtio.h"
>
> +/**
> + * VhostUserHostNotifier - notifier information for one queue
> + * @rcu: rcu_head for cleanup
> + * @mr: memory region of notifier
> + * @addr: current mapped address
> + * @unmap_addr: address to be un-mapped
> + * @idx: virtioqueue index
> + *
> + * The VhostUserHostNotifier entries are re-used. When an old mapping
> + * is to be released it is moved to @unmap_addr and @addr is replaced.
> + * Once the RCU process has completed the unmap @unmap_addr is
> + * cleared.
> + */
>  typedef struct VhostUserHostNotifier {
>      struct rcu_head rcu;
>      MemoryRegion mr;
>      void *addr;
>      void *unmap_addr;
> +    int idx;
>  } VhostUserHostNotifier;
>
> +/**
> + * VhostUserState - shared state for all vhost-user devices
> + * @chr: the character backend for the socket
> + * @notifiers: GPtrArray of @VhostUserHostnotifier
> + * @memory_slots:
> + */
>  typedef struct VhostUserState {
>      CharBackend *chr;
> -    VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
> +    GPtrArray *notifiers;
>      int memory_slots;
>      bool supports_config;
>  } VhostUserState;
>
> +/**
> + * vhost_user_init() - initialise shared vhost_user state
> + * @user: allocated area for storing shared state
> + * @chr: the chardev for the vhost socket
> + * @errp: error handle
> + *
> + * User can either directly g_new() space for the state or embed
> + * VhostUserState in their larger device structure and just point to
> + * it.
> + *
> + * Return: true on success, false on error while setting errp.
> + */
>  bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **err=
p);
> +
> +/**
> + * vhost_user_cleanup() - cleanup state
> + * @user: ptr to use state
> + *
> + * Cleans up shared state and notifiers, callee is responsible for
> + * freeing the @VhostUserState memory itself.
> + */
>  void vhost_user_cleanup(VhostUserState *user);
>
>  #endif
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 6ce082861b..4c0423de55 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1174,14 +1174,16 @@ static void vhost_user_host_notifier_free(VhostUs=
erHostNotifier *n)
>      n->unmap_addr =3D NULL;
>  }
>
> -static void vhost_user_host_notifier_remove(VhostUserState *user,
> -                                            VirtIODevice *vdev, int queu=
e_idx)
> +/*
> + * clean-up function for notifier, will finally free the structure
> + * under rcu.
> + */
> +static void vhost_user_host_notifier_remove(VhostUserHostNotifier *n,
> +                                            VirtIODevice *vdev)
>  {
> -    VhostUserHostNotifier *n =3D &user->notifier[queue_idx];
> -
>      if (n->addr) {
>          if (vdev) {
> -            virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, f=
alse);
> +            virtio_queue_set_host_notifier_mr(vdev, n->idx, &n->mr, fals=
e);
>          }
>          assert(!n->unmap_addr);
>          n->unmap_addr =3D n->addr;
> @@ -1225,6 +1227,15 @@ static int vhost_user_set_vring_enable(struct vhos=
t_dev *dev, int enable)
>      return 0;
>  }
>
> +static VhostUserHostNotifier *fetch_notifier(VhostUserState *u,
> +                                             int idx)
> +{
> +    if (idx >=3D u->notifiers->len) {
> +        return NULL;
> +    }
> +    return g_ptr_array_index(u->notifiers, idx);
> +}
> +
>  static int vhost_user_get_vring_base(struct vhost_dev *dev,
>                                       struct vhost_vring_state *ring)
>  {
> @@ -1237,7 +1248,10 @@ static int vhost_user_get_vring_base(struct vhost_=
dev *dev,
>      };
>      struct vhost_user *u =3D dev->opaque;
>
> -    vhost_user_host_notifier_remove(u->user, dev->vdev, ring->index);
> +    VhostUserHostNotifier *n =3D fetch_notifier(u->user, ring->index);
> +    if (n) {
> +        vhost_user_host_notifier_remove(n, dev->vdev);
> +    }
>
>      ret =3D vhost_user_write(dev, &msg, NULL, 0);
>      if (ret < 0) {
> @@ -1502,6 +1516,29 @@ static int vhost_user_slave_handle_config_change(s=
truct vhost_dev *dev)
>      return dev->config_ops->vhost_dev_config_notifier(dev);
>  }
>
> +/*
> + * Fetch or create the notifier for a given idx. Newly created
> + * notifiers are added to the pointer array that tracks them.
> + */
> +static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u=
,
> +                                                       int idx)
> +{
> +    VhostUserHostNotifier *n =3D NULL;
> +    if (idx >=3D u->notifiers->len) {
> +        g_ptr_array_set_size(u->notifiers, idx);
> +    }
> +
> +    n =3D g_ptr_array_index(u->notifiers, idx);
> +    if (!n) {
> +        n =3D g_new0(VhostUserHostNotifier, 1);
> +        n->idx =3D idx;
> +        g_ptr_array_insert(u->notifiers, idx, n);
> +        trace_vhost_user_create_notifier(idx, n);
> +    }
> +
> +    return n;
> +}
> +
>  static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev =
*dev,
>                                                         VhostUserVringAre=
a *area,
>                                                         int fd)
> @@ -1521,9 +1558,12 @@ static int vhost_user_slave_handle_vring_host_noti=
fier(struct vhost_dev *dev,
>          return -EINVAL;
>      }
>
> -    n =3D &user->notifier[queue_idx];
> -
> -    vhost_user_host_notifier_remove(user, vdev, queue_idx);
> +    /*
> +     * Fetch notifier and invalidate any old data before setting up
> +     * new mapped address.
> +     */
> +    n =3D fetch_or_create_notifier(user, queue_idx);
> +    vhost_user_host_notifier_remove(n, vdev);
>
>      if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
>          return 0;
> @@ -2526,6 +2566,20 @@ static int vhost_user_set_inflight_fd(struct vhost=
_dev *dev,
>      return vhost_user_write(dev, &msg, &inflight->fd, 1);
>  }
>
> +static void vhost_user_state_destroy(gpointer data)
> +{
> +    VhostUserHostNotifier *n =3D (VhostUserHostNotifier *) data;
> +    if (n) {
> +        vhost_user_host_notifier_remove(n, NULL);
> +        object_unparent(OBJECT(&n->mr));
> +        /*
> +         * We can't free until vhost_user_host_notifier_remove has
> +         * done it's thing so schedule the free with RCU.
> +         */
> +        g_free_rcu(n, rcu);
> +    }
> +}
> +
>  bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **err=
p)
>  {
>      if (user->chr) {
> @@ -2534,23 +2588,18 @@ bool vhost_user_init(VhostUserState *user, CharBa=
ckend *chr, Error **errp)
>      }
>      user->chr =3D chr;
>      user->memory_slots =3D 0;
> +    user->notifiers =3D g_ptr_array_new_full(VIRTIO_QUEUE_MAX / 4,
> +                                           &vhost_user_state_destroy);
>      return true;
>  }
>
>  void vhost_user_cleanup(VhostUserState *user)
>  {
> -    int i;
> -    VhostUserHostNotifier *n;
> -
>      if (!user->chr) {
>          return;
>      }
>      memory_region_transaction_begin();
> -    for (i =3D 0; i < VIRTIO_QUEUE_MAX; i++) {
> -        n =3D &user->notifier[i];
> -        vhost_user_host_notifier_remove(user, NULL, i);
> -        object_unparent(OBJECT(&n->mr));
> -    }
> +    user->notifiers =3D (GPtrArray *) g_ptr_array_free(user->notifiers, =
true);
>      memory_region_transaction_commit();
>      user->chr =3D NULL;
>  }
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index fd213e2a27..b40392a593 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -23,6 +23,7 @@ vhost_user_postcopy_waker_found(uint64_t client_addr) "=
0x%"PRIx64
>  vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%=
s + 0x%"PRIx64
>  vhost_user_read(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
>  vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32"=
"
> +vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
>
>  # vhost-vdpa.c
>  vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova,=
 uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d=
 msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64"=
 perm: 0x%"PRIx8" type: %"PRIu8
> --
> 2.30.2
>
>

