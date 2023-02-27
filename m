Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D56A440D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe7p-0003rR-Tu; Mon, 27 Feb 2023 09:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7Y-0003ke-5J
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:53 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7W-00082X-El
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:51 -0500
Received: by mail-wr1-x435.google.com with SMTP id bv17so6352412wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BY+O27vkTKz7VveF8F3o+v7d714AMEm3Jk9i5pC/EpA=;
 b=dHcCV7Kjta0W2eSKYtRuURLnrNxhVybgIc7fmqDUNArr9FkdmB9cDOsrP2HfItAWox
 Qg+5eS9LALDQzN04N0rTtiOvnnEWFHHf396BTb4J/RnelZ1PXAho1O1QJAeO8OWpVbam
 L3fZtGVRBcV9E4qy6PgwalrMicprcP1bIJ3wE3/B41JVN37h1fdCVW41KRtvfWUdEwUV
 J2U4gptzJwo7g9C86eg1FwI49GWZ/W6wBIHAqZHZGxWT66CbNVSXgyYa/wPM6Mbm2JYt
 ZMNa/UQqSkZWIy/3rZ8V0CKIYAk6TlTCrN3pnr+rGNunRP1btUGLelUtw4LDjBYmC812
 aXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BY+O27vkTKz7VveF8F3o+v7d714AMEm3Jk9i5pC/EpA=;
 b=vxiat1SMs++NdwKm028CCNOYrj6+Nxn83f7mBiRJhDLn4E83hS1gIduWNc96mL8baj
 n0vog/eB/rCRLNB2lY2uVdcjnzLOJRgVpZsFL3c0vcBGYnYtH0YMU7aa3CmeFBL5oCJG
 ZoG3vzkVz2pSH29jEvHbhmXO+NS2XY3dOtOARPVWh6VRpES3FRv+wxfE4LeHQlr9NS1u
 smuCJC/KK+yqZRMkssAvBwPIKOC8HzbObfnpwv+XBctlABIDIbpcS9CnkdIHF9G7VRTW
 1SZA/I7MmKvFZ3tfBYpa6/Ic4eFNQzQTJKQW+nylOqZ8+M80YJTEczqYQiVl6ila7LCM
 nTdQ==
X-Gm-Message-State: AO0yUKWtDNwjdgMNhng9nApU7L8iAT1f8ClqLItNlQh+RgxXwh3bdh00
 mdgl1ap6x2l9PQiL0Gc38oH9k58mWIV06cOA
X-Google-Smtp-Source: AK7set9TbZtDn0WeHZukhuieK5oqH64SBtI7jlU4rf7ctn22BUe0rq190jhYLGZAC3a2P2XWBSBQAQ==
X-Received: by 2002:a5d:4952:0:b0:2c6:e861:2a49 with SMTP id
 r18-20020a5d4952000000b002c6e8612a49mr20260197wrs.59.1677506688720; 
 Mon, 27 Feb 2023 06:04:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002c561805a4csm7340780wrm.45.2023.02.27.06.04.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 038/126] hw/cpu: Extend CPUState::cluster_index documentation
Date: Mon, 27 Feb 2023 15:00:45 +0100
Message-Id: <20230227140213.35084-29-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Copy part of the description of commit f7b78602fd ("accel/tcg:
Add cluster number to TCG TB hash") in tcg_cpu_init_cflags(),
improving a bit CPUState::cluster_index documentation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230216142338.82982-2-philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 13 ++++++++++++-
 include/hw/core/cpu.h     |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index d9228fd403..aeb1cbaf65 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -44,7 +44,18 @@
 
 void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
 {
-    uint32_t cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
+    uint32_t cflags;
+
+    /*
+     * Include the cluster number in the hash we use to look up TBs.
+     * This is important because a TB that is valid for one cluster at
+     * a given physical address and set of CPU flags is not necessarily
+     * valid for another:
+     * the two clusters may have different views of physical memory, or
+     * may have different CPU features (eg FPU present or absent).
+     */
+    cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
+
     cflags |= parallel ? CF_PARALLEL : 0;
     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
     cpu->tcg_cflags = cflags;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index a5aa44d12c..7fd6657039 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -272,6 +272,8 @@ struct qemu_work_item;
  *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
  *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
  *   QOM parent.
+ *   Under TCG this value is propagated to @tcg_cflags.
+ *   See TranslationBlock::TCG CF_CLUSTER_MASK.
  * @tcg_cflags: Pre-computed cflags for this cpu.
  * @nr_cores: Number of cores within this CPU package.
  * @nr_threads: Number of threads within this CPU.
-- 
2.38.1


