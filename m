Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACD8388F12
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:28:18 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMFF-0005Sz-RT
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljLqJ-00030x-3T; Wed, 19 May 2021 09:02:31 -0400
Received: from [201.28.113.2] (port=49845 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljLqF-0006sB-ER; Wed, 19 May 2021 09:02:29 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 10:02:21 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 3612380139F;
 Wed, 19 May 2021 10:02:21 -0300 (-03)
Subject: Re: [PATCH 17/24] target/ppc: Use MMUAccessType with
 *_handle_mmu_fault
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-18-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <e0131486-c9b7-5b4d-339b-ab538a61e6c1@eldorado.org.br>
Date: Wed, 19 May 2021 10:02:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-18-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------52010F3C066975C558FD774F"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 13:02:21.0426 (UTC)
 FILETIME=[347C2D20:01D74CAF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------52010F3C066975C558FD774F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> These changes were waiting until we didn't need to match
> the function type of PowerPCCPUClass.handle_mmu_fault.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/mmu-hash32.h  | 4 ++--
>   target/ppc/mmu-hash64.h  | 4 ++--
>   target/ppc/mmu-radix64.h | 4 ++--
>   target/ppc/mmu-hash32.c  | 7 ++-----
>   target/ppc/mmu-hash64.c  | 6 +-----
>   target/ppc/mmu-radix64.c | 7 ++-----
>   6 files changed, 11 insertions(+), 21 deletions(-)
>
> diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
> index 898021f0d8..30e35718a7 100644
> --- a/target/ppc/mmu-hash32.h
> +++ b/target/ppc/mmu-hash32.h
> @@ -5,8 +5,8 @@
>   
>   hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
>   hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
> -                                int mmu_idx);
> +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> +                                MMUAccessType access_type, int mmu_idx);
>   
>   /*
>    * Segment register definitions
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 4b8b8e7950..3e8a8eec1f 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);
>   int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                     target_ulong esid, target_ulong vsid);
>   hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
> -int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
> -                                int mmu_idx);
> +int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> +                                MMUAccessType access_type, int mmu_idx);
>   void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
>                                  target_ulong pte_index,
>                                  target_ulong pte0, target_ulong pte1);
> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
> index f28c5794d0..94bd72cb38 100644
> --- a/target/ppc/mmu-radix64.h
> +++ b/target/ppc/mmu-radix64.h
> @@ -44,8 +44,8 @@
>   
>   #ifdef TARGET_PPC64
>   
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                 int mmu_idx);
> +int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                 MMUAccessType access_type, int mmu_idx);
>   hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
>   
>   static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index 744a763f44..d51be59f95 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -416,8 +416,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
>       return (rpn & ~mask) | (eaddr & mask);
>   }
>   
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                int mmu_idx)
> +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                MMUAccessType access_type, int mmu_idx)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> @@ -426,11 +426,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
>       ppc_hash_pte32_t pte;
>       int prot;
>       int need_prot;
> -    MMUAccessType access_type;
>       hwaddr raddr;
>   
> -    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
> -    access_type = rwx;
>       need_prot = prot_for_access_type(access_type);
>   
>       /* 1. Handle real mode accesses */
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index f48b625f48..877a01a296 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -867,7 +867,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
>   }
>   
>   int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                int rwx, int mmu_idx)
> +                                MMUAccessType access_type, int mmu_idx)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> @@ -877,13 +877,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>       hwaddr ptex;
>       ppc_hash_pte64_t pte;
>       int exec_prot, pp_prot, amr_prot, prot;
> -    MMUAccessType access_type;
>       int need_prot;
>       hwaddr raddr;
>   
> -    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
> -    access_type = rwx;
> -
>       /*
>        * Note on LPCR usage: 970 uses HID4, but our special variant of
>        * store_spr copies relevant fields into env->spr[SPR_LPCR].
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 7972153f23..f6d96f73b2 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -556,19 +556,16 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>       return 0;
>   }
>   
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                 int mmu_idx)
> +int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                 MMUAccessType access_type, int mmu_idx)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
>       int page_size, prot;
>       bool relocation;
> -    MMUAccessType access_type;
>       hwaddr raddr;
>   
>       assert(!(msr_hv && cpu->vhyp));
> -    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
> -    access_type = rwx;
>   
>       relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
>       /* HV or virtual hypervisor Real Mode Access */
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------52010F3C066975C558FD774F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18/05/2021 17:11, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-18-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">These changes were waiting until we didn't need to match
the function type of PowerPCCPUClass.handle_mmu_fault.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-18-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/mmu-hash32.h  | 4 ++--
 target/ppc/mmu-hash64.h  | 4 ++--
 target/ppc/mmu-radix64.h | 4 ++--
 target/ppc/mmu-hash32.c  | 7 ++-----
 target/ppc/mmu-hash64.c  | 6 +-----
 target/ppc/mmu-radix64.c | 7 ++-----
 6 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 898021f0d8..30e35718a7 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -5,8 +5,8 @@
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
 hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
-                                int mmu_idx);
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
+                                MMUAccessType access_type, int mmu_idx);
 
 /*
  * Segment register definitions
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 4b8b8e7950..3e8a8eec1f 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
 hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
-                                int mmu_idx);
+int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
+                                MMUAccessType access_type, int mmu_idx);
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte_index,
                                target_ulong pte0, target_ulong pte1);
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index f28c5794d0..94bd72cb38 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -44,8 +44,8 @@
 
 #ifdef TARGET_PPC64
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                 int mmu_idx);
+int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                 MMUAccessType access_type, int mmu_idx);
 hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
 
 static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 744a763f44..d51be59f95 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -416,8 +416,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn &amp; ~mask) | (eaddr &amp; mask);
 }
 
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                int mmu_idx)
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -426,11 +426,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     ppc_hash_pte32_t pte;
     int prot;
     int need_prot;
-    MMUAccessType access_type;
     hwaddr raddr;
 
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
     need_prot = prot_for_access_type(access_type);
 
     /* 1. Handle real mode accesses */
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index f48b625f48..877a01a296 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -867,7 +867,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
 }
 
 int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                int rwx, int mmu_idx)
+                                MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -877,13 +877,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr ptex;
     ppc_hash_pte64_t pte;
     int exec_prot, pp_prot, amr_prot, prot;
-    MMUAccessType access_type;
     int need_prot;
     hwaddr raddr;
 
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
-
     /*
      * Note on LPCR usage: 970 uses HID4, but our special variant of
      * store_spr copies relevant fields into env-&gt;spr[SPR_LPCR].
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 7972153f23..f6d96f73b2 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -556,19 +556,16 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     return 0;
 }
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                 int mmu_idx)
+int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                 MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
     int page_size, prot;
     bool relocation;
-    MMUAccessType access_type;
     hwaddr raddr;
 
     assert(!(msr_hv &amp;&amp; cpu-&gt;vhyp));
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
 
     relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
     /* HV or virtual hypervisor Real Mode Access */
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------52010F3C066975C558FD774F--

