Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B2F9B902
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Aug 2019 01:44:39 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1JET-0002Vo-Hx
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 19:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JBa-0000XH-3R
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 19:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JBY-0008SY-EB
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 19:41:37 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:59157)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JBY-0008Ru-2R; Fri, 23 Aug 2019 19:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566603696; x=1598139696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HWUFyc+Fo4+HWuoDJwp3NzT6kozLzmjT+cNqe5l9dO0=;
 b=J5g8e/8YGdjnDBUczMpGZ2IGWJSdY18dI3tc1eEOCaT1/5vfUHZYKHqv
 ibfJSPbGYz/7tx+aiaK4TB0ZYjREtKwhYA0sWIdjdKSTO4I1pvJrDRAdk
 CNefMO978e1Mh1o2ieeS0nBHOl930I4fAo5h5r40VNC4D597/ECng/YDy
 GofRDgXcvbonk5fdp9EMY1qHHLgTH1NXOK8fQJCFouasJUs0dJXbddr2b
 yEDhoq+chHZrOYw73fVEEn+qM1m9BNoXZCHIrDoBbbK4hkX3ZNQDH0vNl
 YSfFUZcOe8XW6UzWjsHldSneTqUpKPcq/ldFjpihrNiou+Mpj03BgxN41 w==;
IronPort-SDR: IwrwJgtrkT8BwUryDoKWoDHNwz0soExqc9msDyR6Zw7KCScjWg/sP1UpkszNqbiZ6Pr5NPC3uK
 P/k4VR9icdJ17P6bwK+1756BXQn1ueAoTV6Dx91hgKdN2qEBOt2tbkRGJeiw9e3XKUMQY5qNah
 0y5BhQskwvXO0y5tgIOT5hgEYBRsgSI6pAKjVCLBa5Hs9ehBm5odPNmSNWephhx1jjh3v4FWYx
 80pHEKL4EIulAgaq/QTM0ozB5HO6iCmMAbNWuaZXJqrJfKK4yOUSu3yanRn9H3Hk3KQ+05JoSN
 52M=
X-IronPort-AV: E=Sophos;i="5.64,422,1559491200"; d="scan'208";a="121144249"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2019 07:41:33 +0800
IronPort-SDR: tDVVS8DD1EfYJfjgvKTiMTxrvgdeLZLn55RVhQIoo/q3Uq1F+bGdwxQUS54KQXHHCP1DkFrmRV
 Mvzlmbw4DjkN/1MVM81I2Qt57aFGENfg4L44eucxUd10/87GwHP7yJv6J+53TFsY7LmXQV/lTT
 RabmGdRIhjURf1t5hbeEiolBaE/NbDAs7qfbs7YGx5Uoho38P6ClNjQ64lIQG2T31kcrnhwE5+
 vJhzAXd2Z1Ux2Mza4qw4r96DEO9hwqjGXe1TiEMu1VD+HwC4LSQhnsng2ENg3py3Qw8d5O888Y
 /T6ugC0QUnGicOXQwI1gt6+M
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 16:38:50 -0700
IronPort-SDR: VHoc3CLz3S9RsCWJR2y5gQij7bRDOc8Sphp9y+6ULj570siKSeLsgTcIXCGWR3Z+xMGWT8TI5S
 KvnfFkfk725Vm3+EDLGagbN/sK8P38nqkfRVAlyjHNSFONphnLtcM6ipodiVomX0ff7WT79Sr1
 nI5JsauU2K8fuaECk/pXWuBfTOWPDzy8NdIRiK+mr/FkbEV7LRpc4ow3VrJ6JWqfYVsOpdRtkr
 oA0kD5Qg/fZ7yuE/qrOBvREaPjJlmAl/lw1lLjqt3VkNpcLgGgvTE4z17xxTHlFTkxOqS/icJo
 5hQ=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Aug 2019 16:41:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Date: Fri, 23 Aug 2019 16:37:52 -0700
Message-Id: <008eba3fe3b65cc5d37a1ced51d3631b23bef330.1566603412.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566603412.git.alistair.francis@wdc.com>
References: <cover.1566603412.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.153.141
Subject: [Qemu-devel] [PATCH v1 01/28] target/riscv: Add the Hypervisor
 extension
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
Cc: alistair23@gmail.com, Anup.Patel@wdc.com, palmer@sifive.com,
 alistair.francis@wdc.com, Atish.Patra@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 124ed33ee4..7f54fb8c87 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVC RV('C')
 #define RVS RV('S')
 #define RVU RV('U')
+#define RVH RV('H')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
-- 
2.22.0


