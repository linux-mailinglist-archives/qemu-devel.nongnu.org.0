Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD4C5E865
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 18:07:37 +0200 (CEST)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hihnE-0001uG-Fi
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 12:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53167)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hihZK-0002hr-Lw
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 11:53:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hihZI-00079x-Su
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 11:53:13 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hihZF-0006w6-Gh
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 11:53:10 -0400
Received: by mail-wr1-x443.google.com with SMTP id f9so3383636wre.12
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C07JYTlYo1eRUyog0KlI6elnxskISjJIiJwzTqYbA+8=;
 b=UtJvVyLQpFu+8IgfqaAEMNMXJWLmQyXi+bDVxiCfPuwPqgKn002GhB+RB+WCgmtwJS
 TsEpn8lLQnlbq2E0s9MXi1OPnHM6+alece4fBnrrIsTUvtx5zm4iTXVn8MqWyavDbZj9
 8Hhn8MFlQ0GDEvlWXOAYR26dURU3/EjICp7kRcjNfiI6mXipb0qXJlefUeQdl4xlg+KW
 B85WWKyksDDgkPa+h2SKbTh4j5tSgonXS/KCQCs0psHRjbuib/zVXZNp307gJkvdtqre
 HUD/zePH4Kteu1+xOlARFpbHLJBX+lPG9/lh7tKZ15NLRpDa3Amh7tM4ZpbCmsyg+HDg
 aGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C07JYTlYo1eRUyog0KlI6elnxskISjJIiJwzTqYbA+8=;
 b=qkppvTYUdyJ9FuTXsAaXCM3+M0Y9HtckKM66kc1NLPTkB3NedYL6YuE3jlpfR7f4Dj
 eZxS+aMGKc/aMNGJuHNrFffw5oJT5Ok90Mge75IiQRvd0QfdwOfyCL3vavEMZYLft3na
 Pst9FWSz+dEDQTWnFLb7dck5AXYsiSSvoPLdTPXEF23sk7+23IIzsSV8eQS0F/sI4d9A
 a7SMcBct3PNJF1IakgiiumbuCqkXytb8I6R2SfNKgI4c9tXmDB+MXG0zFNoQwD+9l6ab
 W+48gz8cEMsgkhkGWIrIIdwqHNVZwXoQV313vy1ZE66IUIxNdeYH3KG4qWLWI/Vn50zz
 WNMA==
X-Gm-Message-State: APjAAAXxldG494MbW+Z5Irv25097iudtGHz3DtFY5imX7XnnJGMCpsqK
 OwdqzL9yH6Q4THSX635akzKszA==
X-Google-Smtp-Source: APXvYqxHnJXkvGG6d8gcPOJYWDokuaIRvBf92J0NCD8K9WvytITZeLvT3IMJd96b+I5OPJCmgwZQOQ==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr28077120wro.162.1562169167053; 
 Wed, 03 Jul 2019 08:52:47 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id f204sm4014304wme.18.2019.07.03.08.52.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 08:52:45 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BE1A1FF8F;
 Wed,  3 Jul 2019 16:52:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 16:52:42 +0100
Message-Id: <20190703155244.28166-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703155244.28166-1-alex.bennee@linaro.org>
References: <20190703155244.28166-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v1 2/4] target/arm: handle A-profile T32
 semihosting at translate time
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As for the other semihosting calls we can resolve this at translate
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index aaab043636..8e2e955cbe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10995,6 +10995,24 @@ static inline void gen_thumb_bkpt(DisasContext *s, int imm8)
     gen_exception_bkpt_insn(s, 2, syn_aa32_bkpt(imm8, true));
 }
 
+/*
+ * Thumb SWI. On A-profile CPUs this may be a semihosting call.
+ */
+static inline void gen_thumb_swi(DisasContext *s, int imm8)
+{
+    if (semihosting_enabled() &&
+#ifndef CONFIG_USER_ONLY
+        s->current_el != 0 &&
+#endif
+        (imm8 == 0xab)) {
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
+        return;
+    }
+    gen_set_pc_im(s, s->pc);
+    s->svc_imm = imm8;
+    s->base.is_jmp = DISAS_SWI;
+}
+
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t val, op, rm, rn, rd, shift, cond;
@@ -11752,10 +11770,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             goto undef;
 
         if (cond == 0xf) {
-            /* swi */
-            gen_set_pc_im(s, s->pc);
-            s->svc_imm = extract32(insn, 0, 8);
-            s->base.is_jmp = DISAS_SWI;
+            /* swi/svc  */
+            gen_thumb_swi(s, extract32(insn, 0, 8));
             break;
         }
         /* generate a conditional jump to next instruction */
-- 
2.20.1


