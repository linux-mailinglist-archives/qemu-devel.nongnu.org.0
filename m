Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8927C2F0E8B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 09:52:04 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kysvj-00022h-41
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 03:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kysuG-0001Xb-Km
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 03:50:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kysuE-0007fi-0D
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 03:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610355027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cd1pG0HD5W/Limi8XappYlS/0/C6JgCzT26/TXjcV1k=;
 b=b/IfofXci7mqOft4zOuvCg0lQxm44lZgYe+vTdLCyQm9C6hoxc//5i7ZJ3wxQEX8sg+P6D
 d2zvG9sPaTVWPU6ficcdkCs7/tiuW7juLxDZPFTKMZTIiF/MAlJTsnDirqLTlKZIMipgb+
 bIg+ZTFTio/Q8RJQYIyTIKNYuHsL2e8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-d5zdfLwEOwiaUvYoXsI78g-1; Mon, 11 Jan 2021 03:50:25 -0500
X-MC-Unique: d5zdfLwEOwiaUvYoXsI78g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 646C619611A8;
 Mon, 11 Jan 2021 08:50:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-91.ams2.redhat.com
 [10.36.113.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7920160C68;
 Mon, 11 Jan 2021 08:50:13 +0000 (UTC)
Subject: Re: [PATCH] vhost-user-fs: add the "bootindex" property
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
References: <20210104132401.5100-1-lersek@redhat.com>
Message-ID: <408e6983-c378-b565-1da9-2cf30a9b5f96@redhat.com>
Date: Mon, 11 Jan 2021 09:50:12 +0100
MIME-Version: 1.0
In-Reply-To: <20210104132401.5100-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On 01/04/21 14:24, Laszlo Ersek wrote:
> virtio-fs qualifies as a bootable device minimally under OVMF, but
> currently the necessary "bootindex" property is missing (fw_cfg kernel
> boot notwithstanding).
> 
> Add the property. For completeness, add it to the CCW device as well;
> other virtio-ccw devices seem to have "bootindex" properties too.
> 
> Example OpenFirmware device path for the "vhost-user-fs-pci" device in the
> "bootorder" fw_cfg file:
> 
>   /pci@i0cf8/pci-bridge@1,6/pci1af4,105a@0/filesystem@0
> 
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: virtio-fs@redhat.com
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  include/hw/virtio/vhost-user-fs.h |  1 +
>  hw/s390x/vhost-user-fs-ccw.c      |  2 ++
>  hw/virtio/vhost-user-fs-pci.c     |  2 ++
>  hw/virtio/vhost-user-fs.c         | 10 ++++++++++
>  4 files changed, 15 insertions(+)
> 
> diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
> index 698575277101..0d62834c2510 100644
> --- a/include/hw/virtio/vhost-user-fs.h
> +++ b/include/hw/virtio/vhost-user-fs.h
> @@ -39,6 +39,7 @@ struct VHostUserFS {
>      VhostUserState vhost_user;
>      VirtQueue **req_vqs;
>      VirtQueue *hiprio_vq;
> +    int32_t bootindex;
>  
>      /*< public >*/
>  };
> diff --git a/hw/s390x/vhost-user-fs-ccw.c b/hw/s390x/vhost-user-fs-ccw.c
> index 6c6f26929301..474e97e937b8 100644
> --- a/hw/s390x/vhost-user-fs-ccw.c
> +++ b/hw/s390x/vhost-user-fs-ccw.c
> @@ -47,6 +47,8 @@ static void vhost_user_fs_ccw_instance_init(Object *obj)
>      ccw_dev->force_revision_1 = true;
>      virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>                                  TYPE_VHOST_USER_FS);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
>  }
>  
>  static void vhost_user_fs_ccw_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
> index 8bb389bd282a..2ed8492b3fa3 100644
> --- a/hw/virtio/vhost-user-fs-pci.c
> +++ b/hw/virtio/vhost-user-fs-pci.c
> @@ -68,6 +68,8 @@ static void vhost_user_fs_pci_instance_init(Object *obj)
>  
>      virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>                                  TYPE_VHOST_USER_FS);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
>  }
>  
>  static const VirtioPCIDeviceTypeInfo vhost_user_fs_pci_info = {
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ed036ad9c13f..ac4fc34b36a2 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -22,6 +22,7 @@
>  #include "qemu/error-report.h"
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
> +#include "sysemu/sysemu.h"
>  
>  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
>  {
> @@ -279,6 +280,14 @@ static Property vuf_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static void vuf_instance_init(Object *obj)
> +{
> +    VHostUserFS *fs = VHOST_USER_FS(obj);
> +
> +    device_add_bootindex_property(obj, &fs->bootindex, "bootindex",
> +                                  "/filesystem@0", DEVICE(obj));
> +}
> +
>  static void vuf_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -300,6 +309,7 @@ static const TypeInfo vuf_info = {
>      .name = TYPE_VHOST_USER_FS,
>      .parent = TYPE_VIRTIO_DEVICE,
>      .instance_size = sizeof(VHostUserFS),
> +    .instance_init = vuf_instance_init,
>      .class_init = vuf_class_init,
>  };
>  
> 


