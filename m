Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6579214704
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 17:46:25 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrkMy-0002bl-UD
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 11:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGU-0001Fa-Qc
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:39:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60238
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGQ-0007Vs-WA
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUMsI8pPCoJLWJQxhYCjSGYgbzwxCwXM4hINsxgIP8Y=;
 b=h7KWcpfm9KduiEDZxR5gYa6nx79ZGGIqdfCoa13ugWsdMpkjWs2R27EESXegfbvsxBTR+j
 WTw0ki31XCNKiFr8EF115b52ZVh4oq3QtyF6UN9Bk0zCHAhZ/zJJJmP0rYrP9wIvgLOGLL
 NsrqxjPVCEqp7xGgY64EQrBXHzQ2yVo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-VAB2_2eYMIGT9-fGAUjYkQ-1; Sat, 04 Jul 2020 11:39:34 -0400
X-MC-Unique: VAB2_2eYMIGT9-fGAUjYkQ-1
Received: by mail-wr1-f69.google.com with SMTP id y13so35955446wrp.13
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 08:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUMsI8pPCoJLWJQxhYCjSGYgbzwxCwXM4hINsxgIP8Y=;
 b=OuVZUYzAIpV9y4hfqTPrESBw0+ocvBmQs/jEN+wsUhROlghrnEW6azb8ChqYwbb1c2
 /OLOGdnG9rsKTCP5BalHrwafXGEQsAmh+Go04NCtnHGl63tpSDVywZcIYERMfq3UKAii
 wNxKVC5OzgFPpmEK0Phg8cjdECAjyrjtUineL6ULaz2/DnD2sG6HGe4qhnRtL0apEp5+
 n071KrMU9uFMld7u6/InJv3uubLZKh795X8vJ90m16OvlI/NGzKIYqrvJrLvwyW0lZyz
 /3cNcs9zsQy0Wc65YZ12hv/nzGU2avyWFbNqmWrSvXYXzdHWrr/ER8Pd5hSkAIQ438Yq
 uiMw==
X-Gm-Message-State: AOAM531OX+u7Thw/EcESCLm2kwOkbjFtapD1HvdQiOTmaHARqwa0cNWY
 ETpqF8sDwKZDGEqBRbKxOqpruVMMQ0DHEDnHCUZ9cOTwpH4zIgDNTfgiHJYmfc/zP+R5R49rLti
 kURisU1JYCinW0bg=
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr43727444wrx.178.1593877173364; 
 Sat, 04 Jul 2020 08:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhZpaC4/kffjhUCkKRReiugjCiLRymQ9MrOurXjYEblSE5KLvKS6tusliBNPYaGxM9snMfzQ==
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr43727419wrx.178.1593877173151; 
 Sat, 04 Jul 2020 08:39:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id e5sm17685316wrs.33.2020.07.04.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 04/23] hw/arm/pxa2xx: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:38:49 +0200
Message-Id: <20200704153908.12118-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/pxa2xx.c          | 3 +++
 hw/display/pxa2xx_lcd.c  | 3 +++
 hw/input/pxa2xx_keypad.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f104a33463..adc7263e59 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -27,6 +27,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "hw/qdev-deprecated.h"
 
 static struct {
     hwaddr io_base;
@@ -1768,6 +1769,8 @@ static PXA2xxI2SState *pxa2xx_i2s_init(MemoryRegion *sysmem,
 {
     PXA2xxI2SState *s = g_new0(PXA2xxI2SState, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->rx_dma = rx_dma;
     s->tx_dma = tx_dma;
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index ff90104b80..cf6241ff21 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -20,6 +20,7 @@
 /* FIXME: For graphic_rotate. Should probably be done in common code.  */
 #include "sysemu/sysemu.h"
 #include "framebuffer.h"
+#include "hw/qdev-deprecated.h"
 
 struct DMAChannel {
     uint32_t branch;
@@ -1011,6 +1012,8 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     PXA2xxLCDState *s;
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
     s->invalidated = 1;
     s->irq = irq;
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 62aa6f6b15..6de1e9e4bb 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "hw/arm/pxa.h"
 #include "ui/console.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Keypad
@@ -316,6 +317,8 @@ PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
 {
     PXA2xxKeyPadState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxKeyPadState *) g_malloc0(sizeof(PXA2xxKeyPadState));
     s->irq = irq;
 
-- 
2.21.3


