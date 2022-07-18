Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5B0578919
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:00:19 +0200 (CEST)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDV2Y-0007XB-L8
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUT0-0008VV-GN; Mon, 18 Jul 2022 13:23:37 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSt-0001ub-5K; Mon, 18 Jul 2022 13:23:34 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10c0052da61so25494211fac.12; 
 Mon, 18 Jul 2022 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFZ7zolXvpaOlznryERlV7wLXBqQGgiB5FyUAm/2fkQ=;
 b=niaFNhAzkAX/HTk5zTcxouWXXy/Ij6vakW+e0fvoCGSZEVQOdpM829b48eGMvGnLGR
 olJwv6nYdsFR2mF98+5p0RDWhZBSs7kPZqDE5PnIShuDm8B0yNRzfXxbL9++B+jxNJTA
 pD/ZwaaW9ZD+lk+tUBsPfU0AstE/Ay1+vT80zC9kvfBzPfdiZfbMMAgrnNNk9kl/MDX7
 ilCT17KiT1d7bOVBo3IvFe7KLIz7TqcTEEdVfkj0gathHSjZzJg1Nu2TLW9FTYnmRzrb
 Oqyw2iMvXUu47tNG3si38+SShaNB29jBAdPz3XGP1y65m4KE06YEvwjHVGLos5meoZLQ
 P8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFZ7zolXvpaOlznryERlV7wLXBqQGgiB5FyUAm/2fkQ=;
 b=Y8AIme/kuk3G9xgJ3lfCO/zADFR4wPtlSd1NsKCETYWI1Kfiz6H5uLsxayJo43rWYG
 Urb66KWXiMh1WVi0UisBZL3Zsa7MH6tL7GUqevdCjnKiME9gayfTIjxNkHsL7RDZqre3
 EuYIQw9zLMCB7XEomG4rMNV4K0dC8IzVOG2K8PQwcj59ZUwyzxOnj2D6sJjjcl6T6qaK
 AQdSR+pcsls7V82Hudf01oS4/OM63AZOizHjyev0E5MaR/wcdLi+m3b61y1XFIrGe+RQ
 WdgATGwMRZX67FcHEWwbBdg1c2Yxd+ytpzDpCRXuxae4Fi4uZ4GftVPqGZvKRZP7c3nk
 2CWw==
X-Gm-Message-State: AJIora9GWU+qpWsSpNePEijabn8XSPOQe8E+LP77wUil0sIwtCulxnKP
 adNGSu5yqdvBbuj/ndQ3h85VAtlx7oM=
X-Google-Smtp-Source: AGRyM1vbeQ2qqNIhGV+H38bsV/CgFAkOncX9z9vDgbZ+GvMjpoxJd8PaUISVr8i33HkUUY/N0J8M5Q==
X-Received: by 2002:a05:6870:65ab:b0:10c:373d:eca8 with SMTP id
 fp43-20020a05687065ab00b0010c373deca8mr15991357oab.187.1658165003132; 
 Mon, 18 Jul 2022 10:23:23 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PULL 28/30] ppc: Check partition and process table alignment
Date: Mon, 18 Jul 2022 14:22:06 -0300
Message-Id: <20220718172208.1247624-29-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Check if partition and process tables are properly aligned, in
their size, according to PowerISA 3.1B, Book III 6.7.6 programming
note. Hardware and KVM also raise an exception in these cases.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220628133959.15131-2-leandro.lupori@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c             |  5 +++++
 hw/ppc/spapr_hcall.c       |  9 +++++++++
 target/ppc/mmu-book3s-v3.c |  5 +++++
 target/ppc/mmu-radix64.c   | 17 +++++++++++++----
 4 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3a5112899e..bc9ba6e6dc 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1336,6 +1336,11 @@ static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
         patb = spapr->nested_ptcr & PTCR_PATB;
         pats = spapr->nested_ptcr & PTCR_PATS;
 
+        /* Check if partition table is properly aligned */
+        if (patb & MAKE_64BIT_MASK(0, pats + 12)) {
+            return false;
+        }
+
         /* Calculate number of entries */
         pats = 1ull << (pats + 12 - 4);
         if (pats <= lpid) {
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index d761a7d0c3..a8d4a6bcf0 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -920,6 +920,7 @@ static target_ulong h_register_process_table(PowerPCCPU *cpu,
     target_ulong page_size = args[2];
     target_ulong table_size = args[3];
     target_ulong update_lpcr = 0;
+    target_ulong table_byte_size;
     uint64_t cproc;
 
     if (flags & ~FLAGS_MASK) { /* Check no reserved bits are set */
@@ -927,6 +928,14 @@ static target_ulong h_register_process_table(PowerPCCPU *cpu,
     }
     if (flags & FLAG_MODIFY) {
         if (flags & FLAG_REGISTER) {
+            /* Check process table alignment */
+            table_byte_size = 1ULL << (table_size + 12);
+            if (proc_tbl & (table_byte_size - 1)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: process table not properly aligned: proc_tbl 0x"
+                    TARGET_FMT_lx" proc_tbl_size 0x"TARGET_FMT_lx"\n",
+                    __func__, proc_tbl, table_byte_size);
+            }
             if (flags & FLAG_RADIX) { /* Register new RADIX process table */
                 if (proc_tbl & 0xfff || proc_tbl >> 60) {
                     return H_P2;
diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
index f4985bae78..c8f69b3df9 100644
--- a/target/ppc/mmu-book3s-v3.c
+++ b/target/ppc/mmu-book3s-v3.c
@@ -28,6 +28,11 @@ bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
     uint64_t patb = cpu->env.spr[SPR_PTCR] & PTCR_PATB;
     uint64_t pats = cpu->env.spr[SPR_PTCR] & PTCR_PATS;
 
+    /* Check if partition table is properly aligned */
+    if (patb & MAKE_64BIT_MASK(0, pats + 12)) {
+        return false;
+    }
+
     /* Calculate number of entries */
     pats = 1ull << (pats + 12 - 4);
     if (pats <= lpid) {
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 21ac958e48..9a8a2e2875 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -383,7 +383,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-    uint64_t offset, size, prtbe_addr, prtbe0, base_addr, nls, index, pte;
+    uint64_t offset, size, prtb, prtbe_addr, prtbe0, base_addr, nls, index, pte;
     int fault_cause = 0, h_page_size, h_prot;
     hwaddr h_raddr, pte_addr;
     int ret;
@@ -393,9 +393,18 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                   __func__, access_str(access_type),
                   eaddr, mmu_idx, pid);
 
+    prtb = (pate.dw1 & PATE1_R_PRTB);
+    size = 1ULL << ((pate.dw1 & PATE1_R_PRTS) + 12);
+    if (prtb & (size - 1)) {
+        /* Process Table not properly aligned */
+        if (guest_visible) {
+            ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
+        }
+        return 1;
+    }
+
     /* Index Process Table by PID to Find Corresponding Process Table Entry */
     offset = pid * sizeof(struct prtb_entry);
-    size = 1ULL << ((pate.dw1 & PATE1_R_PRTS) + 12);
     if (offset >= size) {
         /* offset exceeds size of the process table */
         if (guest_visible) {
@@ -403,7 +412,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         }
         return 1;
     }
-    prtbe_addr = (pate.dw1 & PATE1_R_PRTB) + offset;
+    prtbe_addr = prtb + offset;
 
     if (vhyp_flat_addressing(cpu)) {
         prtbe0 = ldq_phys(cs->as, prtbe_addr);
@@ -568,7 +577,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
         return false;
     }
 
-    /* Get Process Table */
+    /* Get Partition Table */
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc;
         vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-- 
2.36.1


