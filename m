Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE251BCDD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:11:23 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYSA-0004Bz-Et
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWr-0005Go-7p
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:09 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWo-0003Nl-R1
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k2so5221493wrd.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rTuyUf9hKQBvU2NQj0c8nRvpNJqnGED5I8QAsoNQvNE=;
 b=qV0SPRLsNOH8Efiip0Gxjbn0Fi1wCDnReP/o2TQE8HWeNJVXJ90fWD1iYWY53p4S0w
 Kwbv43dXPQ5reswIEx54QFGSwkz4sYU9hLPBMq55/4Db2fS8lZuysl3m41Fs9WHr4aVu
 Lv3HHSmZ7Gp9rUUuu7DAndfgybBCTF331r7+5+VoXCS9n2C+9rfqBuIsbg1TU0LEKor+
 0RBDZdhgh8mm1mMIPPOxcbsaXS/eOprBBrWvxKxm2XFwz9riGjESIAyx6K69bn0G1rFg
 7bzWhtXRR3FxMfc7gm9/lecuMT//NFaXzIYZaw8OFXbjyUp56Br5GTIMNMPfZOO8a1wu
 KDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTuyUf9hKQBvU2NQj0c8nRvpNJqnGED5I8QAsoNQvNE=;
 b=itI51jp8gu0djsKbPPpSwcBEGILutrpSA/YiXwbcMuTtD3MLDnKNZ+A+GyBqUipAtI
 uoqECPj4g7iDHME7KKw24i98+jtdInC8sKTJJB6HX/EoALKEprmKVLXAdpW4B9YxhAzQ
 tP88VEUiYm3KVTBZpSoL/5z+qnT2zCp12DJMVBmw/1CZD5HFLWpGitQkgT7rgDMEtWRz
 ISkwX9YqVus37cmQNADr2RjB4oHDQj9vqNQ0wxzNIcb3BBuKOTAGoV52ZWUwpmr1Nsij
 EBBHq/SQnPsY/dt6VQD0aLRzc0Ycdow6DLPjeVMrAiLYGRNZdcjfsWGk2gEXWnHvonG8
 Fvig==
X-Gm-Message-State: AOAM530IQeA+ND4K0d1C/bhT3IZCe2DbT3UP0O6MFKjgCOHWINtKMtN2
 8wmOQ8oFUNJTxs6x7Z6RqDSNjTONpD5D3g==
X-Google-Smtp-Source: ABdhPJxmy+1hv6SRa0KZKbiPb1G4aV0IgXk3zjPc9fhheP/bCoRiI4LBRI9ltsR8HJo4VomRKkPM/A==
X-Received: by 2002:a5d:6182:0:b0:20a:db93:be6d with SMTP id
 j2-20020a5d6182000000b0020adb93be6dmr19400775wru.597.1651741925341; 
 Thu, 05 May 2022 02:12:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] target/arm: Hoist isbanked computation in
 add_cpreg_to_hashtable
Date: Thu,  5 May 2022 10:11:41 +0100
Message-Id: <20220505091147.2657652-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Computing isbanked only once makes the code
a bit easier to read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bba010d7cf5..941b777dea9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8510,6 +8510,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
     int cp = r->cp;
+    bool isbanked;
     size_t name_len;
 
     switch (state) {
@@ -8557,7 +8558,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->opaque = opaque;
     }
 
-    if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
+    isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
+    if (isbanked) {
         /* Register is banked (using both entries in array).
          * Overwriting fieldoffset as the array is only used to define
          * banked registers but later only fieldoffset is used.
@@ -8566,7 +8568,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     }
 
     if (state == ARM_CP_STATE_AA32) {
-        if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
+        if (isbanked) {
             /* If the register is banked then we don't need to migrate or
              * reset the 32-bit instance in certain cases:
              *
-- 
2.25.1


