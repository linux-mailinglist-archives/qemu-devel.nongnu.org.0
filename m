Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48783CC930
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:53:32 +0200 (CEST)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56IV-00082f-Jb
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bm-0003kd-OG
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bk-0003Wn-KN
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id f17so18056350wrt.6
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SI86JUBJzk2u9kiQ5LZPsmQhNkw8gHPm5jzTEnewX0w=;
 b=y9dXgJnEH6BIzyofyiXHTN0isjCsYkpZk32tNT4fKRXdJ1jkMD5lCOLWPmFc/Db2fC
 GPIgNOkCdsSsudJ5+KMrMJsVtFfczih4cQp89/CWqcZdX9xxIvpDfOqVisOPqqdJNgH1
 MpdIiE+n10z2w3m/QfM+amNvLm5Xi/o4NA3DGteo9te97iGh/KYfAqUW1sFAW3n1AsIj
 8UnnXTfAWZK6PbQ+TFHGSizsGFM0h39aM0xw61sdufgFcOvCwPtr/iNlPOODngFm3WkE
 +12pw9pEjgx6RMZbZ1jPzMxhZEzTWXE+g/Jx4+0lTenb3oh+BmdzrUSmulBAmSHvYRzV
 t46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SI86JUBJzk2u9kiQ5LZPsmQhNkw8gHPm5jzTEnewX0w=;
 b=HauUbmEfdHqNPi1QnICRXol0RVPWwr86HPFLP9JJfasIpg8jS0DHUb2p0rC/vF7m2t
 LOH9wFqeVfiZi9pWpH8cwm4bQNesRAcKbusAjBhKJdJsiHWOJUQqRG6p/PQOPG4bO/kV
 Xga3IU+wuVyPUcczoH+xBmJNLeix8Uuen+dELKj/hKJWlxPDCVzMD4XrEGvQtrXv4yQm
 lYMr6q1cK+ThzH9Llm7jkfefdVJvfZ7b2od2v1kKueBmE/m3FnDePfitClo9A0b+AfGe
 Zrl3TIfbFYWev2EVlH/HPITHG/cDjap2mvrY874+4chAP+9gRUQFC5d6FssHgot/rq9/
 yFQg==
X-Gm-Message-State: AOAM533eRr58LHr5Rj9XtkQAE43XUqyNzZdl/plr4SzK7b3dZspiFhf1
 fXZ+okTt78AG14YunhfNEf/RZBZr7C6tkQ==
X-Google-Smtp-Source: ABdhPJy3meB2VlLqAruBj7RPOXbWsduf/HdWRBEHBjvOyDpy6LZl2fuvbbcfanR5b6rLAhCTlFjwvg==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr24683443wrv.343.1626612391352; 
 Sun, 18 Jul 2021 05:46:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] docs: Add skeletal documentation of highbank and midway
Date: Sun, 18 Jul 2021 13:46:20 +0100
Message-Id: <20210718124621.13395-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Add skeletal documentation for the highbank and midway machines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210713142226.19155-4-peter.maydell@linaro.org
---
 docs/system/arm/highbank.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst   |  1 +
 MAINTAINERS                  |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/highbank.rst

diff --git a/docs/system/arm/highbank.rst b/docs/system/arm/highbank.rst
new file mode 100644
index 00000000000..bb4965b367f
--- /dev/null
+++ b/docs/system/arm/highbank.rst
@@ -0,0 +1,19 @@
+Calxeda Highbank and Midway (``highbank``, ``midway``)
+======================================================
+
+``highbank`` is a model of the Calxeda Highbank (ECX-1000) system,
+which has four Cortex-A9 cores.
+
+``midway`` is a model of the Calxeda Midway (ECX-2000) system,
+which has four Cortex-A15 cores.
+
+Emulated devices:
+
+- L2x0 cache controller
+- SP804 dual timer
+- PL011 UART
+- PL061 GPIOs
+- PL031 RTC
+- PL022 synchronous serial port controller
+- AHCI
+- XGMAC ethernet controllers
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index c52902acdad..c0c2585c0ad 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/cubieboard
    arm/emcraft-sf2
+   arm/highbank
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index 1504951823f..4256ad1adbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -643,6 +643,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/highbank.c
 F: hw/net/xgmac.c
+F: docs/system/arm/highbank.rst
 
 Canon DIGIC
 M: Antony Pavlov <antonynpavlov@gmail.com>
-- 
2.20.1


