Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC97E3F7D38
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 22:37:46 +0200 (CEST)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIzeb-0004OX-F7
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 16:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIzde-0002z0-88
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIzda-0003RC-W9
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629923801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TP0Tqeh9FAZYbtFu9+jSndUILQmOJxP2mZgaMzMJzfU=;
 b=ZzXNdiSBl4WOi8J+vp4dGzM8KyizUhKSO/tjvJ6I2PmRaCOWZov+ZHqDUnoFtur4dj0kc9
 Uuqf1wMFuOleed5J8QqYfi/kSuMTNtiXolPljMaWK2HtnQ9WOCe6vB7sgsJw9WN6dDjvnN
 XknAZsnkhH5eMvnsGBWf7nqXr0I5m6o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-LQkiK0flNyG1a-ofHmxKVw-1; Wed, 25 Aug 2021 16:36:38 -0400
X-MC-Unique: LQkiK0flNyG1a-ofHmxKVw-1
Received: by mail-wr1-f70.google.com with SMTP id
 o9-20020a5d6849000000b001574518a85aso217558wrw.11
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 13:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TP0Tqeh9FAZYbtFu9+jSndUILQmOJxP2mZgaMzMJzfU=;
 b=spK9Wo4yAnPzCzoGzmVMN1Bva+hfMLwY7aE2Y0EjbFdaMn8Xl6ZhjeSlrkP7U2UFHS
 xympA33bPNjhmHSc6xQMmllrpaJ8XdILQLz2QGJ+XeqQ85CR0cM1IIhvbv4fiby3wlnO
 zjC5wy1YAL+5DWzU3VzkkPEfSgGmpMwefjmGsdsY83nDEba5V9M3iOModjHw9T1i4GXH
 TFSTml0ytf8ds7XQ4v/otSfbpvZC1gMcEGiIxxzDBNfjUZtQXjXEXy+hMb/0bj6CuPHw
 VvYKDkHEAEjkNNbYsrSaiMs37hCAjnPpTQ2auExS1TvgQb5EG7KVKzEZGS9SedEkih45
 NSlA==
X-Gm-Message-State: AOAM533iuyF5oTwsfatfN7qGu1cEfDSKF8D4wY9Ro07WONd36XtXT12b
 gRXojeP+MenQoL8yMhSaPJ9MZcMzrmTnj0KsY+eSCUBhCGzykpRWCu4rOWHICxTXwvUXc/m+Rp3
 M/MC7o70SvzSGjZg=
X-Received: by 2002:a1c:202:: with SMTP id 2mr328790wmc.122.1629923796062;
 Wed, 25 Aug 2021 13:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2d2wRHcbBazIH+fOGXLw/CR1PbMpPIq4O9TMik6Ls0egKFGXlWthBJ27g1j9DTHCc0KP3Fg==
X-Received: by 2002:a1c:202:: with SMTP id 2mr328769wmc.122.1629923795749;
 Wed, 25 Aug 2021 13:36:35 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z126sm665884wmc.11.2021.08.25.13.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:36:35 -0700 (PDT)
Subject: Re: [RFC PATCH] hw/virtio: Do not access vring cache if queue is not
 ready
