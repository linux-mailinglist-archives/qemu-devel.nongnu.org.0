Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5AF134A54
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 19:17:35 +0100 (CET)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipFte-0002dz-UV
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 13:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ipFqh-0007rf-Rn
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 13:14:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ipFqg-0000iV-Us
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 13:14:31 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34277)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ipFqg-0000ht-Of
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 13:14:30 -0500
Received: by mail-wr1-x442.google.com with SMTP id t2so4482902wrr.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 10:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2Tg6RArKJzvW5SKrSp0DhhlfAmjIjBGMeoq3WBnASo=;
 b=L+4AsO7uMVQQREXVcFhnoinweGpKQ7NZ+XlcsHULvpr77OaFD4/32aZa9dY7ee7tuQ
 XhJybgi9vcPqD/1vEEwryigEYNlwUj8QQRGFzWEq4UvNLACBq1vbDDLno+yL+6CXWhl9
 X+3aiv9MqkdH41xhr2mlDYDMkXUxvfQfp5ifoG57h/ffcrT3/6As+RXuaXUm1rvo7fVB
 orTc4pJLYRssdVq4E3AwVjCdEmN7UVYuqYnl3wvj0vlHiJDhPRoLRT9VtUkxvpinlvmo
 vOE9XhFsC4MjIRisEs9h+siAoQpQ3fdXJD2sJPQwC9neg23Ae3q1mV7C3GWMVnlQvbOO
 smvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y2Tg6RArKJzvW5SKrSp0DhhlfAmjIjBGMeoq3WBnASo=;
 b=f+Ak6v/RmWxuKRei85Em9iGuKAwRakCpnYLhtHUtob5H6eDSgwBYQ1LO+rkOdZM/xP
 JjRdRvVNY+OzOxcU4a6VN4sDnm2KVaIw2HVjA1mbtnQT2m7wZQiPkOKAuDpKfZ6kqoqU
 BF1M75w5DuqnDi/468ap5nWp1WNQRrAkb+cp/6jo/ScLKGG3LsLVxJxdsyVi7vwp9Ptf
 MUFIt4FkK27zbjSliF63c9XTRW7GEdmkXNLk2luMn12uylud6S5kJXLA2TkxwqcRZd7f
 thvfcQtOHBGOGNcAt3MiJHRtmqAEXfqjUsLaOgWd+sM3VWxSRmA583ABr1HvtnmN72hE
 JPFw==
X-Gm-Message-State: APjAAAXF+f3Vr1ayhvykM2Jr8n7aiSk+Jd/Hnl5/uH9YWMCGSL3tSnEu
 gIlw5OZQQ868MhtRtN3wpOI=
X-Google-Smtp-Source: APXvYqzih1S0+U1RwZyXikRP2XIG4hl2hltAMAZDoM1DYlAspi84x4qcUnp3CxAeBsn4KryOH4a+Jg==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr6093125wrm.284.1578507269853; 
 Wed, 08 Jan 2020 10:14:29 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id l19sm2908653wmj.12.2020.01.08.10.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 10:14:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Igor Mammedov <imammedo@redhat.com>, Helge Deller <deller@gmx.de>,
 qemu-devel@nongnu.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/3] hw/hppa/machine: Correctly check the firmware is in PDC
 range
Date: Wed,  8 Jan 2020 19:14:23 +0100
Message-Id: <20200108181425.21485-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200108181425.21485-1-f4bug@amsat.org>
References: <20200108181425.21485-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The firmware has to reside in the PDC range. If the Elf file
expects to load it below FIRMWARE_START, it is incorrect,
regardless the RAM size.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Note we define FIRMWARE_END=0xf0800000 but in the specs
the PDC ends at 0xf1000000.
---
 hw/hppa/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 5d0de26140..6775d879f8 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -155,7 +155,7 @@ static void machine_hppa_init(MachineState *machine)
     qemu_log_mask(CPU_LOG_PAGE, "Firmware loaded at 0x%08" PRIx64
                   "-0x%08" PRIx64 ", entry at 0x%08" PRIx64 ".\n",
                   firmware_low, firmware_high, firmware_entry);
-    if (firmware_low < ram_size || firmware_high >= FIRMWARE_END) {
+    if (firmware_low < FIRMWARE_START || firmware_high >= FIRMWARE_END) {
         error_report("Firmware overlaps with memory or IO space");
         exit(1);
     }
-- 
2.21.1


