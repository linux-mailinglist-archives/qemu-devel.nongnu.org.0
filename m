Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC916C0D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:30:21 +0100 (CET)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZLw-0002yw-3X
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:30:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z0N-0003o2-R5
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z0M-0003dC-Nv
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:08:03 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46341)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Z0M-0003cY-FV
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:08:02 -0500
Received: by mail-wr1-x432.google.com with SMTP id j7so1907813wrp.13
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l/9/y1Knrb83VzdnWxvw9Mf1qvHaX+Xp+yQrIHClHg0=;
 b=kMN5IePzrVVBbIgsgwZjY4m+UQF6Iuar5KvF11ImgNQCP+OYyLytazYmpDaF4au6Gt
 OiZ+Lqz7iB2cDPRKQc0KZE4SRIAbm5Wqj2anOlpOTjVJEM7OcRCSgnQQP5nXx5DvcjmH
 kkXTT6fRY0xFPmq3zsKg5TwnXhVL74hjclELQmsPC3uAMZQ13eEbzXw17WaqedGg/5fj
 J+u/VmX4Xmu9oMYDX2/35OjWCp4VyoiDw3d5GSixUvWDuoJRyPx50kcLq6TBVc9A2Xwm
 SfAmLqO2esVOVKErKsHDE4cqEcDW926M6wuM8dJL52azhoooGBKqbxjgcLy2NB2ALvaM
 tiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l/9/y1Knrb83VzdnWxvw9Mf1qvHaX+Xp+yQrIHClHg0=;
 b=L/bgCBgHRJOtxFJTIsXB1UP/lyI+JLw0CHjipumMqWxkuXKONIJJ3voA/jr6Mth1jw
 MHXSxpO1jYT5RJHHvtEHGgPm+HVtjjSw3RkIoF6hVSqO074qlwGNPa7MOBVVEBoSzjgg
 nt00y7g/umLitl3VW6BuLGdqUED5wECZI8iaGGN/gDPRxRUsPrZHUxeJm76z1IzPR9+6
 sd0ZhVvQZII6IV6XGbu59xJ26woQqxq+yWB3YKZRTnIkCBtXShO23bR+U/P9Og1RbuoY
 wsClxSMdGLXmmOdUa6fKVvZi26b8mAbzM7GJpiYbn50HJszJ8awFS6Wapnh10LB/tcLz
 xxuw==
X-Gm-Message-State: APjAAAUEfuLnevf2X0rJBb5eYSGislOcX9ul9BbrUJTpKsO7uXkLQkZY
 A5jbH2bGB2+83NQPxv9MA6I+6sHO
X-Google-Smtp-Source: APXvYqxHZs5YFJ/zgdpXatTJHEoZb4exn/F6XEAXLPorjqKSS1xHZqd8LYLlywe25qv01/htg9Geeg==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr74001095wrs.237.1582632481186; 
 Tue, 25 Feb 2020 04:08:01 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id h13sm22709423wrw.54.2020.02.25.04.08.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:08:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 128/136] hw/input/milkymist-softusb: Let devices own the
 MemoryRegion they create
Date: Tue, 25 Feb 2020 13:07:26 +0100
Message-Id: <1582632454-16491-26-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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

Avoid orphan memory regions being added in the /unattached QOM
container.

Note this change break the migration of the LM32 milkymist machine.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200224205533.23798-31-philmd@redhat.com>
Supersedes: <20200221173049.18134-1-philmd@redhat.com>
---
 hw/input/milkymist-softusb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 7deeb12..72bc7ba 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -259,13 +259,11 @@ static void milkymist_softusb_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->regs_region);
 
     /* register pmem and dmem */
-    memory_region_init_ram_nomigrate(&s->pmem, OBJECT(s), "milkymist-softusb.pmem",
+    memory_region_init_ram(&s->pmem, OBJECT(s), "milkymist-softusb.pmem",
                            s->pmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->pmem);
     sysbus_init_mmio(sbd, &s->pmem);
-    memory_region_init_ram_nomigrate(&s->dmem, OBJECT(s), "milkymist-softusb.dmem",
+    memory_region_init_ram(&s->dmem, OBJECT(s), "milkymist-softusb.dmem",
                            s->dmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->dmem);
     s->dmem_ptr = memory_region_get_ram_ptr(&s->dmem);
     sysbus_init_mmio(sbd, &s->dmem);
 
@@ -275,8 +273,8 @@ static void milkymist_softusb_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_milkymist_softusb = {
     .name = "milkymist-softusb",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, MilkymistSoftUsbState, R_MAX),
         VMSTATE_HID_KEYBOARD_DEVICE(hid_kbd, MilkymistSoftUsbState),
-- 
1.8.3.1



