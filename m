Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FC4DD987
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:17:08 +0100 (CET)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBXW-00082i-RF
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:17:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBQl-0002Xc-U4
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:10:08 -0400
Received: from [2607:f8b0:4864:20::b31] (port=35477
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBQj-0005dd-BS
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:10:06 -0400
Received: by mail-yb1-xb31.google.com with SMTP id o5so15510890ybe.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mxm8ZflVEThFiYpwJIrnRZrCckjsJfPOzJWkyEEPbnM=;
 b=nUtmmggZZgqt4isBacXu73zOHffbC+kpl/i0q4RnsABgVv4lbZIrJf4eG2KRcv6VZa
 GaOTEf3FfZeaYaqZLnH/vD2OY+dHBOjV+6bMh01EJelADxyr0pzkru6U+2/YfBoD8uhr
 /cM8IbWEGtUQssuYIXvvm8WS5BAQJ9HVwgr7jeA0usJAU/c3HTlz4/yU2gy8fEyJgU0z
 SaO3eFe21a9C11ehqdVD5rHyyFJykvrqUdOImqIwge/S4oBzIbb4O0G3hFvwtwKIQn3g
 SW2BVZdyzCnKbmWR+aIDmBqegcBnmbI7w05g2cOIccG39sonvZXCkv232CzZJx3UWWqE
 ZYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mxm8ZflVEThFiYpwJIrnRZrCckjsJfPOzJWkyEEPbnM=;
 b=utfLM9r5zGDwZs9zzx2rWBluk0BtdyNqCbP9gbqsPtRbSchgw3dkY7EUgyIiaJ01Ab
 3mt6okYX8DJXJui1ywltgj5ZzAj6MVmUbVMjYBe/jDb/3y2hKy1gaEgdmWZ4v2s3AD1w
 TpIKcOK4pIwF/AABi2Rlf/6gwiJhs6mnVXqDgZJJQt7mcM4FO+tbOk34e4W3iOkaStb4
 dsamNLeG5kHaMs1BOqpjMNFhLRRcVeKWmD7ezBjejul+Cn45lLgUc7P0vuJnuZuz3ZdD
 7wddJ5BzPmuAbAbpNVYFbk0BAZ6JipSqNhxLDtRmegb+C03VWHVJR+tbpNEDw7OQZRk0
 /rmQ==
X-Gm-Message-State: AOAM532md9gVPaWw7dOGb9c6NJ9wGnej1MpbyXosKiobZSPV1/Sw3Qk7
 dGfF0XbX3nq+/u0yQxKyPguYWIv7u6Yl21VaiIMy1w==
X-Google-Smtp-Source: ABdhPJz6/MrnVvs+QyH5SRas6EozPXFE4TVAwMnul9IWTGnWRwtst7aTLgcpOK8HT88jRO7wYPfvdZvCmFT4Bv51Qos=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr9310206ybp.39.1647605404098; Fri, 18
 Mar 2022 05:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220302130417.18551-1-ubzeme@gmail.com>
 <20220302130417.18551-3-ubzeme@gmail.com>
In-Reply-To: <20220302130417.18551-3-ubzeme@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 12:09:52 +0000
Message-ID: <CAFEAcA93FYBgU0uof6FSh6xsPuzFTJ3NC8JV4VtxkQRb83-g+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] hvf: simplify data structures and codes of memory
 related functions
To: Yan-Jie Wang <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 13:04, Yan-Jie Wang <ubzeme@gmail.com> wrote:
>
> * Remove mac_slot and use hvf_slot only. The function of the two structures
>   are similar.
>
> * Refactor function hvf_set_phys_mem():
>  - Remove unnecessary checks because any modified memory sections
>    will be removed first (region_del called first) before being added.
>    Therefore, new sections do not overlap with existing sections.
>  - Try to align memory sections first before giving up sections that are not
>    aligned to host page size.
>
> Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
> ---
>  accel/hvf/hvf-accel-ops.c |   1 -
>  accel/hvf/hvf-mem.c       | 211 +++++++++++++++++++-------------------
>  include/sysemu/hvf_int.h  |   8 +-
>  3 files changed, 107 insertions(+), 113 deletions(-)
>
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 50a563bfe0..c77f142f2b 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -49,7 +49,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
> -#include "exec/address-spaces.h"
>  #include "exec/exec-all.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/hvf.h"

I think this deletion of the #include line should have been in patch 1?

> diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
> index 3712731ed9..32452696b6 100644
> --- a/accel/hvf/hvf-mem.c
> +++ b/accel/hvf/hvf-mem.c
> @@ -28,12 +28,16 @@
>
>  /* Memory slots */
>
> +#define HVF_NUM_SLOTS 32
> +
> +static hvf_slot memslots[HVF_NUM_SLOTS];
> +
>  hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
>  {
>      hvf_slot *slot;
>      int x;
> -    for (x = 0; x < hvf_state->num_slots; ++x) {
> -        slot = &hvf_state->slots[x];
> +    for (x = 0; x < HVF_NUM_SLOTS; ++x) {
> +        slot = &memslots[x];
>          if (slot->size && start < (slot->start + slot->size) &&
>              (start + size) > slot->start) {
>              return slot;
> @@ -42,128 +46,130 @@ hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
>      return NULL;
>  }
>
> -struct mac_slot {
> -    int present;
> -    uint64_t size;
> -    uint64_t gpa_start;
> -    uint64_t gva;
> -};
> -
> -struct mac_slot mac_slots[32];
> -
> -static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
> +static hvf_slot *hvf_find_free_slot(void)
>  {
> -    struct mac_slot *macslot;
> -    hv_return_t ret;
> -
> -    macslot = &mac_slots[slot->slot_id];
> -
> -    if (macslot->present) {
> -        if (macslot->size != slot->size) {
> -            macslot->present = 0;
> -            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
> -            assert_hvf_ok(ret);
> +    hvf_slot *slot;
> +    int x;
> +    for (x = 0; x < HVF_NUM_SLOTS; x++) {
> +        slot = &memslots[x];
> +        if (!slot->size) {
> +            return slot;
>          }
>      }
>
> -    if (!slot->size) {
> -        return 0;
> -    }
> -
> -    macslot->present = 1;
> -    macslot->gpa_start = slot->start;
> -    macslot->size = slot->size;
> -    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
> -    assert_hvf_ok(ret);
> -    return 0;
> +    return NULL;
> +}
> +
> +/*
> + * Hypervisor.framework requires that the host virtual address,
> + * the guest physical address and the size of memory regions are aligned
> + * to the host page size.
> + *
> + * The function here tries to align the guest physical address and the size.
> + *
> + * The return value is the aligned size.
> + * The aligned guest physical address will be written to `start'.
> + * The delta between the aligned address and the original address will be
> + * written to `delta'.
> + */
> +static hwaddr hvf_align_section(MemoryRegionSection *section,
> +                              hwaddr *start, hwaddr *delta)

Indentation is slightly wrong here.

> +{
> +    hwaddr unaligned, _start, size, _delta;

Don't use variable names with leading underscores, please.

> +
> +    unaligned = section->offset_within_address_space;
> +    size = int128_get64(section->size);
> +    _start = ROUND_UP(unaligned, qemu_real_host_page_size);
> +    _delta = _start - unaligned;
> +    size = (size - _delta) & qemu_real_host_page_mask;
> +
> +    *start = _start;
> +    *delta = _delta;
> +
> +    return size;
>  }

> -    if (area->readonly ||
> -        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
> -        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
> +        if (readonly) {
> +            slot->flags |= HVF_SLOT_READONLY;
> +        }
> +
> +        if (dirty_tracking) {
> +            slot->flags |= HVF_SLOT_LOG;
> +        }
> +
> +        /* set Hypervisor.framework memory mapping flags */
> +        if (readonly || dirty_tracking) {
> +            flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
> +        } else {
> +            flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
> +        }
> +
> +        ret = hv_vm_map(host_addr, start, size, flags);
> +        assert_hvf_ok(ret);
>      } else {
> -        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
> -    }
> +        /* remove memory region */
> +        slot = hvf_find_overlap_slot(start, size);
>
> -    /* Now make a new slot. */
> -    int x;
> +        if (slot) {
> +            ret = hv_vm_unmap(start, size);
> +            assert_hvf_ok(ret);
>

This 'remove memory region' logic doesn't look quite right. In the old
code, we unmap the entirety of the memory range covered by the old
slot (this happens in do_hvf_set_memory() where it calls hv_vm_unmap()
using the gpa_start and size in the macslot we're about to reuse).
In the new code, we only unmap memory covered by the start/size
we've just calculated, but we then mark the whole slot as unused.
Shouldn't we be unmapping (slot->start, slot->size) here ?

Maybe it's actually the case that we can guarantee start == slot->start
and size == slot->size ? But in that case "find an overlapping slot"
seems like the wrong operation and actually what we're doing is
finding the exact matching slot.

The rest of the logic here looks OK, I think.

-- PMM

