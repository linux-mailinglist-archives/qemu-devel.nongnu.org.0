Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F765670
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 14:13:46 +0200 (CEST)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlXxJ-0006Po-BT
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 08:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48645)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlXwE-0005lT-Ln
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:12:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlXwC-0000iz-FV
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:12:38 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlXwB-0000hV-W9
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:12:36 -0400
Received: by mail-wm1-x344.google.com with SMTP id s3so5453801wms.2
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3cMonKbsaOdqE8YXh9RMaH2ufvX5rqBag4d1fqLsno=;
 b=u83XEOxfttHrkYfRR73FH+1Bt+QVdu6ihf18+K/CsYJfsbore+Nud1Giocp4+HS0Kt
 MFCwzg+hfmaS0GGCA3QBl38im7IDB9q/qf55dLqYYFNzTu+GcO43QDLcB7RVU+yp+/F9
 W8dqbGbmYd4RPFbSVt6HNdgIoQmDg+RDBEPpbr2n249w/2qlW1NACfEYV9UTanDuCOL0
 MUN/LnilhLZAWQiRCeqfXSvontMpYIV89mh0gY7kYwmMT813osJM8c6hmEJAAonFTkc2
 TLIls6cmJbfmcAuiSLg1R8Pz/QJujVDGNGVbZDR9DmgOJj5XXIl1LY/YuJlSpdZDctpE
 gvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3cMonKbsaOdqE8YXh9RMaH2ufvX5rqBag4d1fqLsno=;
 b=d8CE7P5b/yx6CqFQ+uzaRHpm09nUnrOvVaOY+TNp7l5kXLgU+k43bBaLeJiFVH/paH
 AiOpSV/4WE9R+PeOFIu9lOPDk/ya2YEaczqIFsf25nsKisQnHVOQ4DYS835bpt4bpE1k
 oy/ZyFude8l5toEEvFbW5lBA9uCOpIoGf+lbJhN3PxPwXObt+JQUkuExK6hValTMKruG
 gUwZAPiMpoAgktEWxk7O02nXQr+xyADsA0Ji5Nvg+W1Q8j2tlaKXLfSkNEd3z1hlrI+6
 lUQwDX3dr0g8hnD2Z84gabyPq1wxoba1IQn1H37enD5uwNol/+Ot6J4O+yZHxUGgiedy
 +z1A==
X-Gm-Message-State: APjAAAW88EziJo5Vi8aE0VlVYIzUE4zxA2CAqlqcgygK6dOG+PZ2cBA5
 4oojZ7KM/CsVw5gF15gGvbK/lg==
X-Google-Smtp-Source: APXvYqyjRL4Pm4DJ6gxCMhMAABASOjX9YkWy30mz3VnyIHV5hXZJr9CkbqrhyS3PouGt0usrziod8A==
X-Received: by 2002:a1c:eb17:: with SMTP id j23mr4268983wmh.151.1562847154257; 
 Thu, 11 Jul 2019 05:12:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s25sm5129296wmc.21.2019.07.11.05.12.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 05:12:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 13:12:31 +0100
Message-Id: <20190711121231.3601-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH for-4.1] target/arm: Set VFP-related MVFR0
 fields for arm926 and arm1026
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ARMv5 architecture didn't specify detailed per-feature ID
registers. Now that we're using the MVFR0 register fields to
gate the existence of VFP instructions, we need to set up
the correct values in the cpu->isar structure so that we still
provide an FPU to the guest.

This fixes a regression in the arm926 and arm1026 CPUs, which
are the only ones that both have VFP and are ARMv5 or earlier.
This regression was introduced by the VFP refactoring, and more
specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
which accidentally disabled VFP short-vector support and
double-precision support on these CPUs.

Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 1120827fa182f0e
Fixes: 266bd25c485597c
Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
---
I've followed the existing approach we used for ISAR1 here
of just filling in the fields we care about, rather than trying
to set the entire register value.

 target/arm/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e75a64a25a4..446dd5163dc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1666,6 +1666,12 @@ static void arm926_initfn(Object *obj)
      * set the field to indicate Jazelle support within QEMU.
      */
     cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable double precision
+     * and short vector support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
 static void arm946_initfn(Object *obj)
@@ -1713,6 +1719,12 @@ static void arm1026_initfn(Object *obj)
         };
         define_one_arm_cp_reg(cpu, &ifar);
     }
+    /*
+     * Similarly, we need to set MVFR0 fields to enable double precision
+     * and short vector support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
 static void arm1136_r2_initfn(Object *obj)
-- 
2.20.1


