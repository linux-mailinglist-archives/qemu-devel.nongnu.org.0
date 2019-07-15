Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4F68BB6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 15:43:01 +0200 (CEST)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1Fs-00017r-Ct
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hn1FF-0007n7-PA
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hn1FE-0006A3-MQ
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:42:21 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hn1FC-00067L-1F
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:42:18 -0400
Received: by mail-wm1-x344.google.com with SMTP id 207so15246878wma.1
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vAsiB4hjT86jOZ/YYLR/hX2fOxLZe4WaIVAdFxNA9qQ=;
 b=zLlw2+RTdcaSU/3nV+ab9934WQAiBnD3VI3Y854a8tzPCa9vIKeXe89D0wTBfZJ/qJ
 34NwG5LfIKfJW0Be2olDlCoLv4lV4dfWbb9j7bWhloswJryp+AyxrCl2kit3/bteEjFa
 M2tGAe4jqFL6dqeSTj7wh4CjObOYAqRPsRKdmk3dLy2kn+8nqoOn4vh2bxW+zDQ3o9O4
 sKAT63Jc1pCJ88604uskGefqJYmpNKlE+THxjvKejznoe92exCr5xd1TO+2cz2BPYJKY
 +iWHt2OvD/iOoaptbM/gJjioa/Bt7QWYfVhv+/Y62w0gbjy/HVml0oD6ya1kYPqPx6GH
 1ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vAsiB4hjT86jOZ/YYLR/hX2fOxLZe4WaIVAdFxNA9qQ=;
 b=BlNmRS4Nu3rnmZA20xkNnNHlg1afDAclJrFsaW1xgSHVOylv5ViLBLg3Jys5Qg56yG
 B5z1ctkLzk5KxS2Np53no1N/O1Xgl1ZuE0Rxg+M3MKm2GIYR/TFYJiEXPFyZOOUzW25M
 xqlwh5eAnPpcW3bOMw8PiEV03nhFRTuV4Y7txA05hdz/xUSoigDBIvGYDCKqq8HgB7Qo
 BXNty7EtPqjqKEUyXfH6XnU6NnmMJ/Gv1HTgK+eIAyweP7/DJYnbPRM7WlPb61g96PyG
 uoSqcsEK5es2Fm9VeJvvJJ/r6t4pguCzhhCeKKzIqa8pLFPpvv1a7N7Hr0bgiIQL4C/s
 b9cA==
X-Gm-Message-State: APjAAAXs99JhdKUPqzq4uoMWC6bSiv1aXOYhLcvwfcAMiMIG4hjSj9Q8
 /R5MdPBxXfsELfPRcItKkLJbROvmr8Ol6g==
X-Google-Smtp-Source: APXvYqylDhIOUWbQHrXKFnDe+s1VDHsS/gm37+4WRvKrcyu/EQ4d8BAJuqAIAjZ88U9qXtGEcfEWnA==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr23218602wma.46.1563198133890; 
 Mon, 15 Jul 2019 06:42:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c7sm14221808wro.70.2019.07.15.06.42.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 06:42:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 14:42:02 +0100
Message-Id: <20190715134211.23063-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715134211.23063-1-peter.maydell@linaro.org>
References: <20190715134211.23063-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PULL 01/10] target/arm: report ARMv8-A FP support for
 AArch32 -cpu max
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

When we converted to using feature bits in 602f6e42cfbf we missed out
the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
-cpu max configurations. This caused a regression in the GCC test
suite. Fix this by setting the appropriate bits in mvfr1.FPHP to
report ARMv8-A with FP support (but not ARMv8.2-FP16).

Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190711103737.10017-1-alex.bennee@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e75a64a25a4..ad164a773b2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
             t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
             cpu->isar.id_isar6 = t;
 
+            t = cpu->isar.mvfr1;
+            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.0 FP support */
+            cpu->isar.mvfr1 = t;
+
             t = cpu->isar.mvfr2;
             t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
             t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-- 
2.20.1


