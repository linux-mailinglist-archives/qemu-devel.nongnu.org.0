Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42E14AE0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 15:25:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNdcf-0000zW-R5
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 09:25:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ysato@users.sourceforge.jp>) id 1hNdSO-0001fa-HB
	for qemu-devel@nongnu.org; Mon, 06 May 2019 09:15:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ysato@users.sourceforge.jp>) id 1hNdSN-0000Ip-2B
	for qemu-devel@nongnu.org; Mon, 06 May 2019 09:15:00 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:58693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ysato@users.sourceforge.jp>) id 1hNdSM-0000IF-P0
	for qemu-devel@nongnu.org; Mon, 06 May 2019 09:14:58 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.vps.ablenet.jp
	[61.195.96.97]) (Authenticated sender: PQ4Y-STU)
	by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 1DBC411A3B9;
	Mon,  6 May 2019 22:14:58 +0900 (JST)
Received: from ysato.dip.jp (ZM005235.ppp.dion.ne.jp [222.8.5.235])
	by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 8E04B240085; 
	Mon,  6 May 2019 22:14:57 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 22:14:42 +0900
Message-Id: <20190506131444.120869-12-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190506131444.120869-1-ysato@users.sourceforge.jp>
References: <20190506131444.120869-1-ysato@users.sourceforge.jp>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.224.55.13
Subject: [Qemu-devel] [PATCH v9 11/13] MAINTAINERS: Add RX
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7dd71e0a2d..e9430b6c0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -272,6 +272,13 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 
+RENESAS RX
+M: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Maintained
+F: target/rx/
+F: hw/rx/
+F: include/hw/rx/
+
 S390
 M: Richard Henderson <rth@twiddle.net>
 M: David Hildenbrand <david@redhat.com>
@@ -1106,6 +1113,18 @@ F: pc-bios/canyonlands.dt[sb]
 F: pc-bios/u-boot-sam460ex-20100605.bin
 F: roms/u-boot-sam460ex
 
+RX Machines
+-----------
+RX-QEMU
+M: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Maintained
+F: hw/rx/rxqemu.c
+F: hw/intc/rx_icu.c
+F: hw/timer/renesas_*.c
+F: hw/char/renesas_sci.c
+F: include/hw/timer/renesas_*.h
+F: include/hw/char/renesas_sci.h
+
 SH4 Machines
 ------------
 R2D
-- 
2.11.0


