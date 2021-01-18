Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA22F9E46
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:37:14 +0100 (CET)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SqP-0004Mb-Vp
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Sli-0007qN-3f; Mon, 18 Jan 2021 06:32:22 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:32835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Slg-0000Q0-Ez; Mon, 18 Jan 2021 06:32:21 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MlO9r-1lkOos0m7x-00llJE; Mon, 18 Jan 2021 12:32:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] hw/ide/ahci: Replace fprintf() by
 qemu_log_mask(GUEST_ERROR)
Date: Mon, 18 Jan 2021 12:32:05 +0100
Message-Id: <20210118113205.1915888-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118113205.1915888-1-laurent@vivier.eu>
References: <20210118113205.1915888-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:75/DxdI5dAfrV67DyZ6ZftfY9vcFxZNe2ENnwHOvirp+DuRAj6s
 1KFBKiB/zwwbx4XlEbp6PxFmuaMZX4UfmnbtBp25LE6287f1CxFGQDl+RE8nBqkSxNEnrH1
 ZClgKBA12YJvWjOLYtg4nyFYrG6V10EGfAzaa+Lc6KrXVznZWZqInDuXUcemOqlr3l9nJjK
 C/bqu2F+IrubHGqs4SSWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oo18ZwQLkMk=:/Nh1sYK8HD5tVrPOh9iQD0
 EF/833396CidPRsf6M0sENKI720BEfbldlRMaO2PpbDa++rTlvQewqoDA9fvDfrnxdpWKGGpj
 nt0aIOeJS1BG5pZ3GxJjG5aHFCmhQjXEhvLYsMSjOEymXBZ3umZd84NUE0lBLBPNGY30Bac4c
 mpewhFAl5257Piq5wT+QkWipLgL6KVx8QKNhdNUu4H5/fx14Cx9tX/mKgDxf4mVSrFKhxDMyS
 outkzLzoEf1ga9EgTLjJzFPQsXJ+ifgNRylr/JAvtvXQvCicT+8HurAVkg8YtxAucjzUNpFBY
 S9DMkqLDjpkRIR+MY5/DrhHkPPGu9/8PDazRQHgqiHLqUVXLO/AjmGZXilkTChnrEOVBmDwhC
 kleESefjsL+W39BQFzf1ibDrN3VohPRzzMXDSN6AHX5TMFq1q9ATNz/m9RpXLqrPvSc8zFcz1
 QYkhABlAPQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Replace fprintf() calls by qemu_log_mask(LOG_GUEST_ERROR).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210112112955.1849212-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ide/ahci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 4b675b9cfd8d..6d50482b8d1a 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -465,8 +465,9 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
 
     /* Only aligned reads are allowed on AHCI */
     if (addr & 3) {
-        fprintf(stderr, "ahci: Mis-aligned write to addr 0x"
-                TARGET_FMT_plx "\n", addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ahci: Mis-aligned write to addr 0x%03" HWADDR_PRIX "\n",
+                      addr);
         return;
     }
 
@@ -1111,7 +1112,8 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
     g_assert(is_ncq(ncq_fis->command));
     if (ncq_tfs->used) {
         /* error - already in use */
-        fprintf(stderr, "%s: tag %d already used\n", __func__, tag);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: tag %d already used\n",
+                      __func__, tag);
         return;
     }
 
-- 
2.29.2


