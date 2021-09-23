Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6A415B08
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:34:57 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTL84-00043S-RQ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mTKsL-00088D-Bw
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mTKsH-0003Or-VP
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632388716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0nfkoTm1+gFM06a6SRZanFP20VjBjy+qzh4ODrmqeI=;
 b=IQFJLRp8siUOqSVhU3Alv8Wgss5eQS3TbPpjjjqN2I6iXqqffDmlALsqYxIup1FUqFEkwP
 Hkh6N1AdK3VDezJwpCNeNQVMVIOKu6Pg0+QeP9S6pW80qmqiLyVFdCOP1UFadqvdMlUX+u
 RAccteQ9bSqtnUTGstTmqIe68Gbqv44=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-_M5XApKeM1Og60YdE6IVxg-1; Thu, 23 Sep 2021 05:18:32 -0400
X-MC-Unique: _M5XApKeM1Og60YdE6IVxg-1
Received: by mail-ed1-f71.google.com with SMTP id
 e7-20020aa7d7c7000000b003d3e6df477cso6101350eds.20
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u0nfkoTm1+gFM06a6SRZanFP20VjBjy+qzh4ODrmqeI=;
 b=vf3te08NmWh028yZE/2OSeDFUzhvHQNHQLlBdUs9lZogeTxRytLfotjDcOkV40pfPe
 hsgfX/19IFmiviP4p6lFOfbYdmiavnW1zTqcmNbHhhQudzhaefmuk2BXR73iM9j0EhKd
 WadU3jDk0Rq2ISGc8cHm0aaIhcp22uSlSphDUNDm6fKEkS1qiyXzR5XMWzdtW2iStV4J
 vMF7qyTmTXIqfDo/E9P/NLh4HrgF54kv8HRPbn+Z+rCgKMEEKbeUL5IlsOUe/kzF7c10
 wgOn6LVF0Nx1U9gaRw3rQewv7QC6jlF8TXxK0pn1gSkcOiQu9xnw4mbmdUhRFyHcWhvU
 KF4w==
X-Gm-Message-State: AOAM5313CM/RJ75I3TFqFVMwbz9LrsOfe9eQRvuH1J1+9BE8GoJ5qd3d
 DmZgXaaRE2Z/SLG/si+JIIJx9+wTFSd9sgVPIsnmnQs9VSUXp55RF5q3eBda9gC6RmrqCWtq4bi
 iU8JQob01JQbO/0I=
X-Received: by 2002:a17:906:942:: with SMTP id
 j2mr3963138ejd.303.1632388711516; 
 Thu, 23 Sep 2021 02:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxB6kMS+ebNK3ESPL5P8v9jaxf9aGxb7qxE65qIVG1VGbZamLgJoxtuc42gMKcxQJdGS/WDg==
X-Received: by 2002:a17:906:942:: with SMTP id
 j2mr3963116ejd.303.1632388711162; 
 Thu, 23 Sep 2021 02:18:31 -0700 (PDT)
Received: from steredhat (host-79-26-68-6.retail.telecomitalia.it.
 [79.26.68.6])
 by smtp.gmail.com with ESMTPSA id 90sm3031913edc.36.2021.09.23.02.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 02:18:30 -0700 (PDT)
