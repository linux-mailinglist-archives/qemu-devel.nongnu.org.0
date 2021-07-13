Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90F3C7235
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:31:04 +0200 (CEST)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JR9-00086l-G0
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIw-0001af-NF
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIu-0001dc-EW
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n4so3357627wms.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQUH7xKOoPCjm46B5UEAUDBteVD2FMhQP28ZtHWhFHc=;
 b=iFl/8G/7U2fq0Ugco323xszrOrqVEJZ3TPrDLZbqVGicJ4oSN0qYURugdoTF/NHfPE
 MSz453WgEGvqLTiMNhRiJis+UtLd9+B+X47fwDYQSadcu4d0f13psEjbamBQDJhDGYhg
 d5GfJZGpgv8cSNJcVZX06TG/+9z16vUNHzmv599m+wmab3JOMJFSBmPbhqpnV3VYtoPu
 N+64urHhg1EgzGNJwOEgbzqo9gTPxin/NrHc86v17pfMzwP/ZMOaHTAWpgHqvW8TW61Z
 XG4FjfoPdrDFu0x6VN+0siAugawrqXqWt9KEMaRaSylwa/HDuxaLTK02PIqOBeDmefXg
 MuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQUH7xKOoPCjm46B5UEAUDBteVD2FMhQP28ZtHWhFHc=;
 b=tXgSsHGUYvJCptdZXtVfhGpWsSiC4BmGqqGfNzvFUGuRCqwPV3QpjSZB4fBOlxGscz
 wJpf2iMRjpj+M+YnU18Jav9IWlaKMgBIb14HTlVPBPLspND0/WGwot1/Jlts6LFl8ZyX
 n8Vv4lLxgeHWVm/CyTXhoXqCr98jyodQc6qE31tnwRXoD1ZbjHsEU7Kl7qcUraxGcIp1
 E2w5eKL6Z2hu8cjGQ4CJnOZBB20gPi8exKe3q2iek3/ss9fvBAuGVueyNnKR3BR/VDNe
 S5XxmZobvh22mxzgW534BS12DTrHNutPhlnNP2yQSz0YuU9YkHjGfFfSo0S+BupSIhsa
 gbVw==
X-Gm-Message-State: AOAM533VcAGTVU6dIOXd/8hN8S0VmvXq9C3XQE50hAltu8e35Dy5QGpi
 8W5vFcyWUyOaOyMjpQGoYKBd3g==
X-Google-Smtp-Source: ABdhPJx06QnWxrFh9C32ipKvH5h1BxL086MUzQG6jNMtiRdtneqSLbFvlhJGjYMc9CLas7KgPLhZuQ==
X-Received: by 2002:a05:600c:24d3:: with SMTP id
 19mr5257101wmu.171.1626186149640; 
 Tue, 13 Jul 2021 07:22:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] docs: Add skeletal documentation of cubieboard
Date: Tue, 13 Jul 2021 15:22:24 +0100
Message-Id: <20210713142226.19155-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713142226.19155-1-peter.maydell@linaro.org>
References: <20210713142226.19155-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add skeletal documentation of the cubieboard machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index c340bb02b0f..93b9f900034 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,6 +559,7 @@ S: Odd Fixes
 F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
+F: docs/system/arm/cubieboard.rst
 
 Allwinner-h3
 M: Niek Linnenbank <nieklinnenbank@gmail.com>
-- 
2.20.1


