Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC441B7DB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 16:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQBiX-0006EW-2g
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 10:14:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3Sw-0000dy-KF
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3Su-0006Nz-KU
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:34 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:56161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3Su-0006M4-9a
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:32 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.vps.ablenet.jp
	[61.195.96.97]) (Authenticated sender: PQ4Y-STU)
	by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 60A7F42346;
	Mon, 13 May 2019 14:25:31 +0900 (JST)
Received: from ysato.dip.jp (ZM005235.ppp.dion.ne.jp [222.8.5.235])
	by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 1E6C5240086; 
	Mon, 13 May 2019 14:25:31 +0900 (JST)
From: Yoshinori Sato <yo-satoh@sios.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 14:25:18 +0900
Message-Id: <20190513052518.6274-13-yo-satoh@sios.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190513052518.6274-1-yo-satoh@sios.com>
References: <20190513052518.6274-1-yo-satoh@sios.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.224.55.15
X-Mailman-Approved-At: Mon, 13 May 2019 10:11:53 -0400
Subject: [Qemu-devel] [PATCH v11 12/12] MAINTAINERS: Add RX
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
	Yoshinori Sato <yo-satoh@sios.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Yoshinori Sato <yo-satoh@sios.com>
---
 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66ddbda9c9..1599eb6a72 100644
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


