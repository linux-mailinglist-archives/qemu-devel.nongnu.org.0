Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E330131EB34
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:01:40 +0100 (CET)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkoF-0006OZ-W0
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCkli-0005LM-Qz; Thu, 18 Feb 2021 09:59:02 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCklh-0000SL-5a; Thu, 18 Feb 2021 09:59:02 -0500
Received: by mail-ej1-x62e.google.com with SMTP id u20so5387329ejb.7;
 Thu, 18 Feb 2021 06:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ard5aUZvPYdrVwjnl97zMqw9C8R67bjTWkOwIgpPJKE=;
 b=Ruuz+8TGPVdnsOhI9f2OQvy+LcKPjFhgFdErI4+KzdanaI8g7q74XElWbqpEQ/ogBw
 8ScLsrcFITa7im6TwV2iY4XlQZrbGTZeLxRZPBPzTCBZLHAFcL03WteVxkVFeFl9Rf5/
 Oh1GZ5h2BnGjhe0JSRcmfnUBxoxoO7QsvbWLuO4EF/XOhHnnt1623NA1UdQE8RXk/GVG
 S7CD12+QcARopyn+4w2rBIuL8fY6hLeeIVT4p3HPRbmnqEvy3UV9xXNu53CRP4qMZGwH
 F8kbtsHvUwLN2qMmVKncIQZjw66b+enwtX7wigWOxJuJ6YfHibJopBxbMMqAJRst3I9g
 sbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ard5aUZvPYdrVwjnl97zMqw9C8R67bjTWkOwIgpPJKE=;
 b=ALXEFuwbOdXmnW17RW6JajmwLjehCuA6HcaU3jrnPvUdRS4W2A/3022vLc84JFUm9b
 dhB3uVwa6ehh24teoTrUOG6RkvI/cRv7LzZJYKtF0caGjye2RvCsFdnDT/8Q1aTqIT3F
 lm1rtDz2DKD7ynLITzDSFkgWOjsUXGbQhpWL9bNDAsRaoEXpG0lcHXkArCBCmjYHuPJv
 IVRV8KCRjFHhtzySU37aomOYrdxvp+jWNCj3XYECQcqLGJQ5z6KG8IJdalJneamsLMIR
 jP2wuYdciixNVqYYQ1DMpkpPjbUa+QH/eHtLarCBLMeD3c5EKAC9dWf65pjr6klzV6Gf
 zXyA==
X-Gm-Message-State: AOAM530IxZgUKQG7M9F1XOTnQ1cbkni36aawoTMRu/Yox86eNVDSwX20
 CIGM3K5q0Z5TFI6qz+NhGIQ=
X-Google-Smtp-Source: ABdhPJxhyhZSptZFOgg74uErUsj3eWzSjln8OWmAymZuMJvPGLTKgUM/kFyAdOOWy5WHpuYnmoK6tw==
X-Received: by 2002:a17:906:4cd3:: with SMTP id
 q19mr4271545ejt.78.1613660339412; 
 Thu, 18 Feb 2021 06:58:59 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i13sm2621040ejj.2.2021.02.18.06.58.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Feb 2021 06:58:58 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH] hw/ppc: e500: Add missing #address-cells and #size-cells in
 the eTSEC node
Date: Thu, 18 Feb 2021 22:58:39 +0800
Message-Id: <1613660319-76960-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
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
to be incorrectly parsed using the default values.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ppc/e500.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 01517a6..c84a021 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -236,6 +236,8 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     qemu_fdt_setprop_string(fdt, node, "model", "eTSEC");
     qemu_fdt_setprop(fdt, node, "local-mac-address", etsec->conf.macaddr.a, 6);
     qemu_fdt_setprop_cells(fdt, node, "fixed-link", 0, 1, 1000, 0, 0);
+    qemu_fdt_setprop_cells(fdt, node, "#size-cells", 1);
+    qemu_fdt_setprop_cells(fdt, node, "#address-cells", 1);
 
     qemu_fdt_add_subnode(fdt, group);
     qemu_fdt_setprop_cells(fdt, group, "reg", mmio0, 0x1000);
-- 
2.7.4


