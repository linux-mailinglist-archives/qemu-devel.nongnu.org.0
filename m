Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA33BC5CB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:52:34 +0200 (CEST)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0d4U-0003ck-0x
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0cjg-0003qs-NF
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:31:04 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0cje-0006cM-NX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:31:04 -0400
Received: by mail-ej1-x62e.google.com with SMTP id bu12so32113135ejb.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 21:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wsOTdAI4clhTzWNucY/6I964yIAIjK2OlnrgYo4uV8s=;
 b=LBZ3Cfnm/+rIVelWsVaIAiiIIg7brcCRLOyOmLFXcZDJUji2+K7z0fyGgj5Mot4z1E
 zJUz0NsPZm3HNNa34PuaVsTQKxLsvfDo5MvXRXJWwSyW4aH/Vrgsdntog9lEFof0AUCW
 JVURpNUh89mdaHEWJAY/nnXEbzrd6+P2Wh3+yxiGIuk30WebG7fbWjKDyvxMfUd8Dv0T
 HOjeVbVUshujZdTYLM6awCv51lEjbA0Q/RaYvKMnqLWz97k0OlWvkgk9Yj/BvoZvKtlB
 AOxyU/saZ/ngakYic0l5ltVx+thLgyOrkY728iVnBrGZ9DwaRqPicQ0LcLjJgK0PPLfO
 VT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wsOTdAI4clhTzWNucY/6I964yIAIjK2OlnrgYo4uV8s=;
 b=ZjgMK7lNmA6VKK6t32AnFH78ZyGQDVWgYn+xij7Z5zc9WmdpTbFZNyGybKX6Gsgt+K
 wEil1gbwrOzqdqJfCYr6yMUoNgX28wjJMvCaVvJqdt5FlNhGE90BdXmgO/HdlBUSc2Ok
 u7sAf4V4tKVWVK+3rHc9HDkkhl2NZvIW/4MKlWmU1kzLjHYjOiTvxHFx2k71XqPNSa2S
 /Q95dbHtV3y5qBiqmpbr7ajWRNfrjxben9WxKtyr1mJ9fv4zlD+NALkmdzXt9LSO4fiB
 nIO1dOBPgrCQ5L7Vuzxwks7xZId7TwsHRDERnmLtFqIrKBlcJtoHEel3dhENLjmc0gUQ
 R7yA==
X-Gm-Message-State: AOAM533TinQqDVqpYSBNqq3709d4CtTRq/5og1U6aL4s5u5zHJK7aiIS
 ci9egidHaE//2pckLAFR7AU=
X-Google-Smtp-Source: ABdhPJzRlon2XjGtYmsoDJW28PGyR2CExNKVP+eY+LBvUc+IrQdPQGQ0JTF3YjuAenLffn8E9JdR+g==
X-Received: by 2002:a17:906:1da1:: with SMTP id
 u1mr16176634ejh.307.1625545857850; 
 Mon, 05 Jul 2021 21:30:57 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id x16sm2529992ejj.74.2021.07.05.21.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 21:30:57 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs/system: ppc: Update ppce500 documentation with eTSEC
 support
Date: Tue,  6 Jul 2021 12:31:24 +0800
Message-Id: <20210706043124.1871866-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706043124.1871866-1-bmeng.cn@gmail.com>
References: <20210706043124.1871866-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This adds eTSEC support to the PowerPC `ppce500` machine documentation.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/system/ppc/ppce500.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 7a815c1881..afc58f60f5 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
 * Power-off functionality via one GPIO pin
 * 1 Freescale MPC8xxx PCI host controller
 * VirtIO devices via PCI bus
+* 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
 
 Hardware configuration information
 ----------------------------------
@@ -121,7 +122,7 @@ To boot the 32-bit Linux kernel:
 Running U-Boot
 --------------
 
-U-Boot mainline v2021.04 release is tested at the time of writing. To build a
+U-Boot mainline v2021.07 release is tested at the time of writing. To build a
 U-Boot mainline bootloader that can be booted by the ``ppce500`` machine, use
 the qemu-ppce500_defconfig with similar commands as described above for Linux:
 
@@ -154,3 +155,10 @@ interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
                     -display none -serial stdio \
                     -bios u-boot \
                     -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
+
+The QEMU ``ppce500`` machine can also dynamically instantiate an eTSEC device
+if “-device eTSEC” is given to QEMU:
+
+.. code-block:: bash
+
+  -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
-- 
2.25.1


