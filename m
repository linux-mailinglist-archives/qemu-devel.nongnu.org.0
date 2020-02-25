Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69B16C092
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:17:21 +0100 (CET)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Z9M-0002By-29
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Ykh-0000q8-Ab
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Ykd-0007QS-DA
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:51 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:32861)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Ykd-00076u-3K
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id m10so2052491wmc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=orcKET1sDB8nSXJyya4J9R73Mkg/avUceHYxvw2qgmA=;
 b=e8DtIedPelKnEZGPODJNRwNcATXaBCWc1BYly2TpEHazbhX2mwNhUjM0v0SsWq/dSI
 mJs6LShaqemUba939+KXGkK9OlEZOMDCjGGa/ptzCgZUC7D+a0/hFyuxxwqxWvFrLtZi
 VRzAyNrGorRNfSz7Y3F0tHSK/3Peo+W2CCdzSFA8xtJwh9QNQlzJWpMpMYAFgkdBipDY
 E1l+psGEFL4OUqMIvuFEJ/qNlKb4ytckq3+mvwBhulYXdt29+XcOOlIw8Cifqsn8zbrG
 eNRCQX4BsVCkLhIE/2JkTRrQSGbj6sLsZu2zH4MfQguiDo/wwruFOaG+PNp3+NYmcNlm
 ew1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=orcKET1sDB8nSXJyya4J9R73Mkg/avUceHYxvw2qgmA=;
 b=s4RYY3RW86/tObFf7wPbhlLSD+cAj6xFKOu+i38ULelByRno/cJ5YYosYNHKu55XLg
 T9i7GWuJGok48e1RXYsDuV7mxQh8ZK1M4FxNJWWn0lCSgrrvyljKgB4uFxKpwQOFDkVx
 OIZ+wvVNqqhRnJYW8DCrQL8Lh9DAIsFnyZNb5ezjlHHMpFyJDNMIILhTPV8CM1zD51QX
 3dHA2iDXxJEb/LTazK8jyDLZg4BcrFUEvfj27FbRg70PoACCcIVCJsnT9cL+0iycu+YJ
 dxUusKtqWEK1k8HQlb+qEOKAIlqf/2wGdgCjySeeqW3juyoxhOrTax16V5fDIFzLL9MU
 WXyQ==
X-Gm-Message-State: APjAAAXpjBt9f7JWv536ZDyYXARPZgdMzIDxOCd2O46JArSseRyG6cSE
 E2dKmEIud7prJxhRi1YasPIkxjgU
X-Google-Smtp-Source: APXvYqy9mGaT5f0Jg3QpFyibxdtcgxe6wtpwtmVYXR1RpyPrtsj04WB5ZWH5HSslZNpdC20gpuCtIA==
X-Received: by 2002:a7b:c088:: with SMTP id r8mr4988463wmh.18.1582631503817;
 Tue, 25 Feb 2020 03:51:43 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b67sm3922326wmc.38.2020.02.25.03.51.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:51:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 040/136] cris/axis_dev88: use memdev for RAM
Date: Tue, 25 Feb 2020 12:49:30 +0100
Message-Id: <1582631466-13880-40-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200219160953.13771-41-imammedo@redhat.com>
---
 hw/cris/axis_dev88.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index be77604..cf6790f 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -249,7 +249,6 @@ static struct cris_load_info li;
 static
 void axisdev88_init(MachineState *machine)
 {
-    ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     CRISCPU *cpu;
@@ -261,16 +260,12 @@ void axisdev88_init(MachineState *machine)
     struct etraxfs_dma_client *dma_eth;
     int i;
     MemoryRegion *address_space_mem = get_system_memory();
-    MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
     MemoryRegion *phys_intmem = g_new(MemoryRegion, 1);
 
     /* init CPUs */
     cpu = CRIS_CPU(cpu_create(machine->cpu_type));
 
-    /* allocate RAM */
-    memory_region_allocate_system_memory(phys_ram, NULL, "axisdev88.ram",
-                                         ram_size);
-    memory_region_add_subregion(address_space_mem, 0x40000000, phys_ram);
+    memory_region_add_subregion(address_space_mem, 0x40000000, machine->ram);
 
     /* The ETRAX-FS has 128Kb on chip ram, the docs refer to it as the 
        internal memory.  */
@@ -351,6 +346,7 @@ static void axisdev88_machine_init(MachineClass *mc)
     mc->init = axisdev88_init;
     mc->is_default = 1;
     mc->default_cpu_type = CRIS_CPU_TYPE_NAME("crisv32");
+    mc->default_ram_id = "axisdev88.ram";
 }
 
 DEFINE_MACHINE("axis-dev88", axisdev88_machine_init)
-- 
1.8.3.1



