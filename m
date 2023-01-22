Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C871B6770ED
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:08:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdop-00023T-ML; Sun, 22 Jan 2023 12:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdon-00022o-Oc
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:45 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdom-0005TU-6U
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:45 -0500
Received: by mail-ej1-x631.google.com with SMTP id hw16so25048211ejc.10
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kuM8mwAgpa0Pup/G43XnuFRa7bBjpEX8hFtFhv41d40=;
 b=QssRFAGvcBSMUqxTHjamJfOB1vbt3GaJgq1VYHnoFMgEz2LqyWldp0RTEcWhPHSMqF
 bBBlPXAZVnDC55ITAOSXsx7Qfe0rNwC1PjOYdjuPTulKevZoU+iLt7sBLJlJGkgoD/8o
 KrWh7qfPyJ2Yw7TfRLoU41pykAJrTJGWgpC7pKqQxDXxI/d71PqdTn7zw67VP4LK1uCV
 asa5eYia1LC4SwqYTaqmHMEYpD5Yx83tjTA6HMPuYbqM9Ftb748VFjUTmukxLwsGZEjg
 RD6pedR8XRj5yU/fgQarzeFAvs0PQgOdaZeQMzz1IPrZtw7bkHmDzL5kLLeOe87xBivz
 z+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuM8mwAgpa0Pup/G43XnuFRa7bBjpEX8hFtFhv41d40=;
 b=7cW42W/F9t5qDBmRhQeOfNVpn5X17sTpnKrSeyc71hd//5YMZUve/u0H4eARbfDB/6
 CdoIDD9Qiym7KcmM1WZJsHFUe4HlNyXXLSIW5c4HRXqg4CZJrokoy1BbgEmCsLRSsM8w
 MT40Krs7nba5ytO9TJokHjHt0vloLB7CGfDiEh5bAvKAq3eFhswYx5/4qafPvo0XA6nP
 OxomEuYowG62K3bO76xvPcUnTLlzTKACEtQMWX0DIrB1HjPt11SbUa1ZtJn16MJg/jiI
 Zq1UdXJdXDz48q8etqF614vSYFCbGdnfUoFuCOtp//Hn3spHJws0VJ+Pt1vqwz3G/S8Z
 XUXA==
X-Gm-Message-State: AFqh2kq0FbLmX84BRjy8z5/iv6G5Go9M9gSlSTsJG8wH6ZzzzcM3LIHH
 iFYIVLMSSR6pyAHHFFVQikfd0LAJ39dvEw==
X-Google-Smtp-Source: AMrXdXsHm8eIyklvLGeaBKzdbz3xSOQNRARUKgIXhcEngNre2A1QGww7TSAtZx36HCTLUuqnXnTWyA==
X-Received: by 2002:a17:906:52d0:b0:870:5496:26c0 with SMTP id
 w16-20020a17090652d000b00870549626c0mr22514977ejn.34.1674407262391; 
 Sun, 22 Jan 2023 09:07:42 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:41 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/7] hw/acpi/{ich9,
 piix4}: Reuse existing attributes for QOM properties
Date: Sun, 22 Jan 2023 18:07:18 +0100
Message-Id: <20230122170724.21868-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The QOM properties are accessed after the device models have been
realized. This means that the constants are redundant. Remove them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/ich9.c  |  5 ++---
 hw/acpi/piix4.c | 10 ++++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index a93c470e9d..2050af67b9 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -433,7 +433,6 @@ static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
 
 void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
 {
-    static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
     pm->acpi_memory_hotplug.is_enabled = true;
     pm->cpu_hotplug_legacy = true;
     pm->disable_s3 = 0;
@@ -448,8 +447,8 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add(obj, ACPI_PM_PROP_GPE0_BLK, "uint32",
                         ich9_pm_get_gpe0_blk,
                         NULL, NULL, pm);
-    object_property_add_uint32_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
-                                   &gpe0_len, OBJ_PROP_FLAG_READ);
+    object_property_add_uint8_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
+                                  &pm->acpi_regs.gpe.len, OBJ_PROP_FLAG_READ);
     object_property_add_bool(obj, "memory-hotplug-support",
                              ich9_pm_get_memory_hotplug_support,
                              ich9_pm_set_memory_hotplug_support);
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0a81f1ad93..370b34eacf 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -421,18 +421,16 @@ static void piix4_pm_add_properties(PIIX4PMState *s)
 {
     static const uint8_t acpi_enable_cmd = ACPI_ENABLE;
     static const uint8_t acpi_disable_cmd = ACPI_DISABLE;
-    static const uint32_t gpe0_blk = GPE_BASE;
-    static const uint32_t gpe0_blk_len = GPE_LEN;
     static const uint16_t sci_int = 9;
 
     object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_ENABLE_CMD,
                                   &acpi_enable_cmd, OBJ_PROP_FLAG_READ);
     object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_DISABLE_CMD,
                                   &acpi_disable_cmd, OBJ_PROP_FLAG_READ);
-    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
-                                  &gpe0_blk, OBJ_PROP_FLAG_READ);
-    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
-                                  &gpe0_blk_len, OBJ_PROP_FLAG_READ);
+    object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
+                                   &s->io_gpe.addr, OBJ_PROP_FLAG_READ);
+    object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
+                                  &s->ar.gpe.len, OBJ_PROP_FLAG_READ);
     object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
                                   &sci_int, OBJ_PROP_FLAG_READ);
     object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
-- 
2.39.1


