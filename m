Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747DE69B21D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4vd-0005Ft-Lb; Fri, 17 Feb 2023 12:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4va-0005Dm-EZ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:46 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vY-0000wr-PD
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:46 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 p15-20020a17090a2d8f00b00233ceae8407so1937353pjd.3
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dvwt/N5z68Lhd9kFSQNr2cRX2YRLFZu4dbfdxwq/zxM=;
 b=EKVHhP5gnNTPWIX0rnOgSnveNg56CGBDQrT5aMbY/4IK+duSy7ag0Ap1Fnz2xKW9LS
 vCxb0g+B1qPeVCGtBAUQ7TjeUYwvUeDelPYwgIFIaQPU5Ihlgndb7GbDIgkuW1NmPcU5
 61u5z6k7LIPO48nZFq08FYQoRMjXYLVjG6yeCjgwMbKk7EHDdXk0Wa779kF/NIzgN3oj
 zdFC3/i4nlTB9IWpNwRJL6rdWxp6Gl2SXUZ9i6a+8rldaVaC5VCCoXm7e+kz+WCRa2Av
 vKpjEHlf5EyOJijDyuf56sa7CC7u/kg5N25pnYajyTc4B9yR/+ehn0SLTzsqikJe51PE
 Lomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dvwt/N5z68Lhd9kFSQNr2cRX2YRLFZu4dbfdxwq/zxM=;
 b=BJ2pO8DhovZzXWSGlKDgxRXMSqxs0XrwwTkynzyDfOLSZDzdtBHY5L+qUxcXwuEx7L
 WE/xw/QhTevaaozr5WaZhB18Lfii4mfN/G9vn4Av9xghL1UlmMp/raejmoRTYJPUIzoJ
 2kOHol2yoP2RQ7qTECqrDJOZKuaJZB5vu4BNlsMpWjqi1NJ1sJwmT5e7rW+VW+c65UJJ
 xrsosA2GtRmyhZgbKdWTb+QLKYXXiwFl/umEYxR5zGP2B7VwtxCWIU1pkKsI5Fd7vuZM
 UqX74IUrlHf+I0Gj03nL/0IyHiGFPUmr6SFgRqMcPrKha5ft+DaMQQLyxgWFPmm7kEQf
 yFng==
X-Gm-Message-State: AO0yUKWobsIr68tP5KoPG7jZ9q89GrKCeALA+ycvhZSVMGSw/LDPPLQu
 FoZ0IRh0kCJRTjBqgxH1G8N0Kg==
X-Google-Smtp-Source: AK7set8wD4CUaRVyCzf9tRrgFFGaH1hGKm1MtFCg1ZdIxHP8JYTUSPuk28Sleyly9ZwpKSIlbXLPjg==
X-Received: by 2002:a05:6a20:3d88:b0:c7:6f26:c85 with SMTP id
 s8-20020a056a203d8800b000c76f260c85mr4091241pzi.36.1676656423538; 
 Fri, 17 Feb 2023 09:53:43 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 h38-20020a631226000000b004fab2ba60adsm2989699pgl.81.2023.02.17.09.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:43 -0800 (PST)
Subject: [PULL 9/9] target/riscv: Fix vslide1up.vf and vslide1down.vf
Date: Fri, 17 Feb 2023 09:52:03 -0800
Message-Id: <20230217175203.19510-10-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


