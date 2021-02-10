Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A051A317300
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:14:18 +0100 (CET)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xkX-0007mg-Ll
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhS-0005vt-FR
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhQ-0003Eg-IU
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w4so3189680wmi.4
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gin79Zz+8fQ2Ye/3RKVC4CivONugqR+e7doP6QGVOF4=;
 b=S1PCQsspKnCmXiUBFn/obax8LFPY7g7Ov1ngutDxNVFiTyGl3g4U+GQZxoicXHwD0F
 SPEzLUgRmQLXLwtZlp780A67lHwBa8I48TCKwYkHfXMKHvrxX/ECjHhEhM1kO/0OZVZe
 vJw8bT+hA2NwWrdngFfAM33wNQBd8V/nvvhM4mp4/869m7Ff2gvjfoprwoDov8rFN3zD
 y4Uo22DWrmCRKvbl1erHX/cm3mOVeBHFlS268Re8Y/pDlVzdZCn4eRoqmAIId/n5MDep
 aSpEvL284/9v2Qm0YusR3PNcsSoSdpDHRSCQsLDBtOHZ8PKJXKD8hl6fW5HuV4uf3qX9
 8RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gin79Zz+8fQ2Ye/3RKVC4CivONugqR+e7doP6QGVOF4=;
 b=nSlSyjjzUTMXmMEIDa3Aoz2wQZr1qyqNiCU0Moclitz7+2HLrXtsc93v3QWnBx5kMZ
 MZ7+NLTDgJEToFHVkywGJnbPMbI6hQmOEEThDANpcwceSDKWMgP2RCBYR+Agzr0SOAb8
 tJZbP1Ogi2q4Af1CD5q2IgedTo3nEtRB5xnOVe/yjNiFePJQd0Z1kqtPWE4hxMxrUNj4
 iV35Oq7X1t0BX2AXwDgC2ZBMrg9zDcNZZb2vpf0TAxkEgzralrC3SJ8GaH2ssV636Paj
 HF5eojRLDfGuy/yu/jb5DBAzQFSiNrNDSTUSXMmIPps+OCxEot/GyDWIhEs6puCf/hdY
 onXg==
X-Gm-Message-State: AOAM532Cymxk/V1FRXZoE10TstMbgCd5uvSxRC2qbhxBcz/GWrv75iee
 QYMdjBAwVRiaX9xy9ThtewQmOb8AUT9o3M1m
X-Google-Smtp-Source: ABdhPJzEgcDykpbDxCbbd0kpY2p7Vdm8GhCAH9gc26T9UFOe66jeNFaVmUI8SPKFIsRqYBYETJOU1A==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr1204256wma.132.1612995063217; 
 Wed, 10 Feb 2021 14:11:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm4761231wmq.45.2021.02.10.14.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7DCB1FF90;
 Wed, 10 Feb 2021 22:10:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 04/21] contrib: Don't use '#' flag of printf format
Date: Wed, 10 Feb 2021 22:10:36 +0000
Message-Id: <20210210221053.18050-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhouyang <zhouyang789@huawei.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the misuse of
'#' flag of printf format

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-2-zhouyang789@huawei.com>
---
 contrib/plugins/hotblocks.c | 2 +-
 contrib/plugins/hotpages.c  | 2 +-
 contrib/plugins/howvec.c    | 2 +-
 contrib/plugins/lockstep.c  | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 37435a3fc7..4b08340143 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -63,7 +63,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             ExecCount *rec = (ExecCount *) it->data;
-            g_string_append_printf(report, "%#016"PRIx64", %d, %ld, %"PRId64"\n",
+            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"PRId64"\n",
                                    rec->start_addr, rec->trans_count,
                                    rec->insns, rec->exec_count);
         }
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index ecd6c18732..eacc678eac 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -88,7 +88,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             PageCounters *rec = (PageCounters *) it->data;
             g_string_append_printf(report,
-                                   "%#016"PRIx64", 0x%04x, %"PRId64
+                                   "0x%016"PRIx64", 0x%04x, %"PRId64
                                    ", 0x%04x, %"PRId64"\n",
                                    rec->page_address,
                                    rec->cpu_read, rec->reads,
diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 3b9a6939f2..6e602aaccf 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -209,7 +209,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
              i++, counts = g_list_next(counts)) {
             InsnExecCount *rec = (InsnExecCount *) counts->data;
             g_string_append_printf(report,
-                                   "Instr: %-24s\t(%ld hits)\t(op=%#08x/%s)\n",
+                                   "Instr: %-24s\t(%ld hits)\t(op=0x%08x/%s)\n",
                                    rec->insn,
                                    rec->count,
                                    rec->opcode,
diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 5aad50869d..7fd35eb669 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -134,7 +134,7 @@ static void report_divergance(ExecState *us, ExecState *them)
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
-        g_string_printf(out, "@ %#016lx vs %#016lx (%d/%d since last)\n",
+        g_string_printf(out, "@ 0x%016lx vs 0x%016lx (%d/%d since last)\n",
                         us->pc, them->pc, g_slist_length(divergence_log),
                         divrec.distance);
         qemu_plugin_outs(out->str);
@@ -144,7 +144,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         int i;
         GSList *entry;
 
-        g_string_printf(out, "Δ insn_count @ %#016lx (%ld) vs %#016lx (%ld)\n",
+        g_string_printf(out, "Δ insn_count @ 0x%016lx (%ld) vs 0x%016lx (%ld)\n",
                         us->pc, us->insn_count, them->pc, them->insn_count);
 
         for (entry = log, i = 0;
@@ -152,7 +152,7 @@ static void report_divergance(ExecState *us, ExecState *them)
              entry = g_slist_next(entry), i++) {
             ExecInfo *prev = (ExecInfo *) entry->data;
             g_string_append_printf(out,
-                                   "  previously @ %#016lx/%ld (%ld insns)\n",
+                                   "  previously @ 0x%016lx/%ld (%ld insns)\n",
                                    prev->block->pc, prev->block->insns,
                                    prev->insn_count);
         }
-- 
2.20.1


