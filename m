Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467E2D2AAF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:25:36 +0100 (CET)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmc3j-0000Ix-Vg
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1Y-0007Q9-Sa
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:20 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1X-0005ly-25
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:20 -0500
Received: by mail-pg1-x52d.google.com with SMTP id t3so12029136pgi.11
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJMTZbXGZIIwUN/FY4ST6xv0QwD5d73nuDAFCgvCOdY=;
 b=d5YlsHwhvg8WW7gEXN2Sxex7VUg+IA+hrfF/0xICb6h2uti1T6820klmukYkjX7oH7
 xeBAIC6pF3vCoqLC5rTOPEvl5vTLtc3r/jUu1rTlAJaroA/YU06XU8IgBS/vSX9CNciD
 RYScCIg/+557cr6aOrWKeAAQENsOemu2uFdtn87kQBYPatrKx/gXUymt+GY16aqd5Wa2
 gHSMevEKeXizuCjFn8bm0FzQHgKgpdORizuC1snpbPIIuSCOkmqkgrRHeYP8neKtHpVD
 6KTl0dO3ucQiURrJSZGj5szVAT+lL///fhNzLjkgIRT+0DTwAdwBESuVG/S/NPwe8Fi4
 90UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJMTZbXGZIIwUN/FY4ST6xv0QwD5d73nuDAFCgvCOdY=;
 b=cSXr9wL+v4Fpyfxg0rOmkx6L3gRPAmCNBPYspN5MX7v7SHy1GJ3m16ZXN+Fv++vDjG
 GqV2SBhO2JzKUQ9su9JhktkUyRJ1Gu1V+CwHw9jEiWbKOdjuGkivqLYd83YJH2nzif6j
 obwo3QJElf8PuzbWVCHZ80fjHdXQEF0FxtKrotuMnJVGcztwSpK6yX9Ms5wPJgzJKWnT
 C5RG7H/NXHah+K2VkwVHUzI2B931MK2lW4rQdXncnjPeRlsKA85cXSSsolNn40UFh3c7
 I4I+DoPIt22eM+MrBCQrmRn4TeFJ1GUHkU8Z4rMGFBT/dcMcT1qeebHpRoARsR6Hu3zv
 FQNA==
X-Gm-Message-State: AOAM530baLMVA8PDX8AER9UyT8cK9XfzC2sD6e+ZfRrJqcjcnd4kHZ5Y
 MeGSjCLzmRPq3YPFDyVW3bl+iGJfwlOtYQ==
X-Google-Smtp-Source: ABdhPJyeLcCoSjbxYiDrPaQF6xTtFZ7au2FqoFKmdz4MQPz6iNN/TkslYbYNCu8sPncLm24+c5m9RA==
X-Received: by 2002:a63:7407:: with SMTP id p7mr22584370pgc.48.1607430197864; 
 Tue, 08 Dec 2020 04:23:17 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:17 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 3/5] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Tue,  8 Dec 2020 12:23:04 +0000
Message-Id: <20201208122306.8933-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208122306.8933-1-leif@nuviainc.com>
References: <20201208122306.8933-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=leif@nuviainc.com; helo=mail-pg1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b54d1dc092..5e9e8061f7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1713,6 +1713,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
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
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 20)
+FIELD(CCSIDR_EL1, NUMSETS, 32, 23)
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


