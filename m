Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7982D9810
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:37:28 +0100 (CET)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kon6V-0007Do-Dd
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kon58-0006FV-Nx
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:36:05 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kon54-0001Sm-8r
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:35:59 -0500
Received: by mail-wr1-x434.google.com with SMTP id y17so16170682wrr.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 04:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5/21Y1Nv+z8LzfT3vNP3hN3hvuHLRR15ZdgGixszlo=;
 b=moBUB6E3CaqFzoz1I5lukNpPvKC+xdXfAab+epa/EH88j4Orjr3C4Rjy9GkkpWbLD7
 /217cxX7bQJ0SND3MpY7Cxh+X9aQufavqI5jJQwsjbk5T7PxRqm9ON9d960NnyDKJnKs
 DWkuwX+3fuT8iaEz/aQJGhzx9zx17ySw23GY7NZcHeYqH0KOJacbx9S/DP5N2zxapDTv
 CP24kcbSL/h4jkTbzHiL22R93uCLtuRzLd6GWgPUebOdF6UMGRfTvr7IzkrF9xA16zuT
 /6Fc3Y1VFXdlXqIgxdsbDPm7zDBSJ+7yl70xaXUg3IJd1N5YSxJ3M1n0AHxhiiEnMabE
 nBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5/21Y1Nv+z8LzfT3vNP3hN3hvuHLRR15ZdgGixszlo=;
 b=X+KSjEvrUCyNNPCGqoxJjKwMEJtpnk/UfmON+twaSTGxg6sxdrSX56lM8tPbBMlxZ5
 WgFpwQJuurzcmtDWSn7EMOJ9ipLf1NXAyqfaDa9kLfztGcC88HcHiEwC2iLnXl5yCR7W
 MNUy5FGCbTuVcaKAmBZ/tKUD2iGVpeOHeXawyNkw/s8qqjYSz6HocRVYXLhRwDL+AayO
 x0Dp7prkbPavA7SyQcwELgpP2pzrm4PnXqBdJ2X1tlB0iTaPRGbynONS2xgvHPsNEll5
 bl3ZuC3rNJyAmMAE2VleKpIgxy2mgsI5Qis/038bdNXjp4zATGKNzXwaid67llFEOpBX
 DCbg==
X-Gm-Message-State: AOAM531m5IM31dY9kPgDh/4iwNgHYyG5n+cOg77I6eXp2adr/cf6lMaS
 +SEBXLFlAvDfvFPD8Fiqyjcn1w==
X-Google-Smtp-Source: ABdhPJyQ2etZpTGvpg1Is3SUHkjxpNOJfKL3KFnfjhnYAbtS4ZsoY2724g7Rg1650s/BqmIh6cewDA==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr29435561wrv.363.1607949355969; 
 Mon, 14 Dec 2020 04:35:55 -0800 (PST)
Received: from leonardo.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id d15sm31075531wrx.93.2020.12.14.04.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 04:35:55 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Mon, 14 Dec 2020 12:35:53 +0000
Message-Id: <20201214123553.2515-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
v1->v2:
- Correct CCSIDR_EL1 field sizes.

 target/arm/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fadd1a47df..90ba707b64 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(CLIDR_EL1, CTYPE1, 0, 3)
+FIELD(CLIDR_EL1, CTYPE2, 3, 3)
+FIELD(CLIDR_EL1, CTYPE3, 6, 3)
+FIELD(CLIDR_EL1, CTYPE4, 9, 3)
+FIELD(CLIDR_EL1, CTYPE5, 12, 3)
+FIELD(CLIDR_EL1, CTYPE6, 15, 3)
+FIELD(CLIDR_EL1, CTYPE7, 18, 3)
+FIELD(CLIDR_EL1, LOUIS, 21, 3)
+FIELD(CLIDR_EL1, LOC, 24, 3)
+FIELD(CLIDR_EL1, LOUU, 27, 3)
+FIELD(CLIDR_EL1, ICB, 30, 3)
+
+FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
+FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
+
+FIELD(CTR_EL0,  IMINLINE, 0, 4)
+FIELD(CTR_EL0,  L1IP, 14, 2)
+FIELD(CTR_EL0,  DMINLINE, 16, 4)
+FIELD(CTR_EL0,  ERG, 20, 4)
+FIELD(CTR_EL0,  CWG, 24, 4)
+FIELD(CTR_EL0,  IDC, 28, 1)
+FIELD(CTR_EL0,  DIC, 29, 1)
+
 FIELD(MIDR_EL1, REVISION, 0, 4)
 FIELD(MIDR_EL1, PARTNUM, 4, 12)
 FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
-- 
2.20.1


