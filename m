Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A1457912
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:48:42 +0100 (CET)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCgT-0006zQ-5s
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb9-0006jV-Ng
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb6-0002gs-NH
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMVcDRXKtkD3NUB6IvhJT0hWFuHmkfe97MMygzA1bw4=;
 b=XSU2lwWLwSbrcXdo60icdu2myKVtZ4kTLXM0YwO5yhPY4CrY/HhjzsOIh361Fss2U0QCSQ
 8/GCzFPYPEUaoVrnUMDy1JX8OQdxwSiWsONAWy4D/6zkpsW1U+NzAAx+egme05lyE98QfU
 Zc4TLoZVRjD032QR8Z8Z4cOrhng8D2k=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-xoCtz94GMuW99OVFt5UBlw-1; Fri, 19 Nov 2021 17:43:05 -0500
X-MC-Unique: xoCtz94GMuW99OVFt5UBlw-1
Received: by mail-oi1-f198.google.com with SMTP id
 s8-20020aca5e08000000b002b3dd17652cso7746681oib.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s6VSVA9MbVtF8iTRJCTkZmU8pAnxwUNpUSchzMs20FA=;
 b=h/49UD9IGaURdGpgMCbDgd7Oal9LXYQBahOUmWPHy+QdKbd37SeyPO2miNbdXhehIO
 KizxCIrVLfhDGXKR2TQwCOhZzpK1TUcjbwaeV5ggURHUrFDP9OVvt9HbD1oa5rfz5375
 lHM47TQkbT4cBDiYb978xmsCz9H5PARqvm+R/gCM3D46NY4oGr4DkFZocdwq7KU7amo1
 YYHJnYLQZSVuHmN/Z/rwcSqI5tYau4A5oq3doq8TwLIkTq34kA1tMPpCUlCjIKnNPmbl
 tWT8kAuT73Gaj8ys0fyx+GDCrk4ZQ/nIKYVD6LOYWnGlS1jwNvbE3ecuZCzWuxiGmnhB
 9DcQ==
X-Gm-Message-State: AOAM531rPxFMwWLtmCNQWs6PAvovLtJOI80/Yndvt8jRAzmtvwnEQes3
 EfWhwKin+kaVAHHtqpJ4m1pCGH7idGTN8yE292j2Dti15uCOiyMVpLviP5YXnnhnZKWGiJYF3Mf
 WQceE6pTP80wzu+M=
X-Received: by 2002:a05:6808:1a90:: with SMTP id
 bm16mr2998854oib.133.1637361784520; 
 Fri, 19 Nov 2021 14:43:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw15WB2zUKIa2LZvZhLxI/Bf1jvrdZCapWtrsLdrgOVQTFiMXxQQ8XthcHigezUrqe2wP1Ncg==
X-Received: by 2002:a05:6808:1a90:: with SMTP id
 bm16mr2998813oib.133.1637361784023; 
 Fri, 19 Nov 2021 14:43:04 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:03 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:26 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 08/19] vfio-user: define socket receive functions
Message-ID: <20211119154226.0750c3d6.alex.williamson@redhat.com>
In-Reply-To: <bddfd99bea5d80a7bc4bb57290256b530aabb896.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <bddfd99bea5d80a7bc4bb57290256b530aabb896.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Nov 2021 16:46:36 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Add infrastructure needed to receive incoming messages
>=20
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/pci.h           |   2 +-
>  hw/vfio/user-protocol.h |  62 +++++++++
>  hw/vfio/user.h          |   9 +-
>  hw/vfio/pci.c           |  12 +-
>  hw/vfio/user.c          | 326 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS             |   1 +
>  6 files changed, 409 insertions(+), 3 deletions(-)
>  create mode 100644 hw/vfio/user-protocol.h
>=20
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 08ac647..ec9f345 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -193,7 +193,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_US=
ER_PCI)
>  struct VFIOUserPCIDevice {
>      VFIOPCIDevice device;
>      char *sock_name;
> -    bool secure_dma; /* disable shared mem for DMA */

Don't introduce it into the series to start with, confusing to review.

> +    bool send_queued;   /* all sends are queued */
>  };
> =20
>  /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot matc=
h hw */
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> new file mode 100644
> index 0000000..27062cb
> --- /dev/null
> +++ b/hw/vfio/user-protocol.h
> @@ -0,0 +1,62 @@
> +#ifndef VFIO_USER_PROTOCOL_H
> +#define VFIO_USER_PROTOCOL_H
> +
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright =C2=A9 2018, 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Each message has a standard header that describes the command
> + * being sent, which is almost always a VFIO ioctl().
> + *
> + * The header may be followed by command-specific data, such as the
> + * region and offset info for read and write commands.
> + */
> +
> +typedef struct {
> +    uint16_t id;
> +    uint16_t command;
> +    uint32_t size;
> +    uint32_t flags;
> +    uint32_t error_reply;
> +} VFIOUserHdr;
> +

