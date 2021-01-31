Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF3309B73
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:06:57 +0100 (CET)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6AZE-0003nP-AE
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASO-0007Tl-Rh; Sun, 31 Jan 2021 05:59:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASM-0000RF-H9; Sun, 31 Jan 2021 05:59:51 -0500
Received: by mail-wr1-x435.google.com with SMTP id s7so10436444wru.5;
 Sun, 31 Jan 2021 02:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQoiucDIT4rSjEAY4ZuvMUxbDYBSZFNnjg1m60zIj8E=;
 b=ZeHl/siOlsjFxeuZteA5wZuvh/8NM5Q/I2spUpfS0cqhWQBuY9YgwoDKLtaByXCpsv
 b0l2aiuzFIE3GaVjOEgo5w3uUWtoV2d7riKMBtfaVJ1kcmy1TDVcMviNmkVSc50FUIl8
 RrgEgL711CCUFwBVMPacRJlikKGRdcdCvhRV9rDU50nyaf9FSdjlo0LKOVx8NE/An6Yu
 61dk28LtGZmnuUCSGprEiOQlo0nr4rlbWsq36QoRMDGQxhppeXn1SOKISZh6VVgpMrLE
 KLvyHAfmSA2gQpgT+pv2cCgdiaymRAn0USUG9JZhRcUFLTvmKSyFbU+nMMvDVbwRc+KV
 5j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZQoiucDIT4rSjEAY4ZuvMUxbDYBSZFNnjg1m60zIj8E=;
 b=eeGpwlW2OHj4k5qAGY5UBjSrVFvZnzEvbNEKkWfjX21z/FQ6xaOKstoyJgpuYdU4HM
 LxAk+Wem85tX+3N0pr4Gxjv7MLT2p6uSG/5U9G0Cp7Lx2HVahsekdzf2XuzIH+K6K3nD
 1pGEv7IszrWP5zNUA5AkI0cMdxierXrx4cAkx4n1K3DbOisafhbxw8ofefSs00rraYNJ
 IkkR1XrkjnMul+W1vcWLgocrbbFW8mWeQyrenFtM4Kc89Zg9IxeAwCbqIjJdofq5Cm+7
 ZDjtXpgcCni2+RQXL1xsISlejawbnwIDmHR/Dt74nP6WqsYhaFv54pe2hnko/cqyoSSQ
 tNmQ==
X-Gm-Message-State: AOAM532CVrzRTsZNXYi+fRl3zfcR3ZgIfSUby5mOa26GUv+PM/WsxmAF
 eRfYZJNS38eIuqnxHOOCWrxAOAfV19I=
X-Google-Smtp-Source: ABdhPJxVJS0UB3XcqSG9ZrQEJVPZb3WoW36SwkkysF0aEYp4+I6Gla/yX1CHAc/ThxX2mutk7FEQww==
X-Received: by 2002:adf:e9cf:: with SMTP id l15mr13003391wrn.317.1612090788500; 
 Sun, 31 Jan 2021 02:59:48 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d5sm22464661wrs.21.2021.01.31.02.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] hw/arm/sbsa-ref: Restrict SBSA-ref board to 64-bit
 build
Date: Sun, 31 Jan 2021 11:59:16 +0100
Message-Id: <20210131105918.228787-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Leif Lindholm <leif@nuviainc.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SBSA-ref board only use CPUs available in the 64-bit build,
it is pointless to have it available in the 32-bit build.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Leif Lindholm <leif@nuviainc.com>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index be39117b9b6..059ff7382f2 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -22,7 +22,7 @@
 arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
-arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
+arm_ss.add(when: ['CONFIG_SBSA_REF', 'TARGET_AARCH64'], if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
-- 
2.26.2


