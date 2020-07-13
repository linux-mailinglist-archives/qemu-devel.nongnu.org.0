Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3357621DF3C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 19:59:42 +0200 (CEST)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv2jt-0003lu-9J
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 13:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i9-000274-O3
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:57:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i8-00084m-1J
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:57:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q5so17564898wru.6
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AkELVoYEVE6BfnfMYte+uiKJiz/kf50c60t3vfodgLM=;
 b=eHSAPKljbrx+AVNzlmor6md8M1C+d02d8wJzmj021KZuSRM2WNbtTLJ17UsVKHkDXM
 AaYeNXTQynLd/w3V0VfVOWw2IZcdwRvGuKDCel6KRXxjS2KAsgVwtSsX5EvQQCzTT8pz
 nlmpcWo3+z4krRkyBokqEmW4sob/E+ukGZ/vsSApbQGGySiP8p6qox0uwaBCuBiVf69t
 6wLfH9hqAsIwrZ77BB4e1JMXzxp5WenZFKaf2h9+2Z8f5+nxv9Gtk8BMGw+/kT44rrCr
 rnfb7rj8yBYE0RtSGaIkmcfjN6FJ+GsojUcT768O10NGEgHDecfo9pTYr2Nq9bh0Hvz4
 79eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AkELVoYEVE6BfnfMYte+uiKJiz/kf50c60t3vfodgLM=;
 b=Sb/A5XySX2ugzp3nb4Cyoh9d4mInvjoy66Iwozs39hyjykwkkaaupyBBcVml5o2z+2
 j+xDSdeTU7g9leHq5zzoGKqQeqP6BG9Pat49k8i1Nf5a8EyGGYf82AjCL+5IdjwKBMFY
 ObCwlXOoEOkWVI13Vow/KoqonP28ThHJnyF+d/7OCdRdwn+QZ1kFP7snvA//i2esUcc+
 ZkspWg+Wjin9SV19zVHIAyoUcdOoQw0l9c12I9aiYUgJcZ9LiE+zcpI4OyUFrAKhm/Zp
 ajK7+ZNyVVa+J+3pFwqkqc9gszjXNjckEt4HKEXlUPWSEhK0sOqDea1SFsGYMkcGV5G1
 HqQQ==
X-Gm-Message-State: AOAM533ZUwfI26riLzKQdekThTmNw8U6Uq8IwCIaSsuceoFsZCEwZCmE
 XUd7bWT8s8dVR75AQ5ivnKOeBg==
X-Google-Smtp-Source: ABdhPJzyUJ8Jlsyt8KQd6qTBWCVOcP4iIYwa5vcLYjYnfc7cb8objUXCykFZIQdJP+lGg5e5jpevnQ==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr581117wrq.343.1594663070726; 
 Mon, 13 Jul 2020 10:57:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j4sm25723721wrp.51.2020.07.13.10.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:57:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1 2/4] docs/system: Briefly document collie board
Date: Mon, 13 Jul 2020 18:57:44 +0100
Message-Id: <20200713175746.5936-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713175746.5936-1-peter.maydell@linaro.org>
References: <20200713175746.5936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add skeletal documentation of the collie board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/collie.rst | 16 ++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 18 insertions(+)
 create mode 100644 docs/system/arm/collie.rst

diff --git a/docs/system/arm/collie.rst b/docs/system/arm/collie.rst
new file mode 100644
index 00000000000..9f8dbcad25d
--- /dev/null
+++ b/docs/system/arm/collie.rst
@@ -0,0 +1,16 @@
+Sharp Zaurus SL-5500 (``collie``)
+=================================
+
+This machine is a model of the Sharp Zaurus SL-5500, which is
+based on the StrongARM SA1110.
+
+Implemented devices:
+
+ * Flash
+ * Interrupt controller
+ * Timer
+ * RTC
+ * GPIO
+ * Peripheral Pin Controller (PPC)
+ * UARTs
+ * Synchronous Serial Ports (SSP)
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 8fa51a22817..376c18f0b17 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -88,6 +88,7 @@ undocumented; you can get a complete list by running
    arm/orangepi
    arm/palm
    arm/xscale
+   arm/collie
    arm/sx1
    arm/stellaris
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 0f578040b99..048b2d41729 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -845,6 +845,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/collie.c
 F: hw/arm/strongarm*
+F: docs/system/arm/collie.rst
 
 Stellaris
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


