Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BAA3D7B19
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:35:58 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Q3h-0004vO-6R
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m8Q2Q-0003hu-6F
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m8Q2M-0002hr-Uz
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627403670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGaqAFflMX2iEpykHy40V6oWVWhNpoSfbZe3N7rPgog=;
 b=Rytffx4LysES8zMi8bkDP79cu01KaD7rE5VI+pAx/n1qsJmzAgMP5JYKUV/1thvo1Xr8qQ
 IS/0hJk+28Eyyu1K4RF2/ru92QitIull6GJ7dl7rpD1rPrrkZlUWUI4EZGRBncOsIm5C28
 abvysmRtgY7yhZVHHyi8tVIvVQ5mEso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-dyUQLj-CNrCk3N_3y5W7bA-1; Tue, 27 Jul 2021 12:34:27 -0400
X-MC-Unique: dyUQLj-CNrCk3N_3y5W7bA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E97D9193F562;
 Tue, 27 Jul 2021 16:34:25 +0000 (UTC)
Received: from localhost (ovpn-113-165.ams2.redhat.com [10.36.113.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 580A060C0F;
 Tue, 27 Jul 2021 16:34:25 +0000 (UTC)
Date: Tue, 27 Jul 2021 17:34:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC 03/19] vfio-user: define VFIO Proxy and communication
 functions
Message-ID: <YQA1kC1P5k2vRd4O@stefanha-x1.localdomain>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cd9d5d6214d957db61120d9c3cbdc99e799a3baa.1626675354.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cd9d5d6214d957db61120d9c3cbdc99e799a3baa.1626675354.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="usF7GHVF1WrepzYr"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--usF7GHVF1WrepzYr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 18, 2021 at 11:27:42PM -0700, Elena Ufimtseva wrote:
> From: John G Johnson <john.g.johnson@oracle.com>
>=20
> Add user.c and user.h files for vfio-user with the basic
> send and receive functions.
>=20
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/user.h                | 120 ++++++++++++++
>  include/hw/vfio/vfio-common.h |   2 +
>  hw/vfio/user.c                | 286 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |   4 +
>  hw/vfio/meson.build           |   1 +
>  5 files changed, 413 insertions(+)
>  create mode 100644 hw/vfio/user.h
>  create mode 100644 hw/vfio/user.c

The multi-threading, coroutine, and blocking I/O requirements of
vfio_user_recv() and vfio_user_send_reply() are unclear to me. Please
document them so it's clear what environment they can be called from. I
guess they are not called from coroutines and proxy->ioc is a blocking
IOChannel?

>=20
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> new file mode 100644
> index 0000000000..cdbc074579
> --- /dev/null
> +++ b/hw/vfio/user.h
> @@ -0,0 +1,120 @@
> +#ifndef VFIO_USER_H
> +#define VFIO_USER_H
> +
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright =A9 2018, 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Each message has a standard header that describes the command
> + * being sent, which is almost always a VFIO ioctl().
> + *
> + * The header may be followed by command-specfic data, such as the
> + * region and offset info for read and write commands.
> + */
> +
> +/* commands */
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
> +/* flags */
> +#define VFIO_USER_REQUEST       0x0
> +#define VFIO_USER_REPLY         0x1
> +#define VFIO_USER_TYPE          0xF
> +
> +#define VFIO_USER_NO_REPLY      0x10
> +#define VFIO_USER_ERROR         0x20
> +
> +typedef struct vfio_user_hdr {
> +    uint16_t id;
> +    uint16_t command;
> +    uint32_t size;
> +    uint32_t flags;
> +    uint32_t error_reply;
> +} vfio_user_hdr_t;

Please use QEMU coding style in QEMU code (i.e. not shared with Linux or
external libraries):

  typedef struct {
      ...
  } VfioUserHdr;

You can also specify the struct VfioUserHdr tag if you want but it's
only necessary to reference the struct before the end of the typedef
definition.

https://qemu-project.gitlab.io/qemu/devel/style.html

> +
> +/*
> + * VFIO_USER_VERSION
> + */
> +#define VFIO_USER_MAJOR_VER     0
> +#define VFIO_USER_MINOR_VER     0
> +
> +struct vfio_user_version {
> +    vfio_user_hdr_t hdr;
> +    uint16_t major;
> +    uint16_t minor;
> +    char capabilities[];
> +};
> +
> +#define VFIO_USER_DEF_MAX_FDS   8
> +#define VFIO_USER_MAX_MAX_FDS   16
> +
> +#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
> +#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
> +
> +typedef struct VFIOUserFDs {
> +    int send_fds;
> +    int recv_fds;
> +    int *fds;
> +} VFIOUserFDs;

I think around here we switch from vfio-user spec definitions to QEMU
implementation details. It might be nice to keep the vfio-user spec
definitions in a separate header file so the boundary is clear.

> +
> +typedef struct VFIOUserReply {
> +    QTAILQ_ENTRY(VFIOUserReply) next;
> +    vfio_user_hdr_t *msg;
> +    VFIOUserFDs *fds;
> +    int rsize;
> +    uint32_t id;
> +    QemuCond cv;
> +    uint8_t complete;

Please use bool.

> +} VFIOUserReply;
> +
> +enum proxy_state {
> +    CONNECTED =3D 1,
> +    RECV_ERROR =3D 2,
> +    CLOSING =3D 3,
> +    CLOSED =3D 4,
> +};

These enum values probably need a prefix (VFIO_PROXY_*). Generic short
names like CONNECTED, CLOSED, etc could lead to namespace collisions.
Enum constants are in the global namespace.

> +
> +typedef struct VFIOProxy {
> +    QLIST_ENTRY(VFIOProxy) next;
> +    char *sockname;
> +    struct QIOChannel *ioc;
> +    int (*request)(void *opaque, char *buf, VFIOUserFDs *fds);
> +    void *reqarg;
> +    int flags;
> +    QemuCond close_cv;
> +
> +    /*
> +     * above only changed when iolock is held

Please use "BQL" instead of "iolock". git grep shows many results for
BQL and the only result for iolock is in mpqemu code.

> +     * below are protected by per-proxy lock
> +     */
> +    QemuMutex lock;
> +    QTAILQ_HEAD(, VFIOUserReply) free;
> +    QTAILQ_HEAD(, VFIOUserReply) pending;
> +    enum proxy_state state;
> +    int close_wait;

Is this a bool? Please use bool.

> +} VFIOProxy;
> +
> +#define VFIO_PROXY_CLIENT       0x1

A comment that shows which field VFIO_PROXY_CLIENT relates would make this =
clearer:

  /* VFIOProxy->flags */
  #define VFIO_PROXY_CLIENT 0x1

> +
> +void vfio_user_recv(void *opaque);
> +void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
> +#endif /* VFIO_USER_H */
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
> index 8af11b0a76..f43dc6e5d0 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
>  } VFIOAddressSpace;
> =20
>  struct VFIOGroup;
> +typedef struct VFIOProxy VFIOProxy;
> =20
>  typedef struct VFIOContainer {
>      VFIOAddressSpace *space;
> @@ -143,6 +144,7 @@ typedef struct VFIODevice {
>      VFIOMigration *migration;
>      Error *migration_blocker;
>      OnOffAuto pre_copy_dirty_page_tracking;
> +    VFIOProxy *proxy;
>  } VFIODevice;
> =20
>  struct VFIODeviceOps {
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> new file mode 100644
> index 0000000000..021d5540e0
> --- /dev/null
> +++ b/hw/vfio/user.c
> @@ -0,0 +1,286 @@
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright =A9 2018, 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include <linux/vfio.h>
> +#include <sys/ioctl.h>
> +
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +#include "qemu/main-loop.h"
> +#include "hw/hw.h"
> +#include "hw/vfio/vfio-common.h"
> +#include "hw/vfio/vfio.h"
> +#include "qemu/sockets.h"
> +#include "io/channel.h"
> +#include "io/channel-util.h"
> +#include "sysemu/iothread.h"
> +#include "user.h"
> +
> +static uint64_t max_xfer_size =3D VFIO_USER_DEF_MAX_XFER;
> +static IOThread *vfio_user_iothread;
> +static void vfio_user_send_locked(VFIOProxy *proxy, vfio_user_hdr_t *msg=
,
> +                                  VFIOUserFDs *fds);
> +static void vfio_user_send(VFIOProxy *proxy, vfio_user_hdr_t *msg,
> +                           VFIOUserFDs *fds);
> +static void vfio_user_shutdown(VFIOProxy *proxy);
> +
> +static void vfio_user_shutdown(VFIOProxy *proxy)
> +{
> +    qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
> +    qio_channel_set_aio_fd_handler(proxy->ioc,
> +                                   iothread_get_aio_context(vfio_user_io=
thread),
> +                                   NULL, NULL, NULL);

There is no other qio_channel_set_aio_fd_handler() call in this patch.
Why is this one necessary?

> +}
> +
> +void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret)
> +{
> +    vfio_user_hdr_t *hdr =3D (vfio_user_hdr_t *)buf;
> +
> +    /*
> +     * convert header to associated reply
> +     * positive ret is reply size, negative is error code
> +     */
> +    hdr->flags =3D VFIO_USER_REPLY;
> +    if (ret > 0) {
> +        hdr->size =3D ret;
> +    } else if (ret < 0) {
> +        hdr->flags |=3D VFIO_USER_ERROR;
> +        hdr->error_reply =3D -ret;
> +        hdr->size =3D sizeof(*hdr);
> +    }

assert(ret !=3D 0)? That case doesn't seem to be defined so maybe an
assertion is worthwhile.

> +    vfio_user_send(proxy, hdr, NULL);
> +}
> +
> +void vfio_user_recv(void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +    VFIOProxy *proxy =3D vbasedev->proxy;
> +    VFIOUserReply *reply =3D NULL;
> +    g_autofree int *fdp =3D NULL;
> +    VFIOUserFDs reqfds =3D { 0, 0, fdp };
> +    vfio_user_hdr_t msg;
> +    struct iovec iov =3D {
> +        .iov_base =3D &msg,
> +        .iov_len =3D sizeof(msg),
> +    };
> +    int isreply, i, ret;
> +    size_t msgleft, numfds =3D 0;
> +    char *data =3D NULL;
> +    g_autofree char *buf =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    qemu_mutex_lock(&proxy->lock);
> +    if (proxy->state =3D=3D CLOSING) {
> +        qemu_mutex_unlock(&proxy->lock);

QEMU_LOCK_GUARD() automatically unlocks mutexes when the function
returns and is less error-prone than manual lock/unlock calls.

> +        return;
> +    }
> +
> +    ret =3D qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
> +                                 &local_err);
> +    if (ret <=3D 0) {
> +        /* read error or other side closed connection */
> +        error_setg_errno(&local_err, errno, "vfio_user_recv read error")=
;

This will trigger an assertion failure when local_err was already set by
qio_channel_readv_full():

  static void error_setv(Error **errp,
                         const char *src, int line, const char *func,
                         ErrorClass err_class, const char *fmt, va_list ap,
                         const char *suffix)
  {
      Error *err;
      int saved_errno =3D errno;
 =20
      if (errp =3D=3D NULL) {
          return;
      }
      assert(*errp =3D=3D NULL);
      ^^^^^^^^^^^^^^^^^^^^^^

I think this error_setg_errno() call should be dropped. You can use
error_prepend() if you'd like to add more information to the error
message from qio_channel_readv_full().

> +        goto fatal;
> +    }
> +
> +    if (ret < sizeof(msg)) {
> +        error_setg(&local_err, "vfio_user_recv short read of header");
> +        goto err;
> +    }
> +
> +    /*
> +     * For replies, find the matching pending request
> +     */
> +    switch (msg.flags & VFIO_USER_TYPE) {
> +    case VFIO_USER_REQUEST:
> +        isreply =3D 0;
> +        break;
> +    case VFIO_USER_REPLY:
> +        isreply =3D 1;
> +        break;
> +    default:
> +        error_setg(&local_err, "vfio_user_recv unknown message type");
> +        goto err;
> +    }
> +
> +    if (isreply) {
> +        QTAILQ_FOREACH(reply, &proxy->pending, next) {
> +            if (msg.id =3D=3D reply->id) {
> +                break;
> +            }
> +        }

I'm surprised to see this loop since proxy->lock prevents additional
requests from being sent while we're trying to receive a message. Can
there really be multiple replies pending with this locking scheme?

> +        if (reply =3D=3D NULL) {
> +            error_setg(&local_err, "vfio_user_recv unexpected reply");
> +            goto err;
> +        }
> +        QTAILQ_REMOVE(&proxy->pending, reply, next);
> +
> +        /*
> +         * Process any received FDs
> +         */
> +        if (numfds !=3D 0) {
> +            if (reply->fds =3D=3D NULL || reply->fds->recv_fds < numfds)=
 {
> +                error_setg(&local_err, "vfio_user_recv unexpected FDs");
> +                goto err;
> +            }
> +            reply->fds->recv_fds =3D numfds;
> +            memcpy(reply->fds->fds, fdp, numfds * sizeof(int));
> +        }
> +
> +    } else {
> +        /*
> +         * The client doesn't expect any FDs in requests, but
> +         * they will be expected on the server
> +         */
> +        if (numfds !=3D 0 && (proxy->flags & VFIO_PROXY_CLIENT)) {
> +            error_setg(&local_err, "vfio_user_recv fd in client reply");
> +            goto err;
> +        }
> +        reqfds.recv_fds =3D numfds;
> +    }
> +
> +    /*
> +     * put the whole message into a single buffer
> +     */
> +    msgleft =3D msg.size - sizeof(msg);

msg.size has not been validated so this could underflow. Please validate
all inputs so malicious servers/clients cannot crash or compromise the
program.

> +    if (isreply) {
> +        if (msg.size > reply->rsize) {

rsize is an int. Should it be uint32_t like msg.size?

> +            error_setg(&local_err,
> +                       "vfio_user_recv reply larger than recv buffer");
> +            goto fatal;
> +        }
> +        *reply->msg =3D msg;
> +        data =3D (char *)reply->msg + sizeof(msg);
> +    } else {
> +        if (msg.size > max_xfer_size) {
> +            error_setg(&local_err, "vfio_user_recv request larger than m=
ax");
> +            goto fatal;
> +        }

Missing check to prevent buffer overflow:

  if (msg.size < sizeof(msg)) {
      error_setg(&local_err, "vfio_user_recv request too small");
      goto fatal;
  }

> +        buf =3D g_malloc0(msg.size);
> +        memcpy(buf, &msg, sizeof(msg));
> +        data =3D buf + sizeof(msg);
> +    }
> +
> +    if (msgleft !=3D 0) {
> +        ret =3D qio_channel_read(proxy->ioc, data, msgleft, &local_err);
> +        if (ret < 0) {
> +            goto fatal;
> +        }
> +        if (ret !=3D msgleft) {
> +            error_setg(&local_err, "vfio_user_recv short read of msg bod=
y");
> +            goto err;
> +        }
> +    }
> +
> +    /*
> +     * Replies signal a waiter, requests get processed by vfio code
> +     * that may assume the iothread lock is held.
> +     */
> +    qemu_mutex_unlock(&proxy->lock);
> +    if (isreply) {
> +        reply->complete =3D 1;
> +        qemu_cond_signal(&reply->cv);

signal must be called with the mutex held to avoid race conditions. If
the waiter acquires the lock and still sees complete =3D=3D 0, then we
signal before wait is entered, the signal is missed and the waiter is
stuck.

> +    } else {
> +        qemu_mutex_lock_iothread();
> +        /*
> +         * make sure proxy wasn't closed while we waited
> +         * checking without holding the proxy lock is safe
> +         * since state is only set to CLOSING when iolock is held

s/iolock/the BQL/

> +         */
> +        if (proxy->state !=3D CLOSING) {
> +            ret =3D proxy->request(proxy->reqarg, buf, &reqfds);
> +            if (ret < 0 && !(msg.flags & VFIO_USER_NO_REPLY)) {
> +                vfio_user_send_reply(proxy, buf, ret);
> +            }
> +        }
> +        qemu_mutex_unlock_iothread();
> +    }
> +
> +    return;
> + fatal:
> +    vfio_user_shutdown(proxy);
> +    proxy->state =3D RECV_ERROR;
> +
> + err:
> +    qemu_mutex_unlock(&proxy->lock);
> +    for (i =3D 0; i < numfds; i++) {
> +        close(fdp[i]);
> +    }
> +    if (reply !=3D NULL) {
> +        /* force an error to keep sending thread from hanging */
> +        reply->msg->flags |=3D VFIO_USER_ERROR;
> +        reply->msg->error_reply =3D EINVAL;
> +        reply->complete =3D 1;
> +        qemu_cond_signal(&reply->cv);

This has the race condition too.

> +    }
> +    error_report_err(local_err);
> +}
> +
> +static void vfio_user_send_locked(VFIOProxy *proxy, vfio_user_hdr_t *msg=
,
> +                                  VFIOUserFDs *fds)
> +{
> +    struct iovec iov =3D {
> +        .iov_base =3D msg,
> +        .iov_len =3D msg->size,
> +    };
> +    size_t numfds =3D 0;
> +    int msgleft, ret, *fdp =3D NULL;
> +    char *buf;
> +    Error *local_err =3D NULL;
> +
> +    if (proxy->state !=3D CONNECTED) {
> +        msg->flags |=3D VFIO_USER_ERROR;
> +        msg->error_reply =3D ECONNRESET;
> +        return;
> +    }
> +
> +    if (fds !=3D NULL && fds->send_fds !=3D 0) {
> +        numfds =3D fds->send_fds;
> +        fdp =3D fds->fds;
> +    }
> +    ret =3D qio_channel_writev_full(proxy->ioc, &iov, 1, fdp, numfds, &l=
ocal_err);
> +    if (ret < 0) {
> +        goto err;
> +    }
> +    if (ret =3D=3D msg->size) {
> +        return;
> +    }
> +
> +    buf =3D iov.iov_base + ret;
> +    msgleft =3D iov.iov_len - ret;
> +    do {
> +        ret =3D qio_channel_write(proxy->ioc, buf, msgleft, &local_err);
> +        if (ret < 0) {
> +            goto err;
> +        }
> +        buf +=3D ret, msgleft -=3D ret;

Please use semicolon. Comma operators are rare, requiring readers to
check their exact semantics. There is no need to use comma here.

> +    } while (msgleft !=3D 0);
> +    return;
> +
> + err:
> +    error_report_err(local_err);

State remains unchanged and msg->error_reply isn't set?

> +}
> +
> +static void vfio_user_send(VFIOProxy *proxy, vfio_user_hdr_t *msg,
> +                           VFIOUserFDs *fds)
> +{
> +    bool iolock =3D qemu_mutex_iothread_locked();
> +
> +    if (iolock) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +    qemu_mutex_lock(&proxy->lock);
> +    vfio_user_send_locked(proxy, msg, fds);
> +    qemu_mutex_unlock(&proxy->lock);
> +    if (iolock) {
> +        qemu_mutex_lock_iothread();
> +    }
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12d69f3a45..aa4df6c418 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1883,8 +1883,12 @@ L: qemu-s390x@nongnu.org
>  vfio-user
>  M: John G Johnson <john.g.johnson@oracle.com>
>  M: Thanos Makatos <thanos.makatos@nutanix.com>
> +M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> +M: Jagannathan Raman <jag.raman@oracle.com>
>  S: Supported
>  F: docs/devel/vfio-user.rst
> +F: hw/vfio/user.c
> +F: hw/vfio/user.h
> =20
>  vhost
>  M: Michael S. Tsirkin <mst@redhat.com>
> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
> index da9af297a0..739b30be73 100644
> --- a/hw/vfio/meson.build
> +++ b/hw/vfio/meson.build
> @@ -8,6 +8,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>    'display.c',
>    'pci-quirks.c',
>    'pci.c',
> +  'user.c',
>  ))
>  vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
>  vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
> --=20
> 2.25.1
>=20

--usF7GHVF1WrepzYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEANZAACgkQnKSrs4Gr
c8jI0ggAl/Ki9iyXHBzdPujO+XCZTaSL63nVEmbVUrV/D92nFfxH1oozNT55AFSt
yn3LhL+sSpb26mK3Ac+lyXyBtt8wrH0ARy0iOioqOSYkHoymFJedy/vf1C0caZ60
kocaedEGk6MD6s57qNdBdTybDcqMMTsltR+e/9NvjWeN9UDDde+ni+MDtKCFzuWS
cJxnaGiIJlV9VCejilJrLaB57GuuH5SnE2dBbVFZZiCZG3UJyDb7eAiIRxHPAb1k
XoQ7h7fdgaod6osRMMFQeJeJOrrtpzBLERFNV7GQahkLGyAuWUumkAVKsTumc8F2
cfjFNdrfen9v56Bbgl1mhTukF8hEjg==
=69uH
-----END PGP SIGNATURE-----

--usF7GHVF1WrepzYr--


