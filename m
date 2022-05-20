Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73352F1FE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:04:33 +0200 (CEST)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6zD-0006nO-OM
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wU-0003n7-Jg; Fri, 20 May 2022 14:01:38 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wT-0004F1-2H; Fri, 20 May 2022 14:01:38 -0400
Received: by mail-ed1-x534.google.com with SMTP id j28so11687756eda.13;
 Fri, 20 May 2022 11:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2cwM4uPgDq+G3YSHb7SuW/x1hOJyj11CFWN9orv9ojo=;
 b=JYqMfbjPXAkcNPm4/8PSLnpOSBy8MmAfN3VKcqjR5XHMpmLvHDtSy1RJ6TqHWaq04x
 H1eOw4yDROh3Cn9kED8TEZz0YyBx41AERv0PmfjwrY1BgT3TL0xjWFo0w4f6svqg4pD+
 8Wxd4qNdePqaK/CNDYFddxo24bZtaHGndG9UUIoeMajb3j+1rKK1MFQNf+mOuXE8NIUT
 0vUZrYQmkZnAwgKreRMFNDdAK1DpYs+sthH22A9pr9mEn18HCLhF1DFwqbreT3ccV5tz
 KTZbSKP3s5zwpGp/Hyb7Q38Oh7PnvwHUsEXs1B6chuKIodVci5axItvUND1O+vMw18tS
 J9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2cwM4uPgDq+G3YSHb7SuW/x1hOJyj11CFWN9orv9ojo=;
 b=AUPSjSuKg9UAXu+bd9Jbfp+aTUUGRUFpqLm0VEIoUZQVsI7kWfBhAtpOrZvfryEGyK
 vmj8jE/6EhK+QI2LXtsC4N5xjUmwtjKLjEhcoFMUfcIBN+5hcfW58XPCf8l1YkwarhJq
 haYQCrS8O2tGG6tv799Ir05/EO0hr+K5w3i+/Dv4pctOF8nuVRdmbg9u+vS+/MjLY1mo
 Ss+ySSZkgOC99pEFijxssdtfJghC/BuKN+NOlckdCJ837rZm0zI177aXycBM7cKlAJ9/
 3EwyFLwPMBeBFjgRS0s1LNbJbED3ApHGR1Y035V25SkFfXYPHxt/uopm4t0Medd70f9R
 c0Hw==
X-Gm-Message-State: AOAM533tQQCRmYxnhSK+7BBEmMfNnXGZVmQ2NhaC9HHDvhCgtc25n5c/
 ShhSQHX1YkA4okqWKfkEE6pEk+fPaKc=
X-Google-Smtp-Source: ABdhPJySAKCLyPq2oS2QLoQ+nabDhi0i6flR9LBG27rD9ZXDeN1y0BnnQEjLVwrXONJ4qPjCKBeZZw==
X-Received: by 2002:aa7:dd07:0:b0:42a:eeba:a0a8 with SMTP id
 i7-20020aa7dd07000000b0042aeebaa0a8mr12225593edv.371.1653069695243; 
 Fri, 20 May 2022 11:01:35 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v2 01/10] hw: Reuse TYPE_I8042 define
Date: Fri, 20 May 2022 20:01:00 +0200
Message-Id: <20220520180109.8224-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

TYPE_I8042 is exported, so reuse it for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc.c       | 4 ++--
 hw/sparc64/sun4u.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7c39c91335..c914ac0154 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1088,7 +1088,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
         return;
     }
 
-    i8042 = isa_create_simple(isa_bus, "i8042");
+    i8042 = isa_create_simple(isa_bus, TYPE_I8042);
     if (!no_vmport) {
         isa_create_simple(isa_bus, TYPE_VMPORT);
         vmmouse = isa_try_new("vmmouse");
@@ -1096,7 +1096,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
         vmmouse = NULL;
     }
     if (vmmouse) {
-        object_property_set_link(OBJECT(vmmouse), "i8042", OBJECT(i8042),
+        object_property_set_link(OBJECT(vmmouse), TYPE_I8042, OBJECT(i8042),
                                  &error_abort);
         isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
     }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index d1bc77d27e..0e27715ac4 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -334,7 +334,7 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     parallel_hds_isa_init(s->isa_bus, MAX_PARALLEL_PORTS);
 
     /* Keyboard */
-    isa_create_simple(s->isa_bus, "i8042");
+    isa_create_simple(s->isa_bus, TYPE_I8042);
 
     /* Floppy */
     for (i = 0; i < MAX_FD; i++) {
-- 
2.36.1


