Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDC451D275
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:41:53 +0200 (CEST)
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmsb2-00040l-UG
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmsVT-0006x2-FQ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:36:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:31059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmsVR-0001hB-Gg
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651822564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY/iUE4i5nNjeBILJgrUaid9nuAdAvRgXw9E57OrWqg=;
 b=Y0HKTXpAZ9CTiF7WKTMw5VGt3wQvJhWp4bhKL/X181zXEa4zF8iLBLSTfEYvhOp6uD/k9q
 MHNCb6O/Fh9dT6laKUNXTb6RkZfoPMPesVDpwVtP+0uWVgNO/B0v3rZQXmVClXd06qg7E0
 i6wrRTMlypPiQLCDhf19bCV/H3ePj9k=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-iSHEQkTINkiDOOAfIedJlg-1; Fri, 06 May 2022 03:36:01 -0400
X-MC-Unique: iSHEQkTINkiDOOAfIedJlg-1
Received: by mail-lf1-f71.google.com with SMTP id
 x36-20020a056512132400b0044b07b24746so2803014lfu.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 00:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UY/iUE4i5nNjeBILJgrUaid9nuAdAvRgXw9E57OrWqg=;
 b=tkFB2v0Z3u3sbIAXOgtEPPlKkAIkoIgldk8v3OZRQglAuC4MdN8FylCa6RjPrIkV8b
 2T65UUUSCAP+gAMXctSfsVRXQ87KyNdYqzT5w4+NAQO+t+dnH7cEEoEw//L53ee2Kbt+
 Kv9kRSdIZ++enEsmnYOOj8vpyBjomX/UbzWL13uG1IwQMcWj9RI7/NoR0wsPbbSuhEqY
 h7RWMr0RAq9J5BT6LjbV/kqkpn6TkmwGQkWNgaFtk7HsGYaZYwo6Ff+9hB8pZpbUQELH
 RVNUwqJbnpbAO6qWnhMFUobXKPdsV+exYgj/6Pm7oEJEQOVKchEnNMrA8eUAw9FgDV7m
 5POw==
X-Gm-Message-State: AOAM530xBTXZyRpdtusoCL0L/TK4RhHBI3mboW63RtaYCgOGbGMLwrxn
 MMmAYBh8zKSpEhHVXBJ0FAk/ZvTwxQLznRJav+g2rToMdj78McFsyDuqcf/6msx/3yTEUtsrbLH
 gPThgCTnM7ZsIMUhb8+alaPESNK5FvHg=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr1602717lfv.257.1651822559500; 
 Fri, 06 May 2022 00:35:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH05MaP0KxSGDoVcByeScb87zMcf2u9mc5gX6MXjNQbyqhsgPd3dATmVGTNX1aK5v3aWUgUJIWMdJekNrKdJg=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr1602703lfv.257.1651822559283; Fri, 06
 May 2022 00:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
 <1651812874-31967-7-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1651812874-31967-7-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 6 May 2022 15:35:48 +0800
Message-ID: <CACGkMEum+x-MXJ4CruRhZ9fvLma=fMeWxORND7Fr3+GRxFL-gA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] virtio-net: don't handle mq request in userspace
 handler for vhost-vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 eperezma <eperezma@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.74; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 6, 2022 at 12:55 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> virtio_queue_host_notifier_read() tends to read pending event
> left behind on ioeventfd in the vhost_net_stop() path, and
> attempts to handle outstanding kicks from userspace vq handler.
> However, in the ctrl_vq handler, virtio_net_handle_mq() has a
> recursive call into virtio_net_set_status(), which may lead to
> segmentation fault as shown in below stack trace:
>
> 0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at ../hw/core/qdev.c:376
> 1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
> 2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at ../hw/virtio/vhost.c:318
> 3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>, buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at ../hw/virtio/vhost.c:336
> 4  0x000055f800d71867 in vhost_virtqueue_stop (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590, vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
> 5  0x000055f800d7406c in vhost_dev_stop (hdev=hdev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
> 6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
> 7  0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
>    at ../hw/net/vhost_net.c:423
> 8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
> 9  0x000055f800d4e628 in virtio_net_set_status (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
> 10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at ../hw/net/virtio-net.c:1408
> 11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590, vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
> 12 0x000055f800d69f37 in virtio_queue_host_notifier_read (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
> 13 0x000055f800d69f37 in virtio_queue_host_notifier_read (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
> 14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
> 15 0x000055f800d73106 in vhost_dev_disable_notifiers (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
>    at ../../../include/hw/virtio/virtio-bus.h:35
> 16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
> 17 0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
>    at ../hw/net/vhost_net.c:423
> 18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
> 19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
> 20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590, val=<optimized out>) at ../hw/virtio/virtio.c:1945
> 21 0x000055f800d11d9d in vm_state_notify (running=running@entry=false, state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
> 22 0x000055f800d04e7a in do_vm_stop (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false) at ../softmmu/cpus.c:262
> 23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
> 24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
> 25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51
>
> For now, temporarily disable handling MQ request from the ctrl_vq
> userspace hanlder to avoid the recursive virtio_net_set_status()
> call. Some rework is needed to allow changing the number of
> queues without going through a full virtio_net_set_status cycle,
> particularly for vhost-vdpa backend.
>
> This patch will need to be reverted as soon as future patches of
> having the change of #queues handled in userspace is merged.
>
> Fixes: 402378407db ("vhost-vdpa: multiqueue support")
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/virtio-net.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f0bb29c..e263116 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1381,6 +1381,7 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
>      uint16_t queue_pairs;
> +    NetClientState *nc = qemu_get_queue(n->nic);
>
>      virtio_net_disable_rss(n);
>      if (cmd == VIRTIO_NET_CTRL_MQ_HASH_CONFIG) {
> @@ -1412,6 +1413,18 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
>          return VIRTIO_NET_ERR;
>      }
>
> +    /* Avoid changing the number of queue_pairs for vdpa device in
> +     * userspace handler. A future fix is needed to handle the mq
> +     * change in userspace handler with vhost-vdpa. Let's disable
> +     * the mq handling from userspace for now and only allow get
> +     * done through the kernel. Ripples may be seen when falling
> +     * back to userspace, but without doing it qemu process would
> +     * crash on a recursive entry to virtio_net_set_status().
> +     */
> +    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        return VIRTIO_NET_ERR;
> +    }
> +
>      n->curr_queue_pairs = queue_pairs;
>      /* stop the backend before changing the number of queue_pairs to avoid handling a
>       * disabled queue */
> --
> 1.8.3.1
>


