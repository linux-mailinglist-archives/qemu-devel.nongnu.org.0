Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792551E85
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 00:45:39 +0200 (CEST)
Received: from localhost ([::1]:55174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfXiU-0000hQ-Mx
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 18:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34155)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hfXSP-0004AU-11
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 18:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hfXSN-0005O7-T3
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 18:29:00 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hfXSL-0005LC-NQ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 18:28:57 -0400
Received: by mail-wm1-x343.google.com with SMTP id f17so878904wme.2
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 15:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KYk64fDgJf3EGuB/Zdsti2GInZLj+JR40MhwE281SdQ=;
 b=HfdHXcnIXZGy2hmeWotpRxxZ7Fz+go3S7kfxiAZtNIqP6E/Vymn3+i1ONBXxhzpIVj
 GP1a8lkosg17Z21KeDZ76Z1p7JGdn3Nf+oU5hYCs5gGvaAbrEXflDX/xzxXXmTTVUi35
 xYdgkRpuJzJcOqoM1M8P0aAUt3xTwZY3F0kq7rDS3pOZ6NBZvDFuqKM2LkJfmfTs5TwC
 5HJZiY6aN4bntWP2ZqPvh6XPY16gd2aIJx0Sv/xi4jvCMsvoTsoSyt1PyTJ9ANH0i7wG
 Xq7rtsWJjuhMRDDER+UqrT9cVWcy1P9izpgGlMCsQARbS0aMuQfZD084wgKKiPJbxlw4
 mNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KYk64fDgJf3EGuB/Zdsti2GInZLj+JR40MhwE281SdQ=;
 b=iDcbabbG6J264ZSmgrb9kS26H8HyPXFYfN3etXEK32nxDur1lhBiI1/0uNtg5981Ad
 igN+8oeCXCk3LBm81xSug0Qq/wXD1mLhXHTJnFGc2lYncXS8jXCLgoeyM1V6HmNmkF9w
 t5j9ZVRRXoEmAHvUrfItQdkmOTMgkejwfrxM7lvYPZXkEqFX74Z7DDXS8hBpPs+bZcTX
 UVjCEXtCI2AeBUa+9hGphB7EaAAGYxwxgll578jv8x/L2ZW/CKmgt6GPyabilOu4QuJl
 9GBYgb2q8oeQgPhtrVqz+9aMvUjgY73IDeevgblQ+rO42I/WBz4NYsZacQx6Sn2Hm7y7
 vjtw==
X-Gm-Message-State: APjAAAXAT3EfejVcnHfdWDZdGLawrv1I/1H6IcyMVpJ/PveFACU6nNzX
 +CVQnasD1UjtGv0k8W2waG0Evynd
X-Google-Smtp-Source: APXvYqwPXDmdFgHp1zgf5gBDChS07DejhIJ1U65DogBa+A3MxZFlbcAVRZhhs0OU2ug8RM5SgX5UoQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr17711615wma.46.1561415335517; 
 Mon, 24 Jun 2019 15:28:55 -0700 (PDT)
Received: from x1.local (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id l1sm646781wmg.13.2019.06.24.15.28.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 15:28:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 00:28:41 +0200
Message-Id: <20190624222844.26584-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190624222844.26584-1-f4bug@amsat.org>
References: <20190624222844.26584-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 07/10] hw/mips/gt64xxx_pci: Align the pci0-mem
 size
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One byte is missing, use an aligned size.

    (qemu) info mtree
    memory-region: pci0-mem
      0000000000000000-00000000fffffffe (prio 0, i/o): pci0-mem
                                      ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 815ef0711d..2fa313f498 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/mips/mips.h"
@@ -1201,7 +1202,7 @@ PCIBus *gt64120_register(qemu_irq *pic)
     dev = qdev_create(NULL, TYPE_GT64120_PCI_HOST_BRIDGE);
     d = GT64120_PCI_HOST_BRIDGE(dev);
     phb = PCI_HOST_BRIDGE(dev);
-    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", UINT32_MAX);
+    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
     address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
     phb->bus = pci_register_root_bus(dev, "pci",
                                      gt64120_pci_set_irq, gt64120_pci_map_irq,
-- 
2.19.1


