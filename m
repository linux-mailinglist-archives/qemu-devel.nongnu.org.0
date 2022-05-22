Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F005303FA
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 17:57:16 +0200 (CEST)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsnxD-0008K8-90
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 11:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnr2-0007YE-7Q
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqm-00084t-RN
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2a3LRylgA7FYve6ISDmrBg6axZPyUqTSB0+MhmI3M1E=; b=TkVn3jNco3fFJxBXAq6PeP4nTR
 eplC9ZOyusXTJU0IryLWsNn1UEOyRn1l8wAwiM6CH/Yd2zhQhBBmm1ms2tl8DhQZ+n1BDzLkHjRyI
 xz5OuHf6uADPIE7T97/SiLNRtM7+8BcBxtPysLrRftnd4HoJTs3OEYda9UBJrkSojqHwRgm6UyJiG
 twXmIhNYYV2T5AI8turkTYjrX0MDZk23Oyx898q4TfxxQpkec1xaR1i+E4GqcWcWkCbwADk8rCIL5
 lLrfjxiq+7+siP7cDEpiVqKZAeHrEn7zIlZX44/UZQIqgyKfLU5yc+iaFdtI4doQl/dVpION7np2b
 lOMDgsFt+AbYmppizOEHW4TA4QZh0eNDcUlI70oMKf80cLMU1jNmLI32M7IuRR9C2N0T+APdnbz0f
 yLootzQvQpCkAALJssVzl/49s5gkvtWvz1wJhlR4HN6Tvx35/EOKYOOjNMMbzfMaN4fmXsUb07v7r
 jGNolwXG/etJeQHBx3YxFuynrsdZ1OjHSroBEb7wu4Iljj8yJzueVFpvY58tDWMPXaw+YvcXaQ0v8
 EwRtsi84AGugziFLDc1RNdvlf03JDOn9fENB0m/p6h9otlFIu4zN52sbS3bxYCIVFpdlyD+tRPezK
 Wd/hCTpUxdzy+2vNQHAiwA487z554RsdgXi/QujJE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnpl-0006zJ-If; Sun, 22 May 2022 16:49:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 16:50:08 +0100
Message-Id: <20220522155008.21832-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
References: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 6/6] tests/acpi: virt: update golden masters for VIOT
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