To: qemu-devel@nongnu.org
References: <20210825200953.1684541-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ea6cdbd-4ad0-f10c-5229-a68e31fa90c2@redhat.com>
Date: Wed, 25 Aug 2021 22:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825200953.1684541-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 10:09 PM, Philippe Mathieu-Daudé wrote:
> Do not intent to access the vring MemoryRegion cache if
> the queue is not ready (no vring available).
> 
> This fixes issue #301:
> 
>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:77: void address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uint16_t, MemTxAttrs, MemTxResult *):
>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>   (gdb) bt
>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>   #4  0x0000555558f2a122 in address_space_stw_le_cached (cache=0x61300010bb70, addr=516, val=0, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:77
>   #5  0x0000555558f2964c in stw_le_phys_cached (cache=0x61300010bb70, addr=516, val=0) at include/exec/memory_ldst_phys.h.inc:109
>   #6  0x0000555558f28da8 in virtio_stw_phys_cached (vdev=0x62d00004e680, cache=0x61300010bb70, pa=516, value=0) at include/hw/virtio/virtio-access.h:196
>   #7  0x0000555558f287dc in vring_set_avail_event (vq=0x7fff5d23e800, val=0) at hw/virtio/virtio.c:428
>   #8  0x0000555558efabb7 in virtio_queue_split_set_notification (vq=0x7fff5d23e800, enable=1) at hw/virtio/virtio.c:437
>   #9  0x0000555558ef9f3c in virtio_queue_set_notification (vq=0x7fff5d23e800, enable=1) at hw/virtio/virtio.c:498
>   #10 0x0000555558c94786 in virtio_blk_handle_vq (s=0x62d00004e680, vq=0x7fff5d23e800) at hw/block/virtio-blk.c:795
>   #11 0x0000555558cb96c2 in virtio_blk_data_plane_handle_output (vdev=0x62d00004e680, vq=0x7fff5d23e800) at hw/block/dataplane/virtio-blk.c:165
>   #12 0x0000555558f35937 in virtio_queue_notify_aio_vq (vq=0x7fff5d23e800) at hw/virtio/virtio.c:2323
>   #13 0x0000555558f264b3 in virtio_queue_host_notifier_aio_read (n=0x7fff5d23e87c) at hw/virtio/virtio.c:3532
>   #14 0x0000555559a9cd3e in aio_dispatch_handler (ctx=0x613000063000, node=0x60d000008f40) at util/aio-posix.c:329
>   #15 0x0000555559a963ae in aio_dispatch_handlers (ctx=0x613000063000) at util/aio-posix.c:372
>   #16 0x0000555559a95f82 in aio_dispatch (ctx=0x613000063000) at util/aio-posix.c:382
> 
> and  #302:
> 
>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>   (gdb) bt
>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492
> 
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/301
> BugLink: https://bugs.launchpad.net/qemu/+bug/1910941
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Could be more readable to use virtio_queue_ready()
> 
> RFC because I have no clue about this hot path code,
> I simply looked at the backtraces.
> ---
>  hw/virtio/virtio.c | 82 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 874377f37a7..be1ec9e05ef 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -289,26 +289,38 @@ static VRingMemoryRegionCaches *vring_get_region_caches(struct VirtQueue *vq)
>  /* Called within rcu_read_lock().  */
>  static inline uint16_t vring_avail_flags(VirtQueue *vq)
>  {
> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> -    hwaddr pa = offsetof(VRingAvail, flags);
> +    VRingMemoryRegionCaches *caches;
> +    hwaddr pa;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return 0;
> +    }
> +
> +    caches = vring_get_region_caches(vq);
>      if (!caches) {
>          return 0;
>      }
>  
> +    pa = offsetof(VRingAvail, flags);
>      return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>  }
>  
>  /* Called within rcu_read_lock().  */
>  static inline uint16_t vring_avail_idx(VirtQueue *vq)
>  {
> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> -    hwaddr pa = offsetof(VRingAvail, idx);
> +    VRingMemoryRegionCaches *caches;
> +    hwaddr pa;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return 0;
> +    }
> +
> +    caches = vring_get_region_caches(vq);
>      if (!caches) {
>          return 0;
>      }
>  
> +    pa = offsetof(VRingAvail, idx);
>      vq->shadow_avail_idx = virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>      return vq->shadow_avail_idx;
>  }
> @@ -316,13 +328,19 @@ static inline uint16_t vring_avail_idx(VirtQueue *vq)
>  /* Called within rcu_read_lock().  */
>  static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
>  {
> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> -    hwaddr pa = offsetof(VRingAvail, ring[i]);
> +    VRingMemoryRegionCaches *caches;
> +    hwaddr pa;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return 0;
> +    }
> +
> +    caches = vring_get_region_caches(vq);
>      if (!caches) {
>          return 0;
>      }
>  
> +    pa = offsetof(VRingAvail, ring[i]);
>      return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>  }

