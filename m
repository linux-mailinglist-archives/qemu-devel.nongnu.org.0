Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CDE6E0080
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:08:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhgR-0000HT-GL; Wed, 12 Apr 2023 17:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pmhg5-0000AL-GC
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pmhg1-0007wd-TQ
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681333608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RtE4ZCClCnRMfy6H/2LjgvQUefIPMxHvDVuf07UPc7M=;
 b=jJ3aS1KLuAfKOKQqYknGFHD7+oWJLS3YP2QMAt0VSfnNHkykw1Zz7bio9dFOd0WtWYM6dC
 obXy7BSZXt2uB5XM6myEltI5o41uGnFFlHf8SCSgQIB7YNeerCXUoKE4lFlzaPHukRjiLc
 37fKUXUJ/i9U9JoB+MaotY+dqNWYLnc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-hX23ufP2MwiRLbBJAF6Fkg-1; Wed, 12 Apr 2023 17:06:44 -0400
X-MC-Unique: hX23ufP2MwiRLbBJAF6Fkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59D1D101A531;
 Wed, 12 Apr 2023 21:06:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E404C15BB8;
 Wed, 12 Apr 2023 21:06:43 +0000 (UTC)
Date: Wed, 12 Apr 2023 17:06:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Message-ID: <20230412210641.GC2813183@fedora>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TaaiuJT6ORh3DEwR"
Content-Disposition: inline
In-Reply-To: <20230411150515.14020-3-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--TaaiuJT6ORh3DEwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> So-called "internal" virtio-fs migration refers to transporting the
> back-end's (virtiofsd's) state through qemu's migration stream.  To do
> this, we need to be able to transfer virtiofsd's internal state to and
> from virtiofsd.
>=20
> Because virtiofsd's internal state will not be too large, we believe it
> is best to transfer it as a single binary blob after the streaming
> phase.  Because this method should be useful to other vhost-user
> implementations, too, it is introduced as a general-purpose addition to
> the protocol, not limited to vhost-user-fs.
>=20
> These are the additions to the protocol:
> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STATE:
>   This feature signals support for transferring state, and is added so
>   that migration can fail early when the back-end has no support.
>=20
> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pipe
>   over which to transfer the state.  The front-end sends an FD to the
>   back-end into/from which it can write/read its state, and the back-end
>   can decide to either use it, or reply with a different FD for the
>   front-end to override the front-end's choice.
>   The front-end creates a simple pipe to transfer the state, but maybe
>   the back-end already has an FD into/from which it has to write/read
>   its state, in which case it will want to override the simple pipe.
>   Conversely, maybe in the future we find a way to have the front-end
>   get an immediate FD for the migration stream (in some cases), in which
>   case we will want to send this to the back-end instead of creating a
>   pipe.
>   Hence the negotiation: If one side has a better idea than a plain
>   pipe, we will want to use that.
>=20
> - CHECK_DEVICE_STATE: After the state has been transferred through the
>   pipe (the end indicated by EOF), the front-end invokes this function
>   to verify success.  There is no in-band way (through the pipe) to
>   indicate failure, so we need to check explicitly.
>=20
> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
> (which includes establishing the direction of transfer and migration
> phase), the sending side writes its data into the pipe, and the reading
> side reads it until it sees an EOF.  Then, the front-end will check for
> success via CHECK_DEVICE_STATE, which on the destination side includes
> checking for integrity (i.e. errors during deserialization).
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/hw/virtio/vhost-backend.h |  24 +++++
>  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
>  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++++++
>  hw/virtio/vhost.c                 |  37 ++++++++
>  4 files changed, 287 insertions(+)
>=20
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-=
backend.h
> index ec3fbae58d..5935b32fe3 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
>      VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
>  } VhostSetConfigType;
> =20
> +typedef enum VhostDeviceStateDirection {
> +    /* Transfer state from back-end (device) to front-end */
> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> +    /* Transfer state from front-end to back-end (device) */
> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> +} VhostDeviceStateDirection;
> +
> +typedef enum VhostDeviceStatePhase {
> +    /* The device (and all its vrings) is stopped */
> +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> +} VhostDeviceStatePhase;

