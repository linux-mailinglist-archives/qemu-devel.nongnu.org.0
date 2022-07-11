Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED957050D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:06:35 +0200 (CEST)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAu3W-0001WF-6w
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0006V6-HN
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtv9-0002kD-QX
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:05 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v14so7134470wra.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cq6njPeWKBmD/7wPffofXcxJCvDo9VaNMF80FcBqOjU=;
 b=secG/W/dlqoCgGDHSLGYpo62C5tGwl5aZRZ6nrfwxLrEyTX3Kr1Ya3FjZsqbTuzLVL
 TUfw/QlX3vFE55lzGU1Qa99Q4VNVtXMlMmmgi0u4tfs59ToVCg+hM9P6KqCaXIAvmps4
 xjY21oaUuuMEJqZNF2PtB4HuvJem8gj7E69dvyQq0oNRBXVaoMCS6N+3OPViu7gkP8h6
 UNnyETszLC6gtlWnusVHDY35OwSU9YpDg2V6010Fzj4vIPwGMKVJkrEFXHTjLrT/lD87
 qCiimcuWTV+KTMxjN34fa22H9lgvzI4h0SM43S42Tz3hBy3r5/9IpvOVDAYfePrLZxPZ
 8U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cq6njPeWKBmD/7wPffofXcxJCvDo9VaNMF80FcBqOjU=;
 b=vOgI4QXeA23JFTiKbxtmQaT8mDax+82XhXXmtkluzNLgzq7VtRxR3auZ+fiW6KmO6W
 TrxTKLuYEcNv10iO9rqkQTd+0iVLylUA779W3RZg3ZTDPhBg4dovfbOnzvAFAMov83H5
 bCZ/6lWczOQIXwM/DKs8u+yTXO2N56J7DfVH//9vRlsecOZ3X+o7e0/oitIsOeKdTPe0
 9r04HlRxERJaC5bHZi9nF2VALwkhxitoUxk9/Sgj1mbz0occscGxoauKewuFqhGPIcOH
 eMsLwWLFB/xcONfeAGL7DFNfkPS6pX8ZL3lmVUx/TTxTVllXHwsFkepiRb+RcmOrwrY+
 pI1w==
X-Gm-Message-State: AJIora+PvJZlnUPs8qgTmQz/JIfkoi6tD+cPxK1qiwXoMa5nPq+JvS2L
 P524Wfa3a6T361U/8iWuJd/yTvKad6QHpw==
X-Google-Smtp-Source: AGRyM1szLMsJtVS/m/Of1i8Xct5GQ1/3S31JM8fRjlfVghaIhKLrZAzBvNoB3FpQZ2pdV+Tk7kbH/A==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr16555207wri.83.1657547874483; 
 Mon, 11 Jul 2022 06:57:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.57.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:57:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/45] target/arm: Add infrastructure for disas_sme
Date: Mon, 11 Jul 2022 14:57:07 +0100
Message-Id: <20220711135750.765803-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

This includes the build rules for the decoder, and the
new file for translation, but excludes any instructions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h |  1 +
 target/arm/sme.decode      | 20 ++++++++++++++++++++
 target/arm/translate-a64.c |  7 ++++++-
 target/arm/translate-sme.c | 35 +++++++++++++++++++++++++++++++++++
 target/arm/meson.build     |  2 ++
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index f0970c6b8cf..789b6e8e781 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -146,6 +146,7 @@ static inline int pred_gvec_reg_size(DisasContext *s)
 }
 
 bool disas_sve(DisasContext *, uint32_t);
+bool disas_sme(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
new file mode 100644
index 00000000000..c25c031a71d
--- /dev/null
+++ b/target/arm/sme.decode
@@ -0,0 +1,20 @@
+# AArch64 SME instruction descriptions
+#
+#  Copyright (c) 2022 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c86b97b1d49..a5f8a6c771b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14806,7 +14806,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     switch (extract32(insn, 25, 4)) {
-    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
+    case 0x0:
+        if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
+    case 0x1: case 0x3: /* UNALLOCATED */
         unallocated_encoding(s);
         break;
     case 0x2:
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
new file mode 100644
index 00000000000..786c93fb2db
--- /dev/null
+++ b/target/arm/translate-sme.c
@@ -0,0 +1,35 @@
+/*
+ * AArch64 SME translation
+ *
+ * Copyright (c) 2022 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "tcg/tcg-gvec-desc.h"
+#include "translate.h"
+#include "exec/helper-gen.h"
+#include "translate-a64.h"
+#include "fpu/softfloat.h"
+
+
+/*
+ * Include the generated decoder.
+ */
+
+#include "decode-sme.c.inc"
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 43dc6005478..6dd7e93643d 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,5 +1,6 @@
 gen = [
   decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
+  decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
@@ -50,6 +51,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'translate-a64.c',
   'translate-sve.c',
+  'translate-sme.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
-- 
2.25.1