Self-NAck.

While the previous part could be OK, what follows is crap (checking
avail instead of used) so please disregard this patch.

> @@ -336,13 +354,19 @@ static inline uint16_t vring_get_used_event(VirtQueue *vq)
>  static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
>                                      int i)
>  {
> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> -    hwaddr pa = offsetof(VRingUsed, ring[i]);
> +    VRingMemoryRegionCaches *caches;
> +    hwaddr pa;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return;
> +    }
> +
> +    caches = vring_get_region_caches(vq);
>      if (!caches) {
>          return;
>      }
>  
> +    pa = offsetof(VRingUsed, ring[i]);
>      virtio_tswap32s(vq->vdev, &uelem->id);
>      virtio_tswap32s(vq->vdev, &uelem->len);
>      address_space_write_cached(&caches->used, pa, uelem, sizeof(VRingUsedElem));
> @@ -352,23 +376,35 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
>  /* Called within rcu_read_lock().  */
>  static uint16_t vring_used_idx(VirtQueue *vq)
>  {
> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> -    hwaddr pa = offsetof(VRingUsed, idx);
> +    VRingMemoryRegionCaches *caches;
> +    hwaddr pa;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return 0;
> +    }
> +
> +    caches = vring_get_region_caches(vq);
>      if (!caches) {
>          return 0;
>      }
>  
> +    pa = offsetof(VRingUsed, idx);
>      return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
>  }
>  
>  /* Called within rcu_read_lock().  */
>  static inline void vring_used_idx_set(VirtQueue *vq, uint16_t val)
>  {
> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> -    hwaddr pa = offsetof(VRingUsed, idx);
> +    VRingMemoryRegionCaches *caches;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return;
> +    }
> +
> +    caches = vring_get_region_caches(vq);
>      if (caches) {
> +        hwaddr pa = offsetof(VRingUsed, idx);
> +
>          virtio_stw_phys_cached(vq->vdev, &caches->used, pa, val);
>          address_space_cache_invalidate(&caches->used, pa, sizeof(val));
>      }
> @@ -379,17 +415,22 @@ static inline void vring_used_idx_set(VirtQueue *vq, uint16_t val)
>  /* Called within rcu_read_lock().  */
>  static inline void vring_used_flags_set_bit(VirtQueue *vq, int mask)
>  {
> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> -    VirtIODevice *vdev = vq->vdev;
> -    hwaddr pa = offsetof(VRingUsed, flags);
> +    VRingMemoryRegionCaches *caches;
> +    hwaddr pa;
>      uint16_t flags;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return;
> +    }
> +
> +    caches = vring_get_region_caches(vq);
>      if (!caches) {
>          return;
>      }
>  
> +    pa = offsetof(VRingUsed, flags);
>      flags = virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
> -    virtio_stw_phys_cached(vdev, &caches->used, pa, flags | mask);
> +    virtio_stw_phys_cached(vq->vdev, &caches->used, pa, flags | mask);
>      address_space_cache_invalidate(&caches->used, pa, sizeof(flags));
>  }
>  
> @@ -401,6 +442,10 @@ static inline void vring_used_flags_unset_bit(VirtQueue *vq, int mask)
>      hwaddr pa = offsetof(VRingUsed, flags);
>      uint16_t flags;
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return;
> +    }
> +
>      if (!caches) {
>          return;
>      }
> @@ -415,10 +460,15 @@ static inline void vring_set_avail_event(VirtQueue *vq, uint16_t val)
>  {
>      VRingMemoryRegionCaches *caches;
>      hwaddr pa;
> +
>      if (!vq->notification) {
>          return;
>      }
>  
> +    if (unlikely(!vq->vring.avail)) {
> +        return;
> +    }
> +
>      caches = vring_get_region_caches(vq);
>      if (!caches) {
>          return;
> 


