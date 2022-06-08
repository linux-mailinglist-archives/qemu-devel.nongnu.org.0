Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7D3542E27
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 12:45:57 +0200 (CEST)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nytCG-0003TT-Ew
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 06:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyt7j-0008Gq-3b
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:41:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyt7h-0001ex-08
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:41:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id x17so27793686wrg.6
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDaCeEWtkC+//rT1mzIS4ua67TAlHCmcxiRLRNLj26E=;
 b=grcDUJJ3elAxGtPwEXTu12QzAFK0+sYh7AA3/vxsQBRkF65OSt4L8XvGjZHxyvcfQt
 LqVXM9Z9L8p8mwY2mqohhVDcnKqKpv0jQHhbnkLH6SEG9NATlh8qCx1AKA3aNec3qLn0
 1beaVHaQRbHcrlthIwH93PYoZYYanH2wNfV534BHZ1BdmNLi/ymqYFRTHdJStrMXEjPE
 TVVOZjM3yLXqZFqJii9rxKWgVMuD6BcyrzmaejRMIgcI3FBOD4q9IO/nHTc+VydFUAQz
 dH3vzSYbCry5Rn27oBhgpzZDbsRXpcZ3HEhVYhGyVfminQ+B0E9y/o3Wyx4w3Z0+6bD0
 h51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDaCeEWtkC+//rT1mzIS4ua67TAlHCmcxiRLRNLj26E=;
 b=Qk+utM1u5dBAuwZICNT64eHTxEyf8ThmFhPYXmL/aJeey48yw//G1L696bfoNDPsqh
 +oU7gi/2y7IKjVULfSf5jqsg5WAnx/PRSqcJuSrdujAC0xxGEr6bWqQV9IwzCkQc9MoT
 zwUEfV2vXHLPoeTlVAlN88sZoiA3yWDDc8IxD3OKxy8XpKoDyF4PqsJ0kWggt6xM8uGL
 XCoLM5RtGvb9yky/m+0naMIKSweZhbxAbmEtXjCp8Yr/1kllNrtiAav9ZVMjuWXvTtAe
 YKgbZtLLU8LZ+XwxWYbzAzslk2HHvRxh3V2OgSgwcIB/1WxWd99lxcOUdcnsMCGTX/3L
 IFwA==
X-Gm-Message-State: AOAM533LW+Mbe+DoCRNRMyALH70q+CYAJw2q8iD6PMZ38OozWygSRUGJ
 rAxfsrYdbZr4qKC6L0k1H9yDHA==
X-Google-Smtp-Source: ABdhPJzMZSLAOc6nCCfTMcdhoCgiyYuoC6qJEM4UZlmnKzCtYND0oD+BQLtZeDyAcZx8QVVP7/TOCg==
X-Received: by 2002:adf:dcd1:0:b0:218:4736:cf39 with SMTP id
 x17-20020adfdcd1000000b002184736cf39mr12806470wrm.86.1654684869696; 
 Wed, 08 Jun 2022 03:41:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a5d46cc000000b0020fff0ea0a3sm20337008wrs.116.2022.06.08.03.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 03:41:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A7B741FFB7;
 Wed,  8 Jun 2022 11:41:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH] target/mips: make SEMIHOSTING conditional on TCG
Date: Wed,  8 Jun 2022 11:40:54 +0100
Message-Id: <20220608104054.323642-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

Previously SEMIHOSTING was always selected due to requirements in the
helper files. Since the original fix there has been refactoring in the
mips code to split TCG and KVM code. The recent semihosting
refactoring triggers the inverse build problem for KVM only mips
builds. Instead of selecting it in the common config make it optional
on TCG being enabled in the target Kconfig.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 configs/devices/mips-softmmu/common.mak | 3 ---
 target/mips/Kconfig                     | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index d2202c839e..89906777ae 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -1,8 +1,5 @@
 # Common mips*-softmmu CONFIG defines
 
-# CONFIG_SEMIHOSTING is always required on this architecture
-CONFIG_SEMIHOSTING=y
-
 CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
diff --git a/target/mips/Kconfig b/target/mips/Kconfig
index 6adf145354..4918fa42e9 100644
--- a/target/mips/Kconfig
+++ b/target/mips/Kconfig
@@ -1,5 +1,6 @@
 config MIPS
     bool
+    select SEMIHOSTING if TCG
 
 config MIPS64
     bool
-- 
2.30.2


