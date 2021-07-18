Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0AB3CC936
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:56:32 +0200 (CEST)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56LP-0002XN-9Q
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bl-0003kY-Fk
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bj-0003WH-8P
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so9741736wmf.5
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Tz5XVHLGKTsGTw2iya2aqq+WsyldbLkNCSIX8A001I4=;
 b=Qziz0gzUtqU3GMerzoc+Vcf0yP9W9ZdbJWrJBEpgRPQ85dH/8nQtqyhmCdpL+cLISh
 am9av/fitrJmxh0ENYbOhdfw8r0Y9Re6nDOmqje47kAedZM3xb0CckJCBYIXgXDbshYc
 Q8eNBCYZU+YblrtnPU97TlxkA+hWZIovdatfXfXLBPOpXMVI8M0YmWtDW976OOf1JvZX
 FhEi1uOAJnyxK0tcZqLS6HNMPxiVWgXrV8wGWewe+IFciQeDjYue/iPYOfnqCtnGQKLP
 D9+hUEqcTbiz1AGI8xKHelnal28+rQ3JbeNJ7TEUhRnwDgkbMJwuQSGuQlIxR7b0NK89
 vbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tz5XVHLGKTsGTw2iya2aqq+WsyldbLkNCSIX8A001I4=;
 b=UVu9lnvd+tZ9u8D408BztSLtWpmVur7yRV/LEU7LG41Mn78A2cKzaexg33gFgiUTHk
 PbbtYWSiJaZpARHhpwt2M+tNPAWj4N1REULQ4PgT8k7vt1haR8VTo31PIU5DH+yb78Yr
 M9ngLnrpQCyCZXGidIVib5TDPV+b8IgtT7X/xMEDLtVv2BnBNiaV7eJtQBv138gGLX9C
 RdZQBp+cKXTMJ9AgSV3mRv9/C0A0j0oXEXY9EEUdgUpiuof5a3ccCVPz17NwseFjrsbJ
 Yx2uezyIQ0G15tyv/Jv95HR0jeIktpTjGhd1UtkAIilUlLgkboJeu9HibPwu/w33QMbt
 Wy9A==
X-Gm-Message-State: AOAM533qCidQPE8OIioiwcGkSHC79j67TiAH0BHTGg7tZTjm3dwqzXEW
 purXphHDxY5kmtnIHnJNQgcmvwGhIjCiuw==
X-Google-Smtp-Source: ABdhPJwRv7GKr4BDBS0yi5iUxniTpqdLfNJKL4uBhHmRT5QgzMtro0VSwPpEh+UXxfjl5MTRMUL7bQ==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr26187080wmq.115.1626612390055; 
 Sun, 18 Jul 2021 05:46:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/12] docs: Add skeletal documentation of cubieboard
Date: Sun, 18 Jul 2021 13:46:18 +0100
Message-Id: <20210718124621.13395-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Add skeletal documentation of the cubieboard machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210713142226.19155-2-peter.maydell@linaro.org
---
 docs/system/arm/cubieboard.rst | 16 ++++++++++++++++
 docs/system/target-arm.rst     |  1 +
 MAINTAINERS                    |  1 +
 3 files changed, 18 insertions(+)
 create mode 100644 docs/system/arm/cubieboard.rst

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
new file mode 100644
index 00000000000..344ff8cef99
--- /dev/null
+++ b/docs/system/arm/cubieboard.rst
@@ -0,0 +1,16 @@
+Cubietech Cubieboard (``cubieboard``)
+=====================================
+
+The ``cubieboard`` model emulates the Cubietech Cubieboard,
+which is a Cortex-A8 based single-board computer using
+the AllWinner A10 SoC.
+
+Emulated devices:
+
+- Timer
+- UART
+- RTC
+- EMAC
+- SDHCI
+- USB controller
+- SATA controller
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 705b8835e48..e2fcb64872d 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -85,6 +85,7 @@ undocumented; you can get a complete list by running
    arm/aspeed
    arm/sabrelite
    arm/digic
+   arm/cubieboard
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index 814d103fe16..1596b352b46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -560,6 +560,7 @@ S: Odd Fixes
 F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
+F: docs/system/arm/cubieboard.rst
 
 Allwinner-h3
 M: Niek Linnenbank <nieklinnenbank@gmail.com>
-- 
2.20.1


