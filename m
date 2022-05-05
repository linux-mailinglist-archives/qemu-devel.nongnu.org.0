Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F408E51BD39
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:29:56 +0200 (CEST)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYk7-00080Q-Qz
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWx-0005ML-4R
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWt-0003PC-V9
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 r204-20020a1c44d5000000b003946c466c17so365954wma.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yn8j7cjv7DNvRTT6jmfpUT2fMRmuJEdJsUwJdEBQNPY=;
 b=T1/JRvUCS7ZRbn1kMih3cKMPYI9jxSen4vPTSCIGCjADonO6E33icw3RzFKGtHdOjK
 9FZuSOItJMnWY/T/p51AKlsbyyfQrteSuLyvGgo6SdvT6pdxwj3r13/yiPyCwzHoMSXz
 jArXVB1KVjRp2yR5LxqFH0BAViDNeyHQl4K+kqEWhg+tBnup8dh+D9+iUwwRhkTn2kZ0
 neT+VmOGMxprC8aeDrJXBqkq5LNGdDJmXAc0TXn+ofJWvLrAG4y9wyqAmpQM+uKhVO6X
 ++pHuB8YKy55FFNlxCkyjGkys9u5EdTxLJHOZg43m2MlOKXI2xUdAyttRo223c8Tr6lV
 NzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yn8j7cjv7DNvRTT6jmfpUT2fMRmuJEdJsUwJdEBQNPY=;
 b=WsbVm+Ui67ZEs+xonhmsvL8xtxJLqahOfKhV77082Q3c0Ku3jwMFPB/Or5CRk/5NVn
 6b3SXkpnEcBSb4pnR8D7vqafxQZGkvaqbatYlq2DNdz+qcjmNQuul4j7nmNTYjOGzW28
 RuYDM/6wsgc5ZQG2VDeQYKbsluk2g/sK6YZChTweuap2iZ6LYd1sCAHAnFFXXRDVUd6Q
 ToQx0mmr2QpbGNOMSv/+gsaXtYf2yiooTZIpkN2J1BplLt4HvQBE1AczFEFDTpqD+t2n
 9JedUHZK4CQdBKm7BViqL0n9w4BsAJNaVw73XB3z8mcubvXX8axISTWQ8VWaWfZnCWfn
 KkFA==
X-Gm-Message-State: AOAM533NqDnzl+snCVKkla9WHXlg9iDjnCkivuy/Zc1uuBYLBrxH3QWB
 dT7f6kK6AQZuwDq3T5F0VAA1eLOcfLqEMg==
X-Google-Smtp-Source: ABdhPJwyczC8uAe/wZcPiwiGQQOupsob2O5/0LS3dcDOGHjgiR43tgfB/lEv8HCboC4R99jcZZQKIQ==
X-Received: by 2002:a05:600c:35c5:b0:390:9982:7409 with SMTP id
 r5-20020a05600c35c500b0039099827409mr3572934wmq.127.1651741930443; 
 Thu, 05 May 2022 02:12:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] target/arm: read access to performance counters from EL0
Date: Thu,  5 May 2022 10:11:47 +0100
Message-Id: <20220505091147.2657652-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Alex Zuepke <alex.zuepke@tum.de>

The ARMv8 manual defines that PMUSERENR_EL0.ER enables read-access
to both PMXEVCNTR_EL0 and PMEVCNTR<n>_EL0 registers, however,
we only use it for PMXEVCNTR_EL0. Extend to PMEVCNTR<n>_EL0 as well.

Signed-off-by: Alex Zuepke <alex.zuepke@tum.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220428132717.84190-1-alex.zuepke@tum.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14ea5caad94..b4daf4f0761 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6639,10 +6639,10 @@ static void define_pmu_regs(ARMCPU *cpu)
               .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
               .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
               .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
-              .accessfn = pmreg_access },
+              .accessfn = pmreg_access_xevcntr },
             { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 8 | (3 & (i >> 3)),
-              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access_xevcntr,
               .type = ARM_CP_IO,
               .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
               .raw_readfn = pmevcntr_rawread,
-- 
2.25.1


