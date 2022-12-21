Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74E6531B7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:27:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7z4I-0007G1-60; Wed, 21 Dec 2022 08:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=lpRu=4T=kaod.org=clg@ozlabs.org>)
 id 1p7z4F-0007Cj-4R
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:23:31 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=lpRu=4T=kaod.org=clg@ozlabs.org>)
 id 1p7z4D-0007K6-1P
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:23:30 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NcYzT5qS8z4x1D;
 Thu, 22 Dec 2022 00:23:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NcYzR71HRz4xVS;
 Thu, 22 Dec 2022 00:23:15 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Subject: [PATCH] hw/core/loader: Remove declarations of
 option_rom_has_mr/rom_file_has_mr
Date: Wed, 21 Dec 2022 14:23:10 +0100
Message-Id: <20221221132310.1485715-1-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=lpRu=4T=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

These globals were moved to MachineClass by commit 71ae9e94d9 ("pc: Move
option_rom_has_mr/rom_file_has_mr globals to MachineClass"). Finish cleanup.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/loader.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 70248e0da7..1384796a4b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -251,9 +251,6 @@ void pstrcpy_targphys(const char *name,
                       hwaddr dest, int buf_size,
                       const char *source);
 
-extern bool option_rom_has_mr;
-extern bool rom_file_has_mr;
-
 ssize_t rom_add_file(const char *file, const char *fw_dir,
                      hwaddr addr, int32_t bootindex,
                      bool option_rom, MemoryRegion *mr, AddressSpace *as);
-- 
2.38.1


