Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F75628F6B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiin-0002Ga-4K; Mon, 14 Nov 2022 18:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouieM-0001o2-4E
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:58 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oufke-0004Xk-5y
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 15:08:17 -0500
Received: by mail-yb1-xb29.google.com with SMTP id y192so11415350yby.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 12:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oWwMIG5i5BpOBcHcHesJuwkrEG3ZPMD4QzUxUczIkjI=;
 b=Hyd9N7do6EV5fiy40TBCRt5VFfsaWgTaokbMXOJejNSUgVrcEf/ISL3AioLn5H4vLh
 UF8pnBbzDRuosM2Wvp/XcuWtE4BK50ZPL12q1cgUCqLBbG26hjUwpr6KVBNxyyDV+uPc
 ZOUVN6ALxsojawMROR56JO/l3Alo4RRKA8a/ND6GJ9q0orRnirBKwXVc3P3MK7BV/Tqx
 z8Kfkh88HRbWxXGGWLSFPBfXpbnw48yY7XlitMhUGUM6z25B1mD53HR2DWpq7ub2rbm1
 wWhXZg4R9CwdG47VAgzKiw3ROrrFIh5o4p7G4I7LNstvfoKTuSMZP1uINzyEMmqoImHu
 HS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oWwMIG5i5BpOBcHcHesJuwkrEG3ZPMD4QzUxUczIkjI=;
 b=klWZwJxaoUl2LzaBnqV21/FjNqZP2PD4hE/jaiV2QryOsTXTmw0Vkfkbq4s1T96F9t
 C6QNl4vPMBF+ykS0DZSZU/3lU0U6FBdG8mj98pWyMiajcT9Ise6myBsfifQCRNYgQY5i
 4NpjPWFmnYGo/ztTva4pxcuXO4MK2diJTlI5fOhq+RSHvKd100N/gfKn3lFj2FWLTJY+
 YgLK9uwwlY/FiyEOHoMFU1JYwpCmuAvUm+1E+3SQFBIiLqHV/EPp6LhAgVH5gMVdJ3Fc
 tptGKTOhnBYYp7LArCW3nLZSGzEjmkYDCnGFF393zQCfXxL9kOSv6pWvewPFLdaz7rQZ
 z/8g==
X-Gm-Message-State: ANoB5pnI7V6R5w/I8ASd/YT+7IFweOz3qGJlA60AUN54FISOV4onhDPh
 DUKGjga7KDJbxBTE6vrJurj0cpUP3zsuS6wUuT0=
X-Google-Smtp-Source: AA0mqf5M77KPWToN/46behy8Zr3X/gBFHM1UhG5KGYq944moxHqqbvMGeNi/uwB8rpWdj+MczvNy94s2repqZVLRw6I=
X-Received: by 2002:a25:664a:0:b0:6d7:5e6f:2a46 with SMTP id
 z10-20020a25664a000000b006d75e6f2a46mr14718205ybm.118.1668456493746; Mon, 14
 Nov 2022 12:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20221028191648.964076-1-alxndr@bu.edu>
 <20221028191648.964076-2-alxndr@bu.edu>
