Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE4362F48
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:39:42 +0200 (CEST)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiMX-0004Pk-5T
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiE8-0001dY-Oj; Sat, 17 Apr 2021 06:31:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiE6-0000tZ-SJ; Sat, 17 Apr 2021 06:31:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id s7so28926148wru.6;
 Sat, 17 Apr 2021 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdnzmuhsTLw4wdID7+EL8uOV5BaW8a1hwDqQzxQSeJ0=;
 b=hSqDwzKh64y708YkvLg3y0px7fNMVmIgZ87o384zCIyj/bvt0rxsvOTBeGJO+FnW7d
 4XRsU76R6wKADEyo/hpfAjNWGRmpddcoTliMsJGJ9VPRZnb95dsw/UgxnvRN+oZ5Sa6n
 Mv4Q0uNd2QdRQ7G31kef6enuBOU4pDX9m9OuDB3mwx+MtigifWDu7Z3w1J17F+9EpK0R
 yU9mB6I9EE4Hi2gxXa3yQWXuknScHBSnBtaDBbjW7znGl3y9oryOp9BTazPX9vAmnPl2
 MWddrw2FqZ1+6mNAIcACwrVX17mdaTRfoemOT2vQMWbu2g5PkRYEZQMycTS11shloP0V
 f+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PdnzmuhsTLw4wdID7+EL8uOV5BaW8a1hwDqQzxQSeJ0=;
 b=k3SE0oCSwqTDlwApd+2sxIos1gDNiZRn07zEzrkzih4YmAcqpDmGsgQC9bq4E3tWgl
 LVu2jg3dLLpfakxaHftADiliPWMn4rVtTIvh/lbeRNquer402blo6PgSVgasgJ5vtopk
 60nDghT9dAng9uufLx4g3CfqzGm/X+GRMRHwwcrgBe6s2S+fxHHpK/+8Cztj3quDO+v9
 zne4WBRPNbzQx4NUFzvoU1QJj9bzxXDhk+rqPAOtb64uaI2ymgS7eydgWkFhx9SlVDFD
 j7rGh4gI7NnOHsEu59SvYqEnwNCfsyTuSpWZcA04wPV7sld0oPib+EVEbo3EbR54zWCM
 3q3g==
X-Gm-Message-State: AOAM531u8lvDTT3m2hO3A2iX0AbnGM0kJAawy0QP6xncwvz/npiDBRMG
 gYDAF9F7AKsUdBjp3PgFf+whkARsc5Q=
X-Google-Smtp-Source: ABdhPJyG9lVl3E9j8Dn9ghsQfNozVY8AKsTsQYSW1++kRRv0s5UP7NiwTBVYB54nHUKSaZD07KVV1w==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr3654992wrj.339.1618655456749; 
 Sat, 17 Apr 2021 03:30:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n14sm12291808wmk.5.2021.04.17.03.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:30:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] hw/pci-host/raven: Add PCI_IO_BASE_ADDR definition
Date: Sat, 17 Apr 2021 12:30:22 +0200
Message-Id: <20210417103028.601124-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than using the magic 0x80000000 number for the PCI I/O BAR
physical address on the main system bus, use a definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/raven.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 0a9162fba97..730f31a8931 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -82,6 +82,8 @@ struct PRePPCIState {
 
 #define BIOS_SIZE (1 * MiB)
 
+#define PCI_IO_BASE_ADDR    0x80000000  /* Physical address on main bus */
+
 static inline uint32_t raven_pci_io_config(hwaddr addr)
 {
     int i;
@@ -159,7 +161,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
     uint8_t buf[4];
 
     addr = raven_io_address(s, addr);
-    address_space_read(&s->pci_io_as, addr + 0x80000000,
+    address_space_read(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
                        MEMTXATTRS_UNSPECIFIED, buf, size);
 
     if (size == 1) {
@@ -191,7 +193,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
         g_assert_not_reached();
     }
 
-    address_space_write(&s->pci_io_as, addr + 0x80000000,
+    address_space_write(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
                         MEMTXATTRS_UNSPECIFIED, buf, size);
 }
 
@@ -294,8 +296,9 @@ static void raven_pcihost_initfn(Object *obj)
     address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
 
     /* CPU address space */
-    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_io);
-    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
+    memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
+                                &s->pci_io);
+    memory_region_add_subregion_overlap(address_space_mem, PCI_IO_BASE_ADDR,
                                         &s->pci_io_non_contiguous, 1);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
-- 
2.26.3


