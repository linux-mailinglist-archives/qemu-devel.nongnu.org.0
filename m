Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1494939DB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:48:18 +0100 (CET)
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA9Rp-0007iV-RQ
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nA9B1-0001ho-1i
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:30:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nA9Aw-0004RY-V1
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642591850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eUOdMVP4x+JT0nUaxHTzmDc/LwQxzS9ywyA8HE+L9sM=;
 b=brsA5TpZYwIXPdIQ+4aMcAV487tlCkBPpmDJX9Ot8V26v4Boe56O8gjBHe2Ix8eur4ix7q
 dJzVcZ5vsCvShYe1EE8aRX1qOCT/il7HvhVouTzXhx0fcQabnMy2UcIbCNtRhVmswPasls
 MJuSh5nmtRl61/Ixj4mBknqKeFo07iA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-HkidDhmkNd2ZJMbIFWVghQ-1; Wed, 19 Jan 2022 06:30:49 -0500
X-MC-Unique: HkidDhmkNd2ZJMbIFWVghQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 a14-20020aed278e000000b002c91399bf9eso1308256qtd.7
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 03:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eUOdMVP4x+JT0nUaxHTzmDc/LwQxzS9ywyA8HE+L9sM=;
 b=Lq7BQ0CRVxUFGfJynWywsCYSvTOlom24Vkhu7Xo9Aa1kY9NhX4NzpJEtco8nXO4rUw
 9mTSgcJQR0Lkm4dLgotZlNFv/3ONGj2lHH4ldwjn/giuN/HLlAZat7dp+hAG7Qd5JKkF
 DE/Uc9yO2RsAJCKVKohXRRr0QyCKk3coEbGX9sI1gA9KjF5vUBSko07xDWwajnpm3jeX
 wQFRTNMP4LBwjtVBpXwVMf5GqpJrVyGpImm/ywsWHNZ9Asq4LrQ3YPw7JlJgxM/XsAW2
 LAf1w4ODgxAIeIJVetM0CxNtgs+JueunrPZ5Q4IR2UYgT0m2aXMoZZRulj+JdhqG14w5
 q0jw==
X-Gm-Message-State: AOAM5323yw+V1pZguPGmwJt6EKiUxTfKqWEwnt1lnEeSZmBoIoYFV3/9
 pBUskAyxQdcMTUicnjLZsABYeR2r8X5D42rT4wK2WGH17yOkZtefF9amclfX1IQlUj70LVUkqx6
 c2U7uY1ihMx6QwbA=
X-Received: by 2002:a05:6214:20e3:: with SMTP id
 3mr13645677qvk.81.1642591848915; 
 Wed, 19 Jan 2022 03:30:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfRqqC7ZhVxhz8dahA1DoUg4n51zRp5Ep7cCIZQTlYMvKw66hBC21ZvXtO1tqKBvMomF8JPw==
X-Received: by 2002:a05:6214:20e3:: with SMTP id
 3mr13645659qvk.81.1642591848736; 
 Wed, 19 Jan 2022 03:30:48 -0800 (PST)
Received: from steredhat (host-95-238-125-214.retail.telecomitalia.it.
 [95.238.125.214])
 by smtp.gmail.com with ESMTPSA id c20sm152264qtd.20.2022.01.19.03.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 03:30:48 -0800 (PST)
