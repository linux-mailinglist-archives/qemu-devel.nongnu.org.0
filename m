Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F040A9B6FB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 21:21:10 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1F7V-0004pY-OP
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 15:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhA-0003NO-IW
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Eh9-0003Gm-AD
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:56 -0400
Received: from nsstlmta28p.bpe.bigpond.com ([203.38.21.28]:46511)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1Eh8-0003F9-MJ; Fri, 23 Aug 2019 14:53:55 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep28p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185350.JNRK9614.nsstlfep28p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:50 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeosgdrghgrlhhvrghnihesghhmrghilhdrtghomheqpdhrtghpthhtohepoehjrghsohifrghnghesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeophgvthgvrhdrtghhuhgssgesnhhitghtrgdrtghomhdrrghuqedprhgtphhtthhopeeophgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpeeh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C1D64; Sat, 24 Aug 2019 04:53:49 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:33 +1000
Message-Id: <9b9c6623010dc435ccfb725629d413ae7f65c7d9.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.28
Subject: [Qemu-devel] [RFC PATCH 12/17] hw/net: Declare device little or big
 endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/net/allwinner_emac.c | 2 +-
 hw/net/imx_fec.c        | 2 +-
 hw/net/lan9118.c        | 4 ++--
 hw/net/lance.c          | 2 +-
 hw/net/smc91c111.c      | 2 +-
 hw/net/stellaris_enet.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index e055a661c4..84b48b1774 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -421,7 +421,7 @@ static void aw_emac_set_link(NetClientState *nc)
 static const MemoryRegionOps aw_emac_mem_ops = {
     .read = aw_emac_read,
     .write = aw_emac_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index bd99236864..0f3dd7e8e4 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1285,7 +1285,7 @@ static const MemoryRegionOps imx_eth_ops = {
     .write                 = imx_eth_write,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
-    .endianness            = DEVICE_NATIVE_ENDIAN,
+    .endianness            = DEVICE_LITTLE_ENDIAN,
 };
 
 static void imx_eth_cleanup(NetClientState *nc)
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 8bba2a8056..498a6acfe9 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1308,13 +1308,13 @@ static uint64_t lan9118_16bit_mode_read(void *opaque, hwaddr offset,
 static const MemoryRegionOps lan9118_mem_ops = {
     .read = lan9118_readl,
     .write = lan9118_writel,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const MemoryRegionOps lan9118_16bit_mem_ops = {
     .read = lan9118_16bit_mode_read,
     .write = lan9118_16bit_mode_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static NetClientInfo net_lan9118_info = {
diff --git a/hw/net/lance.c b/hw/net/lance.c
index 6631e2a4e0..27dfa3a688 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -76,7 +76,7 @@ static uint64_t lance_mem_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps lance_mem_ops = {
     .read = lance_mem_read,
     .write = lance_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 2,
         .max_access_size = 2,
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index e574635969..50cd6fc140 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -760,7 +760,7 @@ static const MemoryRegionOps smc91c111_mem_ops = {
     .write = smc91c111_writefn,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static NetClientInfo net_smc91c111_info = {
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 3aca2a09f3..5dfd43b3f2 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -459,7 +459,7 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps stellaris_enet_ops = {
     .read = stellaris_enet_read,
     .write = stellaris_enet_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void stellaris_enet_reset(DeviceState *dev)
-- 
2.23.0


