Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A176A21FA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:02:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdJp-0001jZ-D7; Fri, 24 Feb 2023 14:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJn-0001ih-AT
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:19 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJg-0002f1-1E
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:19 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso3789775pjb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265270;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dvwt/N5z68Lhd9kFSQNr2cRX2YRLFZu4dbfdxwq/zxM=;
 b=Pc5zY4DGfxBefuLPCH5QTDhvobZNPSI/J9G9gI5PwSiOidc3nTkwS6g6aeBsrl6QXp
 s3QXX/dt4prDziRNJvfzeN3dtAEftPy9JBGy2s8L04t0qdxysBuoKKafyaqD2Yr1EZH0
 ib5fr1+lrS9g1s2xWtOlMWxFpyD0GK+6SDYEPpKT6J0b1/Xe4f5PGbvjrVMTTSWljYrh
 ttF5hN9pFeHCB25JNj6pjaMdP7v0KG2Zu6fjxoLIZxb+VIRc+Tfp8T7kCa1G4vOnttKL
 ZA8uISdPdyW/ut51qTHD6OmOYk6qSLziDGbNKXWWIjylwZX/9Iav1Mon1Tax6RNztDs6
 tdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265270;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dvwt/N5z68Lhd9kFSQNr2cRX2YRLFZu4dbfdxwq/zxM=;
 b=PMDtttI7Qw8wcB6GcywoHshyOJC7k/772hteSxz0TIe1Q7nUaxSpySTW5NXbz7/GBs
 mlo0zBdJvYQZ+cMLgMFkmgNlk8pUns91tVAWthNeV0vj9dPIz0JAFpf673x8jUw7r6BG
 569nj7hSK0M9Nz0Et4Qf8f34260MH6M2CKrxkvHIJ0ukkUmwUQs4NUdvZdtph8yBj1LW
 P+VfRuHFm+JA3rFdWosICll+49RH/Vy4oL9C6kt6k5+Rz3LWC42WorMU4eXbU1OpPvDj
 CWrCaJev9Lu1STNkj1RVAog7wHrWpaeDjv6Lls3XeKC54CoFuPbFEDcZodowA9A/7nfO
 YlSw==
X-Gm-Message-State: AO0yUKU7LecQTQH2u/yYQa/fqirlRbptpHDY8Ab+IozJFbrMp4QK4xDl
 ltDitow8/WZ1u9xGQVZs0XZnMA==
X-Google-Smtp-Source: AK7set9oOIaEqwct5qwkndL4nNoCqpiaF9IedHxY+8p5MvoLREC7BwAmGIjjFDKtEFZPjtpCOMFilw==
X-Received: by 2002:a17:902:ce90:b0:19a:df76:ddd2 with SMTP id
 f16-20020a170902ce9000b0019adf76ddd2mr20974518plg.36.1677265270463; 
 Fri, 24 Feb 2023 11:01:10 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 w19-20020a170902d3d300b0019b4ee071ddsm5726980plb.209.2023.02.24.11.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:09 -0800 (PST)
Subject: [PULL 8/8] target/riscv: Fix vslide1up.vf and vslide1down.vf
Date: Fri, 24 Feb 2023 10:59:09 -0800
Message-Id: <20230224185908.32706-9-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

vslide1up_##BITWIDTH is used by the vslide1up.vx and vslide1up.vf. So its
scalar input should be uint64_t to hold the 64 bits float register.And the
same for vslide1down_##BITWIDTH.

This bug is caught when run these instructions on qemu-riscv32.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-ID: <20230213094550.29621-1-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/vector_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 00de879787..3073c54871 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5038,7 +5038,7 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
 
 #define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                      \
-static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
+static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
                      void *vs2, CPURISCVState *env, uint32_t desc)          \
 {                                                                           \
     typedef uint##BITWIDTH##_t ETYPE;                                       \
@@ -5086,7 +5086,7 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
 GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
 
 #define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                                     \
-static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
+static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
                        void *vs2, CPURISCVState *env, uint32_t desc)          \
 {                                                                             \
     typedef uint##BITWIDTH##_t ETYPE;                                         \
-- 
2.39.0


