Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08651408E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 04:25:26 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkGJx-0005CQ-4Z
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 22:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nkGIo-0004Vy-3i
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nkGIk-0000wG-Ct
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651199047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrx2THOnSpguT6NrBa6Xh3D5bzL0L0xAUBJPKqa9vSw=;
 b=NcM2yJBUACtlEkbZCP1olJppLMbBgEfQSuKSwqlB36sTsEcj3yaJn2faxUUSQgt9DIm5MX
 Hj9ym2G/fvxEINIE8M4JRdz6upXN1QfJMinVDX1yURVEqiKcI6UPCSUq0/TPOE8oE6mpQl
 Ttb1jvDwhYOUz8zXiPgRvWbYmm9eUvo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-SyNELXCROdam3Q-WbzlnwA-1; Thu, 28 Apr 2022 22:24:04 -0400
X-MC-Unique: SyNELXCROdam3Q-WbzlnwA-1
Received: by mail-pl1-f197.google.com with SMTP id
 s2-20020a17090302c200b00158ea215fa2so3568975plk.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 19:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vrx2THOnSpguT6NrBa6Xh3D5bzL0L0xAUBJPKqa9vSw=;
 b=PUqtBcF0pB4q03IwWrqZn+hUdKEkEp/8QqxbulgCfIvQLS/ADt27L44xvTNa02ll2r
 ThyOP8hYGV3Xl/UJt3lzrDXRFprN66WVDh4JRHy0Z2DfSQMUX46zRj5dCellYzaxZokH
 WP9u+HHyBgd0XEqHOHTrZUZ4E529rVfKR4fjfiZFFKNkt6d+Nns19r/5AvzV4dCaZD/Z
 wJX0aeiXwiLvgLLDAg/3UvE2u4uLSB/MzNr5wVZR3lrtIk6jRGz1vbbCFD8mYdfN/B5p
 8sxdrwafCkOzQudXyTyKSl+stgP9NLT+hj8DATDysifRaRVjmmm6GjTpG//IIZkxKpZp
 lT4w==
X-Gm-Message-State: AOAM533kTSvuKnNswBBfgpWzYBQEbIsqTwCS0UoknkDMrQ2gsu1HKnMx
 ek0Vp9WDFZir0q+DM83ge1TNNtHjg/0GolSERR8wRxCRAdKPF98wkrRraHcUyxo4/+lX8e2K+qg
 t70C6fwo+sHGb7x0=
X-Received: by 2002:a05:6a00:140e:b0:4e1:c81a:625c with SMTP id
 l14-20020a056a00140e00b004e1c81a625cmr37913669pfu.39.1651199043363; 
 Thu, 28 Apr 2022 19:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7PZ1QNSy8LSN+jJhOVdZjx4pP0M6C7LG+k6RLWhriiyq8JDPodqywWUNcgkhklanwHuk3sw==
X-Received: by 2002:a05:6a00:140e:b0:4e1:c81a:625c with SMTP id
 l14-20020a056a00140e00b004e1c81a625cmr37913646pfu.39.1651199043000; 
 Thu, 28 Apr 2022 19:24:03 -0700 (PDT)
Received: from [10.72.13.163] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 mn12-20020a17090b188c00b001cd4989ff64sm7931540pjb.43.2022.04.28.19.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 19:24:02 -0700 (PDT)
Message-ID: <ba73db72-c8b5-0028-bf15-56dba91af7b6@redhat.com>
Date: Fri, 29 Apr 2022 10:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/5] virtio-net: align ctrl_vq index for non-mq guest
 for vhost_vdpa
Content-Language: en-US
To: Si-Wei Liu <si-wei.liu@oracle.com>, qemu-devel@nongnu.org
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
 <1651048216-3365-3-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <1651048216-3365-3-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, sgarzare@redhat.com, eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/27 16:30, Si-Wei Liu 写道:
> With MQ enabled vdpa device and non-MQ supporting guest e.g.
> booting vdpa with mq=on over OVMF of single vqp, below assert
> failure is seen:
>
> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>
> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>     at ../hw/virtio/virtio-pci.c:974
> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>     at ../hw/net/vhost_net.c:361
> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>     at ../softmmu/memory.c:492
> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>     at ../softmmu/memory.c:1504
> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>     at ../softmmu/physmem.c:2914
> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>     attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>
> The cause for the assert failure is due to that the vhost_dev index
> for the ctrl vq was not aligned with actual one in use by the guest.
> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
> if guest doesn't support multiqueue, the guest vq layout would shrink
> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
> This results in ctrl_vq taking a different vhost_dev group index than
> the default. We can map vq to the correct vhost_dev group by checking
> if MQ is supported by guest and successfully negotiated. Since the
> MQ feature is only present along with CTRL_VQ, we make sure the index
> 2 is only meant for the control vq while MQ is not supported by guest.
>
> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---
>   hw/net/virtio-net.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index ffb3475..8ca0b80 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3171,8 +3171,17 @@ static NetClientInfo net_virtio_info = {
>   static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>       assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
> +           error_report("virtio-net: bogus vq index ignored");


This seems trigger-able by guest.

Other looks good.

Thanks


> +           return false;
> +        }
> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>       return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>   }
>   
> @@ -3180,8 +3189,17 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>                                              bool mask)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>       assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
> +           error_report("virtio-net: bogus vq index ignored");
> +           return;
> +        }
> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>       vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>                                vdev, idx, mask);
>   }


