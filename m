Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC531E366
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:10:35 +0100 (CET)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWtu-0001cR-BP
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWSD-0001Ce-6H
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:57 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWS5-0004vU-AW
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:56 -0500
Received: by mail-pl1-x634.google.com with SMTP id s16so197357plr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SLHfS+Gcj+KKjKVIhmB4FpKge7O6y5amgsSfjoU+Ky4=;
 b=iisYvsSCbxIHnI8GgCtddcc0tna0xnSI+1XXW/fCbovln2PVvYQ3t7jnwuVPIJT0Ly
 QZWEcW8E3x1n07OfTq3VAQyGPdfnOyJtMdP7gbudeOZGLNf1EPoe4U8vxbqF18Vi9O2D
 aUYtrtVsqSfiErN7RsUgSuVYGE67E+2F8HRuCKH+RP1g5yW9aT4o/3iohzQqq2+dQs0R
 OiR+47eSpqpZZaXsNoH/FCJRDy6S049Ti12WskuVXnHzVpu3fBOTkQvi/va3Lv2Rxymx
 ClPsHlvJKBPtEfCSbYtGqR2m7IjEjGhWrkicane4FMijJ1L24wE15sMGmKhgGFMZA5wC
 o0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SLHfS+Gcj+KKjKVIhmB4FpKge7O6y5amgsSfjoU+Ky4=;
 b=Y2L6v+3n7Xey2mWuGMtwa8b4rB4pImWIakcsmcs3VVvudH66h8W8hl6T9yDk+T5MKt
 nyxE5SVTRz1o2r18UUzdQpnq4Nw+dEnS14yGzkrgU4p7GGMLAXQuK+syX4RQcTaRz8KY
 anwFZBtqheOLjVUdxt+gRgFwJYX1d6RoCTOl+OFMmrigJCiRYmxvmVyNZkM7q8W4S+Hk
 NkyIb3hASCnM45chASan85XqNb1Nxi2MIDD7yqYBo+0jAMNHQZEhTiEVcQO1naCTMSHT
 IlMNTFDxV0pbi77soWQlTRtFl5Dtg23nA9ZKUO3x94nkQy6YRgHfQioexvXVTWbD3jq0
 gjqw==
X-Gm-Message-State: AOAM533w03oj1K80G8XuSIxT8I559uBTKUtFWCDPfOc/bJrYgjsdsOCQ
 JNmMGV9KHNrfl55bFOIJX6DuZFaUMtLxlA==
X-Google-Smtp-Source: ABdhPJykLWkvAGahAZXmU8uiQ/rdSLkdP9DmWwkHhHcLXcBI8iM+i1I5UNI2l2Dn/wFfbPLMZpqcVQ==
X-Received: by 2002:a17:90b:1495:: with SMTP id
 js21mr1195582pjb.127.1613605304373; 
 Wed, 17 Feb 2021 15:41:44 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/35] Hexagon (tests/tcg/hexagon) TCG tests - floating point
Date: Wed, 17 Feb 2021 15:40:22 -0800
Message-Id: <20210217234023.1742406-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-34-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/hexagon/fpstuff.c       | 370 ++++++++++++++++++++++++++++++
 tests/tcg/hexagon/Makefile.target |   1 +
 2 files changed, 371 insertions(+)
 create mode 100644 tests/tcg/hexagon/fpstuff.c

