Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82161AB869
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 14:51:53 +0200 (CEST)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6DiR-0001fQ-Dk
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 08:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i6Ddw-0007L9-E9
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i6Ddu-0005rH-QT
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:11 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i6Ddu-0005q5-9p
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:10 -0400
Received: by mail-wr1-x443.google.com with SMTP id l11so6443189wrx.5
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOvVFZM+noAC6V/BvH+4ihUiEGZZA4RlqpGJMJGGkFU=;
 b=UbhzYfYyT0+0eBkCfuyA/NYq9gZ2zIDmpW33y6LJo7ZY8TB9TW0GhAS32ALq5py/Y1
 WK1vXt8GCenaFygMYNI+QKJC4Cqu8PW5iOEScde+EPDI589+As9Nkp/A7upXlJpjs4gG
 koaIL/mBWoxsi2KxUI3Jry9bW9C8a4hiZH/Zhx3UMBdBHZUFcZaed/Lx8JzuRjuO2oQM
 ipRXHVy47F0Vgey2qPAMhPcPTsj54gdEfiqZIumON0BumAGL9qZdBYbpuZ7hb/RvzadQ
 ADrhfev1GPVr+aRSEXvFLZikxhMMIU7voqQlhj+TG9nu2KtoP1yjW0QhwMYHQXIM6iD+
 FXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOvVFZM+noAC6V/BvH+4ihUiEGZZA4RlqpGJMJGGkFU=;
 b=XXPRlHl1dufxHBI3xc9hYV4OZmC+WmXzCcokefeCwn5Pfud7Wdu3G+tGcX0x2+eTQ2
 IFk+ahQ+gLMdZ0zSlvD9J3sC/72A4RcZISX9fq7YQUl+P/vi+zZYOZloynDnDTViSB3e
 JwI2eLyUUSPxxl++hieY41a4dGByjpmVjEnNNC1DdPzMotgv3cgmwpMZ9OewVmTHh27K
 zti9AVuCpChKXdKLdP48bl6or7mkBGTdViyE1YEgmdeHaU4cf2jYG8oX4D9z/43AHC7N
 +DdIfQMniLNiTYLOfU8B8ud/iJWvOuV374J4+gwrgsintMNv2+pJk9AMACb5wsMscY7b
 CqsQ==
X-Gm-Message-State: APjAAAVYFYp8hHyPnM+jA3AlKqJdjFgmXK+j/ibfTN1zLs7js1EseEZ3
 BL7JIzL2B/Tev1HZq3JnIxdsFA==
X-Google-Smtp-Source: APXvYqznQWOJpDSqdVw3u+OijRpvtKqDYhwo+yPFJRBylKL1Be2pe/VpJXN5sOXrndPGB4bYbzwcoA==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr6273231wrx.309.1567774029264; 
 Fri, 06 Sep 2019 05:47:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e20sm7142556wrc.34.2019.09.06.05.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:47:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D94221FF8F;
 Fri,  6 Sep 2019 13:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Fri,  6 Sep 2019 13:47:04 +0100
Message-Id: <20190906124706.19145-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906124706.19145-1-alex.bennee@linaro.org>
References: <20190906124706.19145-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v3 2/4] target/arm: handle A-profile
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As for the other semihosting calls we can resolve this at translate
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update for change to gen_exception_internal_insn API
v3
  - update for decode tree, merge T32 & A32 commits
  - dropped r-b due to changes
---
 target/arm/translate.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4cda7812bcb..ed4a97cfb44 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10222,14 +10222,25 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
 }
 
 /*
- * Supervisor call
+ * Supervisor call - both T32 & A32 come here so we need to check
+ * which mode we are in when checking for semihosting.
  */
 
 static bool trans_SVC(DisasContext *s, arg_SVC *a)
 {
-    gen_set_pc_im(s, s->base.pc_next);
-    s->svc_imm = a->imm;
-    s->base.is_jmp = DISAS_SWI;
+    const uint32_t semihost_imm = s->thumb ? 0xab : 0x123456;
+
+    if (semihosting_enabled() &&
+#ifndef CONFIG_USER_ONLY
+        s->current_el != 0 &&
+#endif
+        (a->imm == semihost_imm)) {
+        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+    } else {
+        gen_set_pc_im(s, s->base.pc_next);
+        s->svc_imm = a->imm;
+        s->base.is_jmp = DISAS_SWI;
+    }
     return true;
 }
 
-- 
2.20.1


