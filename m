Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9591635D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 14:03:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNyod-0000Pp-5d
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 08:03:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNyll-0007SB-Og
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNylk-0003UK-Jm
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hNylg-0003Mv-SY
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id j187so3566094wmj.1
	for <qemu-devel@nongnu.org>; Tue, 07 May 2019 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kMoTHcm1UDtivn+Jb4RW2U3g3XSUPQ7nsrsWmhvbMsU=;
	b=r/qPJ2mvBwOFOMGcxj7xTubhCYTowIS7Devv6RhXTPX1YT3Vb74Tu+VkgJk2dkQnDZ
	pFqbRPRqGz12pYRXBDJVUIEK7aXaN2ryOFPVQ1Y/BW7TLqq0he+gNzw9YSgnMkhW5pdE
	mdVv9/p7/84AcILl29/DaXBDdZpn4Tqq5SRtAhVPh7m9wdbs9qoPNKfMcOxOjGftlPjJ
	9zG8y6w8pxajuZcFRtwvvmYtLLicCEd1er17TqlqK17KtwJCTGZkNkbTN+SYlmzjsuyI
	yof1CYjzsO7/g+7jbxCxZm7H/pS8V6XKR3V/w0lh7xORiT42mY6AxRvAZdroBSzCaGBN
	Ru2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kMoTHcm1UDtivn+Jb4RW2U3g3XSUPQ7nsrsWmhvbMsU=;
	b=cFG3UZSC+RBc8wH4wQe+Bcgar+lv7uqzEWp0GQ+X3g+OK1MAEPzv3tT7Vyz8tYTk/O
	sLtuRqrcsSDUpdiSi3WG6ALVTRSO6JZhGjIz7P7eJKF02sOz5Oi5/GJHfyJtZUu9uvdV
	1T8wCKfN4MlxZt5dStA9GklRjQ/a5MH7gsgQyHXpNy6ox+Y3BRAWutVH+UivpbcCNSMh
	G/5hzKE1+v8rHKJo5MQn5dSJTq0ucrTAA4JtSaO90ZHOELEKgVCYk0Z5oZ7OGo+hJb/C
	pC3CK5TsWzdd29PotaSRWh+ytvS7jPxsRHJUnI25z6sg6UBcq3rZJNm9qsT3Fi4IP1+Y
	Favg==
X-Gm-Message-State: APjAAAXdtro/huRPiQHhWXCHvqD+606lIQopFeb2y5erAvcyz1HIZiqb
	2UNCDjw+/yVN3sq7tcHrb0uRIO+61OI=
X-Google-Smtp-Source: APXvYqxPSPGb8QV79tsMMrKTDhap2zgY9HfQNhY7u9Mh20/jZZceqrvD7uHD11Niondy7BNBcSuncA==
X-Received: by 2002:a1c:5f42:: with SMTP id t63mr19472384wmb.94.1557230415732; 
	Tue, 07 May 2019 05:00:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id g3sm12348596wmf.9.2019.05.07.05.00.14
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 05:00:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 12:59:57 +0100
Message-Id: <20190507120011.18100-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507120011.18100-1-peter.maydell@linaro.org>
References: <20190507120011.18100-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::329
Subject: [Qemu-devel] [PULL 01/15] pc: Rearrange pc_system_firmware_init()'s
 legacy -drive loop
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

The loop does two things: map legacy -drive to properties, and collect
all the backends for use after the loop.  The next patch will factor
out the former for reuse in hw/arm/virt.c.  To make that easier,
rearrange the loop so it does the first thing first, and the second
thing second.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190416091348.26075-2-armbru@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/pc_sysfw.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c6285407748..75925f5d3f7 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -280,21 +280,19 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
         pflash_drv = drive_get(IF_PFLASH, 0, i);
-        if (!pflash_drv) {
-            continue;
+        if (pflash_drv) {
+            loc_push_none(&loc);
+            qemu_opts_loc_restore(pflash_drv->opts);
+            if (pflash_cfi01_get_blk(pcms->flash[i])) {
+                error_report("clashes with -machine");
+                exit(1);
+            }
+            qdev_prop_set_drive(DEVICE(pcms->flash[i]), "drive",
+                                blk_by_legacy_dinfo(pflash_drv), &error_fatal);
+            loc_pop(&loc);
         }
-        loc_push_none(&loc);
-        qemu_opts_loc_restore(pflash_drv->opts);
-        if (pflash_blk[i]) {
-            error_report("clashes with -machine");
-            exit(1);
-        }
-        pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);
-        qdev_prop_set_drive(DEVICE(pcms->flash[i]),
-                            "drive", pflash_blk[i], &error_fatal);
-        loc_pop(&loc);
+        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
     }
 
     /* Reject gaps */
-- 
2.20.1


