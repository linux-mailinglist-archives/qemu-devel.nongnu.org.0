Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF84F456A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:43:17 +0200 (CEST)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbrtM-0004Jz-Ux
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xsRMYggKCpsRPC5JONCBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1nbroT-0004EI-1q
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:13 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:41769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xsRMYggKCpsRPC5JONCBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1nbroL-00030j-LV
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:12 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 j1-20020a170903028100b0014b1f9e0068so174511plr.8
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VYxWL6bZEYLrJGNbQRZ1dyCdVAbahcbUSnlVpK3x3+w=;
 b=Yx9jwV/LKMrp0Op8M7XIjKg1ImCArvg+CtjGIVY9mdZoSPaZRlWttfLpzjs9U2eaf9
 vg6rXXlSXNkGdrXQEA/w7JTk2lvm2XDXMJr7At2eGP0uknsNbHgorc4NjsoWg3FiKtSq
 dOeazbDATOtQz87vvHomeRkx6gu1T6EWHVTRMrD+hzErDoJpCrLeQItjDrYQJGdCgDVE
 MnLYWtwGu0CVs2M5MKW9wpI+O8p2HWF9fbIy6nMn3ZRZ+mnch/9dwHtVYbjCFNW8x54Z
 WoEaodcjNl+1frnVl0NsZPlX+ngpu/7oN4Gfan9a0gNkiR5tIPfsl7RZ0y8v7Vaoeb6/
 XEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VYxWL6bZEYLrJGNbQRZ1dyCdVAbahcbUSnlVpK3x3+w=;
 b=ka3PPa7xfPQkfOjSSejN9XxQ1e7tzPvSoNNsQgXDaLYFeI03+FCr+1s+lQxNYllrza
 oeSzM5j9r5bhYSfqJYenRTUaULLwSmq0KL/3E3px1ZvqAbMnpkaJ4xoo0X2oGD7BZq8d
 5XlMz9QYE3QY5ZCrADywW9gU+TXrGMaZFUSBwLN/6/2uoxOwdBtOGm18MKIYpvqrQGa9
 +L1PoAIO6rUWGhMOXNAJCjUzRL2ielCUMrDyNaEILve0LTIDgmz388RVbzHcjsUGyscT
 zBiXsLzTmF7Cy35TUVdcjZkfL3SE9qBzF35WR+lz45OUstwvAyYkdgPx2yn9+Sex7UwS
 lU7A==
X-Gm-Message-State: AOAM532qgUzpBHKpwm9N9yaxKr2I3bK+2tBQMwHEBvuLhH+N/nTcXGSh
 MlgFIJtS3T6PAyx4ZSYoPHYZ14V88BZtPA==
X-Google-Smtp-Source: ABdhPJyDGpppKN4sIDoYWVidf+7gjCfwD2gurtQ2ZvWjfvnHH7YpmwTbWc5O4jdq8TK235sHDtGwkKbykQY3rg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:9b98:b0:156:52b1:b100 with SMTP
 id y24-20020a1709029b9800b0015652b1b100mr5695162plp.174.1649198278208; Tue,
 05 Apr 2022 15:37:58 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:30 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 01/11] docs/system/arm: Add Description for NPCM8XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3xsRMYggKCpsRPC5JONCBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 docs/system/arm/nuvoton.rst | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ef2792076a..bead17fa7e 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,12 +1,13 @@
 Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
 ================================================================
 
-The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
+The `Nuvoton iBMC`_ chips are a family of ARM-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
-servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
-assortment of peripherals targeted for either Enterprise or Data Center /
-Hyperscale applications. The former is a superset of the latter, so NPCM750 has
-all the peripherals of NPCM730 and more.
+servers. Currently there are two families: NPCM7XX series and
+NPCM8XX series. NPCM7XX series feature one or two ARM Cortex-A9 CPU cores,
+while NPCM8XX feature 4 ARM Cortex-A35 CPU cores. Both series contain a
+different assortment of peripherals targeted for either Enterprise or Data
+Center / Hyperscale applications.
 
 .. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
 
@@ -27,6 +28,8 @@ There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
 supported by QEMU.
 
+The NPCM8xx SoC is the successor of the NPCM7xx SoC.
+
 Supported devices
 -----------------
 
@@ -61,6 +64,8 @@ Missing devices
    * System Wake-up Control (SWC)
    * Shared memory (SHM)
    * eSPI slave interface
+   * Block-tranfer interface (8XX only)
+   * Virtual UART (8XX only)
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
@@ -76,6 +81,11 @@ Missing devices
  * Video capture
  * Encoding compression engine
  * Security features
+ * I3C buses (8XX only)
+ * Temperator sensor interface (8XX only)
+ * Virtual UART (8XX only)
+ * Flash monitor (8XX only)
+ * JTAG master (8XX only)
 
 Boot options
 ------------
-- 
2.35.1.1094.g7c7d902a7c-goog


