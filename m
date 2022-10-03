Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5E5F323C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:59:57 +0200 (CEST)
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMvC-0007IK-S1
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1ofMsb-0005LV-Mp
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 10:57:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1ofMsZ-0004rx-S3
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 10:57:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id f11so14495411wrm.6
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RV/X+WaJqNZO6nQexO9aMZi9OCWlE8Q3vDFCU19ehgg=;
 b=YcBNWgCzGgKluIVRv7kN/epE6GoK2NdrFIZeLZmi5o7vDBwZPVC4G+28FM+UF0Ne5D
 O9+5VywFmi035TNVRZKNGPyVGBdhYbNC9EB0kcrq7B5xEsF4s4XvGjjVk2cFqqkoL92O
 nh+U0eLxcpulGDcFJvkei4i0wnQauuY60cFAnvA8nLU0fTUQsr+xaQVqPpcWadV3ZJzW
 E70FE83xrow75jhRGdT58Wa9cwiU+8bSxdGjGfGR6CbWSQL31msxvCwl5ZwRE9INlIsl
 RDspmAZ7AJWaBEpxVONRr8863nAVOve7am22frKjLPSRxQk8RH3TUfq4fVVKJ4HPfhuQ
 LX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RV/X+WaJqNZO6nQexO9aMZi9OCWlE8Q3vDFCU19ehgg=;
 b=fOu58V9qBQHawlC6rHTCEE2QXkry2PWmzVjhNAgPvkzNfZ5rGRrv6wJs51SqFKdQfQ
 X/kdCPNw0UYB9mcg7LqXV6dH2jOwRMKCsI0EeTUTUgJEJ+POOYh4toyYWObqkTGN/rbQ
 N78OHKDGTdCHPgAHF6rSwxUAdnMPDlx5bohvY0PkNS9RplCgMSvb9Nk7XO110DJMO/9W
 jaljb53Dm0vxJV2TfskdAkRE613kjeLvhgNCf+x6BUJnHxpdsdmd2JX/Iyo9yFlmydwH
 f7WswE4wA5DoogkUYaIn74RQlW8vZP9XAo3ZlIuk6RNi7Vgj80hQ7lGbBNGJQXLtnAHo
 F+dg==
X-Gm-Message-State: ACrzQf3Jrmt4t+5mPgEJF/sHgjC9Vko63/fKOlr3tKGjWHoPFDo0wXSm
 heuWL/HwDrsrYyFV8QJIJi+yLA==
X-Google-Smtp-Source: AMsMyM7QW9KLxx1ok39dnt2to5KSw60xi9NAvZUh7CvtW7D3VgINZAFArT/GT0jl4RLkQngyEaBn3w==
X-Received: by 2002:a5d:69c6:0:b0:22c:dbb2:d84 with SMTP id
 s6-20020a5d69c6000000b0022cdbb20d84mr12881189wrw.190.1664809029566; 
 Mon, 03 Oct 2022 07:57:09 -0700 (PDT)
Received: from jerome-XPS-13-9310.. ([2a01:e0a:3cb:7bb0:5860:99c5:7ff3:cb36])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adfec86000000b0022b1d74dc56sm10040365wrn.79.2022.10.03.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 07:57:09 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when booting
 Linux with EL3
Date: Mon,  3 Oct 2022 16:56:41 +0200
Message-Id: <20221003145641.1921467-1-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jerome.forissier@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the Linux kernel booting.rst [1], CPTR_EL3.ESM and
SCR_EL3.EnTP2 must be initialized to 1 when EL3 is present and FEAT_SME
is advertised. This has to be taken care of when QEMU boots directly
into the kernel (i.e., "-M virt,secure=on -cpu max -kernel Image").

Cc: qemu-stable@nongnu.org
Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
Link: [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst?h=v6.0#n321
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 hw/arm/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..ee3858b673 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -763,6 +763,10 @@ static void do_cpu_reset(void *opaque)
                     if (cpu_isar_feature(aa64_sve, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
                     }
+                    if (cpu_isar_feature(aa64_sme, cpu)) {
+                        env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
+                        env->cp15.scr_el3 |= SCR_ENTP2;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.34.1


