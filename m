Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B360436E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 13:39:52 +0200 (CEST)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol7QL-0001RR-At
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 07:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ol7Mq-00081Z-Uk
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:36:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ol7Mn-0005nf-58
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 07:36:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id r13so28432498wrj.11
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tsapSoF+2oynfHGbiw474XF1GzJq1kAu8j4fOMy/y8E=;
 b=B42XMwSl3GHlmnrFF5CIUiTl51B0kEFQs1szdrRgSkOm6HJQNXgZeBFhT5DY4GCwGY
 Up07XwHPOMcq+YEmcojtX96acNjoXQRR0FQrBvwcwOKoOzZtns5Vmf1Ac2NBHuo4iKcZ
 /jDvUn5lsmE7zGhlL56AMdeGAkljXHUwEjnj78qJglkSHm43ka8ysj9+1ZRlcEdbQOzM
 xWYsqqz0xYlYC/f0G5CpSu8QnmOqkWFMXQwzHCAfdslFvcSQimqjn2DFSl4Lu1AyltPD
 ryjJQq94pldUSnarH4iF/tmxxLVhH+p3bDrop6N069fi3lYqtCy1kDkHFArH5tUZBG3W
 AvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tsapSoF+2oynfHGbiw474XF1GzJq1kAu8j4fOMy/y8E=;
 b=Wbv3W/HOoGjBD0tz9UnUxPUm/Dbpo66SZ1q/Mgp5sYQNN5RV8PH9Ogo2+1fSSoeZ90
 3kEhk7Ye4zgZZasTTLxr/aEajMLQxW/r5Ei5kjPgJZBMWzoFPZ3S954p0RAfT5sEVpiD
 01CKVbjz1NHqVoXMm05PMlYlt9ObZZ/V3iKYvBYRd6iC1CyqJJBTenm5vGjZku09rVEF
 paSTB6ytqUIthy4eHJMJsDg88YVGIhrzk0KXhuWUR9ExGiGAtw03N3U5+n8TMd20j1LU
 i6Zc61GLfEyBAUXtRRw8/COdCbMCzdxRATyGUt+7vbcXlDK+X08Or6jidhd7u1BCmmI5
 f74w==
X-Gm-Message-State: ACrzQf14k6hlZ95yDyMtUZWJwJ11PSHm8OOU0nCKo1kpkkeFnu6w3vaR
 sEh+AZg7roKlizbxLwzjSS86BQ==
X-Google-Smtp-Source: AMsMyM5OXkaMyG5OoKEVUPeFEpEzQL16FeD2xiOqektX3Kw6NMM8ChkRBy41QAQSsrZidHHw2SrxKw==
X-Received: by 2002:a5d:5306:0:b0:22c:d927:fc8a with SMTP id
 e6-20020a5d5306000000b0022cd927fc8amr4752528wrv.700.1666179358985; 
 Wed, 19 Oct 2022 04:35:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az25-20020a05600c601900b003b497138093sm16935439wmb.47.2022.10.19.04.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 04:35:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC1381FFB7;
 Wed, 19 Oct 2022 12:35:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [RFC PATCH] target/s390x: fake instruction loading when handling 'ex'
Date: Wed, 19 Oct 2022 12:35:52 +0100
Message-Id: <20221019113552.1051940-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The s390x EXecute instruction is a bit weird as we synthesis the
executed instruction from what we have stored in memory. When plugins
are enabled this breaks because we detect the ld_code2() loading from
a non zero offset without the rest of the instruction being there.

Work around this with a special helper to inform the rest of the
translator about the instruction so things stay consistent.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h    | 17 +++++++++++++++++
 target/s390x/tcg/translate.c |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 3b77f5f4aa..156f568701 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -211,6 +211,23 @@ translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
     return ret;
 }
 
+/**
+ * translator_fake_ldw - fake instruction load
+ * @insn16: 2 byte instruction
+ * @pc: program counter of instruction
+ *
+ * This is a special case helper used where the instruction we are
+ * about to translate comes from somewhere else (e.g. being
+ * re-synthesised for s390x "ex"). It ensures we update other areas of
+ * the translator with details of the executed instruction.
+ */
+
+static inline void translator_fake_ldw(uint16_t insn16, abi_ptr pc)
+{
+    plugin_insn_append(pc, &insn16, sizeof(insn16));
+}
+
+
 /*
  * Return whether addr is on the same page as where disassembly started.
  * Translators can use this to enforce the rule that only single-insn
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1d2dddab1c..a07b8b2d23 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6317,12 +6317,16 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
     if (unlikely(s->ex_value)) {
         /* Drop the EX data now, so that it's clear on exception paths.  */
         TCGv_i64 zero = tcg_const_i64(0);
+        int i;
         tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState, ex_value));
         tcg_temp_free_i64(zero);
 
         /* Extract the values saved by EXECUTE.  */
         insn = s->ex_value & 0xffffffffffff0000ull;
         ilen = s->ex_value & 0xf;
+        for (i = 0; i < ilen; i += 2) {
+            translator_fake_ldw(extract64(insn, 48 - (i * 8), 16), pc + i);
+        }
         op = insn >> 56;
     } else {
         insn = ld_code2(env, s, pc);
-- 
2.34.1


