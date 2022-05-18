Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DF52B8AA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:29:35 +0200 (CEST)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHry-0006b0-O0
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHYQ-0004ja-Mh
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:09:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHYK-0007IU-9t
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:09:17 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHXF-000AVy-Sz; Wed, 18 May 2022 12:08:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 18 May 2022 12:08:39 +0100
Message-Id: <20220518110839.8681-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 6/6] tests/acpi: virt: update golden masters for VIOT
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Differences between disassembled ASL files for VIOT:

+++ /tmp/asl-V69GM1.dsl 2022-05-18 10:22:27.239796759 +0100
@@ -36,11 +36,11 @@
 [041h 0065   1]                     Reserved : 00
 [042h 0066   2]                       Length : 0018

-[044h 0068   4]               Endpoint start : 00003000
+[044h 0068   4]               Endpoint start : 00001000
 [048h 0072   2]            PCI Segment start : 0000
 [04Ah 0074   2]              PCI Segment end : 0000
-[04Ch 0076   2]                PCI BDF start : 3000
-[04Eh 0078   2]                  PCI BDF end : 30FF
+[04Ch 0076   2]                PCI BDF start : 1000
+[04Eh 0078   2]                  PCI BDF end : 10FF
 [050h 0080   2]                  Output node : 0030
 [052h 0082   6]                     Reserved : 000000000000

@@ -48,11 +48,11 @@
 [059h 0089   1]                     Reserved : 00
 [05Ah 0090   2]                       Length : 0018

-[05Ch 0092   4]               Endpoint start : 00001000
+[05Ch 0092   4]               Endpoint start : 00003000
 [060h 0096   2]            PCI Segment start : 0000
 [062h 0098   2]              PCI Segment end : 0000
-[064h 0100   2]                PCI BDF start : 1000
-[066h 0102   2]                  PCI BDF end : 10FF
+[064h 0100   2]                PCI BDF start : 3000
+[066h 0102   2]                  PCI BDF end : 30FF
 [068h 0104   2]                  Output node : 0030
 [06Ah 0106   6]                     Reserved : 000000000000

@@ -62,6 +62,6 @@
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 03 00 30 00 00 00 00 00 00 00 00 00  // ......0.........
     0030: 03 00 10 00 00 00 10 00 00 00 00 00 00 00 00 00  // ................
-    0040: 01 00 18 00 00 30 00 00 00 00 00 00 00 30 FF 30  // .....0.......0.0
-    0050: 30 00 00 00 00 00 00 00 01 00 18 00 00 10 00 00  // 0...............
-    0060: 00 00 00 00 00 10 FF 10 30 00 00 00 00 00 00 00  // ........0.......
+    0040: 01 00 18 00 00 10 00 00 00 00 00 00 00 10 FF 10  // ................
+    0050: 30 00 00 00 00 00 00 00 01 00 18 00 00 30 00 00  // 0............0..
+    0060: 00 00 00 00 00 30 FF 30 30 00 00 00 00 00 00 00  // .....0.00.......

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 tests/data/acpi/q35/VIOT.viot               | Bin 112 -> 112 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
index 9b179266ccbf84f1c250ee646812d17e27987764..275c78fbe8e93190321d957c91c3f17551f865d4 100644
GIT binary patch
delta 10
RcmXRYnBY1wR(PU=1OOI`1E2r^

delta 10
RcmXRYnBY1wR(PU=1OOI`1E2r^

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8367ffe1d4..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/VIOT",
-- 
2.20.1


