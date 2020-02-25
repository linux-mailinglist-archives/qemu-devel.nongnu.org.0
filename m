Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3818416C0B0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:23:46 +0100 (CET)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZFZ-0006Ui-7D
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Yko-0000vI-H7
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Ykh-0007wZ-Py
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:56 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Ykh-0007pg-G5
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:51 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m16so14332067wrx.11
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Az21PqxcFj5PLmHVscAimd//RXYfOGb+OM1gvJEZv5A=;
 b=kbL7zgj3T27BQ1MOVLNHYVEtNY/KeXgEIuNMyTxEowEkH8u742x8k51l/vRVqdCK8c
 uCwz60o18Udgwwzn5e2FRs45UMAeWrOYhHEUIbsQ1IjVg9gVBKWWMSt413a8poSHiJ+t
 Ncax4wHtgLYMnGyCsN76CYZl0Wr6IFsONag0gvjdYMYKDE4XgzGZVdmXWgj0wzP/4Uxo
 3dIPLc0DsiDeAH0L2+ncs1hjdX7T1wXB96mbAowiz8GvQbt1sHKWYospvWvq1W8Tz8LG
 ZWWTdIKz4ub8EHP4mAhxm1XMMsTywKr738XIo7ZdxicpTb5Hch2rRCowSADZdH+hGpYR
 OjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Az21PqxcFj5PLmHVscAimd//RXYfOGb+OM1gvJEZv5A=;
 b=t0XwBSoRrTcPCOXy0agD9r4Y9jEtK+O/md7HvthL1YuwUB1R3famhrq3VJrWblGE4p
 wCVRwWXfOq+qTZTEmC8YzyMlvOIa0xL4R78KEPE3kEFEQNykjG7AGMK1eufDg4zuZd3J
 /RWpca1Y90vFwLueCUJ6iVTsG9T0ymXSWkCn5leDhOuqitRpqXY6i0AIb6pJZrQsFRVG
 H1S+xMW6m9F4OR7oya7Rzmx30Vmma78s9mwzHts81kDc/6P7OYhD1FFWHZDGSHuAjbse
 tM2USKUTGVgXf8+/J1Wrh4K6WWEDn/49JkmnFxi/YHvkTaxHCscS02+YecXyGHen2dJL
 7EwQ==
X-Gm-Message-State: APjAAAVFupgCQ8oq1Bsob9Ln7jZaNu2Wmk1CkBUtWjwzMHkK1bb65CNk
 y2Kgbd3M5mDwdVgUrhOUaXVzzCto
X-Google-Smtp-Source: APXvYqwUjGsPZW2wjNUXNlJL/o8DcU9F4Rhm66rXgP75wveZ81iMlAizCiD4RjrNsDh6Ko/NgoOO3A==
X-Received: by 2002:adf:e546:: with SMTP id z6mr647241wrm.423.1582631510334;
 Tue, 25 Feb 2020 03:51:50 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b67sm3922326wmc.38.2020.02.25.03.51.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:51:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 047/136] m68k/q800: use memdev for RAM
Date: Tue, 25 Feb 2020 12:49:37 +0100
Message-Id: <1582631466-13880-47-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Switch to using generic main RAM allocation. To do this set
MachineClass::default_ram_id to m68k_mac.ram and use
MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200219160953.13771-48-imammedo@redhat.com>
---
 hw/m68k/q800.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1e32363..a4c4bc1 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -160,7 +160,6 @@ static void q800_init(MachineState *machine)
     ram_addr_t initrd_base;
     int32_t initrd_size;
     MemoryRegion *rom;
-    MemoryRegion *ram;
     MemoryRegion *io;
     const int io_slice_nb = (IO_SIZE / IO_SLICE) - 1;
     int i;
@@ -194,9 +193,7 @@ static void q800_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, cpu);
 
     /* RAM */
-    ram = g_malloc(sizeof(*ram));
-    memory_region_init_ram(ram, NULL, "m68k_mac.ram", ram_size, &error_abort);
-    memory_region_add_subregion(get_system_memory(), 0, ram);
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
     /*
      * Memory from IO_BASE to IO_BASE + IO_SLICE is repeated
@@ -443,6 +440,7 @@ static void q800_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1;
     mc->is_default = 0;
     mc->block_default_type = IF_SCSI;
+    mc->default_ram_id = "m68k_mac.ram";
 }
 
 static const TypeInfo q800_machine_typeinfo = {
-- 
1.8.3.1



