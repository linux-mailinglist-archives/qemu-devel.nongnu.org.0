Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF622D9B9F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:00:49 +0100 (CET)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqHI-0001il-HM
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEQ-0007rZ-S4; Mon, 14 Dec 2020 10:57:51 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:44741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEN-0001Pn-6A; Mon, 14 Dec 2020 10:57:50 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mwwm5-1juxO10CB1-00yQ8i; Mon, 14 Dec 2020 16:57:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] hw/pci-host/pam: Replace magic number by
 PAM_REGIONS_COUNT definition
Date: Mon, 14 Dec 2020 16:57:19 +0100
Message-Id: <20201214155733.207430-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yWbPKBhYLElznlki5MBnP6phYaUHaTDcWosOaEOxpm9tcG7y6fP
 WfHvto8f73FKuTOfLWQ1JdQSrhDCZCZAZGge5GQhSCrc+9G1oM4KbYrmD/ct/ZlniR0NuXP
 9LDRvXrNgrjsdUN/MQiz3gXj3GP09pCV5u2ZpwOSRIIR63AO8mgAIEItDzBwW2dkfa7Sf85
 l/uaVvimA6ucAjhpFLwUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AjbuZIq1BZU=:YAc6ZOGyf90rBFin/8nn/C
 KeEI2nNL3Z7JrUypjodL8F9YevL2+oEd2nD7Q2B6/PsgZ1taYHPndwK2UHST0lxfwDBWHgTDS
 OxgHnBWtw3JStNCJWLV01jo0A5cg9almBMLmbB2h9pgytHzkVTgZttjJ194PLjEC7mi0enqyo
 zQmjkYDegYUthhcA4NuAcEMb4F/OI64M4/QmtbGmivivv7kWCA5sQlhrXBirpvTB0n9Yots3j
 2BGLJ65HxnO71jm3Fx1dN6Q2EHZl8Bi6YFcMlRFQ/xHjlpwoH3TYfUTeEAXZc3fcuI3jxRDZn
 5ETc/7u3MgYsITga7hyzJjqwRHcSZimnXIq4410vTNCveihB771WGRjiuH7qBYTtW6t3J5fYM
 AQmmSJwruVGt0VkP2os4O6XrNxwpuOBpDmbvuVuB/u67LPyctZ9Cnoz2CqMAfpxSLLVtelB6B
 yQ4iGEGKRQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Julia Suvorova <jusual@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

While this change helps triskaidekaphobic developers, it
is a good practice to avoid magic values and using constant
definitions instead.

Introduce the PAM_REGIONS_COUNT and use it. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20201202132038.1276404-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci-host/pam.c            | 2 +-
 hw/pci-host/q35.c            | 2 +-
 include/hw/pci-host/i440fx.h | 2 +-
 include/hw/pci-host/pam.h    | 2 ++
 include/hw/pci-host/q35.h    | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index a4962057833f..454dd120db97 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -62,7 +62,7 @@ void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
 
 void pam_update(PAMMemoryRegion *pam, int idx, uint8_t val)
 {
-    assert(0 <= idx && idx <= 12);
+    assert(0 <= idx && idx < PAM_REGIONS_COUNT);
 
     memory_region_set_enabled(&pam->alias[pam->current], false);
     pam->current = (val >> ((!(idx & 1)) * 4)) & PAM_ATTR_MASK;
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index b67cb9c29f8e..2eb729dff585 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -641,7 +641,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
              mch->pci_address_space, &mch->pam_regions[0],
              PAM_BIOS_BASE, PAM_BIOS_SIZE);
-    for (i = 0; i < 12; ++i) {
+    for (i = 0; i < ARRAY_SIZE(mch->pam_regions) - 1; ++i) {
         init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
                  mch->pci_address_space, &mch->pam_regions[i+1],
                  PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 6c16eaf876dd..24fd53942cab 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -29,7 +29,7 @@ struct PCII440FXState {
     MemoryRegion *system_memory;
     MemoryRegion *pci_address_space;
     MemoryRegion *ram_memory;
-    PAMMemoryRegion pam_regions[13];
+    PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
     MemoryRegion smram_region;
     MemoryRegion smram, low_smram;
 };
diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
index fec5cd35d60f..c1fd06ba2ae6 100644
--- a/include/hw/pci-host/pam.h
+++ b/include/hw/pci-host/pam.h
@@ -80,6 +80,8 @@
 #define SMRAM_C_BASE_SEG_MASK  ((uint8_t)0x7)
 #define SMRAM_C_BASE_SEG       ((uint8_t)0x2)  /* hardwired to b010 */
 
+#define PAM_REGIONS_COUNT       13
+
 typedef struct PAMMemoryRegion {
     MemoryRegion alias[4];  /* index = PAM value */
     unsigned current;
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index bbb958176565..ab989698ef8f 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -44,7 +44,7 @@ struct MCHPCIState {
     MemoryRegion *pci_address_space;
     MemoryRegion *system_memory;
     MemoryRegion *address_space_io;
-    PAMMemoryRegion pam_regions[13];
+    PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
     MemoryRegion smram_region, open_high_smram;
     MemoryRegion smram, low_smram, high_smram;
     MemoryRegion tseg_blackhole, tseg_window;
-- 
2.29.2


