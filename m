Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED67333219
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:54:43 +0100 (CET)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmBW-0001MK-TP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm85-0004Jb-E2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm82-00013c-L4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGRRsOLRCmAO6MPW4R+6g0l5+eOKsAVF/J3+u7++AVw=;
 b=AXM9O5i6WYgBma+vjapPq8NU9nzJ+vibOu3f6+p8cjGfwIqqfsJXxp4CZTEVYxmTZF2VmC
 LkdWpLQCKD7OFKoBvG5+3R4nfEKCFcpW0b34kGEGWmkV56KGx1lGFQLqToDDdRdqP9LPaw
 8JBawk5jz8PYBmJD0UzWmrYUiER05/I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-kmkvqo2hP9S2F_hblQfOpQ-1; Tue, 09 Mar 2021 18:51:04 -0500
X-MC-Unique: kmkvqo2hP9S2F_hblQfOpQ-1
Received: by mail-ej1-f70.google.com with SMTP id li22so1886575ejb.18
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGRRsOLRCmAO6MPW4R+6g0l5+eOKsAVF/J3+u7++AVw=;
 b=jwHDTNznQlqNkoJ55t7+1nhwnjwZvuq6NB8JVblgRhcanlchZckfEv6xWTmTHvjG+o
 FnVT8SeIgEu09BE+wJ8cSlmRXhbEpzfzczHfJPjCkqnKgYN6PxlaH6S7j9ZdmH9U96TE
 v/JJ/f3Qo4a756mpe44hzS0zgGdpr9e+jF7ai38k8T1MRjdBbQNZXZE5AdI8Z6NpV14y
 IXujuEamK8QLQ/xiGKla+YICUxQ29LfyB2KBLfV/KkpT6ZCZig+iXxu8PutJMRYbv/FS
 /ENYIrnAK7ssdaLqa00yMGYAH/8fE/kjicpcI3U+tw+OtjWxzpwbyuOVKxtZCYiWbNkX
 oSUw==
X-Gm-Message-State: AOAM5329mfaQLapwfF65fpqQNoe8AdW88W8sq9BEv04xtI8+J3gK6XOd
 lIV4CEXUj9fyLBb7kVi+b10iysx7W3lk6TafiYuvnIpJQ5J1t4X/fmwabYWezGlnNvoXe+Rxfua
 6wvq8PGHZKiF7avx2tUCSbZQr/Y9JEAYK3kEGADjOVbpqkq0dNyk6Xj6o2LoM0NrJ
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr158742edv.237.1615333863064; 
 Tue, 09 Mar 2021 15:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylulpEb+WQWYL+ljXX3rf1bXPR7tOqr8HukAvLjRCBMcJHLdOxNl6LuIhp3AggFgD16hyFiQ==
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr158724edv.237.1615333862826; 
 Tue, 09 Mar 2021 15:51:02 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j1sm9011964ejt.18.2021.03.09.15.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:51:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/block/pflash_cfi02: Rename register_memory(true) as
 mode_read_array
Date: Wed, 10 Mar 2021 00:50:25 +0100
Message-Id: <20210309235028.912078-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309235028.912078-1-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same pattern is used when setting the flash in READ_ARRAY mode:
- Set the state machine command to READ_ARRAY
- Reset the write_cycle counter
- Reset the memory region in ROMD

Refactor the current code by extracting this pattern.
It is used three times:

- When the timer expires and not in bypass mode

- On a read access (on invalid command).

- When the device is initialized. Here the ROMD mode is hidden
  by the memory_region_init_rom_device() call.

pflash_register_memory(rom_mode=true) already sets the ROM device
in "read array" mode (from I/O device to ROM one). Explicit that
by renaming the function as pflash_mode_read_array(), adding
a trace event and resetting wcycle.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 18 +++++++++---------
 hw/block/trace-events   |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 4efbae2f0c9..2ba77a0171b 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -184,10 +184,13 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
     pfl->rom_mode = true;
 }
 
-static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
+static void pflash_mode_read_array(PFlashCFI02 *pfl)
 {
-    memory_region_rom_device_set_romd(&pfl->orig_mem, rom_mode);
-    pfl->rom_mode = rom_mode;
+    trace_pflash_mode_read_array();
+    pfl->cmd = 0x00;
+    pfl->wcycle = 0;
+    pfl->rom_mode = true;
+    memory_region_rom_device_set_romd(&pfl->orig_mem, true);
 }
 
 static size_t pflash_regions_count(PFlashCFI02 *pfl)
@@ -249,11 +252,10 @@ static void pflash_timer(void *opaque)
     toggle_dq7(pfl);
     if (pfl->bypass) {
         pfl->wcycle = 2;
+        pfl->cmd = 0;
     } else {
-        pflash_register_memory(pfl, 1);
-        pfl->wcycle = 0;
+        pflash_mode_read_array(pfl);
     }
-    pfl->cmd = 0;
 }
 
 /*
@@ -315,7 +317,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
     if (!pfl->rom_mode && pfl->wcycle == 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
-        pflash_register_memory(pfl, 1);
+        pflash_mode_read_array(pfl);
     }
     offset &= pfl->chip_len - 1;
     boff = offset & 0xFF;
@@ -933,8 +935,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
-    pfl->wcycle = 0;
-    pfl->cmd = 0;
     pfl->status = 0;
 
     pflash_cfi02_fill_cfi_table(pfl, nb_regions);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index d32475c3989..f16d6e90cfd 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -7,6 +7,7 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 # pflash_cfi01.c
 # pflash_cfi02.c
 pflash_reset(void) "reset"
+pflash_mode_read_array(void) "mode: read array"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
 pflash_io_read(uint64_t offset, unsigned size, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x cmd:0x%02x wcycle:%u"
 pflash_io_write(uint64_t offset, unsigned size, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
-- 
2.26.2