Date: Thu, 23 Sep 2021 11:18:28 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v7] virtio/vsock: add two more queues for datagram types
Message-ID: <20210923091828.e2ao3mra6ps5osc2@steredhat>
References: <CAP_N_Z8p+qsOAm15TtUFhCG-bJHM+zOQ4UJkr4XBdUQnm2wtzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z8p+qsOAm15TtUFhCG-bJHM+zOQ4UJkr4XBdUQnm2wtzQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 10:36:24AM -0700, Jiang Wang . wrote:
>On Wed, Sep 22, 2021 at 2:23 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Wed, Sep 22, 2021 at 12:00:24AM +0000, Jiang Wang wrote:
>> >Datagram sockets are connectionless and unreliable.
>> >The sender does not know the capacity of the receiver
>> >and may send more packets than the receiver can handle.
>> >
>> >Add two more dedicate virtqueues for datagram sockets,
>> >so that it will not unfairly steal resources from
>> >stream and future connection-oriented sockets.
>> >
>> >The two new virtqueues are enabled by default and will
>> >be removed if the guest does not support. This will help
>> >migration work.
>> >
>> >btw: enable_dgram argument in vhost_vsock_common_realize
>> >is redundant for now, but will be used later when we
>> >want to disable DGRAM feature bit for old versions.
>> >
>> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>> >---
>> >v1 -> v2: use qemu cmd option to control number of queues,
>> >        removed configuration settings for dgram.
>> >v2 -> v3: use ioctl to get features and decide number of
>> >        virt queues, instead of qemu cmd option.
>> >v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>> >        in vhost_vsock_common_realize to indicate dgram is supported or not.
>> >v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
>> >        enable_dgram
>> >v5 -> v6: fix style errors. Imporve error handling of
>> >        vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and another one.
>> >v6 -> v7: Always enable dgram for vhost-user and vhost kernel.
>> >        Delete unused virtqueues at the beginning of
>> >        vhost_vsock_common_start for migration. Otherwise, migration will fail.
>> >
>> > hw/virtio/vhost-user-vsock.c                  |  2 +-
>> > hw/virtio/vhost-vsock-common.c                | 32 +++++++++++++++++--
>> > hw/virtio/vhost-vsock.c                       |  6 +++-
>> > include/hw/virtio/vhost-vsock-common.h        |  6 ++--
>> > include/hw/virtio/vhost-vsock.h               |  3 ++
>> > include/standard-headers/linux/virtio_vsock.h |  1 +
>> > 6 files changed, 43 insertions(+), 7 deletions(-)
>> >
>> >diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>> >index 6095ed7349..9823a2f3bd 100644
>> >--- a/hw/virtio/vhost-user-vsock.c
>> >+++ b/hw/virtio/vhost-user-vsock.c
>> >@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>> >         return;
>> >     }
>> >
>> >-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>> >+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", true);
>> >
>> >     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>> >
>> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>> >index 4ad6e234ad..7d89b4d242 100644
>> >--- a/hw/virtio/vhost-vsock-common.c
>> >+++ b/hw/virtio/vhost-vsock-common.c
>> >@@ -26,6 +26,18 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
>> >     int ret;
>> >     int i;
>> >
>> >+    if (!virtio_has_feature(vdev->guest_features, VIRTIO_VSOCK_F_DGRAM)) {
>> >+        struct vhost_virtqueue *vqs;
>> >+        virtio_delete_queue(vvc->dgram_recv_vq);
>> >+        virtio_delete_queue(vvc->dgram_trans_vq);
>> >+
>>
>> Are you sure it works removing queues here?
>> The event_queue would always be #4, but the guest will use #2 which
>> we're removing.
>>
>Yes, this works. In fact, I should include this in v6 and my tests done
>in my previous emails have these changes. But before I submitted the patch,
>I thought this code was redundant and removed it without further testing.

Just tried on an host that doesn't support F_DGRAM and I have the 
following errors:
qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=6: vhost_set_vring_call failed: No buffer space available (105)
qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=6: Failed to initialize virtqueue 2: No buffer space available

I thinks we should re-add the feature discovery before call 
vhost_dev_init().

>
>To explain it, I think the event queue number does not matter for the
>vhost and qemu. The vhost-vsock kernel module does not allocate any
>data structure for the event queue.  Qemu also only allocates an array of
>size 2 or 4 for the tx, rx queues. The event queue is handled separately.
>
>The event queue number only shows up in the spec, but in real code, I don't
>see anywhere that the event queue number is used explicitly or implicitly.
>The Event queue looks independent of tx, rx queues.

Yep, it is used in the linux driver. Look at 
virtio_transport_event_work(), it uses VSOCK_VQ_EVENT (2).

The main test to do is to migrate a guest with active connections that 
doesn't support F_DGRAM on an host that support it and check if, after 
the migration, the connections are reset and the CID updated.

I think is not working now.

>
>> >+        vqs = vvc->vhost_dev.vqs;
>> >+        vvc->vhost_dev.nvqs = MAX_VQS_WITHOUT_DGRAM;
>> >+        vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue,
>> >+                                   vvc->vhost_dev.nvqs);
>> >+        g_free(vqs);
>> >+    }
>> >+
>> >     if (!k->set_guest_notifiers) {
>> >         error_report("binding does not support guest notifiers");
>> >         return -ENOSYS;
>> >@@ -196,9 +208,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>> >     return 0;
>> > }
>> >
>> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
>> >+                               bool enable_dgram)
>>                                        ^
>> It seems always true, and also unused.
>>
>Yes, I can remove it. I am just wondering when we modify the feature
>bit as in your recent seqpacket patch, do we want to change it to false when
>the feature is not supported and make the code logically more 
>resonable？
>Or do we still make it true even if the feature bit is not supported?

Maybe we need to use it because now vhost_dev_init is failing if the 
host doesn't support F_DGRAM since we are registering more queues than 
the device can handle.

