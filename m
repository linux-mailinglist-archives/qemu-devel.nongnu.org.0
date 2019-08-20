Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA5958E8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:52:03 +0200 (CEST)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyvx-0004a6-U4
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hzys5-0007w3-Qy
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hzys4-0004Q9-Ox
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53774)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hzys4-0004Pg-Jh
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 164241FAA62;
 Tue, 20 Aug 2019 07:47:58 +0000 (UTC)
Received: from thuth.com (ovpn-116-232.ams2.redhat.com [10.36.116.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A419100195C;
 Tue, 20 Aug 2019 07:47:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 09:47:42 +0200
Message-Id: <20190820074749.25208-2-thuth@redhat.com>
In-Reply-To: <20190820074749.25208-1-thuth@redhat.com>
References: <20190820074749.25208-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 20 Aug 2019 07:47:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/8] hw/Kconfig: Move the generic XLNX_ZYNQMP to
 the root hw/Kconfig
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The XLNX_ZYNQMP config is used in multiple subdirectories
(timer, intc). Move it to the root hw/Kconfig.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190427141459.19728-2-philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/Kconfig       | 3 +++
 hw/timer/Kconfig | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index 195f541e50..dbae1c0852 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -73,3 +73,6 @@ config XILINX
 config XILINX_AXI
     bool
     select PTIMER # for hw/dma/xilinx_axidma.c
+
+config XLNX_ZYNQMP
+    bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 51921eb63f..eefc95f35e 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -34,9 +34,6 @@ config TWL92230
     bool
     depends on I2C
=20
-config XLNX_ZYNQMP
-    bool
-
 config ALTERA_TIMER
     bool
     select PTIMER
--=20
2.18.1


