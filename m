Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B0E2E8291
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:56:19 +0100 (CET)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6ri-00012x-Tf
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6ld-00022b-9u
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:01 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lb-0006V6-SA
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:00 -0500
Received: by mail-wr1-x429.google.com with SMTP id 91so21025228wrj.7
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpXgP9moZBrSC473lu7QGvZbzGR5/trPsHw8SfcFSaA=;
 b=c2NUqgSeZEiaA5RZAU2EyMjQN3wcDgK6nBfaToXNSTYmyzmKnEjkUHMpyRGsCuAoCO
 Aq3QtK/exYVGj7R33s+5mX4SqvICgEwfhVgoh3M1cRYz/0Y6ode+XchEkGMnaUXn2O7x
 szqyHrRaPkmUbMd/e0jE1WsECGTBEyfEbyfOjMGrzRAtIZ83h0tLOXDv9cuVC38LG+k8
 nUQvkEqStchVnsvba5cthZfUVZU2WVreDszqD12wdQ/SRuHRc9B4h7yNYKsCb/VH9Brx
 jQufP5voa6CRoroWtfU1cPylkzkpDb5YeKx6EbEt3CYZF7LnXU4aNvyMUX4wZx3Gte6i
 Jvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zpXgP9moZBrSC473lu7QGvZbzGR5/trPsHw8SfcFSaA=;
 b=RJbnD7viz/eZ4982VyrAuX2SVtFpDnFRacAscbX36ztPd6rkeO/xwZl5iLdPwiYQJg
 DVRaz8snho2+yb2wYPKj/HewnN3PxE3G/9YTuhQiIiPEG5yM8xO+CxdJbxnzov0suLoG
 G38c0GJgLqH4/w5MPO99tCISU9fXGQeyNRS2ppCgCvKxTp1QUbwzRp2/atp3fqR46ku4
 ml3YFvBfknH1NjKEn8sLX1e2LlnLSY4PAQ9AHncmU2UF96iwRFyX3SYAAsr4rCrR6qk3
 m06AqMnKdwWM2m47bqUUO1MIVcSjWy6SNpnDt1IX6G6yP0H/qnaPkGCjSsUicHwJ+Ixs
 X4aQ==
X-Gm-Message-State: AOAM532d/DJvdbMICI2luLRmfpe0exHYWOsbwVf/pu6qEAgcp6t0tic5
 Uci7ulOt6EIRK+zkPZEdOdZW/M77Eh8=
X-Google-Smtp-Source: ABdhPJxVy8JZj8s35RJPmonjGj9EwE0mzrxii/EQKK2hMbyhMcP4V0BvmK30W2pHAqmfdue7pQvcvg==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr67406710wrx.170.1609454998452; 
 Thu, 31 Dec 2020 14:49:58 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id s1sm73228987wrv.97.2020.12.31.14.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/18] hw/pci-host/bonito: Rename north bridge helpers
Date: Thu, 31 Dec 2020 23:49:02 +0100
Message-Id: <20201231224911.1467352-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename north bridge related helpers as 'bonito_northbridge_*'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a091ef15d27..d91ed82c99e 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -270,7 +270,7 @@ static void bonito_remap(PCIBonitoState *s)
     }
 }
 
-static void bonito_writel(void *opaque, hwaddr addr,
+static void bonito_northbridge_write(void *opaque, hwaddr addr,
                           uint64_t val, unsigned size)
 {
     PCIBonitoState *s = opaque;
@@ -335,7 +335,7 @@ static void bonito_writel(void *opaque, hwaddr addr,
     }
 }
 
-static uint64_t bonito_readl(void *opaque, hwaddr addr,
+static uint64_t bonito_northbridge_read(void *opaque, hwaddr addr,
                              unsigned size)
 {
     PCIBonitoState *s = opaque;
@@ -352,9 +352,9 @@ static uint64_t bonito_readl(void *opaque, hwaddr addr,
     }
 }
 
-static const MemoryRegionOps bonito_ops = {
-    .read = bonito_readl,
-    .write = bonito_writel,
+static const MemoryRegionOps bonito_northbridge_ops = {
+    .read = bonito_northbridge_read,
+    .write = bonito_northbridge_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -681,7 +681,7 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
     pci_config_set_prog_interface(dev->config, 0x00);
 
     /* set the north bridge register mapping */
-    memory_region_init_io(&s->iomem, OBJECT(s), &bonito_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), &bonito_northbridge_ops, s,
                           "north-bridge-register", BONITO_INTERNAL_REG_SIZE);
     sysbus_init_mmio(sysbus, &s->iomem);
     sysbus_mmio_map(sysbus, 0, BONITO_INTERNAL_REG_BASE);
-- 
2.26.2