Date: Wed, 19 Jan 2022 12:30:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Message-ID: <20220119113042.a4dmwe4tnfsabnmn@steredhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-6-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220117124331.1642-6-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 yechuan@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 08:43:26PM +0800, Longpeng(Mike) via wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Implements the .realize interface.
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/vdpa-dev.c         | 101 +++++++++++++++++++++++++++++++++++
> include/hw/virtio/vdpa-dev.h |   8 +++
> 2 files changed, 109 insertions(+)
>
>diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>index b103768f33..bd28cf7a15 100644
>--- a/hw/virtio/vdpa-dev.c
>+++ b/hw/virtio/vdpa-dev.c
>@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
>     return val;
> }
>
>+static void
>+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>+{
>+    /* Nothing to do */
>+}
>+
> static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
> {
>+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>+    uint32_t vdev_id, max_queue_size;
>+    struct vhost_virtqueue *vqs;
>+    int i, ret;
>+
>+    if (s->vdpa_dev_fd == -1) {
>+        s->vdpa_dev_fd = qemu_open(s->vdpa_dev, O_RDWR, errp);

So, here we are re-opening the `vdpa_dev` again (without checking if it 
is NULL).

And we re-do the same ioctls already done in 
vhost_vdpa_device_pci_realize(), so I think we should do them in a 
single place, and that place should be here.

So, what about doing all the ioctls here, setting appropriate fields in 
VhostVdpaDevice, then using that fields in 
vhost_vdpa_device_pci_realize() after qdev_realize() to set 
`class_code`, `trans_devid`, and `nvectors`?

>+        if (*errp) {
>+            return;
>+        }
>+    }
>+    s->vdpa.device_fd = s->vdpa_dev_fd;
>+
>+    max_queue_size = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
>+                                               VHOST_VDPA_GET_VRING_NUM, errp);
>+    if (*errp) {
>+        goto out;
>+    }
>+
>+    if (s->queue_size > max_queue_size) {
>+        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %d (max:%d)",
>+                   s->queue_size, max_queue_size);
>+        goto out;
>+    } else if (!s->queue_size) {
>+        s->queue_size = max_queue_size;
>+    }
>+
>+    s->num_queues = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
>+                                              VHOST_VDPA_GET_VQS_NUM, errp);
                                                 ^
VHOST_VDPA_GET_VQS_COUNT

>+    if (*errp) {
>+        goto out;
>+    }
>+
>+    if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
>+        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
>+                   s->num_queues, VIRTIO_QUEUE_MAX);
>+        goto out;
>+    }
>+
>+    s->dev.nvqs = s->num_queues;
>+    vqs = g_new0(struct vhost_virtqueue, s->dev.nvqs);
>+    s->dev.vqs = vqs;
>+    s->dev.vq_index = 0;
>+    s->dev.vq_index_end = s->dev.nvqs;
>+    s->dev.backend_features = 0;
>+    s->started = false;
>+
>+    ret = vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
>+    if (ret < 0) {
>+        error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
>+                   strerror(-ret));
>+        goto free_vqs;
>+    }
>+
>+    vdev_id = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
>+                                        VHOST_VDPA_GET_DEVICE_ID, errp);
>+    if (ret < 0) {
>+        error_setg(errp, "vhost-vdpa-device: vhost get device id failed: %s",
>+                   strerror(-ret));
>+        goto vhost_cleanup;
>+    }
>+
>+    s->config_size = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
>+                                               VHOST_VDPA_GET_CONFIG_SIZE, errp);
>+    if (*errp) {
>+        goto vhost_cleanup;
>+    }
>+    s->config = g_malloc0(s->config_size);
>+
>+    ret = vhost_dev_get_config(&s->dev, s->config, s->config_size, NULL);
>+    if (ret < 0) {
>+        error_setg(errp, "vhost-vdpa-device: get config failed");
>+        goto free_config;
>+    }
>+
>+    virtio_init(vdev, "vhost-vdpa", vdev_id, s->config_size);
>+
>+    s->virtqs = g_new0(VirtQueue *, s->dev.nvqs);
>+    for (i = 0; i < s->dev.nvqs; i++) {
>+        s->virtqs[i] = virtio_add_queue(vdev, s->queue_size,
>+                                        vhost_vdpa_device_dummy_handle_output);
>+    }
>+
>     return;
>+
>+free_config:
>+    g_free(s->config);
>+vhost_cleanup:
>+    vhost_dev_cleanup(&s->dev);
>+free_vqs:
>+    g_free(vqs);
>+out:
>+    qemu_close(s->vdpa_dev_fd);
>+    s->vdpa_dev_fd = -1;
> }
>
> static void vhost_vdpa_device_unrealize(DeviceState *dev)
>@@ -64,6 +164,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
> static Property vhost_vdpa_device_properties[] = {
>     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
>     DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),
>+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
>diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
>index e7ad349113..e0482035cf 100644
>--- a/include/hw/virtio/vdpa-dev.h
>+++ b/include/hw/virtio/vdpa-dev.h
>@@ -14,6 +14,14 @@ struct VhostVdpaDevice {
>     char *vdpa_dev;
>     int vdpa_dev_fd;
>     int32_t bootindex;
>+    struct vhost_dev dev;
>+    struct vhost_vdpa vdpa;
>+    VirtQueue **virtqs;
>+    uint8_t *config;
>+    int config_size;
>+    uint32_t num_queues;
>+    uint16_t queue_size;
>+    bool started;
> };
>
> uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp);
>-- 
>2.23.0
>
>


