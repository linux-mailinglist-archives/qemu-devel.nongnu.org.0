Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C372EF7C2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:57:36 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwx5-0001GD-6g
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrk-00028z-Vz
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwri-0000vF-NX
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:03 -0500
Received: by mail-wr1-x431.google.com with SMTP id q18so10004967wrn.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G9DNKOB4bf/aDdhp+8z1U9qK/OVof8+z2xA07VIxIrg=;
 b=wJKRhsG4HvJ9BBuWBhyh3QW5KEC6FQgj0xXAQYW8f5P4m923gPdc51UruCvPJg/zRE
 Z8YDQMWshw28YxIrdySv+xtWEJLgOaMAidgHptRzAlt+VXajSAnuUfTC4vtkIjqYjcal
 yC8vsqB9x3LcR1DIK9EAY627IWdIin34FD5v39yXCWYj+cB0dqss0v4eD63zpPJUuWJd
 7gkaIlv/ApgWcbSzvMYKWAudMynX51Qw44RO+nkXhfDd6lvUEGpTVI8GzGLHfWWWJfYs
 dnszaox+sHIkNVB5zqlg0tM0Auvjzk+qIr3aS3VW+ANYk/89rMh9pfU8It6lDY9pvhiT
 UC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G9DNKOB4bf/aDdhp+8z1U9qK/OVof8+z2xA07VIxIrg=;
 b=jQsgxwrL0Qzqzzynf3LHfcm2tCfSCtXgJVHM1cki9PhmIWbgsUZxA+m3khSv405VzQ
 oWM/V8uBmDu6uia/j0gE7ghuSUKyWmsNL3RoL0cLeWxOavknD2IPJDc5Sxh2lvFBae35
 q9hitrs/WrUtquF9pYu/UKNN7J4qQtqP16El+xdJNTpI8EUdoDPJlavD+wOP8cpiosGx
 hifU6N1yX2ksrO41NU8RQdk8n5iZyOwqGFVwGX4mEyubpZ2QR4UIVh4Hy44aelU2XNEh
 0We/b53NTsrWyLXriXojj7vY4Xf/+5Ly0Hh30oRTNzx46RcEnIMJKaz1MFha73J952Se
 YSRg==
X-Gm-Message-State: AOAM531PkmfL6s/8WlZcyLPwmgYgt64vsrL3TJl4qFXFHv5S+8UzpBt4
 YCth1UnecDcIW/f2LIg+owcKXMlB4YqqX+iLe55gt9wn8cKAPFzSv0W6iSlafXG+5ofaquxkd+4
 OBHl4/kZ9+JMW7Q2b2sxpvkPrY6XZixw/1rON6Dwg2JU/+18eiNfuitScZWusbZXsLODgEg==
X-Google-Smtp-Source: ABdhPJyZ46jzikJrVzJlQ2qCWltTxqunAWjQlW+SQ4uELxlat4HCdA35U33+ZzOojlsO7M+Sv75pCQ==
X-Received: by 2002:adf:eb87:: with SMTP id t7mr4907450wrn.316.1610131921052; 
 Fri, 08 Jan 2021 10:52:01 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:52:00 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] target/arm: add aarch32 ID register fields to cpu.h
Date: Fri,  8 Jan 2021 18:51:54 +0000
Message-Id: <20210108185154.8108-7-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x431.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add entries present in ARM DDI 0487F.c (August 2020).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/cpu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8300341a26..af3cce51f4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1830,6 +1830,8 @@ FIELD(ID_ISAR6, DP, 4, 4)
 FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
+FIELD(ID_ISAR6, BF16, 20, 4)
+FIELD(ID_ISAR6, I8MM, 24, 4)
 
 FIELD(ID_MMFR0, VMSA, 0, 4)
 FIELD(ID_MMFR0, PMSA, 4, 4)
@@ -1840,6 +1842,24 @@ FIELD(ID_MMFR0, AUXREG, 20, 4)
 FIELD(ID_MMFR0, FCSE, 24, 4)
 FIELD(ID_MMFR0, INNERSHR, 28, 4)
 
+FIELD(ID_MMFR1, L1HVDVA, 0, 4)
+FIELD(ID_MMFR1, L1UNIVA, 4, 4)
+FIELD(ID_MMFR1, L1HVDSW, 8, 4)
+FIELD(ID_MMFR1, L1UNISW, 12, 4)
+FIELD(ID_MMFR1, L1HVD, 16, 4)
+FIELD(ID_MMFR1, L1UNI, 20, 4)
+FIELD(ID_MMFR1, L1TSTCLN, 24, 4)
+FIELD(ID_MMFR1, BPRED, 28, 4)
+
+FIELD(ID_MMFR2, L1HVDFG, 0, 4)
+FIELD(ID_MMFR2, L1HVDBG, 4, 4)
+FIELD(ID_MMFR2, L1HVDRNG, 8, 4)
+FIELD(ID_MMFR2, HVDTLB, 12, 4)
+FIELD(ID_MMFR2, UNITLB, 16, 4)
+FIELD(ID_MMFR2, MEMBARR, 20, 4)
+FIELD(ID_MMFR2, WFISTALL, 24, 4)
+FIELD(ID_MMFR2, HWACCFLG, 28, 4)
+
 FIELD(ID_MMFR3, CMAINTVA, 0, 4)
 FIELD(ID_MMFR3, CMAINTSW, 4, 4)
 FIELD(ID_MMFR3, BPMAINT, 8, 4)
@@ -1858,6 +1878,8 @@ FIELD(ID_MMFR4, LSM, 20, 4)
 FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
+FIELD(ID_MMFR5, ETS, 0, 4)
+
 FIELD(ID_PFR0, STATE0, 0, 4)
 FIELD(ID_PFR0, STATE1, 4, 4)
 FIELD(ID_PFR0, STATE2, 8, 4)
@@ -1876,6 +1898,10 @@ FIELD(ID_PFR1, SEC_FRAC, 20, 4)
 FIELD(ID_PFR1, VIRT_FRAC, 24, 4)
 FIELD(ID_PFR1, GIC, 28, 4)
 
+FIELD(ID_PFR2, CSV3, 0, 4)
+FIELD(ID_PFR2, SSBS, 4, 4)
+FIELD(ID_PFR2, RAS_FRAC, 8, 4)
+
 FIELD(ID_AA64ISAR0, AES, 4, 4)
 FIELD(ID_AA64ISAR0, SHA1, 8, 4)
 FIELD(ID_AA64ISAR0, SHA2, 12, 4)
@@ -1990,6 +2016,8 @@ FIELD(ID_DFR0, MPROFDBG, 20, 4)
 FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
+FIELD(ID_DFR1, MTPMU, 0, 4)
+
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
 FIELD(DBGDIDR, VERSION, 16, 4)
-- 
2.20.1


