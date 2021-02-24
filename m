Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968DF323974
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:30:35 +0100 (CET)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqV8-0003nJ-1Q
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEqTX-0003Az-9X; Wed, 24 Feb 2021 04:28:55 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEqTV-0005dc-LR; Wed, 24 Feb 2021 04:28:54 -0500
Received: by mail-ed1-x52d.google.com with SMTP id j9so1612556edp.1;
 Wed, 24 Feb 2021 01:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=T5gOHH5jRlJcPsCP2782PeiT0pmJU2vc7Bnr5VH29vg=;
 b=TtUN84TUqweM5kbAvy8bALAJvU9dTSd4E3G0APro1WzGxCGjG8y6iEoWmQZ8oxVZpM
 N/8yTlVm+zEoAi8WMiDHDd3n7Caiz0L0O8ZlXTnO8B6qC4es9pbG8Sqw4lpUuIxjaIWD
 fDSe1x8sIKEngz9+PtQa/k732mZTjUJ8kwFca/yIeBu4id48sJtL665tT4P9dFV8EgJF
 DWXpTzgJ6tiQAGeSRxMgqe8D+jlo5EoICSjuyCZO8wgVTyhBgSI7WMIBoANzzTF5m5Qu
 UmBYgDCipqqlxDenBhyqfrrJ8lekPiLW18qp8Rr5rcahV9phucA0/foJC1MPjmppLwRI
 i2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T5gOHH5jRlJcPsCP2782PeiT0pmJU2vc7Bnr5VH29vg=;
 b=bAxA+hneou6JmuZwUNenM7YSGANz+KwKngSCniRqQuNgIzgEj4rOwnXAfTfYl7I/Py
 0SmTowjBCRxxBtbePIVqI0Hk3XJt3tRhYULBVyzoATde6vXvhRpsWD2jaLiutZZmtKEL
 n98/I9onexlkMEfuzWBzN/aJaRLOVtcjHcYlnl7giLZwaD7QbwIglOFZzZfhZFWQlwtc
 Wj6NLrg8wqmqhbGJq0hbs0s2ZyJMASbNXiYeVqkgiWkmUFWxOChCq68PDzAp35aUfE2h
 uLTZb3JmWg4V+L5MREw+29pdFKII7qO3jobal/sFatIsKrUXzfHY2C9jebYpNjhSki1k
 ilcQ==
X-Gm-Message-State: AOAM533RvcEF6Lre9hwvgHNa02P0Bm8n4YK1f3vfOi0HjHMeKXKfo1pD
 dhBKCsoAIwLuC3xbETKUW1s=
X-Google-Smtp-Source: ABdhPJzaSWpqi+LOaWQwlZ/vkH0pQgGb5Z/DE2AHA5gN+IQZJmEN5QeUBoQqdkc9vHIQMByhCAB45Q==
X-Received: by 2002:aa7:db91:: with SMTP id u17mr13306331edt.71.1614158931086; 
 Wed, 24 Feb 2021 01:28:51 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y8sm866035ejw.32.2021.02.24.01.28.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 01:28:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH] hw/ppc: e500: Add missing <ranges> in the eTSEC node
Date: Wed, 24 Feb 2021 17:28:39 +0800
Message-Id: <1614158919-9473-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The eTSEC node should provide an empty <ranges> property in the
eTSEC node, otherwise of_translate_address() in the Linux kernel
fails to get the eTSEC register base, reporting:

  OF: ** translation for device /platform@f00000000/ethernet@0/queue-group **
  OF: bus is default (na=1, ns=1) on /platform@f00000000/ethernet@0
  OF: translating address: 00000000
  OF: parent bus is default (na=1, ns=1) on /platform@f00000000
  OF: no ranges; cannot translate

Per devicetree spec v0.3 [1] chapter 2.3.8:

  If the property is not present in a bus node, it is assumed that
  no mapping exists between children of the node and the parent
  address space.

This is why of_translate_address() aborts the address translation.
Apparently U-Boot devicetree parser seems to be tolerant with
missing <ranges> as this was not noticed when testing with U-Boot.
The empty <ranges> property is present in all kernel shipped dtsi
files for eTSEC, Let's add it to conform with the spec.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ppc/e500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c84a021..79467ac 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -231,6 +231,7 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     assert(irq2 >= 0);
 
     qemu_fdt_add_subnode(fdt, node);
+    qemu_fdt_setprop(fdt, node, "ranges", NULL, 0);
     qemu_fdt_setprop_string(fdt, node, "device_type", "network");
     qemu_fdt_setprop_string(fdt, node, "compatible", "fsl,etsec2");
     qemu_fdt_setprop_string(fdt, node, "model", "eTSEC");
-- 
2.7.4


