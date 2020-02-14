Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E515F2FF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 19:21:01 +0100 (CET)
Received: from localhost ([::1]:43633 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2faG-0004t0-1O
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 13:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2fVL-0004I9-Sp
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 13:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2fVK-00004z-UH
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 13:15:55 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43505)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2fVK-0008WF-Om
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 13:15:54 -0500
Received: by mail-pl1-x643.google.com with SMTP id p11so4004581plq.10
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 10:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WVNZD9ad+przMHF0OKz5odOrKHpFBH9KJ8cJLa9N9Zg=;
 b=KT9j2MfjOXeXJVi7VqQjJ+K0N41/v9gusJAx9FpN1q/USdFibu9jrzKIfZM0v4a2Ok
 p2eySqyoiz7Yiri6CiPyvpxk3JDU9HKC0D452cUFpm+mk6/vfGiBRvbdaGRze4ih7+B4
 UFfVJtA0PM45PmHV0uFOEWHXmTEzR6ScLf6BS6zAo8LWv23q1vHsigLr00ahcDX4mhVv
 ZkO2cJZv4RC4QlzNNtGsTV+BpxuHVjss7Lyoq7JiZ0hjzPJlP3QRWkVK+3wshi7pSUuy
 IQxR5g5P5y9cBOVLB5jEfuY1uIePXS8MN9MPPmLTAXC8sQr7w30P9MPCsSszHPpPZK4F
 /zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WVNZD9ad+przMHF0OKz5odOrKHpFBH9KJ8cJLa9N9Zg=;
 b=GsEGPIMnjym9xZK39gVAI3jx85OYvWwsVu0ToyZVDtjVzcVxZQd+5+gxO1UIvBfM0F
 XGEJkUGR3Nk6rO2hkS5Z5PQF9S12eEVoinRka6XCCbPsBebFRzCFdqFStavKU1AjbV9I
 fgR4kEOSEh6t+2vncHXQ0VB7INAgE/IZAfoDilyJyJuzZAq27OQf4u+lXJVmdOjtJeuE
 Mx3LAD26Pyo/51pOAAdz6qY1q4qTqRPbmZtbG0bQp8leoxUZ+QSFBq44mM8vrWKZE5l9
 LnNKjkp069ONAeQmtuvVP5gy3gDolkU8GAdb+V9+5kav1QXT742pWuf4Ip9WRqnBpQI9
 E00A==
X-Gm-Message-State: APjAAAVjhJyeJu+HsxZFbX88+9yKSis1FD1IZjViAArL7ffr3PICzkPL
 6fZcZutBcxnqZXxWR1DAyYYVieieXnc=
X-Google-Smtp-Source: APXvYqwQAirYuZYjjvW7i4TGK7e292EzW0GG9p4Kvwps/XyExe3/N6ftiWo5dg8nxlUGO8ec3XU41A==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
 i7mr4479347plt.66.1581704153452; 
 Fri, 14 Feb 2020 10:15:53 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i3sm7525123pfg.94.2020.02.14.10.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 10:15:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/19] target/arm: Set MVFR0.FPSP for ARMv5 cpus
Date: Fri, 14 Feb 2020 10:15:32 -0800
Message-Id: <20200214181547.21408-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214181547.21408-1-richard.henderson@linaro.org>
References: <20200214181547.21408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to convert FEATURE tests to ISAR tests,
so FPSP needs to be set for these cpus, like we have
already for FPDP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f0bd419dd8..92006e56c8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1869,10 +1869,11 @@ static void arm926_initfn(Object *obj)
      */
     cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
     /*
-     * Similarly, we need to set MVFR0 fields to enable double precision
-     * and short vector support even though ARMv5 doesn't have this register.
+     * Similarly, we need to set MVFR0 fields to enable vfp and short vector
+     * support even though ARMv5 doesn't have this register.
      */
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
@@ -1911,10 +1912,11 @@ static void arm1026_initfn(Object *obj)
      */
     cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
     /*
-     * Similarly, we need to set MVFR0 fields to enable double precision
-     * and short vector support even though ARMv5 doesn't have this register.
+     * Similarly, we need to set MVFR0 fields to enable vfp and short vector
+     * support even though ARMv5 doesn't have this register.
      */
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 
     {
-- 
2.20.1


