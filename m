Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24529AE1D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 13:29:12 +0200 (CEST)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i17km-0002b1-0i
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 07:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i17jP-00029f-TP
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 07:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i17jO-0006ul-Hc
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 07:27:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38968)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i17jO-0006uX-9i; Fri, 23 Aug 2019 07:27:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7CF443082131;
 Fri, 23 Aug 2019 11:27:45 +0000 (UTC)
Received: from [10.36.117.2] (ovpn-117-2.ams2.redhat.com [10.36.117.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0EAA18660;
 Fri, 23 Aug 2019 11:27:42 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20190823100741.9621-1-david@redhat.com>
 <20190823100741.9621-9-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <8df7d599-bc35-621e-c5d9-ac8554cba512@redhat.com>
Date: Fri, 23 Aug 2019 13:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823100741.9621-9-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 23 Aug 2019 11:27:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v1 8/9] exec.c: Factor out core logic of
 check_watchpoint()
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
Cc: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.19 12:07, David Hildenbrand wrote:
> We want to perform the same checks in probe_write() to trigger a cpu
> exit before doing any modifications. We'll have to pass a PC.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  exec.c                | 23 +++++++++++++++++------
>  include/hw/core/cpu.h |  2 ++
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 1df966d17a..d233a4250b 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2810,12 +2810,10 @@ static const MemoryRegionOps notdirty_mem_ops = {
>      },
>  };
>  
> -/* Generate a debug exception if a watchpoint has been hit.  */
> -static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
> +void cpu_check_watchpoint(CPUState *cpu, vaddr vaddr, int len,
> +                          MemTxAttrs attrs, int flags, uintptr_t ra)
>  {
> -    CPUState *cpu = current_cpu;
>      CPUClass *cc = CPU_GET_CLASS(cpu);
> -    target_ulong vaddr;
>      CPUWatchpoint *wp;
>  
>      assert(tcg_enabled());
> @@ -2826,7 +2824,7 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>          cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
>          return;
>      }
> -    vaddr = (cpu->mem_io_vaddr & TARGET_PAGE_MASK) + offset;
> +
>      vaddr = cc->adjust_watchpoint_address(cpu, vaddr, len);
>      QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
>          if (cpu_watchpoint_address_matches(wp, vaddr, len)
> @@ -2851,11 +2849,14 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>                  if (wp->flags & BP_STOP_BEFORE_ACCESS) {
>                      cpu->exception_index = EXCP_DEBUG;
>                      mmap_unlock();
> -                    cpu_loop_exit(cpu);
> +                    cpu_loop_exit_restore(cpu, ra);
>                  } else {
>                      /* Force execution of one insn next time.  */
>                      cpu->cflags_next_tb = 1 | curr_cflags();
>                      mmap_unlock();
> +                    if (ra) {
> +                        cpu_restore_state(cpu, ra, true);
> +                    }
>                      cpu_loop_exit_noexc(cpu);
>                  }
>              }
> @@ -2865,6 +2866,16 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>      }
>  }
>  
> +/* Generate a debug exception if a watchpoint has been hit.  */
> +static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
> +{
> +    CPUState *cpu = current_cpu;
> +    vaddr vaddr;
> +
> +    vaddr = (cpu->mem_io_vaddr & TARGET_PAGE_MASK) + offset;
> +    cpu_check_watchpoint(cpu, vaddr, len, attrs, flags, 0);
> +}
> +
>  /* Watchpoint access routines.  Watchpoints are inserted using TLB tricks,
>     so these check for a hit then pass through to the normal out-of-line
>     phys routines.  */
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 77fca95a40..3a2d76b32c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -1070,6 +1070,8 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
>      return false;
>  }
>  
> +void cpu_check_watchpoint(CPUState *cpu, vaddr vaddr, int len,
> +                          MemTxAttrs attrs, int flags, uintptr_t ra);
>  int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>                            int flags, CPUWatchpoint **watchpoint);
>  int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
> 

As we will have bigger accesses with probe_write(), we should do

diff --git a/exec.c b/exec.c
index d233a4250b..4f8cc62a5f 100644
--- a/exec.c
+++ b/exec.c
@@ -2834,7 +2834,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr
vaddr, int len,
             } else {
                 wp->flags |= BP_WATCHPOINT_HIT_WRITE;
             }
-            wp->hitaddr = vaddr;
+            wp->hitaddr = MAX(vaddr, wp->vaddr);
             wp->hitattrs = attrs;
             if (!cpu->watchpoint_hit) {
                 if (wp->flags & BP_CPU &&

I guess, to make sure we actually indicate the watchpoint.

-- 

Thanks,

David / dhildenb