A comment referencing the doc would probably be a good idea about here.

> +/* VFIOUserHdr commands */
> +enum vfio_user_command {
> +    VFIO_USER_VERSION                   =3D 1,
> +    VFIO_USER_DMA_MAP                   =3D 2,
> +    VFIO_USER_DMA_UNMAP                 =3D 3,
> +    VFIO_USER_DEVICE_GET_INFO           =3D 4,
> +    VFIO_USER_DEVICE_GET_REGION_INFO    =3D 5,
> +    VFIO_USER_DEVICE_GET_REGION_IO_FDS  =3D 6,
> +    VFIO_USER_DEVICE_GET_IRQ_INFO       =3D 7,
> +    VFIO_USER_DEVICE_SET_IRQS           =3D 8,
> +    VFIO_USER_REGION_READ               =3D 9,
> +    VFIO_USER_REGION_WRITE              =3D 10,
> +    VFIO_USER_DMA_READ                  =3D 11,
> +    VFIO_USER_DMA_WRITE                 =3D 12,
> +    VFIO_USER_DEVICE_RESET              =3D 13,
> +    VFIO_USER_DIRTY_PAGES               =3D 14,
> +    VFIO_USER_MAX,
> +};
> +
> +/* VFIOUserHdr flags */
> +#define VFIO_USER_REQUEST       0x0
> +#define VFIO_USER_REPLY         0x1
> +#define VFIO_USER_TYPE          0xF
> +
> +#define VFIO_USER_NO_REPLY      0x10
> +#define VFIO_USER_ERROR         0x20
> +
> +
> +#define VFIO_USER_DEF_MAX_FDS   8
> +#define VFIO_USER_MAX_MAX_FDS   16
> +
> +#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
> +#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)

These are essentially magic numbers, some discussion of how these
limits are derived would be useful for future contributors, but also
only DEV_MAX_XFER is used in this patch and it's confusing why the
macro isn't used directly.  Most of the logic surrounding these is
added in the next patch, so it doesn't really make sense to add them
here.  Thanks,

Alex

