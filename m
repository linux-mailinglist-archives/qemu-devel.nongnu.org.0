Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CB423B68
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:22:44 +0200 (CEST)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY44R-0003WR-CB
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mY42q-0002nz-FE
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mY42n-0002S7-CR
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633515660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5B27zJi2vPUwk5B5ARqkByx37x/CNCs7ie8cvno+i4=;
 b=NsvcKU2/Msh/cOMg11hcC3h8AP7HDCD3Miw7DVt2Il0/FyU0dDT0yECtkVvNQuiUYJY31n
 05QstgSFKAcKDflImZ5KZKQQxTrCfmonzNbCfqnw+ZVedKH+Pht/tFT1AO8GC52UAsxX+A
 p69amNwO+cYi8fK7uESs7yV8PfItESI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-F9JBb6BfOKyWnFqvEL1R0w-1; Wed, 06 Oct 2021 06:20:57 -0400
X-MC-Unique: F9JBb6BfOKyWnFqvEL1R0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44A721006AA3;
 Wed,  6 Oct 2021 10:20:56 +0000 (UTC)
Received: from titinator (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7C6604CC;
 Wed,  6 Oct 2021 10:20:46 +0000 (UTC)
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-10-vgoyal@redhat.com>
User-agent: mu4e 1.5.13; emacs 27.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 09/13] virtiofsd: Specify size of
 notification buffer using config space
Date: Wed, 06 Oct 2021 12:05:20 +0200
In-reply-to: <20210930153037.1194279-10-vgoyal@redhat.com>
Message-ID: <lyzgrmihdv.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021-09-30 at 11:30 -04, Vivek Goyal <vgoyal@redhat.com> wrote...
> Daemon specifies size of notification buffer needed and that should be
> done using config space.
>
> Only ->notify_buf_size value of config space comes from daemon. Rest of
> it is filled by qemu device emulation code.
>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> ---
>  hw/virtio/vhost-user-fs.c                  | 27 +++++++++++++++++++
>  include/hw/virtio/vhost-user-fs.h          |  2 ++
>  include/standard-headers/linux/virtio_fs.h |  2 ++
>  tools/virtiofsd/fuse_virtio.c              | 31 ++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 6bafcf0243..68a94708b4 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -36,15 +36,41 @@ static const int user_feature_bits[] = {
>      VHOST_INVALID_FEATURE_BIT
>  };
>
> +static int vhost_user_fs_handle_config_change(struct vhost_dev *dev)
> +{
> +    return 0;
> +}
> +
> +const VhostDevConfigOps fs_ops = {
> +    .vhost_dev_config_notifier = vhost_user_fs_handle_config_change,
> +};
> +
>  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
>      struct virtio_fs_config fscfg = {};
> +    Error *local_err = NULL;
> +    int ret;
> +
> +    /*
> +     * As of now we only get notification buffer size from device. And that's
> +     * needed only if notification queue is enabled.
> +     */
> +    if (fs->notify_enabled) {
> +        ret = vhost_dev_get_config(&fs->vhost_dev, (uint8_t *)&fs->fscfg,
> +                                   sizeof(struct virtio_fs_config),
> +                                   &local_err);
> +        if (ret) {
> +            error_report_err(local_err);
> +            return;
> +        }
> +    }

I was a bit puzzled by this form of error reporting from the config
callback. It looks like this is not a first, the same pattern exists in
vhost-user-input, vhost-user-gpu, vhost-user-gpu.

However, in all these other cases, there is a memset of the config data to
zero before returning, so you don't leave it uninitialized. Only
vhost-user-blk follows a similar pattern as the code above. Apparently,
vhost_dev_get_config itself does not zero the config either.

Would it be worth adding the following to the error path?

    memset(config, 0, sizeof(fscfg));

