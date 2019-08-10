Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232C8882E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:30:48 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwJ1j-00084g-GP
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34936)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIl8-0006Sc-G6
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIl7-0004VD-Bz
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:38 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37162)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIl7-0004V3-7e
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:37 -0400
Received: by mail-ot1-x344.google.com with SMTP id f17so5090247otq.4
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/+1yhQdyK8ZDeq0meu1PGD/43DRms8yD88y6giDNC0=;
 b=enIuXWGEz8l5Zk61S8PJUaCh9WDsjjkrYd4x7oLzOZAaHpZcoJxCsMdDeRwso1zLSx
 noGxuvsmiraB+I4NIV5kRcZFOQdOUIZOT0iLwkCUdYs/LlYyzt/dJGoo+JK8MwXFre2V
 sV1zjmP1bgcv/JK/hyWh5zd+lCTPUGvAXvD8OrvpxpKSgj7L+y8X02b9TplE6mGy/e6T
 gNNz8MbJmhUnZPH+glSmbHaFeR0zu7jv+cio0yGCoqpLAKrO8+WLZVPwqsWqBh1dhGNw
 CAC9bo4O30sz0mUavTm1h1ASaKdXuyT1Id0xrCG06MSlTsrpg+MViVmpqOIBX59imvdf
 vQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/+1yhQdyK8ZDeq0meu1PGD/43DRms8yD88y6giDNC0=;
 b=XV2pJhu542WWp2zk/BjGfwnWY22aq0vsbv+K5/ielBB39HSczsrkx4Up97r5EK6oBR
 RDs3zeTr9k4Ei5lGBnIuxFVIWAVS/OO7REJeHDacImD2KTSxGTNeaWKkS2ZZdYf0PV65
 DUpSpTL6JM24cvwG0z1HAw5dK4HgtzqyCWQXPGRka417Mo2asHfrEq9qLqyjwmCmgp61
 XpFtL186y7j8LHdHp1flXIAgQGotzSIgXcy0rWUkAdjX44bM4XzsWiG8uEBtjNrvlG8i
 wzklZUD1TlvD+iBEsc4shfYvN7qSdJkkRlO8ciJdQYueQ080WD+mIJkTSeiGsjnXnmOk
 6LeQ==
X-Gm-Message-State: APjAAAUWZu2CHlZ1wXFH+xP2AN37xzSgnf7TEUFvRU0CwA11ixNcmG4S
 JHYktVauVP6XcAQ819oq/EtReIm0
X-Google-Smtp-Source: APXvYqzW44RZ7k+imKy0HNWRLmArU4zFPGSzlKla7iUJ4Ha7rJv2cZTBiC9eYulZcoDuK17V4rxutg==
X-Received: by 2002:a9d:d51:: with SMTP id 75mr21550015oti.46.1565410416538;
 Fri, 09 Aug 2019 21:13:36 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:36 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:46 -0400
Message-Id: <20190810041255.6820-31-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: [Qemu-devel] [RFC PATCH v2 30/39] target/i386: introduce gvec-based
 code generator macros
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

Code generators defined using these macros rely on a gvec operation
(i.e. tcg_gen_gvec_*).

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index d721bb5142..36f2579654 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -23,6 +23,7 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
+#include "tcg-op-gvec.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
@@ -4882,6 +4883,22 @@ INSNOP_LDST_UNIFY(Qq, Nq, NqMq)
         gen_helper_ ## helper(cpu_env, s->ptr0, s->ptr1);       \
     }
 
+#define GEN_INSN_WR_GVEC(mnem, gvec, opW1, opR1, vece, oprsz, maxsz)    \
+    static void gen_insn_wr(mnem, opW1, opR1)(                          \
+        CPUX86State *env, DisasContext *s, insnop_t(opW1) ret,          \
+        insnop_t(opR1) arg1)                                            \
+    {                                                                   \
+        tcg_gen_gvec_ ## gvec(vece, ret, arg1, oprsz, maxsz);           \
+    }
+
+#define GEN_INSN_WRR_GVEC(mnem, gvec, opW1, opR1, opR2, vece, oprsz, maxsz) \
+    static void gen_insn_wrr(mnem, opW1, opR1, opR2)(                   \
+        CPUX86State *env, DisasContext *s, insnop_t(opW1) ret,          \
+        insnop_t(opR1) arg1, insnop_t(opR2) arg2)                       \
+    {                                                                   \
+        tcg_gen_gvec_ ## gvec(vece, ret, arg1, arg2, oprsz, maxsz);     \
+    }
+
 /*
  * Instruction translators
  */
-- 
2.20.1


