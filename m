Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0A55B835
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:31:48 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jDn-0004sx-Bw
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izU-0003hm-5t; Mon, 27 Jun 2022 03:17:01 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izQ-0003uL-DC; Mon, 27 Jun 2022 03:16:59 -0400
Received: by mail-ej1-x62f.google.com with SMTP id sb34so17085991ejc.11;
 Mon, 27 Jun 2022 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OgLTEN559d5MRc9woY4BVfF0YnifdBVutDH48Qz2Aqs=;
 b=VYPjjR4DQvS/fQ4RTJ31KtZ2g58lsop8f04Zl/K/4OUbMbLaVlgrtsfOiXnjE/okTP
 7g/DAWdRTyThdv0Mt+4APc5yssi5FaBxSVZwGyLK4dBOR4A05bfgC/gR8zw3X6Fd0vqE
 Vmo0oEX19wv/R6OCp6Mvb54Gs9BdKPqFCC5BbL5hXtxA/CXdF2kon0tA02qXYP9gKBf0
 cvfdE/rs/D0J57CkTk/rBfI3q91NAHNh/qSqv9iO4lkzOUHselQe4ifGHS/1vB2r5gig
 jIcqJYtdJeEoJaR0wbSI1XKZ5HsuJnVMGbkt4Mw32/q8tx6E5fFhG98xtFFrpUrX7YO4
 jfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OgLTEN559d5MRc9woY4BVfF0YnifdBVutDH48Qz2Aqs=;
 b=5UMzPkGBNceJWVwuPr+psKajTZESsEo9L/ltBiSNxlSm323gcXkEA/5BiqUcbqCxQY
 TanRgTIlTABQcP9yFFt8YkxKAcg8S5RKNRfhMgFENNg65g/D+Gde9k2vsG34WD8/niuK
 xCkIVhUwDy68I/52iWEUAcrhCDV8GzQ4P/oWQAOIOVZbBAT7181Rjq4eml7VoEkIWqty
 GHhZmZ5qyCYRMY1dcPkKzD9YzxvwgmjTrMDPQMO6zDD/p4WeFD6pwvZwXH0Wp3KXSN1L
 WVMoZkU9TgC6lAwP9kka72DtVim6mFBn0Y6Eq8ZJTtDELYQP/CcjxjKAYJLZm3r5urYB
 njIg==
X-Gm-Message-State: AJIora/LHVGdLhn+b8Rjpk0JeXWJfTGl438mUUkjfRMp4K8Ne4yAVtCz
 9jzilhB9vMaSkomsKrRBhM/sk67coeIR8Q==
X-Google-Smtp-Source: AGRyM1u8MRMKRKJkw4FonumDfEcoqukTO9AKDwT7xB5FZcbupwH3b3MzxzDB8ymmVl/k+A90w/YBLA==
X-Received: by 2002:a17:906:1998:b0:726:a78c:2a2f with SMTP id
 g24-20020a170906199800b00726a78c2a2fmr2943097ejd.463.1656314212868; 
 Mon, 27 Jun 2022 00:16:52 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:52 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 09/10] hw/isa: Resolve unneeded usage of isabus global
Date: Mon, 27 Jun 2022 09:16:10 +0200
Message-Id: <20220627071611.8793-10-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

Now that all call sites of these functions are fixed to pass non-NULL
ISADevices, the ISABus can be determined from the ISADevice argument.

Patch based on https://lists.nongnu.org/archive/html/qemu-devel/2021-05/
msg05785.html.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/ioport.c      |  4 ++--
 hw/isa/isa-bus.c     | 21 +++++++++++++--------
 include/hw/isa/isa.h |  2 +-
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index 69e4fa15d4..112726e415 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -53,8 +53,8 @@ static const MemoryRegionPortio ide_portio2_list[] = {
 
 void isa_ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 {
-    /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
-       bridge has been setup properly to always register with ISA.  */
+    assert(dev);
+
     isa_register_portio_list(dev, &bus->portio_list,
                              iobase, ide_portio_list, bus, "ide");
 
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 9e8b5da027..5518db93cd 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -116,6 +116,10 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 
 void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
 {
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
     memory_region_add_subregion(isabus->address_space_io, start, io);
     isa_init_ioport(dev, start);
 }
@@ -125,8 +129,13 @@ void isa_register_portio_list(ISADevice *dev,
                               const MemoryRegionPortio *pio_start,
                               void *opaque, const char *name)
 {
+    ISABus *isabus;
+
+    assert(dev);
     assert(piolist && !piolist->owner);
 
+    isabus = isa_bus_from_device(dev);
+
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
@@ -246,20 +255,16 @@ static char *isabus_get_fw_dev_path(DeviceState *dev)
 
 MemoryRegion *isa_address_space(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space;
-    }
+    assert(dev);
 
-    return isabus->address_space;
+    return isa_bus_from_device(dev)->address_space;
 }
 
 MemoryRegion *isa_address_space_io(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space_io;
-    }
+    assert(dev);
 
-    return isabus->address_space_io;
+    return isa_bus_from_device(dev)->address_space_io;
 }
 
 type_init(isabus_register_types)
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 8dd2953211..486851e7cb 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -108,7 +108,7 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start);
  * function makes it easy to create multiple MemoryRegions for a single
  * device and use the legacy portio routines.
  *
- * @dev: the ISADevice against which these are registered; may be NULL.
+ * @dev: the ISADevice against which these are registered
  * @piolist: the PortioList associated with the io ports
  * @start: the base I/O port against which the portio->offset is applied.
  * @portio: the ports, sorted by offset.
-- 
2.36.1