>
>> > {
>> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> >+    int nvqs = MAX_VQS_WITH_DGRAM;
>> >
>> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>> >                 sizeof(struct virtio_vsock_config));
>> >@@ -209,12 +223,17 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>> >     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >                                        vhost_vsock_common_handle_output);
>> >
>> >+    vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >+                                          vhost_vsock_common_handle_output);
>> >+    vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >+                                          vhost_vsock_common_handle_output);
>> >+
>> >     /* The event queue belongs to QEMU */
>> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >                                        vhost_vsock_common_handle_output);
>> >
>> >-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
>> >-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
>> >+    vvc->vhost_dev.nvqs = nvqs;
>> >+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
>> >
>> >     vvc->post_load_timer = NULL;
>> > }
>> >@@ -227,6 +246,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>> >
>> >     virtio_delete_queue(vvc->recv_vq);
>> >     virtio_delete_queue(vvc->trans_vq);
>> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>> >+        virtio_delete_queue(vvc->dgram_recv_vq);
>> >+        virtio_delete_queue(vvc->dgram_trans_vq);
>> >+    }
>> >+
>> >+    g_free(vvc->vhost_dev.vqs);
>> >+
>> >     virtio_delete_queue(vvc->event_vq);
>> >     virtio_cleanup(vdev);
>> > }
>> >diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>> >index 1b1a5c70ed..6e315ecf23 100644
>> >--- a/hw/virtio/vhost-vsock.c
>> >+++ b/hw/virtio/vhost-vsock.c
>> >@@ -23,6 +23,7 @@
>> >
>> > const int feature_bits[] = {
>> >     VIRTIO_VSOCK_F_SEQPACKET,
>> >+    VIRTIO_VSOCK_F_DGRAM,
>> >     VHOST_INVALID_FEATURE_BIT
>> > };
>> >
>> >@@ -116,6 +117,9 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> >
>> >     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>> >+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
>> >+    }
>>
>> Take a look at
>> https://lore.kernel.org/qemu-devel/20210921161642.206461-1-sgarzare@redhat.com/
>>
>Yes, I noticed that email. Thanks for reminding me. I did not make
>similar changes yet because I want to wait for that patch to be merged.
>I can start to make similar changes in the next version.

Yep, better to wait comments on that series.

>
>> If it will be accepted, we should use something similar (e.g.
>> `datagram` prop) and handle this flag in vhost-vsock-common.
>>
>> And we should change a bit the queue handling:
>> - if QEMU (new `datagram` prop is `on` or `auto`) and the kernel
>>    supports F_DGRAM, we can allocate 5 queues.
>Agree with the new prop. But when the kernel supports F_DGRAM, qemu
>still only allocates 4 queues. As in the following code：
>
>vvc->vhost_dev.nvqs = nvqs;
>vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, 
>vvc->vhost_dev.nvqs);
>
>// nvqs will be either 2 or 4. Will not be 5. btw, in the new version, it will
>// always be 4.

Sorry, with allocating I meant virtio_add_queue() calls.

Just to be clear, I think we should do something like this:

#define VHOST_VSOCK_NVQS          3
#define VHOST_VSOCK_NVQS_DGRAM    5
#define VHOST_VSOCK_MAX_VQS       VHOST_VSOCK_NVQS_DGRAM

struct VHostVSockCommon {
     ...

     VirtQueue *vqs[VHOST_VSOCK_MAX_VQS];

     int event_vq_id;
}

void vhost_vsock_common_realize(...)
{
     int nvqs = VHOST_VSOCK_NVQS;

     ...

     if (enable_dgram) {
         nvqs = VHOST_VSOCK_NVQS_DGRAM;
     }

     ...

     for (i = 0; i < nvqs; i++) {
         vvc->vqs[i] = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
                                        vhost_vsock_common_handle_output);
     }

     /* event queue is not handled by the vhost device */
     vvc->vhost_dev.nvqs = nvqs - 1;
     vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);

     ...
}

int vhost_vsock_common_start(...)
{
     ...

     if (virtio_has_feature(vdev->guest_features, VIRTIO_VSOCK_F_DGRAM)) {
         vvc->event_vq_id = VHOST_VSOCK_NVQS_DGRAM - 1;
     } else {
         vvc->event_vq_id = VHOST_VSOCK_NVQS - 1;
     }

     ...
}

Then use `vvc->event_vq_id` in :
- vhost_vsock_common_send_transport_reset()
- vhost_vsock_common_post_load() (instead of 2 wired in the code)

Maybe in vhost_vsock_common_send_transport_reset() we can skip the 
message enqueueing if the device is not started 
(vvc->vhost_dev.started).

Thanks,
Stefano


