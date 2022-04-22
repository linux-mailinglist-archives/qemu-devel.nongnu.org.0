Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5E50B5BA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:56:24 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqxb-0007Ct-V1
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAC-0005Gh-NT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA9-0002tH-TG
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id bv16so10285276wrb.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S4r+9Jtute0CnHhryAfrHHj2Bmc0mJidkIeWbRs5UF8=;
 b=BnfiCVdqaEy7bhtikvhHLs9ze4nuHawhV9Cl/OB3Upw2EP4mVi7IlxC4iQNqqZsJDp
 jK2ttVqhlTAs+jNnVGyzpYAR+tWA9dzHQVvqz+OeTKVybl9yZa5JzOoXJZ2Hgkuw6ro1
 J8BDmy/w3A5YGff8p1m680ZInSSk67nGw22SGZNm+JxIMPsIIwrMc2q8m0c9LFUl5Vuu
 M0Qtw7KhmbRmNN8DltrfWeH3Pp61YGllCjmqu8Qqcv4ypsY+Ql/Npo5KC1xrLBTUFAkX
 da1zZRukhHrrydQsDHyBgTqBSRuwNZWo3krM/nVimkeZLN/t7IyDwvnGlQAQohuQumZm
 7Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4r+9Jtute0CnHhryAfrHHj2Bmc0mJidkIeWbRs5UF8=;
 b=7Rb1k+hFnqgmBtqDnctvD8h2BUOAfNDJI9AY2O1+ggw+1t1a4siI0B+I8hsmkQ8gJa
 VxdhWG8UvaCTX7zT78CTV1ju+R2XV6JFQq362xrhYkw3LX7MCTNY1iKRZsynE4M0BYVz
 0fmgLsTXxitXF5q/ghKEZ4KvNP7r0Bdx3eFe3xnnKtSESPjqkxYR2OhnimH5cFlA7Amy
 kDZEjklzyLhfJ0DSDnb0QiNnWUgIkqvR1zOZ6rqCGI84kZH1bUhmHddfPcZ07UIx65qG
 H2EQXXO2kM722eWIMSuieGE1znm2DHc47xrgdRHfFi9s8qkTFnvxUQMmPXV+nsDgXaKq
 7tIg==
X-Gm-Message-State: AOAM533oxwIGjDNvvrkrKXDwNm5+Q7TQ6A5z61miWUMVPBEVdWpqkgkh
 TxbZaOweVbz72l4hPnpPV3EJ/I8PmAtziQ==
X-Google-Smtp-Source: ABdhPJyeDsDHTD1X4PTUxTTtZWK8M8eKNYj4Sg4mG/c4l2oyNJ1h3ntaYooMLJULNEZcp2g8l9KHLA==
X-Received: by 2002:adf:eacf:0:b0:20a:c8c4:ac51 with SMTP id
 o15-20020adfeacf000000b0020ac8c4ac51mr2078936wrn.510.1650621915500; 
 Fri, 22 Apr 2022 03:05:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/61] target/arm: Update SCTLR bits to ARMv9.2
Date: Fri, 22 Apr 2022 11:04:15 +0100
Message-Id: <20220422100432.2288247-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Update SCTLR_ELx fields per ARM DDI0487 H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cc8f7f74eab..bee1cf4653a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1233,6 +1233,20 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_ATA0    (1ULL << 42) /* v8.5-MemTag */
 #define SCTLR_ATA     (1ULL << 43) /* v8.5-MemTag */
 #define SCTLR_DSSBS_64 (1ULL << 44) /* v8.5, AArch64 only */
+#define SCTLR_TWEDEn  (1ULL << 45)  /* FEAT_TWED */
+#define SCTLR_TWEDEL  MAKE_64_MASK(46, 4)  /* FEAT_TWED */
+#define SCTLR_TMT0    (1ULL << 50) /* FEAT_TME */
+#define SCTLR_TMT     (1ULL << 51) /* FEAT_TME */
+#define SCTLR_TME0    (1ULL << 52) /* FEAT_TME */
+#define SCTLR_TME     (1ULL << 53) /* FEAT_TME */
+#define SCTLR_EnASR   (1ULL << 54) /* FEAT_LS64_V */
+#define SCTLR_EnAS0   (1ULL << 55) /* FEAT_LS64_ACCDATA */
+#define SCTLR_EnALS   (1ULL << 56) /* FEAT_LS64 */
+#define SCTLR_EPAN    (1ULL << 57) /* FEAT_PAN3 */
+#define SCTLR_EnTP2   (1ULL << 60) /* FEAT_SME */
+#define SCTLR_NMI     (1ULL << 61) /* FEAT_NMI */
+#define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
+#define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
 
 #define CPTR_TCPAC    (1U << 31)
 #define CPTR_TTA      (1U << 20)
-- 
2.25.1


