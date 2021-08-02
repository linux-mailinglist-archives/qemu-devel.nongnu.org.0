Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA063DD528
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:06:57 +0200 (CEST)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWie-0005t0-8f
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaJ-0000JN-0F
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaH-0003YH-Fm
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so10839406wmq.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K+43bwjBEMaP3/NNrT8H6mztjjaRqn0rPO+cVcTuedE=;
 b=U/7ClweBPYFLjoCana235PvBCSSD72l40KrymFU58aepy/xuelt5WFZlGWz7enG0Sj
 MTEs6EiPoYfLTgSOc7M4o4JiNJX/Gnazc1N2esQsRppHuEFGq/Zm4v3LDYmJEVUZS5Cw
 lAR0e7cdRzrteeXW4gctkv64m2TPzKqJIn9COtkEeVx6aCPQz9F+ezKMDYiwbh45h+vE
 gD96UyI0oxl7VnEVM79fXOmiJDc7Fp0Vn6prdUlBsfDJHjaOboeLFA2uUBIPQ5RUXOEl
 gs4MRKc2QLVcpvF2Yt7R1biQOV7n1mmupgnI7NVkNe4e/5JcNYmnHoOghbh2l6Xt8UQW
 1+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K+43bwjBEMaP3/NNrT8H6mztjjaRqn0rPO+cVcTuedE=;
 b=n17bjrVPgwT+aRbs3iU8ty+wHSXWelW7YenuoRVQX1V8+pm8DObi+tr2u4DwXPgU/N
 +FQ6YbgF/3kLuiwXwjomd8lwMMRyo5NSxueYocVKD3QHbekMcHW9W0oavxZ61pzBiutB
 0daUVWFy+rZyRm5uPylDNJzwShS+kmEiukYKmQPCFNd2sn8qmOxqURpFvOTN6TMJfvUA
 gsNA3gX331D7BY1/oEhO1rHZPQQw3LbyAMVLxQqC7wR1SQAGTOSTdRCiQjODmFAsaMKx
 eZKiGAy6q8pj9UtSQEknhaCNhpvcZ+LgSPObr7NZLTjwmcsjfW8uP4iDPwwpc+mzetAf
 eIPw==
X-Gm-Message-State: AOAM532btUkDyzL7M1LTvepewZIlUn64kHpwXjU3banNhYjN8qzbUZek
 mbcs/hogxZkUUG4w9OWwzAmhAUZ/Es5M3Q==
X-Google-Smtp-Source: ABdhPJyVehG0bkYNL7u6E0PrOHYQ05njXeveL8w8N6oNg9n6JXHJDfzlmsV4uul45JSWVUYqaVwrVQ==
X-Received: by 2002:a1c:1dcf:: with SMTP id
 d198mr16318723wmd.103.1627905495982; 
 Mon, 02 Aug 2021 04:58:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] docs: Add documentation of Arm 'imx25-pdk' board
Date: Mon,  2 Aug 2021 12:57:54 +0100
Message-Id: <20210802115812.10731-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Add brief documentation of the Arm 'imx25-pdk' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210722175229.29065-4-peter.maydell@linaro.org
---
 docs/system/arm/imx25-pdk.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst    |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/imx25-pdk.rst

diff --git a/docs/system/arm/imx25-pdk.rst b/docs/system/arm/imx25-pdk.rst
new file mode 100644
index 00000000000..2a9711e8a79
--- /dev/null
+++ b/docs/system/arm/imx25-pdk.rst
@@ -0,0 +1,19 @@
+NXP i.MX25 PDK board (``imx25-pdk``)
+====================================
+
+The ``imx25-pdk`` board emulates the NXP i.MX25 Product Development Kit
+board, which is based on an i.MX25 SoC which uses an ARM926 CPU.
+
+Emulated devices:
+
+- SD controller
+- AVIC
+- CCM
+- GPT
+- EPIT timers
+- FEC
+- RNGC
+- I2C
+- GPIO controllers
+- Watchdog timer
+- USB controllers
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index d423782d661..91ebc26c6db 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -95,6 +95,7 @@ undocumented; you can get a complete list by running
    arm/nrf
    arm/nseries
    arm/nuvoton
+   arm/imx25-pdk
    arm/orangepi
    arm/palm
    arm/raspi
diff --git a/MAINTAINERS b/MAINTAINERS
index 6c558303f96..bda08356d46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -684,6 +684,7 @@ F: hw/watchdog/wdt_imx2.c
 F: include/hw/arm/fsl-imx25.h
 F: include/hw/misc/imx25_ccm.h
 F: include/hw/watchdog/wdt_imx2.h
+F: docs/system/arm/imx25-pdk.rst
 
 i.MX31 (kzm)
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


