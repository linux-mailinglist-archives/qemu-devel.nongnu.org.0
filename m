Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC154699B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:42:05 +0200 (CEST)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzglw-00081g-3I
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzgkh-000783-9K
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:40:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzgkf-0003E0-FL
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:40:46 -0400
Received: by mail-ed1-x532.google.com with SMTP id x62so35801148ede.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RzYJ3ADO8B5IeLwis6gFlwQIfqK+5ucvmMnVP4vhTF8=;
 b=EXvgQ/T/MjaAa+1BW0YRUQY1LrfekKpOhVyCoL/E6wv5K27VhCeBKTH1PmS7d4nkuC
 pzvkIxKQzg/csX3cyuGWyXtekjnKy4uR5TTIAcZFniXp/j2aoLr5quaC6xO8ECCBmjbg
 N/6o7F85bhA0DYeuenpbOchkf6YO0ePRGCyhkdbLUDMJUsiM6p7ANk5FptoSgPig1t3K
 uwIY7gBSDRDX+tXnO2CF/9bUsFlQyyJwyVlRiB6EmB98gUME2+5mwnLMQgimywyXOXFb
 Zfu936U8b//krx95k/z9XjilPaIacVpkRhXbqvL2Rp/CuNBJjyrp8TOlP4f7O6r3m66A
 VpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RzYJ3ADO8B5IeLwis6gFlwQIfqK+5ucvmMnVP4vhTF8=;
 b=nDndbuagK4ff6krLi/sBMseAzWBIceszoyCdRw+cYOX+Aa14QxfhVvzknnve6uRUWT
 CW3utLGgAvUsxh07i5fg9S/YFKDQmdVylFc02FX1w7yueEiJ439Y04p5dwHn09cupkgC
 WQnyAW8GmF5lrQS3PWELrJ3nmudEp7LVAZqPSMlFhfmwOZcD4pIH9VMQ1Wsffqlm6x6i
 5GyfJ3NUh6DhwiQElXLZAiy3tz+yLKEgDv2f9yNDuED5Tr3OAvZuPs2Sg3Ci4behDov8
 A4/Rqc3EW0FzNMw9wLaxDPTBKEw+iJ8yQIcRKLd1G2NnTCj39ez1jANGIAzM+eo0q11k
 5Cdg==
X-Gm-Message-State: AOAM531RhN7FRm6PZX93n91aSvNfbFKiFVQJ6TZiSIai0W4a+GcLUJOt
 lHiLf7OKvOv4BQf9YXRxGX8Npw==
X-Google-Smtp-Source: ABdhPJyFX9It2VjezbMe0rC+iq8n95oLQxje8m/I7M9FpY6Qzy+lsIdEsNeeJgnhqHrF8qVi78SojQ==
X-Received: by 2002:a05:6402:528a:b0:42d:e116:fab8 with SMTP id
 en10-20020a056402528a00b0042de116fab8mr50584633edb.134.1654875643559; 
 Fri, 10 Jun 2022 08:40:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a056402070700b0042aa153e73esm16298783edx.12.2022.06.10.08.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 08:40:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4CAA1FFB7;
 Fri, 10 Jun 2022 16:40:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, agorglouk@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: de-duplicate our register XML definitions
Date: Fri, 10 Jun 2022 16:40:36 +0100
Message-Id: <20220610154036.1253158-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We generate the XML for each vCPU we create which for heavily threaded
linux-user runs can add up to a lot of memory. Unfortunately we can't
only do it once as we may have vCPUs with different capabilities in
different cores but we can at least free duplicate definitions if we
find them.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1070
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2f806512d0..85ef6dc6db 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -318,7 +318,24 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
     g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &param);
     g_string_append_printf(s, "</feature>");
-    cpu->dyn_sysreg_xml.desc = g_string_free(s, false);
+
+    /* De-duplicate system register descriptions */
+    if (cs != first_cpu) {
+        CPUState *other_cs;
+        CPU_FOREACH(other_cs) {
+            ARMCPU *other_arm = ARM_CPU(other_cs);
+            if (g_strcmp0(other_arm->dyn_sysreg_xml.desc, s->str) == 0) {
+                cpu->dyn_sysreg_xml.desc = other_arm->dyn_sysreg_xml.desc;
+                g_string_free(s, true);
+                s = NULL;
+                break;
+            }
+        }
+    }
+
+    if (s) {
+        cpu->dyn_sysreg_xml.desc = g_string_free(s, false);
+    }
     return cpu->dyn_sysreg_xml.num;
 }
 
@@ -436,7 +453,24 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
                            base_reg++);
     info->num += 2;
     g_string_append_printf(s, "</feature>");
-    cpu->dyn_svereg_xml.desc = g_string_free(s, false);
+
+    /* De-duplicate SVE register descriptions */
+    if (cs != first_cpu) {
+        CPUState *other_cs;
+        CPU_FOREACH(other_cs) {
+            ARMCPU *other_arm = ARM_CPU(other_cs);
+            if (g_strcmp0(other_arm->dyn_svereg_xml.desc, s->str) == 0) {
+                cpu->dyn_sysreg_xml.desc = other_arm->dyn_svereg_xml.desc;
+                g_string_free(s, true);
+                s = NULL;
+                break;
+            }
+        }
+    }
+
+    if (s) {
+        cpu->dyn_svereg_xml.desc = g_string_free(s, false);
+    }
 
     return cpu->dyn_svereg_xml.num;
 }
-- 
2.30.2


