Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8BA547443
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:34:59 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzOM-0001dy-Bz
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTp-0006Mf-7W
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:33 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTn-0006mS-IY
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:32 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o8so1500251wro.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3Frjb+iZeP6AJlq/dppPnZOms0aAvuMgoxoQExC85M=;
 b=m20ruo3F2IOOtkLNtyz9Z65BKHbfypTAAB5jSV/Tk36pPgmnnft9FWrXhMKv4Ut2OF
 bYocOO5ZLGhdqa6ZzZ9KS1nP6Ojis5/nRCHEpoQzj7OakVVYmo6cY/33CA114C1o0aNS
 RD+BTPVnEdxdzYF14M0GNrAZ4TKxB5y9Bj2h71Y6WVLR1/q5sLdilBmbMr8D/Lf1XrkM
 XVIHwppynmaQ8DIRoPQ3AG0wJMrlnmU8W+jnWU0aEkT18GYdZdVXC4KQNiEWAQXcveKz
 /piPbPk27/sFArUTkdwqQQ3NBj6IIY6wGioMlXr+X1S4bM6p9Qz0WezfP85OerPcfL+g
 Pyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3Frjb+iZeP6AJlq/dppPnZOms0aAvuMgoxoQExC85M=;
 b=waQiuEejarP5918IoBRKJN39YUM6Zf5fEwwdPTvy/knv1SJ4Q5bBRzOR8AGQEdkdGV
 rhdk3o6jL89FPFgvLI+EhX8OgICR6QEwhoPXJcIKpfqaqwXfcIQ9dPwdOo/C/AU9rTBF
 wOOCEewSRFjTrN8nqdvk0QYLdbUbtEwS/rvrjY1/6PCUfZr7vXASP93ni0dmysj3iEfg
 7lZLCXm6AQoJ3uT9xrKfFKtqnYYlHIIS4YVjwWDCrK2fT9qCBsSt/WSQtO/rMCRE2c+D
 mWyUAwm6EH3cqcJ4hjAvmKx8zZnzJgyYwzg5TNPgyoKvsssWz5nRgfji/QsvOfCVmsZR
 lkZQ==
X-Gm-Message-State: AOAM530Ptq13A+MTGN62V7X/+tUYfZoQJTOI2olhC7LsCPzQBEQDz/Ed
 rKJG9tW5XMFeOehJJN9UF5w4zmwQDyY=
X-Google-Smtp-Source: ABdhPJziEwbUPWcllCFs2ULPxl0lF+oOE3dh+XRW/+ZqmBRZYke4n1JDFnSzKL8J3aHqB/q4+K3jQQ==
X-Received: by 2002:a5d:5002:0:b0:212:dab6:fce9 with SMTP id
 e2-20020a5d5002000000b00212dab6fce9mr47145494wrt.63.1654943790030; 
 Sat, 11 Jun 2022 03:36:30 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 d9-20020a5d6449000000b002101ed6e70fsm2194403wrw.37.2022.06.11.03.36.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 38/49] hw/i386/microvm-dt: Force explicit failure if retrieving
 QOM property fails
Date: Sat, 11 Jun 2022 12:33:01 +0200
Message-Id: <20220611103312.67773-39-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

New code will be added where this is best practice. So update existing code
as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220529184006.10712-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/microvm-dt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 9c3c4995b4..fde74819f2 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -32,6 +32,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qapi/error.h"
 #include "sysemu/device_tree.h"
 #include "hw/char/serial.h"
 #include "hw/i386/fw_cfg.h"
@@ -187,8 +188,8 @@ static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
 static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "ns16550";
-    uint32_t irq = object_property_get_int(OBJECT(dev), "irq", NULL);
-    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", NULL);
+    uint32_t irq = object_property_get_int(OBJECT(dev), "irq", &error_fatal);
+    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", &error_fatal);
     hwaddr size = 8;
     char *nodename;
 
-- 
2.36.1


