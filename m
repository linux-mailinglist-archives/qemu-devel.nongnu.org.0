Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335A99D18C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 16:22:19 +0200 (CEST)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Fsw-0005z5-6n
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 10:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fp6-0003xB-No
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fp5-00083U-Mh
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:18:20 -0400
Received: from nsstlmta10p.bpe.bigpond.com ([203.38.21.10]:57504)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2Fp5-00080C-36; Mon, 26 Aug 2019 10:18:19 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep10p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141814.RFAT6772.nsstlfep10p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:18:14 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoehjshhnohifsehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehkfiholhhfsehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehmrhgvihhtiiesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeoqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpedt
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D2D11751058886B; Tue, 27 Aug 2019 00:18:14 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:28 +1000
Message-Id: <2a1a5d52f1d6a44151e2e486653d47835151e649.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.10
Subject: [Qemu-devel] [PATCH 02/19] hw/block: Declare device little or big
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tony Nguyen <tony.nguyen@bt.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.

Then, on inspection:
- if ununsed, re-declare as DEVICE_HOST_ENDIAN.
- if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
- if just a bit bucket, re-delcare as DEVICE_HOST_ENDIAN
- if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
- if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
- if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/block/fdc.c     | 4 ++--
 hw/block/onenand.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index ac5d31e8c1..2745586982 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -984,13 +984,13 @@ static void fdctrl_write_mem (void *opaque, hwaddr reg,
 static const MemoryRegionOps fdctrl_mem_ops = {
     .read = fdctrl_read_mem,
     .write = fdctrl_write_mem,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_HOST_ENDIAN,
 };
 
 static const MemoryRegionOps fdctrl_mem_strict_ops = {
     .read = fdctrl_read_mem,
     .write = fdctrl_write_mem,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_HOST_ENDIAN,
     .valid = {
         .min_access_size = 1,
         .max_access_size = 1,
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index fcc5a69b90..95fc0443d3 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -771,7 +771,7 @@ static void onenand_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps onenand_ops = {
     .read = onenand_read,
     .write = onenand_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void onenand_realize(DeviceState *dev, Error **errp)
-- 
2.23.0


