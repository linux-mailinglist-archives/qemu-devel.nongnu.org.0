Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38470460D63
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:42:32 +0100 (CET)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXYl-0004gC-B7
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:42:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1W-0001rQ-M1
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:10 -0500
Received: from [2607:f8b0:4864:20::1035] (port=36646
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1U-0000jC-ON
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so14353286pja.1
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wAsbdEEdW0VsHEhKHigFQ1lYgGtjc9PMvUIOzqgH5ts=;
 b=ICTSkmGMtRkjv3SGwNM7t0dt4X2xzguPnnFb76En25gQdxFJKGBtjOCLu883bs6EJJ
 wtmSrf3ctBMUH+jcfoli/IdUYi/unj23KOlW1KXhvZZX6eDR/2fXq1LRu6b8NrT+kBbp
 K+xy4qjT/UvUpYPvRSpgn0aGvalcjcLpoVa/bo94ZnKSr/Pb/TK9RxOEa0IQTEjnQKsq
 a3I/ZEDM4KUxD04AfbM7DbAAKfbJN+OE7m/mV/1r2mQRwJqcm10MAGaz8v2XOKqTlMGT
 yUSO3FPhQnm6YyFetzVhdDHKDvHen8KRSpG85iohsF+yBK2vlNruVQruB8yz5Mq4f2us
 Qmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wAsbdEEdW0VsHEhKHigFQ1lYgGtjc9PMvUIOzqgH5ts=;
 b=XzXKp7p5KdQTyL37rbRx60dTWYFmskDmW4Zf9S67H2MJVLHDLzco0JZZCEGe3buN4+
 cjeoToMPt/otCcb+jboJzxOm/2At0rIeAOu02UtZBphfLs3neXwa/pmo/VLu/LEq1t9H
 tffLibssqyw1UyRE7e+Dj5zDQX0l7hOvMDkQB0jfyJ9mVGmV0LnbsXm3I2FGu8plN0vH
 PmYfgCapK6G71XEC8L1VCvqEuNYUWQG4aifM2Wozj2zRLq91VFSIStXgt7AjVWtvMgEN
 D9eeN+PP5xRvfkvOEg3xe487/S0kwhFkBXXSoEYq9Oz6T5GzoDEZeshSo9hErPho9W67
 4jhw==
X-Gm-Message-State: AOAM5334tpmEug8annLTFIod+PGMbS6Oj3CGw0LRz6VM6OYS8KFIJEpO
 Y/0G73y0F0NeVbaQCgIEbipWFJvG5sNmzXi7
X-Google-Smtp-Source: ABdhPJx3ufvotmz/7y/apUABYRyS1h4G+skLnqiHzmbAGWOR/OWU+YWbPGLCI4olleKNPKmrexrR5A==
X-Received: by 2002:a17:902:f091:b0:143:b72e:c126 with SMTP id
 p17-20020a170902f09100b00143b72ec126mr56176018pla.61.1638155287407; 
 Sun, 28 Nov 2021 19:08:07 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 53/77] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Mon, 29 Nov 2021 11:03:13 +0800
Message-Id: <20211129030340.429689-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++++++++---
 target/riscv/vector_helper.c            | 12 ++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f5588d9832c..998247d71d9 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2637,9 +2637,15 @@ GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
-GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
+static bool freduction_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_check(s, a) &&
+           require_rvf(s);
+}
+
+GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c95c8bd9db3..79a2c3ff3ac 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4173,14 +4173,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maximum_number)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum_number)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-- 
2.25.1


