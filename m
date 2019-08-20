Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDA958DC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:50:05 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyu4-0001dg-4t
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hzys6-0007wT-Tb
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hzys5-0004Qx-Re
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hzys5-0004QO-LB
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E8BC120ABB;
 Tue, 20 Aug 2019 07:48:00 +0000 (UTC)
Received: from thuth.com (ovpn-116-232.ams2.redhat.com [10.36.116.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA47B1001B09;
 Tue, 20 Aug 2019 07:47:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 09:47:44 +0200
Message-Id: <20190820074749.25208-4-thuth@redhat.com>
In-Reply-To: <20190820074749.25208-1-thuth@redhat.com>
References: <20190820074749.25208-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 20 Aug 2019 07:48:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/8] hw/dma: Do not build the xlnx_dpdma device
 for the MicroBlaze machines
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

The xlnx_dpdma device is only used by the ZynqMP AArch64 machine
(not the MicroBlaze PMU). Remove it from the ZynqMP generic objects.
(Note, this entry was duplicated for the AArch64).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190427141459.19728-4-philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/dma/Makefile.objs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 8b39f9c600..b672e7a522 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -8,7 +8,6 @@ common-obj-$(CONFIG_XILINX_AXI) +=3D xilinx_axidma.o
 common-obj-$(CONFIG_ZYNQ_DEVCFG) +=3D xlnx-zynq-devcfg.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_dma.o
 common-obj-$(CONFIG_STP2000) +=3D sparc32_dma.o
-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx_dpdma.o
 obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dpdma.o
 common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o
=20
--=20
2.18.1


