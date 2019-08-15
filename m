Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83178E2C2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 04:35:06 +0200 (CEST)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy5bV-0001G1-BB
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 22:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5Dd-0006HX-15
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5Db-0000DA-PF
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:24 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:45964)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hy5Db-0000BQ-2g
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:23 -0400
Received: by mail-yb1-xb44.google.com with SMTP id u32so388453ybi.12
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 19:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIVLjBZ4EhE+MzFCNvDW3yPbuhtWbciOLVJl7OstUps=;
 b=k2Onn4NhqdtoXPAfgYt+WUWQhyu0qngo4it5N9DIC7oZRg+KprcOjC7PCoOMl/PCh4
 fcp0c1rfx+aRIFKKpw4EG6IpsjIZVC9S/0zfP1cQgpMw5A2h4wXEDvgfbBRGAdyrNft3
 9YhegKk2smr1QKqlulXu5PX4ZajczNZQBzh8YUB3qhWRGzd1jpWbLFM8B/OI3dmTffhT
 q7ObpkHmE94rcrIkWu4QG825vQll9BiM/vJNH1KPwFH3chNye1RDIkoF/wjnGvaUaXx6
 wf3OQwE0j8Z2tOd0Y3yTZXstQttLcURKCQEwkBp6X4++bniallDBf6b8rRoABlRkMeaF
 hjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIVLjBZ4EhE+MzFCNvDW3yPbuhtWbciOLVJl7OstUps=;
 b=OzdHDzvy4R2iO05DmsEUEzwkd2eMu75dJhSqSpvcMavg+Vc0pnm7mXgkM7LcllgtW1
 /dS/vSbgMHr2aK9AfUOO4NQfzlZPdVEuZxnYcEyugtdgC5dHNcJ8oI07GgfmPGAAcmrU
 hhriLdMNLbEVeoIGvuen9ZSPHXqD6c12N/eMGRtJXe/l6SrBgdkIqDjJ6Ki4yf0WxDn6
 1jIPK9RgwaojmjJszi+y0ir/3fuFDBOmU5Bh/2g/gblHtL2HimMH0TBWAtfnMrCXMUu7
 +TsSqUoXgV/uAZ8itgHFvdwYhViWxQgSVOAAHaEE1nHbbInj+XxZwT+pszJSiDB7KHJJ
 GCJg==
X-Gm-Message-State: APjAAAVo5GglSW3kSUF0DRm1Xh90t5SMm7/h76UYtnbnoD2XhsPM+Bxo
 S7FYiwS8mOJdYrSUXlagrBPHFjvQ
X-Google-Smtp-Source: APXvYqwTiWfSAl5/RiWBZUJUklY3ikhvh7560VxxoN0PtZ1GPSvEmAV7hEjCONp0RlbGtCfC2W2tAQ==
X-Received: by 2002:a25:6646:: with SMTP id z6mr60318ybm.67.1565835021968;
 Wed, 14 Aug 2019 19:10:21 -0700 (PDT)
Received: from dionysus.attlocal.net ([2601:c0:c67f:e390:8a9a:e33f:caf8:f018])
 by smtp.gmail.com with ESMTPSA id
 j3sm374882ywk.21.2019.08.14.19.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 19:10:21 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 22:09:12 -0400
Message-Id: <20190815020928.9679-31-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815020928.9679-1-jan.bobek@gmail.com>
References: <20190815020928.9679-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
Subject: [Qemu-devel] [RFC PATCH v3 30/46] target/i386: introduce code
 generators
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this context, "code generators" are functions that receive decoded
instruction operands and emit TCG ops implementing the correct
instruction functionality. Introduce the naming macros first, actual
generator macros will be added later.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 69233fd0f8..b5f609e147 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -5207,6 +5207,44 @@ INSNOP_LDST(xmm_t0, Mhq)
     }
 }
 
+/*
+ * Code generators
+ */
+#define gen_insn(mnem, argc, ...)               \
+    glue(gen_insn, argc)(mnem, ## __VA_ARGS__)
+#define gen_insn0(mnem)                         \
+    gen_ ## mnem ## _0
+#define gen_insn1(mnem, opT1)                   \
+    gen_ ## mnem ## _1 ## opT1
+#define gen_insn2(mnem, opT1, opT2)             \
+    gen_ ## mnem ## _2 ## opT1 ## opT2
+#define gen_insn3(mnem, opT1, opT2, opT3)       \
+    gen_ ## mnem ## _3 ## opT1 ## opT2 ## opT3
+#define gen_insn4(mnem, opT1, opT2, opT3, opT4)         \
+    gen_ ## mnem ## _4 ## opT1 ## opT2 ## opT3 ## opT4
+
+#define GEN_INSN0(mnem)                         \
+    static void gen_insn0(mnem)(                \
+        CPUX86State *env, DisasContext *s)
+#define GEN_INSN1(mnem, opT1)                   \
+    static void gen_insn1(mnem, opT1)(          \
+        CPUX86State *env, DisasContext *s,      \
+        insnop_arg_t(opT1) arg1)
+#define GEN_INSN2(mnem, opT1, opT2)                             \
+    static void gen_insn2(mnem, opT1, opT2)(                    \
+        CPUX86State *env, DisasContext *s,                      \
+        insnop_arg_t(opT1) arg1, insnop_arg_t(opT2) arg2)
+#define GEN_INSN3(mnem, opT1, opT2, opT3)                       \
+    static void gen_insn3(mnem, opT1, opT2, opT3)(              \
+        CPUX86State *env, DisasContext *s,                      \
+        insnop_arg_t(opT1) arg1, insnop_arg_t(opT2) arg2,       \
+        insnop_arg_t(opT3) arg3)
+#define GEN_INSN4(mnem, opT1, opT2, opT3, opT4)                 \
+    static void gen_insn4(mnem, opT1, opT2, opT3, opT4)(        \
+        CPUX86State *env, DisasContext *s,                      \
+        insnop_arg_t(opT1) arg1, insnop_arg_t(opT2) arg2,       \
+        insnop_arg_t(opT3) arg3, insnop_arg_t(opT4) arg4)
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1


