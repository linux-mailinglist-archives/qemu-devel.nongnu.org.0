Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CCB982BB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 20:27:48 +0200 (CEST)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0VKl-0003sx-Fc
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 14:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URv-0001my-BC
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URt-0008WM-5X
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:31:07 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:38908)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0URt-0008W0-0p
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:31:05 -0400
Received: by mail-yb1-xb42.google.com with SMTP id j199so1343229ybg.5
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1c3Na9HxVp5HO/a1YQcRY2ARb5VgxB+NQ4zHhWuq1wk=;
 b=lxRADTNpi5bLD68A9jD6pH4WCJwjyfG9iRGtM0+tFFILtWebWRfEMkOzCUsG8IMkO/
 Y5/5OLUdGKXvEJl0CORop77ArTMHxSWURCxxU56mUjog6+s4CaThDKipbD/wO57PQ0gq
 zaJ+IoPSdoH4JXlLyKjminn/Ae2bPsI7m/5k9io1iqRcNRTGdNDREOaY7gvyrL6urYSK
 pKs0iN1tthy9C87Vr1uDQ1iTgH08g+NuKfLoduwzhjI98Ndc8k1QBh71r/lBl884XVZO
 GI71DX6yg8GFxOxDh+WP/hNV52RfT3v+imKtiJybkOsyZcq2G0jrdkEbiyKvQ9Oa3opU
 bMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1c3Na9HxVp5HO/a1YQcRY2ARb5VgxB+NQ4zHhWuq1wk=;
 b=H3gqV2eU4blUG2Zd6N+TtPRdU752DfnqxjFFH9W6aL2x5y6YpZ3qC9amTT6PSVhuy6
 EJwBbn/nuftCzaSS4OdN3Nr2pXVIeW06RjUyjtJ3zSzvhVmZTfZ/qiChMhbCZ7Vg8NBf
 QP6S6NaIO4EH+UDQZWAqWuYL8hm7SB7sd0h3gqoXQYZsrnyAlB25r9ykVul3pY9+ZTzW
 DoaaqE6SIjzIH0uxj1zqIcNVy3W1mlkVBPaRMMfErJxeDgdghme1YIrZ8fZAj+7t2m0+
 eC/tgde3mi0+GLjCs2ZVitxAqB7SBpZo0LutoqOofrF9BMTTJxxKbBEZvGS2KPZPvwWB
 OxOg==
X-Gm-Message-State: APjAAAX26BhXSauiceTsgmqsYV9H6f0iT1TgXedS5QWfd7nZDwzYFdEH
 LATgrJhA2CxpxnGj7EW7FIypWz28
X-Google-Smtp-Source: APXvYqzujNeoCqmonO71Q81kwm9FDorBdg97znBwsXidlIutJvPbJ/hme2GnQtGygpGnnGBg/r9YBg==
X-Received: by 2002:a25:2f42:: with SMTP id v63mr24155062ybv.228.1566408664326; 
 Wed, 21 Aug 2019 10:31:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:31:03 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:29:43 -0400
Message-Id: <20190821172951.15333-68-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
Subject: [Qemu-devel] [RFC PATCH v4 67/75] target/i386: introduce aliases
 for helper-based tcg_gen_gvec_* functions
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

Expand our aliases for tcg_gen_gvec_* functions to also include those
that generate calls to out-of-line helpers. This allows us use them
via the DEF_GEN_INSN*_GVEC macros.
---
 target/i386/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 78c91a85c9..c7e664e798 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4441,6 +4441,36 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     }
 }
 
+#define gen_gvec_s1_ool(ret, aofs, oprsz, maxsz, data, helper)  \
+    do {                                                        \
+        const TCGv_ptr a0 = tcg_temp_new_ptr();                 \
+        const TCGv_i32 desc =                                   \
+              tcg_const_i32(simd_desc(oprsz, maxsz, 0));        \
+                                                                \
+        tcg_gen_addi_ptr(a0, cpu_env, aofs);                    \
+        gen_helper_ ## helper(ret, a0, desc);                   \
+                                                                \
+        tcg_temp_free_ptr(a0);                                  \
+        tcg_temp_free_i32(desc);                                \
+    } while (0)
+
+/*
+ * We pass the immediate value via simd_data. The width is limited
+ * to SIMD_DATA_BITS, but we only use up to 8-bit immediates.
+ */
+#define gen_gvec_sd1_ool(ret, aofs, oprsz, maxsz, helper)       \
+    gen_gvec_s1_ool(ret, aofs, oprsz, maxsz, 0, helper)
+#define gen_gvec_sq1_ool(ret, aofs, oprsz, maxsz, helper)       \
+    gen_gvec_s1_ool(ret, aofs, oprsz, maxsz, 0, helper)
+#define gen_gvec_2_ool(aofs, bofs, oprsz, maxsz, helper)                \
+    tcg_gen_gvec_2_ool(aofs, bofs, oprsz, maxsz, 0, gen_helper_ ## helper)
+#define gen_gvec_2i_ool(aofs, bofs, c, oprsz, maxsz, helper)            \
+    tcg_gen_gvec_2_ool(aofs, bofs, oprsz, maxsz, c, gen_helper_ ## helper)
+#define gen_gvec_3_ool(aofs, bofs, cofs, oprsz, maxsz, helper)          \
+    tcg_gen_gvec_3_ool(aofs, bofs, cofs, oprsz, maxsz, 0, gen_helper_ ## helper)
+#define gen_gvec_3i_ool(aofs, bofs, cofs, c, oprsz, maxsz, helper)      \
+    tcg_gen_gvec_3_ool(aofs, bofs, cofs, oprsz, maxsz, c, gen_helper_ ## helper)
+
 #define gen_gvec_mov(dofs, aofs, oprsz, maxsz, vece)    \
     tcg_gen_gvec_mov(vece, dofs, aofs, oprsz, maxsz)
 
-- 
2.20.1


