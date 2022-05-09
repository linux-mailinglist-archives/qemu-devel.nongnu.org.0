Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CBA51FC2D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:07:34 +0200 (CEST)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2An-0001Mg-7q
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Y-0007GU-Dx
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22W-0001IW-L9
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w4so19070775wrg.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qa9bXLZrtUjkR08O1nmZU1gZrJzLSKj+bcC5vCf6akQ=;
 b=lBg71FUejsMOGgDjkg2a3q3HoFPcoiTPkAk35Re3AJwRs0yh+f/bK5BJdJjBXlC8hs
 OosnlXDx+F65FS74EZDPU15JKWM6kBHI5LMcvUoRnUlJay8BC68KNDSkpZu0iKhMg46G
 QPA8NDchVgqlkltUAz76bGCJ9ABiFZXg7A4XrWsO2ljNNBncz901Rr12lYntwSI+qVx8
 V/mdTqt0SFA7xCnBUsk1AV0z9AvDa+EqFchN1s3utb5XqjKwLg80DAHrul19XvhAE7Gb
 p1eD9/KwQ+neTnAGQQKindJ/XkXgBEAgXAVD22liBy9X3gSSSX0r5fSB0OiD8R+Cc4RG
 5uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qa9bXLZrtUjkR08O1nmZU1gZrJzLSKj+bcC5vCf6akQ=;
 b=imhEB6L4dBCIaUqU7/GUp8xo4tVKWP2EZNzngb4JfM5/ds8m41wuA94GEZO5fK6qQO
 3lxZoA42aTt5Qxr/dK6Db5EuVp49RgTJzZFy9eU+9yURTAe2TUlVY6WnVx0IcsdNWRI6
 +Xwemqi7G7kyJNzszVtVgxWvsBrwQ/I3qouFmILbuzOnFB/Qeiz4jJehlp6YP46Ut89m
 d43iyAQF+9qgisZ0JSGe0UWtpW76x/4mmQ1PQGom4kfq4OLn/ohB6ryTDOjcUPMN4JGU
 nNUth/aHPv/Mfo0j1fmasKcoArgavPWD6bw4El5SA4LlciY2b/iJXNJWfJguhiqqBELU
 oWmg==
X-Gm-Message-State: AOAM530cl0lU5ZZ6ZVRS59NleRDQPjwJisK7AJucDQ0TcEO2VHd7T05q
 ZrzVj+OFTKwYOVUvTtBgU9aVfS11KkLtuQ==
X-Google-Smtp-Source: ABdhPJz/X2PfI9jjaAnlGW3NXa6CHlPn39KAWrCT08Y6elcOb7XxnQR2YzY3UIHecdZ+Ih4UhGV/sg==
X-Received: by 2002:a05:6000:2a5:b0:20c:520a:a12e with SMTP id
 l5-20020a05600002a500b0020c520aa12emr13088558wry.629.1652097539234; 
 Mon, 09 May 2022 04:58:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/32] target/arm: Use field names for manipulating EL2 and EL3
 modes
Date: Mon,  9 May 2022 12:58:27 +0100
Message-Id: <20220509115848.3521805-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Richard Henderson <richard.henderson@linaro.org>

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 01176b2569f..7995ff27126 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1801,11 +1801,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1836,12 +1838,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1