> +
> +
> +#endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 301ef6a..bd3717f 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -11,6 +11,8 @@
>   *
>   */
> =20
> +#include "user-protocol.h"
> +
>  typedef struct {
>      int send_fds;
>      int recv_fds;
> @@ -27,6 +29,7 @@ enum msg_type {
> =20
>  typedef struct VFIOUserMsg {
>      QTAILQ_ENTRY(VFIOUserMsg) next;
> +    VFIOUserHdr *hdr;
>      VFIOUserFDs *fds;
>      uint32_t rsize;
>      uint32_t id;
> @@ -70,9 +73,13 @@ typedef struct VFIOProxy {
>  } VFIOProxy;
> =20
>  /* VFIOProxy flags */
> -#define VFIO_PROXY_CLIENT       0x1
> +#define VFIO_PROXY_CLIENT        0x1
> +#define VFIO_PROXY_FORCE_QUEUED  0x4
> =20
>  VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
>  void vfio_user_disconnect(VFIOProxy *proxy);
> +void vfio_user_set_handler(VFIODevice *vbasedev,
> +                           void (*handler)(void *opaque, VFIOUserMsg *ms=
g),
> +                           void *reqarg);
> =20
>  #endif /* VFIO_USER_H */
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ebfabb1..db45179 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3448,6 +3448,11 @@ struct VFIOValidOps vfio_pci_valid_ops =3D {
>   * vfio-user routines.
>   */
> =20
> +static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
> +{
> +
> +}
> +
>  /*
>   * Emulated devices don't use host hot reset
>   */
> @@ -3501,6 +3506,11 @@ static void vfio_user_pci_realize(PCIDevice *pdev,=
 Error **errp)
>          return;
>      }
>      vbasedev->proxy =3D proxy;
> +    vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
> +
> +    if (udev->send_queued) {
> +        proxy->flags |=3D VFIO_PROXY_FORCE_QUEUED;
> +    }
> =20
>      vbasedev->name =3D g_strdup_printf("VFIO user <%s>", udev->sock_name=
);
>      vbasedev->dev =3D DEVICE(vdev);
> @@ -3524,7 +3534,7 @@ static void vfio_user_instance_finalize(Object *obj=
)
> =20
>  static Property vfio_user_pci_dev_properties[] =3D {
>      DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
> -    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false)=
,
> +    DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, fa=
lse),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 92d4e03..f662ae0 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -25,9 +25,27 @@
>  #include "sysemu/iothread.h"
>  #include "user.h"
> =20
> +static uint64_t max_xfer_size =3D VFIO_USER_DEF_MAX_XFER;
>  static IOThread *vfio_user_iothread;
> +
>  static void vfio_user_shutdown(VFIOProxy *proxy);
> +static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                     VFIOUserFDs *fds);
> +static VFIOUserFDs *vfio_user_getfds(int numfds);
> +static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
> +
> +static void vfio_user_recv(void *opaque);
> +static int vfio_user_recv_one(VFIOProxy *proxy);
> +static void vfio_user_cb(void *opaque);
> =20
> +static void vfio_user_request(void *opaque);
> +
> +
> +static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
> +{
> +    hdr->flags |=3D VFIO_USER_ERROR;
> +    hdr->error_reply =3D err;
> +}
> =20
>  /*
>   * Functions called by main, CPU, or iothread threads
> @@ -39,11 +57,259 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
>      qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, N=
ULL);
>  }
> =20
> +static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                     VFIOUserFDs *fds)
> +{
> +    VFIOUserMsg *msg;
> +
> +    msg =3D QTAILQ_FIRST(&proxy->free);
> +    if (msg !=3D NULL) {
> +        QTAILQ_REMOVE(&proxy->free, msg, next);
> +    } else {
> +        msg =3D g_malloc0(sizeof(*msg));
> +        qemu_cond_init(&msg->cv);
> +    }
> +
> +    msg->hdr =3D hdr;
> +    msg->fds =3D fds;
> +    return msg;
> +}
> +
> +/*
> + * Recycle a message list entry to the free list.
> + */
> +static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg)
> +{
> +    if (msg->type =3D=3D VFIO_MSG_NONE) {
> +        error_printf("vfio_user_recycle - freeing free msg\n");
> +        return;
> +    }
> +
> +    /* free msg buffer if no one is waiting to consume the reply */
> +    if (msg->type =3D=3D VFIO_MSG_NOWAIT || msg->type =3D=3D VFIO_MSG_AS=
YNC) {
> +        g_free(msg->hdr);
> +    }
> +
> +    msg->type =3D VFIO_MSG_NONE;
> +    msg->hdr =3D NULL;
> +    msg->fds =3D NULL;
> +    msg->complete =3D false;
> +    QTAILQ_INSERT_HEAD(&proxy->free, msg, next);
> +}
> +
> +static VFIOUserFDs *vfio_user_getfds(int numfds)
> +{
> +    VFIOUserFDs *fds =3D g_malloc0(sizeof(*fds) + (numfds * sizeof(int))=
);
> +
> +    fds->fds =3D (int *)((char *)fds + sizeof(*fds));
> +
> +    return fds;
> +}
> =20
>  /*
>   * Functions only called by iothread
>   */
> =20
> +static void vfio_user_recv(void *opaque)
> +{
> +    VFIOProxy *proxy =3D opaque;
> +
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    if (proxy->state =3D=3D VFIO_PROXY_CONNECTED) {
> +        while (vfio_user_recv_one(proxy) =3D=3D 0) {
> +            ;
> +        }
> +    }
> +}
> +
> +/*
> + * Receive and process one incoming message.
> + *
> + * For replies, find matching outgoing request and wake any waiters.
> + * For requests, queue in incoming list and run request BH.
> + */
> +static int vfio_user_recv_one(VFIOProxy *proxy)
> +{
> +    VFIOUserMsg *msg =3D NULL;
> +    g_autofree int *fdp =3D NULL;
> +    VFIOUserFDs *reqfds;
> +    VFIOUserHdr hdr;
> +    struct iovec iov =3D {
> +        .iov_base =3D &hdr,
> +        .iov_len =3D sizeof(hdr),
> +    };
> +    bool isreply =3D false;
> +    int i, ret;
> +    size_t msgleft, numfds =3D 0;
> +    char *data =3D NULL;
> +    char *buf =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    /*
> +     * Read header
> +     */
> +    ret =3D qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
> +                                 &local_err);
> +    if (ret =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> +        return ret;
> +    }
> +    if (ret <=3D 0) {
> +        /* read error or other side closed connection */
> +        if (ret =3D=3D 0) {
> +            error_setg(&local_err, "vfio_user_recv server closed socket"=
);
> +        } else {
> +            error_prepend(&local_err, "vfio_user_recv");
> +        }
> +        goto fatal;
> +    }
> +    if (ret < sizeof(msg)) {
> +        error_setg(&local_err, "vfio_user_recv short read of header");
> +        goto fatal;
> +    }
> +
> +    /*
> +     * Validate header
> +     */
> +    if (hdr.size < sizeof(VFIOUserHdr)) {
> +        error_setg(&local_err, "vfio_user_recv bad header size");
> +        goto fatal;
> +    }
> +    switch (hdr.flags & VFIO_USER_TYPE) {
> +    case VFIO_USER_REQUEST:
> +        isreply =3D false;
> +        break;
> +    case VFIO_USER_REPLY:
> +        isreply =3D true;
> +        break;
> +    default:
> +        error_setg(&local_err, "vfio_user_recv unknown message type");
> +        goto fatal;
> +    }
> +
> +    /*
> +     * For replies, find the matching pending request.
> +     * For requests, reap incoming FDs.
> +     */
> +    if (isreply) {
> +        QTAILQ_FOREACH(msg, &proxy->pending, next) {
> +            if (hdr.id =3D=3D msg->id) {
> +                break;
> +            }
> +        }
> +        if (msg =3D=3D NULL) {
> +            error_setg(&local_err, "vfio_user_recv unexpected reply");
> +            goto err;
> +        }
> +        QTAILQ_REMOVE(&proxy->pending, msg, next);
> +
> +        /*
> +         * Process any received FDs
> +         */
> +        if (numfds !=3D 0) {
> +            if (msg->fds =3D=3D NULL || msg->fds->recv_fds < numfds) {
> +                error_setg(&local_err, "vfio_user_recv unexpected FDs");
> +                goto err;
> +            }
> +            msg->fds->recv_fds =3D numfds;
> +            memcpy(msg->fds->fds, fdp, numfds * sizeof(int));
> +        }
> +    } else {
> +        if (numfds !=3D 0) {
> +            reqfds =3D vfio_user_getfds(numfds);
> +            memcpy(reqfds->fds, fdp, numfds * sizeof(int));
> +        } else {
> +            reqfds =3D NULL;
> +        }
> +    }
> +
> +    /*
> +     * Put the whole message into a single buffer.
> +     */
> +    if (isreply) {
> +        if (hdr.size > msg->rsize) {
> +            error_setg(&local_err,
> +                       "vfio_user_recv reply larger than recv buffer");
> +            goto err;
> +        }
> +        *msg->hdr =3D hdr;
> +        data =3D (char *)msg->hdr + sizeof(hdr);
> +    } else {
> +        if (hdr.size > max_xfer_size) {
> +            error_setg(&local_err, "vfio_user_recv request larger than m=
ax");
> +            goto err;
> +        }
> +        buf =3D g_malloc0(hdr.size);
> +        memcpy(buf, &hdr, sizeof(hdr));
> +        data =3D buf + sizeof(hdr);
> +        msg =3D vfio_user_getmsg(proxy, (VFIOUserHdr *)buf, reqfds);
> +        msg->type =3D VFIO_MSG_REQ;
> +    }
> +
> +    msgleft =3D hdr.size - sizeof(hdr);
> +    if (msgleft !=3D 0) {
> +        ret =3D qio_channel_read(proxy->ioc, data, msgleft, &local_err);
> +        /* error or would block */
> +        if (ret < 0) {
> +            goto fatal;
> +        }
> +        if (ret !=3D msgleft) {
> +            error_setg(&local_err, "vfio_user_recv short read of msg bod=
y");
> +            goto fatal;
> +        }
> +    }
> +
> +    /*
> +     * Replies signal a waiter, if none just check for errors
> +     * and free the message buffer.
> +     *
> +     * Requests get queued for the BH.
> +     */
> +    if (isreply) {
> +        msg->complete =3D true;
> +        if (msg->type =3D=3D VFIO_MSG_WAIT) {
> +            qemu_cond_signal(&msg->cv);
> +        } else {
> +            if (hdr.flags & VFIO_USER_ERROR) {
> +                error_printf("vfio_user_rcv error reply on async request=
 ");
> +                error_printf("command %x error %s\n", hdr.command,
> +                             strerror(hdr.error_reply));
> +            }
> +            /* youngest nowait msg has been ack'd */
> +            if (proxy->last_nowait =3D=3D msg) {
> +                proxy->last_nowait =3D NULL;
> +            }
> +            vfio_user_recycle(proxy, msg);
> +        }
> +    } else {
> +        QTAILQ_INSERT_TAIL(&proxy->incoming, msg, next);
> +        qemu_bh_schedule(proxy->req_bh);
> +    }
> +    return 0;
> +
> +    /*
> +     * fatal means the other side closed or we don't trust the stream
> +     * err means this message is corrupt
> +     */
> +fatal:
> +    vfio_user_shutdown(proxy);
> +    proxy->state =3D VFIO_PROXY_ERROR;
> +
> +err:
> +    for (i =3D 0; i < numfds; i++) {
> +        close(fdp[i]);
> +    }
> +    if (isreply && msg !=3D NULL) {
> +        /* force an error to keep sending thread from hanging */
> +        vfio_user_set_error(msg->hdr, EINVAL);
> +        msg->complete =3D true;
> +        qemu_cond_signal(&msg->cv);
> +    }
> +    error_report_err(local_err);
> +    return -1;
> +}
> +
>  static void vfio_user_cb(void *opaque)
>  {
>      VFIOProxy *proxy =3D opaque;
> @@ -59,6 +325,51 @@ static void vfio_user_cb(void *opaque)
>   * Functions called by main or CPU threads
>   */
> =20
> +/*
> + * Process incoming requests.
> + *
> + * The bus-specific callback has the form:
> + *    request(opaque, msg)
> + * where 'opaque' was specified in vfio_user_set_handler
> + * and 'msg' is the inbound message.
> + *
> + * The callback is responsible for disposing of the message buffer,
> + * usually by re-using it when calling vfio_send_reply or vfio_send_erro=
r,
> + * both of which free their message buffer when the reply is sent.
> + *
> + * If the callback uses a new buffer, it needs to free the old one.
> + */
> +static void vfio_user_request(void *opaque)
> +{
> +    VFIOProxy *proxy =3D opaque;
> +    VFIOUserMsgQ new, free;
> +    VFIOUserMsg *msg;
> +
> +    /* reap all incoming */
> +    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
> +        new =3D proxy->incoming;
> +        QTAILQ_INIT(&proxy->incoming);
> +    }
> +    QTAILQ_INIT(&free);
> +
> +    /* process list */
> +    while (!QTAILQ_EMPTY(&new)) {
> +        msg =3D QTAILQ_FIRST(&new);
> +        QTAILQ_REMOVE(&new, msg, next);
> +        proxy->request(proxy->req_arg, msg);
> +        QTAILQ_INSERT_HEAD(&free, msg, next);
> +    }
> +
> +    /* free list */
> +    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
> +        while (!QTAILQ_EMPTY(&free)) {
> +            msg =3D QTAILQ_FIRST(&free);
> +            QTAILQ_REMOVE(&free, msg, next);
> +            vfio_user_recycle(proxy, msg);
> +        }
> +    }
> +}
> +
>  static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =3D
>      QLIST_HEAD_INITIALIZER(vfio_user_sockets);
> =20
> @@ -97,6 +408,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, =
Error **errp)
>      }
> =20
>      proxy->ctx =3D iothread_get_aio_context(vfio_user_iothread);
> +    proxy->req_bh =3D qemu_bh_new(vfio_user_request, proxy);
> =20
>      QTAILQ_INIT(&proxy->outgoing);
>      QTAILQ_INIT(&proxy->incoming);
> @@ -107,6 +419,18 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr=
, Error **errp)
>      return proxy;
>  }
> =20
> +void vfio_user_set_handler(VFIODevice *vbasedev,
> +                           void (*handler)(void *opaque, VFIOUserMsg *ms=
g),
> +                           void *req_arg)
> +{
> +    VFIOProxy *proxy =3D vbasedev->proxy;
> +
> +    proxy->request =3D handler;
> +    proxy->req_arg =3D req_arg;
> +    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
> +                                   vfio_user_recv, NULL, proxy);
> +}
> +
>  void vfio_user_disconnect(VFIOProxy *proxy)
>  {
>      VFIOUserMsg *r1, *r2;
> @@ -122,6 +446,8 @@ void vfio_user_disconnect(VFIOProxy *proxy)
>      }
>      object_unref(OBJECT(proxy->ioc));
>      proxy->ioc =3D NULL;
> +    qemu_bh_delete(proxy->req_bh);
> +    proxy->req_bh =3D NULL;
> =20
>      proxy->state =3D VFIO_PROXY_CLOSING;
>      QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f429bab..52d37dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1888,6 +1888,7 @@ S: Supported
>  F: docs/devel/vfio-user.rst
>  F: hw/vfio/user.c
>  F: hw/vfio/user.h
> +F: hw/vfio/user-protocol.h
> =20
>  vhost
>  M: Michael S. Tsirkin <mst@redhat.com>


