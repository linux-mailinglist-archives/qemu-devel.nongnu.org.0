Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ACF6770EC
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:08:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdov-000266-1E; Sun, 22 Jan 2023 12:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdos-00025J-KX
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:50 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdor-0005TS-1P
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:50 -0500
Received: by mail-ej1-x634.google.com with SMTP id qx13so25025160ejb.13
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eI89IUN7RUUfOnazKDFhGcoR2byoRpvGz9uEt6uTd/4=;
 b=KcEMhD9Ocq0RhW4sOjxD92H4y8Y/S8rCWBodI/SHp4rj26SDQio/QtpQMU+U+dGYWJ
 rKfAvRGUkj99F0R9swfYiwX0zJrlFVDa5a8TkzzqeQWgrYHr+rNRW0u3UF2vo6RRj1c+
 0hNTq3qXXAwsBOwdJyZUCAUAydLmyiDjHG5FWidwxh4P96p6Le8ZHC6ioH7rAIJNcimU
 /diBI4t+NrMoZJx28iOgLQVGVs7hyeGOtOCdUvhTvQz+jUtS9mZc5I7kUqx5Rj1mSklb
 yPC+Tse7wmZdYshhyzV3bBoR/I9GYuiuI4+xxeQoc9b5v5SqR/GzTs1WZs1CZgxZ79Y2
 DvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eI89IUN7RUUfOnazKDFhGcoR2byoRpvGz9uEt6uTd/4=;
 b=flswteq6so29A1hM+4mfZTB/HkQ9mzuqOL3lAX/duUoKOdvxtC6vMKDfQbMCZLJscR
 lh4giH8GlSJaEBG8IhS1Tdmf5RnB1G/oMY0fABiVSgS0DV9pHGKBjJza9xe7o3a/Q70Y
 WhVgjg7wJz01BX+voqbFlQTNZHW78XGd8qDX9ZtdVt7+hKSbLzTcm5/F3XlGPKDEM/nE
 3T8pISHT+JBtCCFVtCXZHipDVscqEJN3Wuhx0EXdQ95CubcqTFKjmGa+1MZVb851qGGH
 r4IITpYpsa8lC4sO9lGhtUsjr6mIOgpJG3Tn/TY7d6CjS1UUemSZY4ef0ENaENckmscN
 dFuQ==
X-Gm-Message-State: AFqh2kpAjoSr5mZVEqcx4HI7s7bvmbCYbyh3ppBBpFMEB/saLrcmm1Rt
 wi919aBHCIszejZFi97DoEa94SWoSasSdQ==
X-Google-Smtp-Source: AMrXdXu40VdWxBunHDZGLJ14lcKQ3Ao6DdZsTeQt+4RyWXDlp+YvjRDDSA7V7sOuN6uhbCff83pabg==
X-Received: by 2002:a17:906:6844:b0:86e:f478:f598 with SMTP id
 a4-20020a170906684400b0086ef478f598mr22331066ejs.44.1674407268141; 
 Sun, 22 Jan 2023 09:07:48 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/7] hw/acpi: Trace GPE access in all device models,
 not just PIIX4
Date: Sun, 22 Jan 2023 18:07:23 +0100
Message-Id: <20230122170724.21868-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/core.c       | 5 +++++
 hw/acpi/piix4.c      | 3 ---
 hw/acpi/trace-events | 8 ++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 6da275c599..a33e410e69 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -32,6 +32,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "sysemu/runstate.h"
+#include "trace.h"
 
 struct acpi_table_header {
     uint16_t _length;         /* our length, not actual part of the hdr */
@@ -686,6 +687,8 @@ void acpi_gpe_ioport_writeb(ACPIREGS *ar, uint32_t addr, uint32_t val)
 {
     uint8_t *cur;
 
+    trace_acpi_gpe_ioport_writeb(addr, val);
+
     cur = acpi_gpe_ioport_get_ptr(ar, addr);
     if (addr < ar->gpe.len / 2) {
         /* GPE_STS */
@@ -709,6 +712,8 @@ uint32_t acpi_gpe_ioport_readb(ACPIREGS *ar, uint32_t addr)
         val = *cur;
     }
 
+    trace_acpi_gpe_ioport_readb(addr, val);
+
     return val;
 }
 
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 836f9026b1..b65ddb8e44 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -45,7 +45,6 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "migration/vmstate.h"
 #include "hw/core/cpu.h"
-#include "trace.h"
 #include "qom/object.h"
 
 #define GPE_BASE 0xafe0
@@ -510,7 +509,6 @@ static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
     PIIX4PMState *s = opaque;
     uint32_t val = acpi_gpe_ioport_readb(&s->ar, addr);
 
-    trace_piix4_gpe_readb(addr, width, val);
     return val;
 }
 
@@ -519,7 +517,6 @@ static void gpe_writeb(void *opaque, hwaddr addr, uint64_t val,
 {
     PIIX4PMState *s = opaque;
 
-    trace_piix4_gpe_writeb(addr, width, val);
     acpi_gpe_ioport_writeb(&s->ar, addr, val);
     acpi_update_sci(&s->ar, s->irq);
 }
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 78e0a8670e..159937ddb9 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -17,6 +17,10 @@ mhp_acpi_clear_remove_evt(uint32_t slot) "slot[0x%"PRIx32"] clear remove event"
 mhp_acpi_pc_dimm_deleted(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm deleted"
 mhp_acpi_pc_dimm_delete_failed(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm delete failed"
 
+# core.c
+acpi_gpe_ioport_readb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " ==> 0x%" PRIx8
+acpi_gpe_ioport_writeb(uint32_t addr, uint8_t val) "addr: 0x%" PRIx32 " <== 0x%" PRIx8
+
 # cpu.c
 cpuhp_acpi_invalid_idx_selected(uint32_t idx) "0x%"PRIx32
 cpuhp_acpi_read_flags(uint32_t idx, uint8_t flags) "idx[0x%"PRIx32"] flags: 0x%"PRIx8
@@ -48,10 +52,6 @@ acpi_pci_sel_read(uint32_t val) "%" PRIu32
 acpi_pci_ej_write(uint64_t addr, uint64_t data) "0x%" PRIx64 " <== %" PRIu64
 acpi_pci_sel_write(uint64_t addr, uint64_t data) "0x%" PRIx64 " <== %" PRIu64
 
-# piix4.c
-piix4_gpe_readb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64 " width: %d ==> 0x%" PRIx64
-piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64 " width: %d <== 0x%" PRIx64
-
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
-- 
2.39.1