vDPA has:

  /* Suspend a device so it does not process virtqueue requests anymore
   *
   * After the return of ioctl the device must preserve all the necessary s=
tate
   * (the virtqueue vring base plus the possible device specific states) th=
at is
   * required for restoring in the future. The device must not change its
   * configuration after that point.
   */
  #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)

  /* Resume a device so it can resume processing virtqueue requests
   *
   * After the return of this ioctl the device will have restored all the
   * necessary states and it is fully operational to continue processing the
   * virtqueue descriptors.
   */
  #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)

I wonder if it makes sense to import these into vhost-user so that the
difference between kernel vhost and vhost-user is minimized. It's okay
if one of them is ahead of the other, but it would be nice to avoid
overlapping/duplicated functionality.

(And I hope vDPA will import the device state vhost-user messages
introduced in this series.)

> +
>  struct vhost_inflight;
>  struct vhost_dev;
>  struct vhost_log;
> @@ -133,6 +145,15 @@ typedef int (*vhost_set_config_call_op)(struct vhost=
_dev *dev,
> =20
>  typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> =20
> +typedef bool (*vhost_supports_migratory_state_op)(struct vhost_dev *dev);
> +typedef int (*vhost_set_device_state_fd_op)(struct vhost_dev *dev,
> +                                            VhostDeviceStateDirection di=
rection,
> +                                            VhostDeviceStatePhase phase,
> +                                            int fd,
> +                                            int *reply_fd,
> +                                            Error **errp);
> +typedef int (*vhost_check_device_state_op)(struct vhost_dev *dev, Error =
**errp);
> +
>  typedef struct VhostOps {
>      VhostBackendType backend_type;
>      vhost_backend_init vhost_backend_init;
> @@ -181,6 +202,9 @@ typedef struct VhostOps {
>      vhost_force_iommu_op vhost_force_iommu;
>      vhost_set_config_call_op vhost_set_config_call;
>      vhost_reset_status_op vhost_reset_status;
> +    vhost_supports_migratory_state_op vhost_supports_migratory_state;
> +    vhost_set_device_state_fd_op vhost_set_device_state_fd;
> +    vhost_check_device_state_op vhost_check_device_state;
>  } VhostOps;
> =20
>  int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 2fe02ed5d4..29449e0fe2 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -346,4 +346,83 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
>                             struct vhost_inflight *inflight);
>  int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>                             struct vhost_inflight *inflight);
> +
> +/**
> + * vhost_supports_migratory_state(): Checks whether the back-end
> + * supports transferring internal state for the purpose of migration.
> + * Support for this feature is required for vhost_set_device_state_fd()
> + * and vhost_check_device_state().
> + *
> + * @dev: The vhost device
> + *
> + * Returns true if the device supports these commands, and false if it
> + * does not.
> + */
> +bool vhost_supports_migratory_state(struct vhost_dev *dev);
> +
> +/**
> + * vhost_set_device_state_fd(): Begin transfer of internal state from/to
> + * the back-end for the purpose of migration.  Data is to be transferred
> + * over a pipe according to @direction and @phase.  The sending end must
> + * only write to the pipe, and the receiving end must only read from it.
> + * Once the sending end is done, it closes its FD.  The receiving end
> + * must take this as the end-of-transfer signal and close its FD, too.
> + *
> + * @fd is the back-end's end of the pipe: The write FD for SAVE, and the
> + * read FD for LOAD.  This function transfers ownership of @fd to the
> + * back-end, i.e. closes it in the front-end.
> + *
> + * The back-end may optionally reply with an FD of its own, if this
> + * improves efficiency on its end.  In this case, the returned FD is
> + * stored in *reply_fd.  The back-end will discard the FD sent to it,
> + * and the front-end must use *reply_fd for transferring state to/from
> + * the back-end.
> + *
> + * @dev: The vhost device
> + * @direction: The direction in which the state is to be transferred.
> + *             For outgoing migrations, this is SAVE, and data is read
> + *             from the back-end and stored by the front-end in the
> + *             migration stream.
> + *             For incoming migrations, this is LOAD, and data is read
> + *             by the front-end from the migration stream and sent to
> + *             the back-end to restore the saved state.
> + * @phase: Which migration phase we are in.  Currently, there is only
> + *         STOPPED (device and all vrings are stopped), in the future,
> + *         more phases such as PRE_COPY or POST_COPY may be added.
> + * @fd: Back-end's end of the pipe through which to transfer state; note
> + *      that ownership is transferred to the back-end, so this function
> + *      closes @fd in the front-end.
> + * @reply_fd: If the back-end wishes to use a different pipe for state
> + *            transfer, this will contain an FD for the front-end to
> + *            use.  Otherwise, -1 is stored here.
> + * @errp: Potential error description
> + *
> + * Returns 0 on success, and -errno on failure.
> + */
> +int vhost_set_device_state_fd(struct vhost_dev *dev,
> +                              VhostDeviceStateDirection direction,
> +                              VhostDeviceStatePhase phase,
> +                              int fd,
> +                              int *reply_fd,
> +                              Error **errp);
> +
> +/**
> + * vhost_set_device_state_fd(): After transferring state from/to the
> + * back-end via vhost_set_device_state_fd(), i.e. once the sending end
> + * has closed the pipe, inquire the back-end to report any potential
> + * errors that have occurred on its side.  This allows to sense errors
> + * like:
> + * - During outgoing migration, when the source side had already started
> + *   to produce its state, something went wrong and it failed to finish
> + * - During incoming migration, when the received state is somehow
> + *   invalid and cannot be processed by the back-end
> + *
> + * @dev: The vhost device
> + * @errp: Potential error description
> + *
> + * Returns 0 when the back-end reports successful state transfer and
> + * processing, and -errno when an error occurred somewhere.
> + */
> +int vhost_check_device_state(struct vhost_dev *dev, Error **errp);
> +
>  #endif
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e5285df4ba..93d8f2494a 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -83,6 +83,7 @@ enum VhostUserProtocolFeature {
>      /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATION=
S. */
>      VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS =3D 15,
>      VHOST_USER_PROTOCOL_F_STATUS =3D 16,
> +    VHOST_USER_PROTOCOL_F_MIGRATORY_STATE =3D 17,
>      VHOST_USER_PROTOCOL_F_MAX
>  };
> =20
> @@ -130,6 +131,8 @@ typedef enum VhostUserRequest {
>      VHOST_USER_REM_MEM_REG =3D 38,
>      VHOST_USER_SET_STATUS =3D 39,
>      VHOST_USER_GET_STATUS =3D 40,
> +    VHOST_USER_SET_DEVICE_STATE_FD =3D 41,
> +    VHOST_USER_CHECK_DEVICE_STATE =3D 42,
>      VHOST_USER_MAX
>  } VhostUserRequest;
> =20
> @@ -210,6 +213,12 @@ typedef struct {
>      uint32_t size; /* the following payload size */
>  } QEMU_PACKED VhostUserHeader;
> =20
> +/* Request payload of VHOST_USER_SET_DEVICE_STATE_FD */
> +typedef struct VhostUserTransferDeviceState {
> +    uint32_t direction;
> +    uint32_t phase;
> +} VhostUserTransferDeviceState;
> +
>  typedef union {
>  #define VHOST_USER_VRING_IDX_MASK   (0xff)
>  #define VHOST_USER_VRING_NOFD_MASK  (0x1 << 8)
> @@ -224,6 +233,7 @@ typedef union {
>          VhostUserCryptoSession session;
>          VhostUserVringArea area;
>          VhostUserInflight inflight;
> +        VhostUserTransferDeviceState transfer_state;
>  } VhostUserPayload;
> =20
>  typedef struct VhostUserMsg {
> @@ -2681,6 +2691,140 @@ static int vhost_user_dev_start(struct vhost_dev =
*dev, bool started)
>      }
>  }
> =20
> +static bool vhost_user_supports_migratory_state(struct vhost_dev *dev)
> +{
> +    return virtio_has_feature(dev->protocol_features,
> +                              VHOST_USER_PROTOCOL_F_MIGRATORY_STATE);
> +}
> +
> +static int vhost_user_set_device_state_fd(struct vhost_dev *dev,
> +                                          VhostDeviceStateDirection dire=
ction,
> +                                          VhostDeviceStatePhase phase,
> +                                          int fd,
> +                                          int *reply_fd,
> +                                          Error **errp)
> +{
> +    int ret;
> +    struct vhost_user *vu =3D dev->opaque;
> +    VhostUserMsg msg =3D {
> +        .hdr =3D {
> +            .request =3D VHOST_USER_SET_DEVICE_STATE_FD,
> +            .flags =3D VHOST_USER_VERSION,
> +            .size =3D sizeof(msg.payload.transfer_state),
> +        },
> +        .payload.transfer_state =3D {
> +            .direction =3D direction,
> +            .phase =3D phase,
> +        },
> +    };
> +
> +    *reply_fd =3D -1;
> +
> +    if (!vhost_user_supports_migratory_state(dev)) {
> +        close(fd);
> +        error_setg(errp, "Back-end does not support migration state tran=
sfer");
> +        return -ENOTSUP;
> +    }
> +
> +    ret =3D vhost_user_write(dev, &msg, &fd, 1);
> +    close(fd);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "Failed to send SET_DEVICE_STATE_FD message");
> +        return ret;
> +    }
> +
> +    ret =3D vhost_user_read(dev, &msg);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "Failed to receive SET_DEVICE_STATE_FD reply");
> +        return ret;
> +    }
> +
> +    if (msg.hdr.request !=3D VHOST_USER_SET_DEVICE_STATE_FD) {
> +        error_setg(errp,
> +                   "Received unexpected message type, expected %d, recei=
ved %d",
> +                   VHOST_USER_SET_DEVICE_STATE_FD, msg.hdr.request);
> +        return -EPROTO;
> +    }
> +
> +    if (msg.hdr.size !=3D sizeof(msg.payload.u64)) {
> +        error_setg(errp,
> +                   "Received bad message size, expected %zu, received %"=
 PRIu32,
> +                   sizeof(msg.payload.u64), msg.hdr.size);
> +        return -EPROTO;
> +    }
> +
> +    if ((msg.payload.u64 & 0xff) !=3D 0) {
> +        error_setg(errp, "Back-end did not accept migration state transf=
er");
> +        return -EIO;
> +    }
> +
> +    if (!(msg.payload.u64 & VHOST_USER_VRING_NOFD_MASK)) {
> +        *reply_fd =3D qemu_chr_fe_get_msgfd(vu->user->chr);
> +        if (*reply_fd < 0) {
> +            error_setg(errp,
> +                       "Failed to get back-end-provided transfer pipe FD=
");
> +            *reply_fd =3D -1;
> +            return -EIO;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int vhost_user_check_device_state(struct vhost_dev *dev, Error **=
errp)
> +{
> +    int ret;
> +    VhostUserMsg msg =3D {
> +        .hdr =3D {
> +            .request =3D VHOST_USER_CHECK_DEVICE_STATE,
> +            .flags =3D VHOST_USER_VERSION,
> +            .size =3D 0,
> +        },
> +    };
> +
> +    if (!vhost_user_supports_migratory_state(dev)) {
> +        error_setg(errp, "Back-end does not support migration state tran=
sfer");
> +        return -ENOTSUP;
> +    }
> +
> +    ret =3D vhost_user_write(dev, &msg, NULL, 0);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "Failed to send CHECK_DEVICE_STATE message");
> +        return ret;
> +    }
> +
> +    ret =3D vhost_user_read(dev, &msg);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "Failed to receive CHECK_DEVICE_STATE reply");
> +        return ret;
> +    }
> +
> +    if (msg.hdr.request !=3D VHOST_USER_CHECK_DEVICE_STATE) {
> +        error_setg(errp,
> +                   "Received unexpected message type, expected %d, recei=
ved %d",
> +                   VHOST_USER_CHECK_DEVICE_STATE, msg.hdr.request);
> +        return -EPROTO;
> +    }
> +
> +    if (msg.hdr.size !=3D sizeof(msg.payload.u64)) {
> +        error_setg(errp,
> +                   "Received bad message size, expected %zu, received %"=
 PRIu32,
> +                   sizeof(msg.payload.u64), msg.hdr.size);
> +        return -EPROTO;
> +    }
> +
> +    if (msg.payload.u64 !=3D 0) {
> +        error_setg(errp, "Back-end failed to process its internal state"=
);
> +        return -EIO;
> +    }
> +
> +    return 0;
> +}
> +
>  const VhostOps user_ops =3D {
>          .backend_type =3D VHOST_BACKEND_TYPE_USER,
>          .vhost_backend_init =3D vhost_user_backend_init,
> @@ -2716,4 +2860,7 @@ const VhostOps user_ops =3D {
>          .vhost_get_inflight_fd =3D vhost_user_get_inflight_fd,
>          .vhost_set_inflight_fd =3D vhost_user_set_inflight_fd,
>          .vhost_dev_start =3D vhost_user_dev_start,
> +        .vhost_supports_migratory_state =3D vhost_user_supports_migrator=
y_state,
> +        .vhost_set_device_state_fd =3D vhost_user_set_device_state_fd,
> +        .vhost_check_device_state =3D vhost_user_check_device_state,
>  };
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index cbff589efa..90099d8f6a 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -2088,3 +2088,40 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
> =20
>      return -ENOSYS;
>  }
> +
> +bool vhost_supports_migratory_state(struct vhost_dev *dev)
> +{
> +    if (dev->vhost_ops->vhost_supports_migratory_state) {
> +        return dev->vhost_ops->vhost_supports_migratory_state(dev);
> +    }
> +
> +    return false;
> +}
> +
> +int vhost_set_device_state_fd(struct vhost_dev *dev,
> +                              VhostDeviceStateDirection direction,
> +                              VhostDeviceStatePhase phase,
> +                              int fd,
> +                              int *reply_fd,
> +                              Error **errp)
> +{
> +    if (dev->vhost_ops->vhost_set_device_state_fd) {
> +        return dev->vhost_ops->vhost_set_device_state_fd(dev, direction,=
 phase,
> +                                                         fd, reply_fd, e=
rrp);
> +    }
> +
> +    error_setg(errp,
> +               "vhost transport does not support migration state transfe=
r");
> +    return -ENOSYS;
> +}
> +
> +int vhost_check_device_state(struct vhost_dev *dev, Error **errp)
> +{
> +    if (dev->vhost_ops->vhost_check_device_state) {
> +        return dev->vhost_ops->vhost_check_device_state(dev, errp);
> +    }
> +
> +    error_setg(errp,
> +               "vhost transport does not support migration state transfe=
r");
> +    return -ENOSYS;
> +}
> --=20
> 2.39.1
>=20

--TaaiuJT6ORh3DEwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ3HWEACgkQnKSrs4Gr
c8hZ5Af9HXKYsc5E/+6y8W3SwhuAl9yRnCwDtRtJb3U0f7KXysOo8CNwGH4wZ5RE
StQTrDHt79tZeOv7kzZLX5H1vAxa71Du92wDQqx7m4iWCF3Ut0yYsYwLkEM8ENem
PqJbrRfCr+SgZhOqA3MkJNP79C0UYMBk0btrOMqjW83rWICX1BK9Zh0YjYi3vSeU
lOZoMh+kqPDkGo3M9XTmPW/ftb5CQC32xHSStXXLGgG1N4CVposZpNG7jFsB9CPw
CxywL83a2gy0Zf+jdZRjO44v/N+h+Ej4CfezjpWPWn4tBTND+ocn+xVynUCpk2cI
41BOXiH/GUprHV0nKLJKJtIyWmAE0Q==
=tuaq
-----END PGP SIGNATURE-----

--TaaiuJT6ORh3DEwR--


