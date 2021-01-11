Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0812F1CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:32 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1E3-0002Wf-Vy
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kz19b-0005aU-7Y
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:38:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kz19X-0003AM-I3
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610386730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6wpJyISTldBb84OCXQRoYv1biOPxAGWn8qpb2qoMTRg=;
 b=bRq5aJaMMa2z/rlqLBhgZ/N7mubRAdvtXHB1piKrRA7myqMCjelNUhbLnUeds1d4wuT4bz
 e4PZNWEq0dsMGNFnqAIC1siaF83WF+ORYn4x8vQJFXZWmi7MiYxI8gVYyrQKPmkTrlJRta
 0pTBPexcF08f47TLPnWctzGD6c7YlFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-OvNyM-h8OtSVTO_UaLiFEQ-1; Mon, 11 Jan 2021 12:38:48 -0500
X-MC-Unique: OvNyM-h8OtSVTO_UaLiFEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B97801007484;
 Mon, 11 Jan 2021 17:38:47 +0000 (UTC)
Received: from work-vm (ovpn-115-72.ams2.redhat.com [10.36.115.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 459176ACE0;
 Mon, 11 Jan 2021 17:38:30 +0000 (UTC)
Date: Mon, 11 Jan 2021 17:38:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] vhost-user-fs: add the "bootindex" property
Message-ID: <20210111173827.GO2965@work-vm>
References: <20210104132401.5100-1-lersek@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210104132401.5100-1-lersek@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laszlo Ersek (lersek@redhat.com) wrote:
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

That looks reasonable; although I'm not familiar with the bootindex
system; so 

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


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
> -- 
> 2.19.1.3.g30247aa5d201
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


