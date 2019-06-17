Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487E9485D6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 16:43:50 +0200 (CEST)
Received: from localhost ([::1]:48102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcsrN-0003pp-Gf
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 10:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46589)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsiF-0003Ru-UJ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsiE-00080N-Jq
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38767)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcsiE-0007zH-DK
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:22 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d18so10238557wrs.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5wceQkO0iVo/ukmBGSUYh+JsgVf/jAUmegmqeoCkDUQ=;
 b=qjjvZMbCUvX0ACGwrzXIW/TdsqHYBSxy8lZS04IYFPmjVjzdSZCDnee+83klPPiewe
 w9OtczNdveR1qnEYi7kOrBK1cZTvt3bZpWT8ycPhqyYrklPTmGedUnjdVv1OS3Wbkyc+
 WTrWzD+GA2r1+NVt2QDf7bxeJtVp6AIavk4ZTrafVeaWKm3qYsQHaTxd3JdRiVgZbr35
 UZnWj3WLv1aRQmiRPl11iiFHdz2yWB6iywkco4auUrxG7j3uc8cTXnIaIHlcZbB/imUd
 LZhaYzioFooJj02OsQqPxQA2K4taMjvixX3wUCFB1LbD3WVS3DyBLlk9jgUBGlNR25Dt
 NwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wceQkO0iVo/ukmBGSUYh+JsgVf/jAUmegmqeoCkDUQ=;
 b=apZB0mpNOrjsS3jl6cgPEek+oFAswkIqDLrfn67lS5iUtCEHh8gLuhwL40litwbQUP
 keO6kwFjcg22REsXk3YPrfXT0jPxySO4UdAF6xHgjca0NFqALm3YYs4JMpBsKAUH8kM2
 Vys9uaRLtg1ccLikUF8fMYX7cVuG5QQf9tnoCNzdDiSq4XazQJcOVnry5c8Qpn5JgaVF
 Y2HMfsuo6PW6O+IC4IBn3jE739QWIUXLXLvFcLnctb3be+lDIxE44vyV3JoX/S+CkLGY
 gtI5emfqPHz/cVSUNH/2LzNhn8KlU8yJM7EjYtsok7V551YXhAAp74ALtqZLywaDMOIM
 1eIA==
X-Gm-Message-State: APjAAAXcBjyb4Xz7S2ab+YfT/CG9UYIXY5kXcqZkLLOmBlQLvpRGmt5R
 k9Xoba+LM0b95esWwqdALNO/xI0/htvzYg==
X-Google-Smtp-Source: APXvYqy3Tmq1Owjd255HjyCZFHhmOW1yqFyhyoPo2SF8/uZUsB1gCOnTaU6stnDHuMs2znlgHywIzw==
X-Received: by 2002:a5d:6212:: with SMTP id y18mr29950554wru.178.1560782061180; 
 Mon, 17 Jun 2019 07:34:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a67sm13819985wmh.40.2019.06.17.07.34.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 07:34:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 15:33:54 +0100
Message-Id: <20190617143412.5734-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617143412.5734-1-peter.maydell@linaro.org>
References: <20190617143412.5734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
Subject: [Qemu-devel] [PULL 06/24] target/arm: Allow M-profile CPUs to
 disable the DSP extension via CPU property
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

Allow the DSP extension to be disabled via a CPU property for
M-profile CPUs. (A and R-profile CPUs don't have this extension
as a defined separate optional architecture extension, so
they don't need the property.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20190517174046.11146-3-peter.maydell@linaro.org
---
 target/arm/cpu.h |  2 ++
 target/arm/cpu.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cf2496aeeec..a98c45b1ff0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -790,6 +790,8 @@ struct ARMCPU {
     bool has_vfp;
     /* CPU has Neon */
     bool has_neon;
+    /* CPU has M-profile DSP extension */
+    bool has_dsp;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index af879d5311e..376db154f00 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -769,6 +769,9 @@ static Property arm_cpu_has_vfp_property =
 static Property arm_cpu_has_neon_property =
             DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
 
+static Property arm_cpu_has_dsp_property =
+            DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
+
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -881,6 +884,12 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 
+    if (arm_feature(&cpu->env, ARM_FEATURE_M) &&
+        arm_feature(&cpu->env, ARM_FEATURE_THUMB_DSP)) {
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_dsp_property,
+                                 &error_abort);
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
                                  &error_abort);
@@ -1100,6 +1109,26 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.mvfr0 = u;
     }
 
+    if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
+        uint32_t u;
+
+        unset_feature(env, ARM_FEATURE_THUMB_DSP);
+
+        u = cpu->isar.id_isar1;
+        u = FIELD_DP32(u, ID_ISAR1, EXTEND, 1);
+        cpu->isar.id_isar1 = u;
+
+        u = cpu->isar.id_isar2;
+        u = FIELD_DP32(u, ID_ISAR2, MULTU, 1);
+        u = FIELD_DP32(u, ID_ISAR2, MULTS, 1);
+        cpu->isar.id_isar2 = u;
+
+        u = cpu->isar.id_isar3;
+        u = FIELD_DP32(u, ID_ISAR3, SIMD, 1);
+        u = FIELD_DP32(u, ID_ISAR3, SATURATE, 0);
+        cpu->isar.id_isar3 = u;
+    }
+
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_M)) {
-- 
2.20.1


