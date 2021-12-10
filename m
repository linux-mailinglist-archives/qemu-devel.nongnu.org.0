Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA2C46FD63
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:08:13 +0100 (CET)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbsy-0006Wn-EG
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapC-00086U-Ee
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:14 -0500
Received: from [2607:f8b0:4864:20::102a] (port=41578
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvap6-000792-KC
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:14 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso6910921pjb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0rY9mKULfSQ0EpzkA8qwqz5+yWbt6UhklqyNOxzLko=;
 b=kmy39cuEYF/TpZOWjFbPUM7nyd7+9+iI7MGiYm3tlkNPGe0IRNl+SbgrwxFlQoQZcL
 j+oEDRWUTIwZLsGDAxEa4Kg3rJ6ACWiVZ90EFhJl+Qd+WCJvgq7/wkdaNILdzHms07lV
 2OSWuUAn/6JGrOZ1mJns2rV21r2/OuMJoy2RdKYxGOB2W6ycguufO/btIhJq/b4D3P0D
 hbYhC5J684OLwWeci/A4N8kx3WVyfLzfSIelK42oWi18tUedvf75c57XR2ZF47Af7bF0
 /418PqWN9zHcZnakg2wOCymeN7XMi6Wm8jPo5Bajz6iv9MwVnYFRvCccMxtC5g9m8aRy
 eQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0rY9mKULfSQ0EpzkA8qwqz5+yWbt6UhklqyNOxzLko=;
 b=j0v0jKkOgvaPBZ0Vm/oue3I6ake4MpDev8rpBSp9PNDV6dFg2W7d46DQ7zFHcxLIpr
 SdJra0bfm8hRrWHQUBId7xuD+UdcgGFuXd7bmrN15S37hBL1C3XqW5vpTBjGdcIzd86q
 /5bgQlKvU7OcH3mBQlGvrBySr10NAelnPg0LJgQDnS4uEkrPHXhT30BFGmQS8xCZ+36V
 yuNfBTAtySXeVqH1oVbY2ie/5ichno4W4S4jDmP6sUJE3MuvHWGT/ePnNyIHRmsgItW0
 17bpwfY/fMiaEWKBFiTnKFW8KHmeD++AqNcvxwgGRfvWOZqHnY6PwTR4VJuABITIQJfU
 czkg==
X-Gm-Message-State: AOAM530PY2wH/GLkTsGml2oTZUQFo1wQkAn99Gd5We7W21Pl+0facArt
 F6yIxOYI3pidniC4c3tP3Khy7Mz5vKe++NvE
X-Google-Smtp-Source: ABdhPJwQ2egd93PPNExt32Whyaad8oCiMC9JzAONpHPiFnNFWzBrGEknFZAvMBTEA5fmhi715KYBTg==
X-Received: by 2002:a17:902:ea10:b0:142:112d:c0b9 with SMTP id
 s16-20020a170902ea1000b00142112dc0b9mr73235050plg.35.1639123207253; 
 Fri, 10 Dec 2021 00:00:07 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 59/77] target/riscv: rvv-1.0: floating-point min/max
 instructions
Date: Fri, 10 Dec 2021 15:56:45 +0800
Message-Id: <20211210075704.23951-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index aed230e1ad..cc95b69255 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3387,28 +3387,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
 
 /* Vector Floating-Point MIN/MAX Instructions */
-RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
-RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
-RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
+RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
+RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
+RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minimum_number)
 GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
-RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
-RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
+RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minimum_number)
+RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minimum_number)
+RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minimum_number)
 GEN_VEXT_VF(vfmin_vf_h, 2, 2)
 GEN_VEXT_VF(vfmin_vf_w, 4, 4)
 GEN_VEXT_VF(vfmin_vf_d, 8, 8)
 
-RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
+RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maximum_number)
+RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maximum_number)
+RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maximum_number)
 GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
+RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maximum_number)
+RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maximum_number)
+RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maximum_number)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8)
-- 
2.31.1