In-Reply-To: <20221028191648.964076-2-alxndr@bu.edu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 Nov 2022 15:08:01 -0500
Message-ID: <CAJSP0QU3k2FwVCG4uVBqtrweLtzdHn=czyS5WVHUWndOKLRxew@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] memory: associate DMA accesses with the initiator
 Device
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 28 Oct 2022 at 15:19, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> Add transitionary DMA APIs which associate accesses with the device
> initiating them. The modified APIs maintain a "MemReentrancyGuard" in
> the DeviceState, which is used to prevent DMA re-entrancy issues.
> The MemReentrancyGuard is set/checked when entering IO handlers and when
> initiating a DMA access.
>
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
>
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
>
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/qdev-core.h |  2 ++
>  include/sysemu/dma.h   | 41 +++++++++++++++++++++++++++++++++++++++++
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  4 files changed, 59 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 785dd5a56e..ab78d211af 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -8,6 +8,7 @@
>  #include "qom/object.h"
>  #include "hw/hotplug.h"
>  #include "hw/resettable.h"
> +#include "sysemu/dma.h"
>
>  enum {
>      DEV_NVECTORS_UNSPECIFIED = -1,
> @@ -194,6 +195,7 @@ struct DeviceState {
>      int alias_required_for_version;
>      ResettableState reset;
>      GSList *unplug_blockers;
> +    MemReentrancyGuard mem_reentrancy_guard;
>  };
>
>  struct DeviceListener {
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index a1ac5bc1b5..879b666bbb 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -15,6 +15,10 @@
>  #include "block/block.h"
>  #include "block/accounting.h"
>
> +typedef struct {
> +    bool engaged_in_io;
> +} MemReentrancyGuard;

Please add a doc comment that explains the purpose of MemReentrancyGuard.

> +
>  typedef enum {
>      DMA_DIRECTION_TO_DEVICE = 0,
>      DMA_DIRECTION_FROM_DEVICE = 1,
> @@ -321,4 +325,41 @@ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
>  uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
>                                 int max_addr_bits);
>
> +#define REENTRANCY_GUARD(func, ret_type, dev, ...) \
> +    ({\
> +     ret_type retval;\
> +     MemReentrancyGuard prior_guard_state = dev->mem_reentrancy_guard;\
> +     dev->mem_reentrancy_guard.engaged_in_io = 1;\

Please use true/false for bool constants. That way it's obvious to the
reader that this is a bool and not an int.

> +     retval = func(__VA_ARGS__);\
> +     dev->mem_reentrancy_guard = prior_guard_state;\
> +     retval;\
> +     })

I'm trying to understand the purpose of this macro. It restores the
previous state of mem_reentrancy_guard, implying that this is
sometimes called when the guard is already true (i.e. from
MemoryRegion callbacks). It can also be called in the BH case and I
think that's why mem_reentrancy_guard is set to true here. Using BHs
to avoid deep stacks and re-entrancy is a valid technique though, and
this macro seems to be designed to prevent it. Can you explain a bit
more about how this is supposed to be used?

If this macro is a public API that other parts of QEMU will use, then
the following approach is more consistent with how the lock guard
macros work:

  REENTRANCY_GUARD(dev) {
      retval = func(1, 2, 3);
  }

It's also more readable then:

  REENTRANCY_GUARD(func, int, dev, 1, 2, 3);

?

> +#define REENTRANCY_GUARD_NORET(func, dev, ...) \
> +    ({\
> +     MemReentrancyGuard prior_guard_state = dev->mem_reentrancy_guard;\
> +     dev->mem_reentrancy_guard.engaged_in_io = 1;\
> +     func(__VA_ARGS__);\
> +     dev->mem_reentrancy_guard = prior_guard_state;\
> +     })
> +#define dma_memory_rw_guarded(dev, ...) \
> +    REENTRANCY_GUARD(dma_memory_rw, MemTxResult, dev, __VA_ARGS__)
> +#define dma_memory_read_guarded(dev, ...) \
> +    REENTRANCY_GUARD(dma_memory_read, MemTxResult, dev, __VA_ARGS__)
> +#define dma_memory_write_guarded(dev, ...) \
> +    REENTRANCY_GUARD(dma_memory_write, MemTxResult, dev, __VA_ARGS__)
> +#define dma_memory_set_guarded(dev, ...) \
> +    REENTRANCY_GUARD(dma_memory_set, MemTxResult, dev, __VA_ARGS__)
> +#define dma_memory_map_guarded(dev, ...) \
> +    REENTRANCY_GUARD(dma_memory_map, void*, dev, __VA_ARGS__)
> +#define dma_memory_unmap_guarded(dev, ...) \
> +    REENTRANCY_GUARD_NORET(dma_memory_unmap, dev, __VA_ARGS__)
> +#define ldub_dma_guarded(dev, ...) \
> +    REENTRANCY_GUARD(ldub_dma, MemTxResult, dev, __VA_ARGS__)
> +#define stb_dma_guarded(dev, ...) \
> +    REENTRANCY_GUARD(stb_dma, MemTxResult, dev, __VA_ARGS__)
> +#define dma_buf_read_guarded(dev, ...) \
> +    REENTRANCY_GUARD(dma_buf_read, MemTxResult, dev, __VA_ARGS__)
> +#define dma_buf_write_guarded(dev, ...) \
> +    REENTRANCY_GUARD(dma_buf_read, MemTxResult, dev, __VA_ARGS__)
> +
>  #endif
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..c44dc75149 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      uint64_t access_mask;
>      unsigned access_size;
>      unsigned i;
> +    DeviceState *dev = NULL;
>      MemTxResult r = MEMTX_OK;
>
>      if (!access_size_min) {
> @@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>          access_size_max = 4;
>      }
>
> +    /* Do not allow more than one simultanous access to a device's IO Regions */
> +    if (mr->owner &&
> +            !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {

Why are readonly MemoryRegions exempt?

> +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> +        if (dev->mem_reentrancy_guard.engaged_in_io) {
> +            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +            return MEMTX_ERROR;
> +        }
> +        dev->mem_reentrancy_guard.engaged_in_io = true;
> +    }
> +
>      /* FIXME: support unaligned access? */
>      access_size = MAX(MIN(size, access_size_max), access_size_min);
>      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> @@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>                          access_mask, attrs);
>          }
>      }
> +    if (dev) {
> +        dev->mem_reentrancy_guard.engaged_in_io = false;
> +    }
>      return r;
>  }
>
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index 22606dc27b..62d04ea9a7 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
>  memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
> +memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
> --
> 2.27.0
>
>

