Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511A10527
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 07:18:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLhdN-0007y7-4G
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 01:18:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLhRQ-0006Se-Pz
	for qemu-devel@nongnu.org; Wed, 01 May 2019 01:06:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLhRN-0002sC-OW
	for qemu-devel@nongnu.org; Wed, 01 May 2019 01:06:00 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLhRN-0002rq-J3
	for qemu-devel@nongnu.org; Wed, 01 May 2019 01:05:57 -0400
Received: by mail-pl1-x644.google.com with SMTP id b3so7749390plr.7
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 22:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A0TLLHctb8x320fY5Kq/5/FkOQqXe52LbNwf5bR69vI=;
	b=fi0++L+zFFB2v8f3i1fupthWDz62d8FzF+KwgOGJsJpNxcxmSxCfaLdY21A0TfUclf
	fW3HDCVBnM/J2tYAGgdnkHDCgkzqLiKVcO/tvZABWzA/LMtdSwDPsXN6cJENJe05LDKl
	yfj3/5/bhmExvfVqMc3DHmeKtgjerS9Dyo4u0RJOmC4/+aE0Q6swiOGKopgYoFSc6AXf
	z2MJZ8vfdBD1SnGoeyZKkq2BOZGEV+jCxGOQRlQ/VTNRKCcIXpV8yV9GckTLOGaj1az+
	GzRKlyBnfi1u9YxXaF3+810iyZzrcGZAA6P6uEz+Jqjfuqug/4p5tqoqmpHRww2Bahej
	bPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A0TLLHctb8x320fY5Kq/5/FkOQqXe52LbNwf5bR69vI=;
	b=aJ6IlReyr/RowG04TQZD8h256uc7m9R4OPY1XPBipNstKjhdxR2JjoCtL6sDQTh27N
	toiaYSeNAREzlTZgCRouOsiFf7QhIYGbDSkZrtOH1mKiVwqPl8MKtEqt+ZjcnNrq1vO1
	Emw2gW+ZWMYZ48dolXWykmn2z+lK5PUaZs7C2LQFL9zoEsW4Dl+l/Ddax0DLD9zMslF8
	+nPWAqHOTLq5jQLo1kEyjnG4HkPCwnC8Ip3MWTYNKAu/j8G+Y236vRh4EB54Y0j5ewx4
	1D/RijE5IDv2zIBUTu1+kOicUXk8CIFaetquATLv1cbCpHVayuyxUELTSMNjpbtkcZNP
	kzcQ==
X-Gm-Message-State: APjAAAWbrgg8afRe0uq8xJaipW7uhqSRlKUiQCgimv54BPlGTwW69dVb
	uzqcp62GHK5myIZik3L8mW9wTs4+S+Q=
X-Google-Smtp-Source: APXvYqxRtuYfJmJmP4zk0ceX9CHTlt3kUBQBGq4t0+xHH8tTyRQhDAw+TIJjZqLjXouojIJEuq/lMw==
X-Received: by 2002:a17:902:6b:: with SMTP id
	98mr59424891pla.271.1556687156129; 
	Tue, 30 Apr 2019 22:05:56 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	t127sm9687251pfb.106.2019.04.30.22.05.54 for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 22:05:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 22:05:17 -0700
Message-Id: <20190501050536.15580-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501050536.15580-1-richard.henderson@linaro.org>
References: <20190501050536.15580-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v2 10/29] tcg: Add tcg_out_dupm_vec to the
 backend interface
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently stubbed out in all backends that support vectors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.inc.c |  6 ++++++
 tcg/i386/tcg-target.inc.c    |  7 +++++++
 tcg/tcg.c                    | 19 ++++++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 3cefdd1e43..4a3cfa778a 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -822,6 +822,12 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
     return true;
 }
 
+static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg r, TCGReg base, intptr_t offset)
+{
+    return false;
+}
+
 static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
                          tcg_target_long value)
 {
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 3c8229d413..f04933bc19 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -891,6 +891,13 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
     return true;
 }
 
+static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg r, TCGReg base, intptr_t offset)
+{
+    return false;
+}
+
+
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
                              TCGReg ret, tcg_target_long arg)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 78fd0e4594..ef01cf8214 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -111,6 +111,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #if TCG_TARGET_MAYBE_vec
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg dst, TCGReg src);
+static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg dst, TCGReg base, intptr_t offset);
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
                              TCGReg dst, tcg_target_long arg);
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
@@ -122,6 +124,11 @@ static inline bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
 {
     g_assert_not_reached();
 }
+static inline bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                                    TCGReg dst, TCGReg base, intptr_t offset)
+{
+    g_assert_not_reached();
+}
 static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type,
                                     TCGReg dst, tcg_target_long arg)
 {
@@ -3413,6 +3420,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     TCGRegSet dup_out_regs, dup_in_regs;
     TCGTemp *its, *ots;
     TCGType itype, vtype;
+    intptr_t endian_fixup;
     unsigned vece;
     bool ok;
 
@@ -3482,7 +3490,16 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
         /* fall through */
 
     case TEMP_VAL_MEM:
-        /* TODO: dup from memory */
+#ifdef HOST_WORDS_BIGENDIAN
+        endian_fixup = itype == TCG_TYPE_I32 ? 4 : 8;
+        endian_fixup -= 1 << vece;
+#else
+        endian_fixup = 0;
+#endif
+        if (tcg_out_dupm_vec(s, vtype, vece, ots->reg, its->mem_base->reg,
+                             its->mem_offset + endian_fixup)) {
+            goto done;
+        }
         tcg_out_ld(s, itype, ots->reg, its->mem_base->reg, its->mem_offset);
         break;
 
-- 
2.17.1


