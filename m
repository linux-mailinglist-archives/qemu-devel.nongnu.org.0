Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC437087C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:51:22 +0200 (CEST)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcui1-00058G-9n
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaU-00089h-Hx
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:34 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-0008Tb-1Z
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:34 -0400
Received: by mail-pg1-x52b.google.com with SMTP id m12so829260pgr.9
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8Pf8ZpwZ1pQBiqGaJFMNS/iHJ5hjxHqBDOnzStfgWc=;
 b=a31CRwzHcGzJucsrEQHVfXsEkH5jgPorvOlr5Mk5aGLZLmM6bRuChn0sPGx/ODfO1q
 XYq6DWBav878a3ye8YRrYp1WBwhZzSEgLVqfVior/bTVCXQqQlu9gZ1EqTvEYdZbISt5
 VfQg17gwAdh9ykXtJ5g24l/sQ4dO4rQ/DUawpXYC/W4Dl6RewNypkfuY7/ra3fFTyxRw
 NMDHibZhb6x+7+nhMnScITXn/8U9gCnliWGcoeB9XgMe37ynJFd9YBgGtvUlg9uE1mQs
 L0OY1W+v7EAlj0UMbdjQYyVU3k0AXLO7xahvGOnb+1MoyBE7LV2WyQSwq6F/nf4SQObj
 s6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8Pf8ZpwZ1pQBiqGaJFMNS/iHJ5hjxHqBDOnzStfgWc=;
 b=QyIroQDR+OUYtBX4WwvU0j95lSKxMSoK2xTDaWEfuoIhRT9OXuyjI/ytr/iMQqqpRr
 8Z8XnItnYP3zbMvOnZ5X8jPuKnSLLUk8Y23/4qUI/jGCCpBTTcZ7ALxZFxFEpFY7f/QA
 M6F2scedeSK2d5m/tRPmvATai3ZclvBD+4s4iC7v5yydBtGkywFHVXbukSBnEcgSy6Pq
 37j+CsTQpjVVw1fnETsJY13cSolmkS9py7Yd/ak6y43OtoIW/479nJWGbvyaWI9nUWcr
 OiZwz2DMrRc7ZUMh9heZreJmPJjdPxiUrkAuDxGhFkrxE10eLOYf2zms/LeFssnjm3Cm
 Qd1g==
X-Gm-Message-State: AOAM533YKbwzfrGyaSa6luogG2RdNQCOucQrzusWJpI/agzSRNkmrtgd
 9ZUqPBL+3yTg5xg4B31KZLXEZ2fSQaOwFQ==
X-Google-Smtp-Source: ABdhPJzKp/ltA1N2XlE0JcxQq9D/PLGXFuP/wTxpbXVmGbGFfWPuuVcdHsmk2K/DSkCbguqb2y3cgg==
X-Received: by 2002:a65:6705:: with SMTP id u5mr4093621pgf.418.1619894607394; 
 Sat, 01 May 2021 11:43:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/31] target/hexagon: Change DECODE_MAPPED_REG operand name to
 OPNUM
Date: Sat,  1 May 2021 11:42:56 -0700
Message-Id: <20210501184324.1338186-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Reported-by: Richard Henderson <<richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1615784049-26215-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index c9bacaa1ee..1c9c07412a 100644
--- a/target/hexagon/decode.c
+++ b/target/hexagon/decode.c
@@ -48,8 +48,8 @@ enum {
 DEF_REGMAP(R_16,  16, 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23)
 DEF_REGMAP(R__8,  8,  0, 2, 4, 6, 16, 18, 20, 22)
 
-#define DECODE_MAPPED_REG(REGNO, NAME) \
-    insn->regno[REGNO] = DECODE_REGISTER_##NAME[insn->regno[REGNO]];
+#define DECODE_MAPPED_REG(OPNUM, NAME) \
+    insn->regno[OPNUM] = DECODE_REGISTER_##NAME[insn->regno[OPNUM]];
 
 typedef struct {
     const struct DectreeTable *table_link;
-- 
2.25.1


