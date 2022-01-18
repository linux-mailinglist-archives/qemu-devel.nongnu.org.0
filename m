Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C944913E6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:05:03 +0100 (CET)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9drq-0006Oz-H9
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:05:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZO-0000Hw-Ss
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:02 -0500
Received: from [2607:f8b0:4864:20::62e] (port=37591
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZM-0007Vc-2B
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id n11so21019736plf.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6X6uKJ2JNZMFaH4JOhQuJr7oqwjryS8q6Pz6EFPHQyM=;
 b=eYbdtwT/7C7Dpb1/QQi2ZR1H4GSx3Fjf1pvuQrNJDqc9mimKY0NqL2schChYpLbzFI
 stLQ4NjCqdpsMb0S9pvOzI2fdmbdS+rDELXR6U8Fe9H/jpH2YuyG6DqL89IAGsURpypt
 IzuRorZVUbh9gRrI5LfobGLfb02rKDeMSJIj5ZRgQLWPJZ0idkdH+//vMnlqL9CSWqgA
 p8aMyngtak6gTY8nsTkQ9LoCXE01ubRngi/C/sW6Cib/7kd3FSTnXU5n7qAx6kuTtVdH
 nzPp8LMvtW2brxp4qo2CxZB7QAF4DGE1gUj31OYNEDi3Ay2mm4j6SDn9JTB3EUKL9Niz
 YT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6X6uKJ2JNZMFaH4JOhQuJr7oqwjryS8q6Pz6EFPHQyM=;
 b=5HRVSt9DKINtHYYi24FF8Qh7r1Bh8uozyztQSalpiyf0oys9k1tXmxsSPJMFWcMVat
 TM/25byLz+KbTQ/a2GxJA3Kw3znbTqVVcKy0LH0cQcANzr2SLQBZmc4vKb52D9gkwtJU
 vEhXt3uCQV3kUTFdmqzYOwA2xAg6AgwmXg6i0sRmbVZ+lXQv5OFMRtMkbnpfYlY0pans
 S93TjV3/secm8UDt5/KjrCptuCP60HzFaKsCZi+ZOrWcdIP0fzhpq6emt0uJ/rERFbZs
 JxJMDaL19KZQ7Bpfqsy1on7oOufE+gh2Jv4l/TYk0eTitrq0zPKIDNE6Rdhf7Aoe6vkT
 /fMQ==
X-Gm-Message-State: AOAM533UrVA2jf+/7DJTSFwn7/lBTkD3MJDDDvatdPZI5O0A65dpRWtV
 1FSoS2LvqyApiZciuVjA34CQUzgIXCMQHfPu
X-Google-Smtp-Source: ABdhPJz0eqcEWHNOc3M5yqgfSSniQdIyh01JE7Iku7dKxLHv8IhV/8lG8NuRnU8BtLhVi6R52o1iLA==
X-Received: by 2002:a17:902:b78b:b0:14a:1f78:2739 with SMTP id
 e11-20020a170902b78b00b0014a1f782739mr25150927pls.45.1642470354640; 
 Mon, 17 Jan 2022 17:45:54 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/17] target/riscv: rvv-1.0: Add Zve64f support for
 widening type-convert insns
Date: Tue, 18 Jan 2022 09:45:11 +0800
Message-Id: <20220118014522.13613-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector widening conversion instructions are provided to and from all
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++++------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 08f25e3ce4..58f12366dd 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -77,6 +77,17 @@ static bool require_zve64f(DisasContext *s)
     return s->ext_zve64f ? s->sew <= MO_32 : true;
 }
 
+static bool require_scale_zve64f(DisasContext *s)
+{
+    /* RVV + Zve64f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve64f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <= MO_16 : true;
+}
+
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int vd)
 {
@@ -2333,7 +2344,8 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* OPFVV with WIDEN */
@@ -2372,7 +2384,8 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* OPFVF with WIDEN */
@@ -2402,7 +2415,8 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* WIDEN OPFVV with WIDEN */
@@ -2441,7 +2455,8 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dd(s, a->rd, a->rs2, a->vm);
+           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* WIDEN OPFVF with WIDEN */
@@ -2700,14 +2715,16 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           (s->sew != MO_8) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
@@ -2758,7 +2775,8 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
-- 
2.31.1


