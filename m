Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096C2DAC69
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:54:20 +0100 (CET)
Received: from localhost ([::1]:44790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8uJ-0005x7-D0
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00078Y-Cx
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ot-000164-Nh
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:46 -0500
Received: by mail-pl1-x634.google.com with SMTP id t6so10905754plq.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=junQgOuTu5FDmmp1xNv+EH03SvWJS5HmFQLLzAJVkgQ=;
 b=mIitDwFbwPIzJnuRc49MU8EBnkQtkt39LRKLJeW2v2Nvo9czdTTTqkxwK9KabuVqyJ
 8HYWDmHMNdGaFcq+l6gen1I8ymfHqK5qjQ/0ngGVz0Pw2qV/oYwqPHUQrEsTSjfa6l8G
 HHalsWtj26CqXb/wX+lZqgef/pZ+Hd+G7cbDzKCC2Mv5t6Q9KPs5cX5cUqkDtHyx2oms
 o4wOflcAKy8Eijh8ryKV3j1u+/4iRD1R9PujPb3/dg4UgHgYewnF2L51d8ilO70UGbCX
 +sOGPi4H44K8gX4b6lMoXNJ1B/cyJZ1qEdw+uknE4nSJI9XxMIhGPX+JPl+uorEDExQW
 bbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=junQgOuTu5FDmmp1xNv+EH03SvWJS5HmFQLLzAJVkgQ=;
 b=CnIQW62aGvjfBjkODBKhksRE7PlctSIkx/w44NYqMVxY0iau2GJbXieX9z8IOJc9On
 OnSRE2wvcGcEvfsbOxzbrX76m4nwrLmI1BAi3S3ciby5T44VICTeRnHUu+Q6qPbHfSJq
 OIrVU7ErtqLYJxYIG/YdTi/E76V+kN4eVF/R5G3uUwtH9WC7NuHtUJkZQo2pNncbAjLG
 cNBgUrmBacUrphXwHXPewtY02y2mKV9svKYzCgz7dwf+9k0eR1PJ5Fz29bek4fWPXCVE
 6qKvMW9J93+vCVNBt+6l4b8UVX2FhJX2xA/zxbhkr+sbOGeRKd8oDdmO/OweLFy6m1AE
 zp9w==
X-Gm-Message-State: AOAM533NjUgwvEvLi/eMzMHyFOcdViZejcTyLaogNe5MADcUd2EA9tCA
 3C5/bLacFpCpDZPzJrQjCfZrmw==
X-Google-Smtp-Source: ABdhPJzgE0jXytDHreuevXbDTJu2+CIa5L+nTPGrDlqpHnJUdZUHeOAbAk8PCjU/HufmFF2qaTZBmQ==
X-Received: by 2002:a17:902:8643:b029:da:d5f9:28f6 with SMTP id
 y3-20020a1709028643b02900dad5f928f6mr2276740plt.8.1608032922480; 
 Tue, 15 Dec 2020 03:48:42 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:42 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 4/5] target/arm: add aarch64 ID register fields to cpu.h
Date: Tue, 15 Dec 2020 11:48:27 +0000
Message-Id: <20201215114828.18076-5-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=leif@nuviainc.com; helo=mail-pl1-x634.google.com
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

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 90ba707b64..efa977eaca 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1895,6 +1895,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1905,11 +1908,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
 FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
+FIELD(ID_AA64PFR0, SEL2, 36, 4)
+FIELD(ID_AA64PFR0, MPAM, 40, 4)
+FIELD(ID_AA64PFR0, AMU, 44, 4)
+FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, CSV2, 56, 4)
+FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
+FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -1923,6 +1933,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1932,6 +1944,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1958,6 +1972,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.20.1


