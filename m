Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA8336D94
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:17:53 +0100 (CET)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGW0-00012s-Ln
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKGUa-0000S2-DI; Thu, 11 Mar 2021 03:16:24 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKGUY-00045x-4o; Thu, 11 Mar 2021 03:16:24 -0500
Received: by mail-ej1-x636.google.com with SMTP id mj10so44323538ejb.5;
 Thu, 11 Mar 2021 00:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=F7d2B8kuQm5TJu7CoF8oTVx1SqdIdneBYdDdURUxyxo=;
 b=bWtJv1hIhZvatl5SWkJ9ul9M4gIhLeugv42tsfcXYAg03RtGslAwr5eh6vnB1hVEMH
 Evh+NmEEqxPgJmMAbWklNVLN8dnbVgGx8XciaKk2jbQ+rP8XSa8sWvxn0zfeTnujBGJF
 FS0fkHgS7SN8P/T5AUoYdWhQ64Klp3vwY2TMmmKWjw8oMhV8VzNIGAyCH2hzrtG69IsN
 a9RJ7QB0VLHc9asQpsxPAVIPHZZXr1TtD2PpeT8yZUfWfkxwvTEc5vo/C2fOvDMn9wUM
 99pZ8um2rprSFMKqGkXAR7uw5vvDjPogYd7WVmO5zARSsUC1oF1sk6EDAExXofR8u9nl
 x0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F7d2B8kuQm5TJu7CoF8oTVx1SqdIdneBYdDdURUxyxo=;
 b=jOHiqvyhuDT+AQETW1bbx4LwhwdoXkFzFh7EUnqKWogASmb3YKlO/jrgpL8T9mWMcU
 UTQ+ju5TX3eKuyrGIOEzuOWUQ+W2z+VlPCld5I4J0U103+8J+jcYQCHh4oie1mnKIrRY
 uEUh/yCSek6WhEKr/XWD+z46wcD1TtAZuUWTY9BlOzhAa9fj7SnqEDmDzQ0KUNF3arYb
 9sURNcUBIBAnUTbQbMLbK6qwAoIK7T+PbU0DMgBzKoDiyjL5DGPxg7Gk0NngrzEwB+DI
 IFfga07EhCm8Pi7/3/zZJFSsVeLOdUhScb8tiirs6seSUurn5IXqfCH/wpaN86/e2vL+
 JJgg==
X-Gm-Message-State: AOAM533H+AXx/HtJGXBR/HEy10VuZ7/l69uVBe2Xf6I9Wxupm8ZMamM3
 Rha9hn0mqaOPF9TTDR+DWqA=
X-Google-Smtp-Source: ABdhPJwuOsvndomx5tHCzEXRE2t45HzEps4lxH+XzqyuNoN8/GgYEIv7aSjBJasBnnST6WKIwbmS2Q==
X-Received: by 2002:a17:906:d8c6:: with SMTP id
 re6mr1877727ejb.311.1615450579761; 
 Thu, 11 Mar 2021 00:16:19 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id cx15sm851539edb.54.2021.03.11.00.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 00:16:19 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [RESEND PATCH] hw/ppc: e500: Add missing #address-cells and
 #size-cells in the eTSEC node
Date: Thu, 11 Mar 2021 16:16:08 +0800
Message-Id: <20210311081608.66891-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per devicetree spec v0.3 [1] chapter 2.3.5:

The #address-cells and #size-cells properties are not inherited
from ancestors in the devicetree. They shall be explicitly defined.
If missing, a client program should assume a default value of 2
for #address-cells, and a value of 1 for #size-cells.

These properties are currently missing, causing the <reg> property
of the queue-group subnode to be incorrectly parsed using default
values.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ppc/e500.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 1d94485ac8..79467ac512 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -237,6 +237,8 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     qemu_fdt_setprop_string(fdt, node, "model", "eTSEC");
     qemu_fdt_setprop(fdt, node, "local-mac-address", etsec->conf.macaddr.a, 6);
     qemu_fdt_setprop_cells(fdt, node, "fixed-link", 0, 1, 1000, 0, 0);
+    qemu_fdt_setprop_cells(fdt, node, "#size-cells", 1);
+    qemu_fdt_setprop_cells(fdt, node, "#address-cells", 1);
 
     qemu_fdt_add_subnode(fdt, group);
     qemu_fdt_setprop_cells(fdt, group, "reg", mmio0, 0x1000);
-- 
2.17.1