diff --git a/tests/tcg/hexagon/fpstuff.c b/tests/tcg/hexagon/fpstuff.c
new file mode 100644
index 0000000000..e4f1a0eeb4
--- /dev/null
+++ b/tests/tcg/hexagon/fpstuff.c
@@ -0,0 +1,370 @@
+/*
+ *  Copyright(c) 2020-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * This test checks various FP operations performed on Hexagon
+ */
+
+#include <stdio.h>
+
+const int FPINVF_BIT = 1;                 /* Invalid */
+const int FPINVF = 1 << FPINVF_BIT;
+const int FPDBZF_BIT = 2;                 /* Divide by zero */
+const int FPDBZF = 1 << FPDBZF_BIT;
+const int FPOVFF_BIT = 3;                 /* Overflow */
+const int FPOVFF = 1 << FPOVFF_BIT;
+const int FPUNFF_BIT = 4;                 /* Underflow */
+const int FPUNFF = 1 << FPUNFF_BIT;
+const int FPINPF_BIT = 5;                 /* Inexact */
+const int FPINPF = 1 << FPINPF_BIT;
+
+const int SF_ZERO =                       0x00000000;
+const int SF_NaN =                        0x7fc00000;
+const int SF_NaN_special =                0x7f800001;
+const int SF_ANY =                        0x3f800000;
+const int SF_HEX_NAN =                    0xffffffff;
+
+const long long DF_NaN =                  0x7ff8000000000000ULL;
+const long long DF_ANY =                  0x3f80000000000000ULL;
+const long long DF_HEX_NAN =              0xffffffffffffffffULL;
+
+int err;
+
+#define CLEAR_FPSTATUS \
+    "r2 = usr\n\t" \
+    "r2 = clrbit(r2, #1)\n\t" \
+    "r2 = clrbit(r2, #2)\n\t" \
+    "r2 = clrbit(r2, #3)\n\t" \
+    "r2 = clrbit(r2, #4)\n\t" \
+    "r2 = clrbit(r2, #5)\n\t" \
+    "usr = r2\n\t"
+
+static void check_fpstatus_bit(int usr, int expect, int flag, const char *n)
+{
+    int bit = 1 << flag;
+    if ((usr & bit) != (expect & bit)) {
+        printf("ERROR %s: usr = %d, expect = %d\n", n,
+               (usr >> flag) & 1, (expect >> flag) & 1);
+        err++;
+    }
+}
+
+static void check_fpstatus(int usr, int expect)
+{
+    check_fpstatus_bit(usr, expect, FPINVF_BIT, "Invalid");
+    check_fpstatus_bit(usr, expect, FPDBZF_BIT, "Div by zero");
+    check_fpstatus_bit(usr, expect, FPOVFF_BIT, "Overflow");
+    check_fpstatus_bit(usr, expect, FPUNFF_BIT, "Underflow");
+    check_fpstatus_bit(usr, expect, FPINPF_BIT, "Inexact");
+}
+
+static void check32(int val, int expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%x != 0x%x\n", val, expect);
+        err++;
+    }
+}
+static void check64(unsigned long long val, unsigned long long expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%llx != 0x%llx\n", val, expect);
+        err++;
+    }
+}
+
+static void check_compare_exception(void)
+{
+    int cmp;
+    int usr;
+
+    /* Check that FP compares are quiet (don't raise any execptions) */
+    asm (CLEAR_FPSTATUS
+         "p0 = sfcmp.eq(%2, %3)\n\t"
+         "%0 = p0\n\t"
+         "%1 = usr\n\t"
+         : "=r"(cmp), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+         : "r2", "p0", "usr");
+    check32(cmp, 0);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "p0 = sfcmp.gt(%2, %3)\n\t"
+         "%0 = p0\n\t"
+         "%1 = usr\n\t"
+         : "=r"(cmp), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+         : "r2", "p0", "usr");
+    check32(cmp, 0);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "p0 = sfcmp.ge(%2, %3)\n\t"
+         "%0 = p0\n\t"
+         "%1 = usr\n\t"
+         : "=r"(cmp), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+         : "r2", "p0", "usr");
+    check32(cmp, 0);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "p0 = dfcmp.eq(%2, %3)\n\t"
+         "%0 = p0\n\t"
+         "%1 = usr\n\t"
+         : "=r"(cmp), "=r"(usr) : "r"(DF_NaN), "r"(DF_ANY)
+         : "r2", "p0", "usr");
+    check32(cmp, 0);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "p0 = dfcmp.gt(%2, %3)\n\t"
+         "%0 = p0\n\t"
+         "%1 = usr\n\t"
+         : "=r"(cmp), "=r"(usr) : "r"(DF_NaN), "r"(DF_ANY)
+         : "r2", "p0", "usr");
+    check32(cmp, 0);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "p0 = dfcmp.ge(%2, %3)\n\t"
+         "%0 = p0\n\t"
+         "%1 = usr\n\t"
+         : "=r"(cmp), "=r"(usr) : "r"(DF_NaN), "r"(DF_ANY)
+         : "r2", "p0", "usr");
+    check32(cmp, 0);
+    check_fpstatus(usr, 0);
+}
+
+static void check_sfminmax(void)
+{
+    int minmax;
+    int usr;
+
+    /*
+     * Execute sfmin/sfmax instructions with one operand as NaN
+     * Check that
+     *     Result is the other operand
+     *     Invalid bit in USR is not set
+     */
+     asm (CLEAR_FPSTATUS
+         "%0 = sfmin(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+         : "r2", "usr");
+    check64(minmax, SF_ANY);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "%0 = sfmax(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+         : "r2", "usr");
+    check64(minmax, SF_ANY);
+    check_fpstatus(usr, 0);
+
+    /*
+     * Execute sfmin/sfmax instructions with both operands NaN
+     * Check that
+     *     Result is SF_HEX_NAN
+     *     Invalid bit in USR is set
+     */
+    asm (CLEAR_FPSTATUS
+         "%0 = sfmin(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(SF_NaN), "r"(SF_NaN)
+         : "r2", "usr");
+    check64(minmax, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "%0 = sfmax(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(SF_NaN), "r"(SF_NaN)
+         : "r2", "usr");
+    check64(minmax, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+}
+
+static void check_dfminmax(void)
+{
+    unsigned long long minmax;
+    int usr;
+
+    /*
+     * Execute dfmin/dfmax instructions with one operand as NaN
+     * Check that
+     *     Result is the other operand
+     *     Invalid bit in USR is set
+     */
+     asm (CLEAR_FPSTATUS
+         "%0 = dfmin(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(DF_NaN), "r"(DF_ANY)
+         : "r2", "usr");
+    check64(minmax, DF_ANY);
+    check_fpstatus(usr, FPINVF);
+
+    asm (CLEAR_FPSTATUS
+         "%0 = dfmax(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(DF_NaN), "r"(DF_ANY)
+         : "r2", "usr");
+    check64(minmax, DF_ANY);
+    check_fpstatus(usr, FPINVF);
+
+    /*
+     * Execute dfmin/dfmax instructions with both operands NaN
+     * Check that
+     *     Result is DF_HEX_NAN
+     *     Invalid bit in USR is set
+     */
+    asm (CLEAR_FPSTATUS
+         "%0 = dfmin(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(DF_NaN), "r"(DF_NaN)
+         : "r2", "usr");
+    check64(minmax, DF_HEX_NAN);
+    check_fpstatus(usr, FPINVF);
+
+    asm (CLEAR_FPSTATUS
+         "%0 = dfmax(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(minmax), "=r"(usr) : "r"(DF_NaN), "r"(DF_NaN)
+         : "r2", "usr");
+    check64(minmax, DF_HEX_NAN);
+    check_fpstatus(usr, FPINVF);
+}
+
+static void check_canonical_NaN(void)
+{
+    int sf_result;
+    unsigned long long df_result;
+    int usr;
+
+    /* Check that each FP instruction properly returns SF_HEX_NAN/DF_HEX_NAN */
+    asm(CLEAR_FPSTATUS
+        "%0 = sfadd(%2, %3)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = sfsub(%2, %3)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = sfmpy(%2, %3)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    sf_result = SF_ZERO;
+    asm(CLEAR_FPSTATUS
+        "%0 += sfmpy(%2, %3)\n\t"
+        "%1 = usr\n\t"
+        : "+r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    sf_result = SF_ZERO;
+    asm(CLEAR_FPSTATUS
+        "p0 = !cmp.eq(r0, r0)\n\t"
+        "%0 += sfmpy(%2, %3, p0):scale\n\t"
+        "%1 = usr\n\t"
+        : "+r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr", "p0");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    sf_result = SF_ZERO;
+    asm(CLEAR_FPSTATUS
+        "%0 -= sfmpy(%2, %3)\n\t"
+        "%1 = usr\n\t"
+        : "+r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    sf_result = SF_ZERO;
+    asm(CLEAR_FPSTATUS
+        "%0 += sfmpy(%2, %3):lib\n\t"
+        "%1 = usr\n\t"
+        : "+r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    sf_result = SF_ZERO;
+    asm(CLEAR_FPSTATUS
+        "%0 -= sfmpy(%2, %3):lib\n\t"
+        "%1 = usr\n\t"
+        : "+r"(sf_result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2sf(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(sf_result), "=r"(usr) : "r"(DF_NaN)
+        : "r2", "usr");
+    check32(sf_result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = dfadd(%2, %3)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(df_result), "=r"(usr) : "r"(DF_NaN), "r"(DF_ANY)
+        : "r2", "usr");
+    check64(df_result, DF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = dfsub(%2, %3)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(df_result), "=r"(usr) : "r"(DF_NaN), "r"(DF_ANY)
+        : "r2", "usr");
+    check64(df_result, DF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2df(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(df_result), "=r"(usr) : "r"(SF_NaN)
+        : "r2", "usr");
+    check64(df_result, DF_HEX_NAN);
+    check_fpstatus(usr, 0);
+}
+
+int main()
+{
+    check_compare_exception();
+    check_sfminmax();
+    check_dfminmax();
+    check_canonical_NaN();
+
+    puts(err ? "FAIL" : "PASS");
+    return err ? 1 : 0;
+}
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index a54e3c7503..616af697fe 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -41,5 +41,6 @@ HEX_TESTS += preg_alias
 HEX_TESTS += dual_stores
 HEX_TESTS += mem_noshuf
 HEX_TESTS += atomics
+HEX_TESTS += fpstuff
 
 TESTS += $(HEX_TESTS)
-- 
2.25.1


