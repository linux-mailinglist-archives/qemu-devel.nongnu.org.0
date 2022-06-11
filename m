Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47153547442
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:33:31 +0200 (CEST)
Received: from localhost ([::1]:53118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzMw-0008Sh-B9
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUE-00072J-Pf
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUD-0006pS-9j
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c21so1514293wrb.1
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jy+8G+yK6GF20IWR2ufr/1kZUbW/onYslHSoLcVKEqw=;
 b=M0hR9SdHIlOfsIss52exNtNS3ilJle5rFi8b/JEtoi0UBy3dn1fpNvHPIllugElDEt
 OWgudrTf3j3xPqMaseziYn/ZvYRDhCinV65fdBLdJ0Z3uesaGq75Z+P+96TVUWvmA3WZ
 Zec3wodzlSUauc+IISgTBpRtkRf+tsd4HceizmmBzXswtBu+kAx/c9+T+o9YsQXMieLF
 DiiF44TkbdE+iKnikycC/KlqlSksEX5WoJJfLk+DVaPdEIQiQ0CH3IitslM6PqnrZHAY
 w4IFw9cu5QlLfl4n073nCe8lW3Cy1bXot+VwZJLG9WYMVqz2585UKO/ouE86yXb+TzTG
 Y47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jy+8G+yK6GF20IWR2ufr/1kZUbW/onYslHSoLcVKEqw=;
 b=mjSy6zOGo1TihEozaV/i2qXH6y68JkHfFzuYCU+yAHiqOomeFflCkgd1/JBoqvMonB
 bg3gYeFSH+fH4Gg3iltu5naAgAQd9M+mjJesZl/LdYo4lb09g0bWT260LXDJ5sewMDMY
 usfaMpQeJyWgnxvr7aGH6ODaYDLkwqnfqexD7/V6ftg61hHPmgBS6glv/OubLZBTmEXh
 uHpHzkzaWgjXbn3ekLINA3sgBd5HXUDjmTXCEH4KNOcHlnS7yqA0/snKIliaKgmoOCVM
 eB8VjPHpFTpXwA3asijb0/fOdQRJQhBMN2zBCYPX4qmWNTwEwYvVBmJHE1cUIZZ1ABVh
 dbfQ==
X-Gm-Message-State: AOAM530XoW5l0XC0MKfkSF8zIhG0iO/AjbTGjoJTHej1WNXjYibuf4ys
 ZuxwF3/4kf69/NzMJgJqmdhIkDGjDqg=
X-Google-Smtp-Source: ABdhPJz2Y5HxCroS/IcQjFZ3WVyF4TmEBa6TlmGiNYDbLhSdpjwl4Jxz8/CPDXpuMK6R+Sjvitr8WA==
X-Received: by 2002:adf:f80b:0:b0:217:88ff:eb6f with SMTP id
 s11-20020adff80b000000b0021788ffeb6fmr33251817wrp.489.1654943815654; 
 Sat, 11 Jun 2022 03:36:55 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600016c700b0020c7ec0fdf4sm2440540wrf.117.2022.06.11.03.36.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:55 -0700 (PDT)
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 43/49] hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
Date: Sat, 11 Jun 2022 12:33:06 +0200
Message-Id: <20220611103312.67773-44-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

The macro seems to be used only internally, so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-4-shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc.c         | 9 +++++++++
 include/hw/i386/pc.h | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index af9e5edb04..272d7227d5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -98,6 +98,15 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+/*
+ * Helper for setting model-id for CPU models that changed model-id
+ * depending on QEMU versions up to QEMU 2.4.
+ */
+#define PC_CPU_MODEL_IDS(v) \
+    { "qemu32-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
+    { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
+    { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
+
 GlobalProperty pc_compat_7_0[] = {};
 const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 003a86b721..b58ac343ba 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -288,14 +288,6 @@ extern const size_t pc_compat_1_5_len;
 extern GlobalProperty pc_compat_1_4[];
 extern const size_t pc_compat_1_4_len;
 
-/* Helper for setting model-id for CPU models that changed model-id
- * depending on QEMU versions up to QEMU 2.4.
- */
-#define PC_CPU_MODEL_IDS(v) \
-    { "qemu32-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
-    { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
-    { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
-- 
2.36.1


