Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D74AFFC5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:01:40 +0100 (CET)
Received: from localhost ([::1]:49026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHv1t-00015u-9C
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:01:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwy-0006c6-Ch
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:32 -0500
Received: from [2607:f8b0:4864:20::102c] (port=36612
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuww-0008HS-Qz
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:32 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso5028130pjd.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0xC9CQX8BO13hvHk0VfRHuZcIUjpzb43FM2p/Uv61K4=;
 b=SpHWAWB+Bp+MnDk6hgcH7JItCgnoj6bNQdRcng9xScbb8zuslS4tlofbxGrvvrcZs4
 UTEKr41VgzyWSVpiJodDKiTDt4Cuipbd7KircOuf9Da1HLmbQuEnCeklcXBXT51oYWUZ
 1PyeuZWDBcJFw5rF40Ms5eJRuiYTGSKX2wAopcKWcgcnO/v4xaVjZW611pmXjcYnWqOi
 RHO2XIAsqVqE12+L2GPt5rJShcnc7Dl+myFpskEIBD4QIOik3teiESM66ctqpxX2TTKI
 YamO7+4ELFX79DpP9hmVsn1WY2BuiYhktB9TEyH165zmoiZNiMO3mx9r0W5lkRZ1RrmY
 cJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0xC9CQX8BO13hvHk0VfRHuZcIUjpzb43FM2p/Uv61K4=;
 b=xQzm+DcDwKLxyKqzyZKSUTlMYIIwn/5TE5gj/4gwA4TD56O1qCD13F4YcCeB/lxiK9
 Z8mnonYV8WDyvAn2biu0D3GeYWL3vaq2d8X7KmXXHdqX3D7fX1N63xQisTxgD6Fj7xlQ
 zcLrp7NDcq8Qpq1mjOD4UZpBofEh/HhW4AFFYL00JFMV6nvoNTEAf13I6SRomHI+wXGC
 2FfheyaehxeQardgyQCeGe6QusLTQUpbjDZbZgSPOBpTHzCpA7x7yhjvzxEyy0O8B7Ih
 5MGPW7Eze/2wP/n8Jgwg9nrMS12IyvHnWi8acloyt8O+w8jp5+xfXZ6o/sh8XWtMgoo1
 mL9Q==
X-Gm-Message-State: AOAM5308765eiyt0OIS7++PSh4kD0VUVMud2KKc4a4sf0jZxCjBsUuXu
 Gk8/gNwubXetDbId/n/ZTag2Nzj39jY=
X-Google-Smtp-Source: ABdhPJz7Zs5GujlPmldIUp6Gi3OROWS9Jf8/KOk1/2y9LcHzB8eB19gM5rViH3UMmgbZeZeZmAL51g==
X-Received: by 2002:a17:90a:fe15:: with SMTP id
 ck21mr5786300pjb.95.1644443789401; 
 Wed, 09 Feb 2022 13:56:29 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y190sm6703939pfg.212.2022.02.09.13.56.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:56:29 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 12/15] hw/m68k: Restrict M68kCPU type to target/ code
Date: Wed,  9 Feb 2022 22:54:43 +0100
Message-Id: <20220209215446.58402-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/m68k/mcf.h | 3 +--
 target/m68k/cpu-qom.h | 2 --
 target/m68k/cpu.h     | 4 ++--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index 8cbd587bbf..e84fcfb4ca 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -3,7 +3,6 @@
 /* Motorola ColdFire device prototypes.  */
 
 #include "exec/hwaddr.h"
-#include "target/m68k/cpu-qom.h"
 
 /* mcf_uart.c */
 uint64_t mcf_uart_read(void *opaque, hwaddr addr,
@@ -16,7 +15,7 @@ void mcf_uart_mm_init(hwaddr base, qemu_irq irq, Chardev *chr);
 /* mcf_intc.c */
 qemu_irq *mcf_intc_init(struct MemoryRegion *sysmem,
                         hwaddr base,
-                        M68kCPU *cpu);
+                        ArchCPU *cpu);
 
 /* mcf5206.c */
 #define TYPE_MCF5206_MBAR "mcf5206-mbar"
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index c2c0736b3b..ec75adad69 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -25,8 +25,6 @@
 
 #define TYPE_M68K_CPU "m68k-cpu"
 
-typedef struct ArchCPU M68kCPU;
-
 OBJECT_DECLARE_TYPE(ArchCPU, M68kCPUClass,
                     M68K_CPU)
 
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 872e8ce637..90be69e714 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -156,14 +156,14 @@ typedef struct CPUArchState {
  *
  * A Motorola 68k CPU.
  */
-struct ArchCPU {
+typedef struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
 
     CPUNegativeOffsetState neg;
     CPUM68KState env;
-};
+} M68kCPU;
 
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


