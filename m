Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1A60636B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:44:33 +0200 (CEST)
Received: from localhost ([::1]:49080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWmd-0000rp-Aj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:44:31 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWiH-0000tO-SK
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDS-0000by-0a
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDL-000500-0X
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so1996447wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWnNbpGNLR82FODc2Xo/7qx//MiZp6GbXbmOras6p+Y=;
 b=fDnZ4KP5nwwnMb/SsIla+XHr46+PvEFS77fNHRwCgx8X90/eWXxD1LKCeE+N1/Moxk
 IravUwsFvPjRbNSqjBHcbj5Fr4f6BmQfIilr1wezt8Mt8GLaZ5VDb9GJcVBibl290W/Q
 eTHvIV0gUSMlnZBcF6+/it+pnxuS02YEvve183VbQhIWrVRtYqS146xRdt79yCruqGfa
 MFnTa1ikUYAdZeh2i+mQjyBVkRhfS59liy741WMFPRVNJqkMvRwniV4MuiHGXB4ThEgG
 YVsdljrmSR3GEpSFxCwNB0HE3CxJwJ4U5tXik3rck3PZxtq1MV6usi7moifuXT1kgFdX
 ZOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWnNbpGNLR82FODc2Xo/7qx//MiZp6GbXbmOras6p+Y=;
 b=faoo6w6U5jIyIjhd7/XsT0hz/K1Qd4ORbvyNvu0UlOQnK7B/8LcjhmtOaBCqCrI0xu
 uqYp8aiX1RP3DiXhvJMBapPBV7lYAte94sUIo0Wll8WNZHvkNAIU8XT7rVlD677CDeY2
 krs76jXFPSvfZifrAuAjjTKGgQd9gcyuSeqDc/ZBZeU+sK+9qUgzoqQZJ1eQOPqkVt41
 +05sQXYgkGDR9ylen7usU/3/Pz1zGO0J1j5sIUUv89LSnGmgRjLBQUBoyerpExUjSfw+
 hYIuFcPxOHlykN9SmhvTxT8YlNE9+sepJKQJmN8dtLU6Hed1vx1SZ6+sz6GNX5SLQwDi
 1Vgw==
X-Gm-Message-State: ACrzQf0bdbcBnught4Rka3UCPV+EerWs0yOWbuoXlYjsRhZZC7STT2/w
 vk86O+rZttq2ZqY29qpf4B9hsQ==
X-Google-Smtp-Source: AMsMyM5mM04MrWvN+hvBgj6rZUPZxOjzUHdkpaTNPe7v2GIMYFjbNfXWHGq4W9o+uWajlL8taqaNZQ==
X-Received: by 2002:a05:600c:5388:b0:3c5:4c1:a1f6 with SMTP id
 hg8-20020a05600c538800b003c504c1a1f6mr9114744wmb.11.1666267191769; 
 Thu, 20 Oct 2022 04:59:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfd208000000b00235da296623sm1562619wrh.31.2022.10.20.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FFB91FFCF;
 Thu, 20 Oct 2022 12:52:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v3 25/26] target/s390x: fake instruction loading when handling
 'ex'
Date: Thu, 20 Oct 2022 12:52:08 +0100
Message-Id: <20221020115209.1761864-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The s390x EXecute instruction is a bit weird as we synthesis the
executed instruction from what we have stored in memory. This missed
the plugin instrumentation.

Work around this with a special helper to inform the rest of the
translator about the instruction so things stay consistent.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - s/w/b/ for translator_fake_ldb
  - add comment to extract_insn
  - reword commit message
---
 include/exec/translator.h    | 17 +++++++++++++++++
 target/s390x/tcg/translate.c |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 3b77f5f4aa..af2ff95cd5 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -211,6 +211,23 @@ translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
     return ret;
 }
 
+/**
+ * translator_fake_ldb - fake instruction load
+ * @insn8: byte of instruction
+ * @pc: program counter of instruction
+ *
+ * This is a special case helper used where the instruction we are
+ * about to translate comes from somewhere else (e.g. being
+ * re-synthesised for s390x "ex"). It ensures we update other areas of
+ * the translator with details of the executed instruction.
+ */
+
+static inline void translator_fake_ldb(uint8_t insn8, abi_ptr pc)
+{
+    plugin_insn_append(pc, &insn8, sizeof(insn8));
+}
+
+
 /*
  * Return whether addr is on the same page as where disassembly started.
  * Translators can use this to enforce the rule that only single-insn
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 95279e5dc3..8101f5f569 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6317,12 +6317,18 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
     if (unlikely(s->ex_value)) {
         /* Drop the EX data now, so that it's clear on exception paths.  */
         TCGv_i64 zero = tcg_const_i64(0);
+        int i;
         tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState, ex_value));
         tcg_temp_free_i64(zero);
 
         /* Extract the values saved by EXECUTE.  */
         insn = s->ex_value & 0xffffffffffff0000ull;
         ilen = s->ex_value & 0xf;
+        /* register insn bytes with translator so plugins work */
+        for (i = 0; i < ilen; i++) {
+            uint8_t byte = extract64(insn, 56 - (i * 8), 8);
+            translator_fake_ldb(byte, pc + i);
+        }
         op = insn >> 56;
     } else {
         insn = ld_code2(env, s, pc);
-- 
2.34.1


