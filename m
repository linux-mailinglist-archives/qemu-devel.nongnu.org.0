Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1586A9832
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:16:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY5G5-00081O-Rf; Fri, 03 Mar 2023 08:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5G3-0007q8-B0
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:15:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5G1-0000BF-Pi
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:15:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so3883626wmb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 05:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677849332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgszLDOcwezsUSUZ+mEHV/p7i8QgHlK1DQCsMrGJVGY=;
 b=fX/R1Xc95o4+EdIAuaT6ErlAbdRY2wCzmNwpYBxjMPTp4aTVA+XJGCpx+5gerSw6Q8
 HnMCULjGOXPtYdTvbFUstRQ8j7FybuKfc/P0UE1EbK7zeTgjfcOrUny1JYvurZ3jJi5d
 EbsBRYTh/9tc+otHZG+IqgFDXg2vieumwLm7d4V6cK6CWOinPtpOPEQLyuD0RBRUsac6
 XxHQDxYymEEtCfeINkUiFZ0BKJA2ly6IqHpjCwoGg4TRh/pl4b97ty6pthSwLHu8D+G5
 OyasVH2tkwsZvp8qpt2oGrRCEypSJ+NfEfvOULHU94R7WQXPJul1+BoyOiFKtsqvkd+B
 Fivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677849332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgszLDOcwezsUSUZ+mEHV/p7i8QgHlK1DQCsMrGJVGY=;
 b=2mt64mMeJArnOsK+U1k0bHyGHOHnKIk/1tEHuqqN18/KD4/fzSVWo/DETWxdzcyZAs
 7RzFBA+IqHMWIns8995Co8M0aXnYI/sjXS4gZQaohiSrLt4L3J99uJKTnvry6gcmcMLJ
 +K7OKSlR7W+HQ8NXzfjdrBxIEYauxKOkvbN7Ba9y5h4ce24FP2I6vKbCPdME0G6fHYcG
 mh17CVdU4k+TN7jZgSCZ4jG1JFNT1zXm5qn34lyErl8SCcQKu+wjI8HWzr8Kd1TTE6jh
 dEvEQuts7fmWOdVLufrnFMIgAe+FX72UNl2j7ZHOJgneqo3/sIfEnTKNgTUYFavMiYng
 oiFQ==
X-Gm-Message-State: AO0yUKWZvHJWk8+5uzVPtGPHXsPDAD3gS9QmFqYvwBlE7mdPvnstNFi8
 44S9tnR5SLENSU9XjXj7AFbx5A==
X-Google-Smtp-Source: AK7set8TLygVd0AHVlLH4Vz5MtZ9GwfuGHWWulyX2Lj3bBVvbua/ss9j8vnDBQhY9LLV0wysxvqfnw==
X-Received: by 2002:a05:600c:4f92:b0:3ea:f6c4:5f28 with SMTP id
 n18-20020a05600c4f9200b003eaf6c45f28mr1578220wmq.36.1677849332050; 
 Fri, 03 Mar 2023 05:15:32 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm2063077wmp.3.2023.03.03.05.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 05:15:31 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v11 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Fri,  3 Mar 2023 14:12:49 +0100
Message-Id: <20230303131252.892893-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303131252.892893-1-alexghiti@rivosinc.com>
References: <20230303131252.892893-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This array is actually used as a boolean so swap its current char type
to a boolean and at the same time, change the type of validate_vm to
bool since it returns valid_vm_1_10_[32|64].

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..163eb3b82b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1123,16 +1123,16 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-static const char valid_vm_1_10_32[16] = {
-    [VM_1_10_MBARE] = 1,
-    [VM_1_10_SV32] = 1
+static const bool valid_vm_1_10_32[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV32] = true
 };
 
-static const char valid_vm_1_10_64[16] = {
-    [VM_1_10_MBARE] = 1,
-    [VM_1_10_SV39] = 1,
-    [VM_1_10_SV48] = 1,
-    [VM_1_10_SV57] = 1
+static const bool valid_vm_1_10_64[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV39] = true,
+    [VM_1_10_SV48] = true,
+    [VM_1_10_SV57] = true
 };
 
 /* Machine Information Registers */
@@ -1215,7 +1215,7 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static int validate_vm(CPURISCVState *env, target_ulong vm)
+static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         return valid_vm_1_10_32[vm & 0xf];
@@ -2641,7 +2641,8 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    target_ulong vm, mask;
+    target_ulong mask;
+    bool vm;
 
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
-- 
2.37.2


