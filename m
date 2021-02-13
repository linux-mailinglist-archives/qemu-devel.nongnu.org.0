Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A263C31ABAB
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:22:49 +0100 (CET)
Received: from localhost ([::1]:51680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAusq-0006Fr-LO
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaG-0001s3-F7
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:36 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaE-00065H-Ph
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id g10so2950535wrx.1
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=amxipGPhN1ZCgpnvtNxEzqZbpdXA2+kytu/LCnoBfOc=;
 b=K3pW3OPyFo9noJrEyJNoebQH8C/Cz3Q0Sn9LRdVJGFdHDoR20Fa526H70we+JOjHkJ
 PZ5XH2LspvPK8ML4qeUWSaXGqAZfLtyQHgtJQ+GQ0ofJVX5o9o98AqHGKyQxtboQu8XQ
 3QZp4qw9QDDbeApDA/x+CxV7+yLgxgfciNhQnxz4DFaaNBq/X5AXijXFx6OU39Y5mUsd
 eDL81zspGpbBr8x6LTEqiW+b+diyOIF/zrq71i6MS3RHNDWdRaS+FbtEG/vEB8M0XSz5
 TmOBOsJzuZ/MBd75yugqFMcAz391Ce4iUfuS/QEwgPz21W22feI9ChejWtQXvHiZE07c
 Su3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=amxipGPhN1ZCgpnvtNxEzqZbpdXA2+kytu/LCnoBfOc=;
 b=aC2PIEw6bXp7rThEK2JnLWlySVQo83Lucrz67twflV9hOejdydCmulC78WFZWTx3Vr
 eSGHT9Za3pGWfJlAdpIjteORCUPv1i9tnLYvfhp/JnuoJo4+oD+4OIxs6nV9UwfO996t
 IVWG6fUc1acl8wGG7o/HxaKl37YJBWTO4CcB7l2bPSwR5Ma3YHxL0XNi22yRJD3G0RQ8
 qDjaEW/aKIRftOfCPexWU11Uo1T5sAvvuffrfCnb7LOFYX+x+Jvxi5XzAk2J2ABO6ERp
 4zpwLFDzYNXiRQoTpkKLFsB5bccXCzPFr1opYAkYOqHn1F6yy6F+ntOJllBXBaeSZJM1
 Fd7w==
X-Gm-Message-State: AOAM532NxNyL6OBwAZ//jSfCfnTld7ufy6LkK/jHZls06v7e9tvYzd3M
 h8caCrRGQszsGyfiMFcvPyHdHQ==
X-Google-Smtp-Source: ABdhPJxpasVyWvc2bcHnDYUwMOL5M/sGyyCqXJaH4ZZVlWgFUlsBBNFpLbD3/Yv4fhutSsgk2n0iAQ==
X-Received: by 2002:adf:fc48:: with SMTP id e8mr8980509wrs.154.1613221413319; 
 Sat, 13 Feb 2021 05:03:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm2078253wre.25.2021.02.13.05.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0D311FF90;
 Sat, 13 Feb 2021 13:03:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 04/23] contrib: Don't use '#' flag of printf format
Date: Sat, 13 Feb 2021 13:03:06 +0000
Message-Id: <20210213130325.14781-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Message-Id: <20210210221053.18050-5-alex.bennee@linaro.org>
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