>
>      memcpy((char *)fscfg.tag, fs->conf.tag,
>             MIN(strlen(fs->conf.tag) + 1, sizeof(fscfg.tag)));
>
>      virtio_stl_p(vdev, &fscfg.num_request_queues, fs->conf.num_request_queues);
> +    virtio_stl_p(vdev, &fscfg.notify_buf_size, fs->fscfg.notify_buf_size);
>
>      memcpy(config, &fscfg, sizeof(fscfg));
>  }
> @@ -316,6 +342,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>                  sizeof(struct virtio_fs_config));
>
>      vuf_create_vqs(vdev, true);
> +    vhost_dev_set_config_notifier(&fs->vhost_dev, &fs_ops);
>      ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
> index 95dc0dd402..3b114ee260 100644
> --- a/include/hw/virtio/vhost-user-fs.h
> +++ b/include/hw/virtio/vhost-user-fs.h
> @@ -14,6 +14,7 @@
>  #ifndef _QEMU_VHOST_USER_FS_H
>  #define _QEMU_VHOST_USER_FS_H
>
> +#include "standard-headers/linux/virtio_fs.h"
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user.h"
> @@ -37,6 +38,7 @@ struct VHostUserFS {
>      struct vhost_virtqueue *vhost_vqs;
>      struct vhost_dev vhost_dev;
>      VhostUserState vhost_user;
> +    struct virtio_fs_config fscfg;
>      VirtQueue **req_vqs;
>      VirtQueue *hiprio_vq;
>      VirtQueue *notification_vq;
> diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standard-headers/linux/virtio_fs.h
> index b7f015186e..867d18acf6 100644
> --- a/include/standard-headers/linux/virtio_fs.h
> +++ b/include/standard-headers/linux/virtio_fs.h
> @@ -17,6 +17,8 @@ struct virtio_fs_config {
>
>  	/* Number of request queues */
>  	uint32_t num_request_queues;
> +	/* Size of notification buffer */
> +	uint32_t notify_buf_size;
>  } QEMU_PACKED;
>
>  /* For the id field in virtio_pci_shm_cap */
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index f5b87a508a..3b720c5d4a 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -856,6 +856,35 @@ static bool fv_queue_order(VuDev *dev, int qidx)
>      return false;
>  }
>
> +static uint64_t fv_get_protocol_features(VuDev *dev)
> +{
> +    return 1ull << VHOST_USER_PROTOCOL_F_CONFIG;
> +}
> +
> +static int fv_get_config(VuDev *dev, uint8_t *config, uint32_t len)
> +{
> +    struct virtio_fs_config fscfg = {};
> +    unsigned notify_size, roundto = 64;
> +    union fuse_notify_union {
> +        struct fuse_notify_poll_wakeup_out  wakeup_out;
> +        struct fuse_notify_inval_inode_out  inode_out;
> +        struct fuse_notify_inval_entry_out  entry_out;
> +        struct fuse_notify_delete_out       delete_out;
> +        struct fuse_notify_store_out        store_out;
> +        struct fuse_notify_retrieve_out     retrieve_out;
> +    };
> +
> +    notify_size = sizeof(struct fuse_out_header) +
> +              sizeof(union fuse_notify_union);
> +    notify_size = ((notify_size + roundto) / roundto) * roundto;
> +
> +    fscfg.notify_buf_size = notify_size;
> +    memcpy(config, &fscfg, len);
> +    fuse_log(FUSE_LOG_DEBUG, "%s:Setting notify_buf_size=%d\n", __func__,
> +             fscfg.notify_buf_size);
> +    return 0;
> +}
> +
>  static const VuDevIface fv_iface = {
>      .get_features = fv_get_features,
>      .set_features = fv_set_features,
> @@ -864,6 +893,8 @@ static const VuDevIface fv_iface = {
>      .queue_set_started = fv_queue_set_started,
>
>      .queue_is_processed_in_order = fv_queue_order,
> +    .get_protocol_features = fv_get_protocol_features,
> +    .get_config = fv_get_config,
>  };
>
>  /*


--
Cheers,
Christophe de Dinechin (IRC c3d)


