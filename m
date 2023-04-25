Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8386EE57A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:17:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLJn-0001YH-Aq; Tue, 25 Apr 2023 12:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prLJl-0001XO-DU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:15:01 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prLJi-0003wW-96
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:15:01 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 6DC7360177;
 Tue, 25 Apr 2023 19:14:51 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ZEJx1U1OcKo0-Vui2v4vY; Tue, 25 Apr 2023 19:14:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682439290; bh=ehBE2fK1ENA84Ps5bmvth2N8WSsXpBuCWBbENqvHwGk=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=a0yFWJ+KtMOYNR9yi6FOQ/NHE0m3g4HcH6ifSJhtYPXK4pch4wdLBbOkNVC6KsWMv
 T8AhvHKm/O4+7cbMEV7TYi+QsX1wXPndIvnqObtkDtBcFpbVxm4rLS3fFIyND8ROA5
 /+2PvoNvPen5egU4O3owGdUmWJw5JdL4pMHBmETU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru, lersek@redhat.com,
 kraxel@redhat.com
Subject: [PATCH v2 1/3] pci: pci_add_option_rom(): improve style
Date: Tue, 25 Apr 2023 19:14:32 +0300
Message-Id: <20230425161434.173022-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425161434.173022-1-vsementsov@yandex-team.ru>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix over-80 lines and missing curly brackets for if-operators, which
are required by QEMU coding style.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pci.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..4a61c8d24a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2297,10 +2297,12 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
     char name[32];
     const VMStateDescription *vmsd;
 
-    if (!pdev->romfile)
+    if (!pdev->romfile) {
         return;
-    if (strlen(pdev->romfile) == 0)
+    }
+    if (strlen(pdev->romfile) == 0) {
         return;
+    }
 
     if (!pdev->rom_bar) {
         /*
@@ -2349,7 +2351,8 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
     }
     if (pdev->romsize != -1) {
         if (size > pdev->romsize) {
-            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
+            error_setg(errp, "romfile \"%s\" (%u bytes) "
+                       "is too large for ROM size %u",
                        pdev->romfile, (uint32_t)size, pdev->romsize);
             g_free(path);
             return;
@@ -2359,14 +2362,13 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
     }
 
     vmsd = qdev_get_vmsd(DEVICE(pdev));
+    snprintf(name, sizeof(name), "%s.rom",
+             vmsd ? vmsd->name : object_get_typename(OBJECT(pdev)));
 
-    if (vmsd) {
-        snprintf(name, sizeof(name), "%s.rom", vmsd->name);
-    } else {
-        snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
-    }
     pdev->has_rom = true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
+    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
+                           &error_fatal);
+
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
-- 
2.34.1


