Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EF416C17F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:58:51 +0100 (CET)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZnW-0007KC-N8
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z0A-0003XA-EA
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z09-0003Un-Br
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:50 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40832)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Z09-0003U2-4y
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:49 -0500
Received: by mail-wm1-x330.google.com with SMTP id t14so2884098wmi.5
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sx6gw86N54XNVKLEmPL5JrhmwlCuEFgFKvIZU/MwFMY=;
 b=tRGTGRSmhp7v2jWe8zAd+LkNG6r7RLlRZG+LpOk21Q1PBWn2av9reVGKC3VqQM1xA6
 rIiFQjYzqh+RvK7wpbWyht6d4v1vaRd0ndIXpzzP91EXE6TkAht7QHH9sZp+f9rO2pEg
 JUcqcOZSsc2KK4mH1eieI08FSukpgkTrhrVvGwPn1lAv7I+SVRW2Ko5ZotCs4HnM9xoO
 kOYy3qdOwNs2kslAMWsiEV7LOhYvLOW/Bm3ersG93ZqdkZxkPIkd+6gBo6wQQ+GH8psL
 cqjP3r9fqXrAQCamZ1uh8XPVYkBbkXwSf/VzXuKtS8buvcOivseW7raTFE2UkG0FmuZu
 SMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sx6gw86N54XNVKLEmPL5JrhmwlCuEFgFKvIZU/MwFMY=;
 b=N0cOPLLrbexyLxhdFZPig1Y3QH6AFuJ/pQam3pYF9caqVAfREHcU3CQVshPqvTlAS8
 ulOXfMabWmfgX4Vk9wbMM7GdBbh8MkAZfs/1rLkuc2/e6suTf9NTVavyxxmGZUcdk3n8
 U5ClyUSDOeKme1WRgJa4f4Zqcofqb/3WP6mEi8LJPALBPcXG/8roj7DGd35BvTiH3l1E
 Wie2zdoWeRVa9t+DIRgTrVrGE2MhBLbsrwedj8mocw1bpqcJDftuoeSVfqnXRGULiCHu
 2hvZ2UaL/Xi9lnKkEEgFFm6CaVEVMTi9mVmhu5EgaKADiBJOQj1hXW+bPtD39tBWVB4D
 8MGQ==
X-Gm-Message-State: APjAAAXlFfthxrXjMTrYuMJFAaVcjvKjvacTf6Xpey6bU02C4ze8PEak
 Wza7WTfPH9rf73TV3D/pKxWBkmUX
X-Google-Smtp-Source: APXvYqzDbdvET0xRSI0mtSYCZA+yeaXda6yLqz2ewQ2vK3K6ExawiYyGBlgK/dj/NMRrjcaW/SrFBw==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr4899769wmd.62.1582632467728; 
 Tue, 25 Feb 2020 04:07:47 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id h13sm22709423wrw.54.2020.02.25.04.07.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:07:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 114/136] hw/arm/stm32: Use memory_region_init_rom() with
 read-only regions
Date: Tue, 25 Feb 2020 13:07:12 +0100
Message-Id: <1582632454-16491-12-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The scripts/coccinelle/memory-region-housekeeping.cocci reported:
* TODO [[view:./hw/arm/stm32f205_soc.c::face=ovl-face1::linb=96::colb=4::cole=26][potential use of memory_region_init_rom*() in  ./hw/arm/stm32f205_soc.c::96]]
* TODO [[view:./hw/arm/stm32f405_soc.c::face=ovl-face1::linb=98::colb=4::cole=26][potential use of memory_region_init_rom*() in  ./hw/arm/stm32f405_soc.c::98]]

We can indeed replace the memory_region_init_ram() and
memory_region_set_readonly() calls by memory_region_init_rom().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200224205533.23798-17-philmd@redhat.com>
Supersedes: <20200221173049.18134-1-philmd@redhat.com>
---
 hw/arm/stm32f205_soc.c | 4 +---
 hw/arm/stm32f405_soc.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 627fd44..2de5627 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -93,12 +93,10 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     MemoryRegion *flash = g_new(MemoryRegion, 1);
     MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
 
-    memory_region_init_ram(flash, NULL, "STM32F205.flash", FLASH_SIZE,
+    memory_region_init_rom(flash, NULL, "STM32F205.flash", FLASH_SIZE,
                            &error_fatal);
     memory_region_init_alias(flash_alias, NULL, "STM32F205.flash.alias",
                              flash, 0, FLASH_SIZE);
-
-    memory_region_set_readonly(flash, true);
     memory_region_set_readonly(flash_alias, true);
 
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 9bcad97..b8fca13 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -95,7 +95,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     Error *err = NULL;
     int i;
 
-    memory_region_init_ram(&s->flash, NULL, "STM32F405.flash", FLASH_SIZE,
+    memory_region_init_rom(&s->flash, NULL, "STM32F405.flash", FLASH_SIZE,
                            &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -103,8 +103,6 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     memory_region_init_alias(&s->flash_alias, NULL, "STM32F405.flash.alias",
                              &s->flash, 0, FLASH_SIZE);
-
-    memory_region_set_readonly(&s->flash, true);
     memory_region_set_readonly(&s->flash_alias, true);
 
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
-- 
1.8.3.1



