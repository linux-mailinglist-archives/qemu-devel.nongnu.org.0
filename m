Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC14AFFE0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:05:58 +0100 (CET)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHv65-0007El-PS
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwb-0005wI-42
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:09 -0500
Received: from [2607:f8b0:4864:20::62e] (port=35638
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwY-0008EQ-LU
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y7so131608plp.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lt5xGKR3Z7vKxq8vzU4efggY71T1A412lzm5UN/xys0=;
 b=HZgOlTky7vG1yIzXJb3/Wd1otP7NrtCJqJ1lTu8Gz0K+y3JIUMR41KragsktnXLIpf
 XBUfx/qKs+QXkjBNQJk7w3z03qOhNH6sDK1+04Bvh3o8Tl+HYw1CjD+HjP/C38rx6V37
 ogbzW1mXJFe14FokaZG4/OhS6RXzvE9Sm4uJkh5mGLjlZJpCdjX0YcZrVKtyOwJrutEi
 WK8yKe1EszrQxDtj+Wny0I4uc5KpDaByU3nkqzr9iYybZd19mZ3YAqnoDd6qBxSJA24D
 lIJyQtDUAueRErlISlVErYYRRLHR/DckFMYVQAm/IrJzydBtHHBZB6XGKRQphm9ouds7
 IMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lt5xGKR3Z7vKxq8vzU4efggY71T1A412lzm5UN/xys0=;
 b=r86uNy+XkK/uMzlc1ZbMspl9hguInDZyaUqfiegFARwhhjbGkg6QTyqwSFzCCODYcm
 eJiSOLCE3Wu1C+An8wCdL8/RvUKhqnrZzgo1/uEZ6xrPt1ECtuqyiFiwTt9oHPCWmDl5
 gZDn++Hatp22JRifG8xfZkf3bu96zaseVdN3YAyuYQqElvTcVF5PtTrDmfDqXOm6/58w
 G+ErHVSObXGRi8YkK3qjJpvk6sfv7xEqCVc+070Ne6wmxTOQXchreMXq4YIw4FHNI40d
 jfvP8VkQyVvYBvhQDprJ8LBTKFN7TmRkU9AZt5sJrQgDTqTeJ25+7BawQLKQrQTn1Ijg
 QgiQ==
X-Gm-Message-State: AOAM530AgE2tRzwQeaEAoILiWIoa8Gusou1FcbPERAYGGfmx4gGIEfaK
 oy2/2usgjqHKclNf4r3YK/HEpH3Giy4=
X-Google-Smtp-Source: ABdhPJyKtC0wJOhgtiTvoxet/OL5QZmCmKn1SCgfRk4yVv2acdd/sty87VeYfZT4QYZc/tVGzzb8lQ==
X-Received: by 2002:a17:902:b213:: with SMTP id
 t19mr4133411plr.100.1644443765304; 
 Wed, 09 Feb 2022 13:56:05 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id v17sm19857363pfm.10.2022.02.09.13.56.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:56:05 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 09/15] target: Use forward declared type instead of structure
 type
Date: Wed,  9 Feb 2022 22:54:40 +0100
Message-Id: <20220209215446.58402-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The CPU / CPU state are forward declared.

  $ git grep -E 'struct [A-Za-z]+CPU\ \*'
  target/arm/hvf_arm.h:16:void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
  target/openrisc/cpu.h:234:    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
  target/openrisc/cpu.h:238:    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,

  $ git grep -E 'struct CPU[A-Za-z]+State\ \*'
  target/mips/internal.h:137:    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
  target/mips/internal.h:139:    void (*helper_tlbwi)(struct CPUMIPSState *env);
  target/mips/internal.h:140:    void (*helper_tlbwr)(struct CPUMIPSState *env);
  target/mips/internal.h:141:    void (*helper_tlbp)(struct CPUMIPSState *env);
  target/mips/internal.h:142:    void (*helper_tlbr)(struct CPUMIPSState *env);
  target/mips/internal.h:143:    void (*helper_tlbinv)(struct CPUMIPSState *env);
  target/mips/internal.h:144:    void (*helper_tlbinvf)(struct CPUMIPSState *env);
  target/xtensa/cpu.h:347:    struct CPUXtensaState *env;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/hvf_arm.h   |  2 +-
 target/mips/internal.h | 14 +++++++-------
 target/openrisc/cpu.h  |  4 ++--
 target/xtensa/cpu.h    |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index ea238cff83..9a9d1a0bf5 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -13,6 +13,6 @@
 
 #include "cpu.h"
 
-void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
+void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
 #endif
diff --git a/target/mips/internal.h b/target/mips/internal.h
index f705d6bfa6..ac6e03e2f2 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -134,14 +134,14 @@ struct r4k_tlb_t {
 struct CPUMIPSTLBContext {
     uint32_t nb_tlb;
     uint32_t tlb_in_use;
-    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
+    int (*map_address)(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, MMUAccessType access_type);
-    void (*helper_tlbwi)(struct CPUMIPSState *env);
-    void (*helper_tlbwr)(struct CPUMIPSState *env);
-    void (*helper_tlbp)(struct CPUMIPSState *env);
-    void (*helper_tlbr)(struct CPUMIPSState *env);
-    void (*helper_tlbinv)(struct CPUMIPSState *env);
-    void (*helper_tlbinvf)(struct CPUMIPSState *env);
+    void (*helper_tlbwi)(CPUMIPSState *env);
+    void (*helper_tlbwr)(CPUMIPSState *env);
+    void (*helper_tlbp)(CPUMIPSState *env);
+    void (*helper_tlbr)(CPUMIPSState *env);
+    void (*helper_tlbinv)(CPUMIPSState *env);
+    void (*helper_tlbinvf)(CPUMIPSState *env);
     union {
         struct {
             r4k_tlb_t tlb[MIPS_TLB_MAX];
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index ee069b080c..5711591520 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -231,11 +231,11 @@ typedef struct CPUOpenRISCTLBContext {
     OpenRISCTLBEntry itlb[TLB_SIZE];
     OpenRISCTLBEntry dtlb[TLB_SIZE];
 
-    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_code)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
-    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_data)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 02143f2f77..f2165b17e2 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -344,7 +344,7 @@ typedef struct XtensaGdbRegmap {
 } XtensaGdbRegmap;
 
 typedef struct XtensaCcompareTimer {
-    struct CPUXtensaState *env;
+    CPUXtensaState *env;
     QEMUTimer *timer;
 } XtensaCcompareTimer;
 
-- 
2.34.1


