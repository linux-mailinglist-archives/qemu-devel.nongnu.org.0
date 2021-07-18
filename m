Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053143CC937
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:56:33 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56LQ-0002ZL-3A
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bm-0003kc-Nw
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bk-0003Wa-A5
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a13so18024966wrf.10
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RXMddOMoQSEaXfNbqTIYzuEkUOjWwgdzOPERkMGl9nw=;
 b=EAjJSpAUCzS97aBxG4zbdHhd2Jk0ThCRe+w088Z5v03HOqX80DMoj1pHqef2t/MJoC
 9PYgcVLYZgX9Q3GZUA+RY36m0/0az9bJ1LJvc2oI8keTMjb5s57aS3gV4ML2IC06+szy
 1mIKmh40GOtCPS1/jBYUL9Bqhy8tyxgGnm4z8VjyAZlTBeVpNRi6/J2VJxWcWimoOhR6
 LhFxgnrht2eC+XvvNinfbfrPwsh0H+RV+FUco1bbfAAMefP6Qur2AKgaD8VZRXPNsy/Z
 QIrRTO8uYvtWeMtmSserrpSj+KuDiXubFh/z9y2d4FgOmkRFMO5PvEUXg2RJvvoyxUd1
 q7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RXMddOMoQSEaXfNbqTIYzuEkUOjWwgdzOPERkMGl9nw=;
 b=ZiUAhbRx4gbvYNSeLu1+warWlm4LkBZcWidHI5t0RvNa+DPnWJMJARGXJj+T68JSik
 HVX7+pvAbrU64GsTrS7ag//gntpekfhTm6pPQERdiw9faOMRXsTIJw675hdPj8NjYacX
 sdhz61W8H2ExLD11OwChgHNPCvQtUT2M5pnPv3cZM0TfSMm36Xagsf9FYzGDLr0qIi/z
 N4Cx3ATjw2mEt86UuXQtjvPS6njqooKkVN67mNZNN7Z47LTAh7ASiCv1tSDIdVoR3PTE
 OXIy4Y8DdWZRhSVaQmOioyVuITS9/ssTJHbnWYLB9DGq8C2uQ3zFUlzeSNqPTB1UxxZ/
 I4sQ==
X-Gm-Message-State: AOAM533sLqvy/UOR1RBTq0FuhkfbL4kLyrCUho/JR5qi5Ot7poLJv2v/
 yq2qtwPNZtAlNh0ZboJ10SlrIbhP5LmoxA==
X-Google-Smtp-Source: ABdhPJxhvil8hxKvTg9U3mi5k21dkRS+dtB8UBvVFswiLrLwo3QqBtzdwC8C9u8nKMdh6Y6b9YHN1A==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr24488873wrt.193.1626612390679; 
 Sun, 18 Jul 2021 05:46:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] docs: Add skeletal documentation of the emcraft-sf2
Date: Sun, 18 Jul 2021 13:46:19 +0100
Message-Id: <20210718124621.13395-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Add skeletal documentation of the emcraft-sf2 machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210713142226.19155-3-peter.maydell@linaro.org
---
 docs/system/arm/emcraft-sf2.rst | 15 +++++++++++++++
 docs/system/target-arm.rst      |  1 +
 MAINTAINERS                     |  1 +
 3 files changed, 17 insertions(+)
 create mode 100644 docs/system/arm/emcraft-sf2.rst

diff --git a/docs/system/arm/emcraft-sf2.rst b/docs/system/arm/emcraft-sf2.rst
new file mode 100644
index 00000000000..377e2487206
--- /dev/null
+++ b/docs/system/arm/emcraft-sf2.rst
@@ -0,0 +1,15 @@
+Emcraft SmartFusion2 SOM kit (``emcraft-sf2``)
+==============================================
+
+The ``emcraft-sf2`` board emulates the SmartFusion2 SOM kit from
+Emcraft (M2S010). This is a System-on-Module from EmCraft systems,
+based on the SmartFusion2 SoC FPGA from Microsemi Corporation.
+The SoC is based on a Cortex-M4 processor.
+
+Emulated devices:
+
+- System timer
+- System registers
+- SPI controller
+- UART
+- EMAC
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index e2fcb64872d..c52902acdad 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
    arm/sabrelite
    arm/digic
    arm/cubieboard
+   arm/emcraft-sf2
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index 1596b352b46..1504951823f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1024,6 +1024,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-som.c
+F: docs/system/arm/emcraft-sf2.rst
 
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
-- 
2.20.1


