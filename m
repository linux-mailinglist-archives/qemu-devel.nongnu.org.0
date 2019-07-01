Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FD35C722
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 04:25:41 +0200 (CEST)
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi8UG-0002b2-Kd
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 22:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56447)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4PM-0006p1-0W
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4PI-00017j-1d
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:04:18 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:44121)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi4PE-00014B-8I
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:04:14 -0400
Received: by mail-wr1-f49.google.com with SMTP id e3so5903288wrs.11
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 15:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sPbsb4f0JFD9WjkRWgwBp1rhSrFIRCwYdPeLnHu8nlU=;
 b=fQG36OmneOJ9jlAXGyPQbqVNcTTRlBazSOwtcCEZUf5RMrbY84c0kYPdTYmDpduFsd
 TA+0NMURBn0RHKtIgTnRRVHbqQG+3edeYPSnQiOIZKR/DazbD5vpKJQQBuk86o2r186r
 mZc9Kx+PeS7m9B4DujbjeybhpvfF9QfO78Pj9t6CkHZchQ7jiwSIm+xf+OgH/95fCglu
 67OkMiKOEdLT+Vmqt+d9ANhemHbUg5A+YDWXvzY1BenenVSwu4dUoqjVCzd43HKhx6vw
 beNpuM+Z5eD/5k8OFxzef1PREkkj64BlprWbOihz8PYNYRzYCVnfzdmtXOmNdxIBLodd
 MAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPbsb4f0JFD9WjkRWgwBp1rhSrFIRCwYdPeLnHu8nlU=;
 b=IUbtGFafgJyQ/gA9A/YqOJ82+MFxxavs8X6835FmBvjfM22rmzTqe1SYYm+ZiJUqI+
 FVFBHXnAd25LUt6r+FS5bwRsAwFRL77Ubk7POxfw1i8s09omRHvMosdB7kq6kmI3M9um
 28N3BTl4RKaGRaSQLwapYobKujN27+vcz5u6D+AyoL3JJHhsXgHSNGnA4efOpPd0xDKm
 JnFz5VrlrfeIhtWvyX8Yu0JSwHorLFOaayCpBdOAIbJaZVmSrrJLjT4pi9i1W2wUudHi
 Om91xN4lr93dR019edr2agthWWFruZyed7Sub2065RuJNX1rS4Is8pwBXDFez7fzOXtl
 gGag==
X-Gm-Message-State: APjAAAUcN7Jwov+WpPrKA/qRqkLqFvx1gip4io2t2L7naVz3sh5AraSl
 9fEOZLsj58OSnfbA+lXuTD6iT/C4+PTBXg==
X-Google-Smtp-Source: APXvYqzVYyDLS7q1BUpVlT1//XpSKpV1y5lIlzA7o0sV2Yh001mjPLCSCCyKIS0CPn/a7mBehSHPDg==
X-Received: by 2002:adf:de90:: with SMTP id w16mr19401268wrl.217.1561999232428; 
 Mon, 01 Jul 2019 09:40:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o6sm26573508wra.27.2019.07.01.09.40.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:40:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 17:39:39 +0100
Message-Id: <20190701163943.22313-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701163943.22313-1-peter.maydell@linaro.org>
References: <20190701163943.22313-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.49
Subject: [Qemu-devel] [PULL 42/46] target/arm/vfp_helper: Extract
 vfp_set_fpscr_from_host()
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The vfp_set_fpscr() helper contains code specific to the host
floating point implementation (here the SoftFloat library).
Extract this code to vfp_set_fpscr_from_host().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190701132516.26392-17-philmd@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index b19a395b67d..838f7d25fd1 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -81,6 +81,18 @@ static inline int vfp_exceptbits_to_host(int target_bits)
     return host_bits;
 }
 
+static uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
+{
+    uint32_t i;
+
+    i = get_float_exception_flags(&env->vfp.fp_status);
+    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    /* FZ16 does not generate an input denormal exception.  */
+    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
+          & ~float_flag_input_denormal);
+    return vfp_exceptbits_from_host(i);
+}
+
 static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
 {
     int i;
@@ -141,12 +153,7 @@ uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
             | (env->vfp.vec_len << 16)
             | (env->vfp.vec_stride << 20);
 
-    i = get_float_exception_flags(&env->vfp.fp_status);
-    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
-    /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
-          & ~float_flag_input_denormal);
-    fpscr |= vfp_exceptbits_from_host(i);
+    fpscr |= vfp_get_fpscr_from_host(env);
 
     i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
     fpscr |= i ? FPCR_QC : 0;
-- 
2.20.1


