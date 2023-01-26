Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DC67D794
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dQ-00086u-Ad; Thu, 26 Jan 2023 16:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dE-0007zd-8j; Thu, 26 Jan 2023 16:18:04 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dC-0007jn-K8; Thu, 26 Jan 2023 16:18:03 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kt14so8686024ejc.3;
 Thu, 26 Jan 2023 13:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Y9cub/HmI35SV/LefG5zdwf9+3G3TlrTC86o8kKOss=;
 b=GJ2EdVuTDRtYLNG6XRwVVUaG6VASv7C4oRcMf76/MPKICHqHoJLvhYS62CUYlNA/CC
 +tpnaH5FSBzH090vg2MVcsowb7t1qFrWV6iTQBzvvZGC/DBWOYOy9+SpIsAq+ocCeu32
 zYQBloPj8t0WMu+kPvsOep9oxmamb4g3KSGh/LBEDbOYfYg7GXbwPugf18gEypsFYtBl
 1hBmYrS2fDlmJxfFubVtzK7aHq149w0HpoFuua//mCsRuVREZze9mjQGXG7vCDXIWKTZ
 uV0KwHCuQsBJN+kVGcTMJnvzKlPWPvWEFS5tbniTuLM2mFinl5d0LFfAda9JVknVux2h
 HZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Y9cub/HmI35SV/LefG5zdwf9+3G3TlrTC86o8kKOss=;
 b=bd+Yg7MJLbZiKVuEeCCcdTgvovL6OLOavczF5s2j6cWEjaxdnhnEqKJFN9V9NiC1tO
 okglvDd/sroqJXesM4z1jFfEdiLZW8LlNtjrieaZhrxIqs2h+HM8PuTbXsfrfNS9PKYL
 3hmWsB6IDeQNkjt1c5DSNt59yav5OYbhwZW1ytTfZcCFfqUAaB9gbJOezD308TN8oF0u
 GWsYQZx1Q12ZeEAm080CEdsyc243a+mbn7doVQjAAvwrY7upjDJHXu0A17JEu1/uKtlM
 S+IxJfdwNf0p2DzrkkRgNImni0byjlqZ7RzB71hWxBoQFpm6eiXUeQPNPhNybD+SpD/f
 mOzQ==
X-Gm-Message-State: AO0yUKUsjUNeIS4bHHw9h//OHOJ1uUg0fdI8jG4z1MqcZGEUwOgCgwNU
 8oSEA2ZnbyxCeIsRip8OpmUyObyJxRlrvg==
X-Google-Smtp-Source: AK7set/4bzhGGo0RUN4HxwYDBn88GzMuH8YOU17+fbSPRFWO55XLWKzYrKrzU1eqni6NsnBuxaylDA==
X-Received: by 2002:a17:906:2b98:b0:878:81d6:1e2d with SMTP id
 m24-20020a1709062b9800b0087881d61e2dmr1399874ejg.7.1674767880849; 
 Thu, 26 Jan 2023 13:18:00 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:18:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 10/10] hw/isa/isa-bus: Resolve isabus global
Date: Thu, 26 Jan 2023 22:17:40 +0100
Message-Id: <20230126211740.66874-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

Now that only isa_bus_new() accesses the isabus global it can be removed
assuming that all call sites take care of not passing the same address
spaces to different isa_bus_new() invocations.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 8bae5cc473..b8c89a1e65 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -26,8 +26,6 @@
 #include "hw/isa/isa.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-static ISABus *isabus;
-
 static char *isabus_get_fw_dev_path(DeviceState *dev);
 
 static void isa_bus_class_init(ObjectClass *klass, void *data)
@@ -53,10 +51,8 @@ static const TypeInfo isa_bus_info = {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
                     MemoryRegion *address_space_io, Error **errp)
 {
-    if (isabus) {
-        error_setg(errp, "Can't create a second ISA bus");
-        return NULL;
-    }
+    ISABus *isabus;
+
     if (!dev) {
         dev = qdev_new("isabus-bridge");
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.39.1


