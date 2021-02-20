Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6832056E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:50:00 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRhv-0004CI-Fm
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUK-0007Ct-4b; Sat, 20 Feb 2021 07:35:56 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:42361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUF-0003OQ-GI; Sat, 20 Feb 2021 07:35:55 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N7AEs-1lubws3wbs-017Sl5; Sat, 20 Feb 2021 13:35:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] hw/scsi/megasas: Remove pointless parenthesis
Date: Sat, 20 Feb 2021 13:35:23 +0100
Message-Id: <20210220123525.1353731-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iU61+iNoqvDfYsZE4lV1vOg1HkSBsKkDmtpy3KsYbISZTZDaYLz
 FIPnAOjfeVaC5kVFlh7zRBi+SQnfUsYkpfRKfzoSDaGRX+Mr7mxE/lEAEIDIUGqaZeU4N2z
 +9Fp83In4FJFrDe+QG/K70RD4i2yDa4HrIzAiDfbatrzw1B55DTz01vZQ9etjI1VGFwQOvy
 iZIboHL4e5iGGi5epwfJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BqlsuIgaIJc=:8gXP082sJsXYzDe4FM/ag5
 BiFs7hQt8ghmt+6vkWMz97HsxmXQ8QqsVmAu8oPvVx6kAQXQRDUW/hx7yOZIbvnPQ/995H2lP
 kMED804IXSG2KtSiw84iQFULsRqrvFOIBz6TFEA6aH/57l0CsN4ZbGhLuryyUcc2WY/REuenL
 C4NyF6tPtn9EltfpNAhHku6AXsxpq4BnC3ap9Qt11Z1SD2AA8T5BEbtkPsHQPNyZS0kFxSBP/
 fK+4LHbtdraPtKSw8EzMSKtDsFlUv/fOVZRB8glEZukhJZPHt2jG0S3P1f40w2wo3R5kExJ7R
 5kF1qIZPUf1mekfXOQOkYb8mFwEVetIYDL5Q0r8H3a9BdDfvMjAZAmSLR0bDLBDOtKNNPekDw
 M1aQaUDhCfmYACsUfhE//apJwQgMauqTYTdMo5KDSPuAHIlV2vjYS7IVUVSlfpE+T2H6x7YsI
 5R8X7Qu1BA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201011195001.3219730-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/megasas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 1a5fc5857db3..5bfc92fca138 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2384,8 +2384,8 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
     if (!s->sas_addr) {
         s->sas_addr = ((NAA_LOCALLY_ASSIGNED_ID << 24) |
                        IEEE_COMPANY_LOCALLY_ASSIGNED) << 36;
-        s->sas_addr |= (pci_dev_bus_num(dev) << 16);
-        s->sas_addr |= (PCI_SLOT(dev->devfn) << 8);
+        s->sas_addr |= pci_dev_bus_num(dev) << 16;
+        s->sas_addr |= PCI_SLOT(dev->devfn) << 8;
         s->sas_addr |= PCI_FUNC(dev->devfn);
     }
     if (!s->hba_serial) {
-- 
2.29.2


