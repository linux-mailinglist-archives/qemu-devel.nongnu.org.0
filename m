Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFB5EBB0A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:00:59 +0200 (CEST)
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4aQ-0002XD-Fa
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47p-00054A-Ep
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:25 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47n-0001Ek-61
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260283; x=1695796283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NSdLJUes/A5o/LxxgY5E+Ys07xPrASvSUN2mRI+b+Tw=;
 b=D+UAt5TgiLwOebRK4miLeK+sT16guj5/i5h3IDQY3OFhERvMBdl5szao
 rzzBelZImgZTplbC7w6U0ng7kbbmfzN3qBG1ClqGzSKjEEiBwSK2YKKhO
 BuEErfM7qOryvrKat2c4gQ7tJgl+JON0p8XmbpVY7y1qXrxnDeqnaZ4gk
 avBU5g8HMJbzkeL/o/PFzCLvXXaXprF11m4ZHKmLB38laq+Fe/Beixd2P
 mEgL7KCopn8OSWRfTY5L5kMjjoSFj9AXiG70PaZ8pFRtRUBhkdO+N1li/
 LO7PLvffl1B8GBWdbC94TsMcw8iWG5Ssj80AUykkHs6TXHocRQlUspGR2 A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; 
 d="scan'208,217";a="217530837"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:21 +0800
IronPort-SDR: ky/TVzS7TCwEx3hwH1LkuoRQmEVCseIex0vBFT8p1XOxClab9+4Aqm2K1zUCmemV9Y4w0sw6PH
 OyM2ObzrdZwxLUZHaUPZA9NzqT4eqNUgxO0L0r4XXXwTHa7TmNOuVWkBnzGMqkmCXXMBK+GEtu
 WO7M7LOawB90GyX+UTbIM8oHemjthXOf9jano9c8cJtr3YEKcQ/4b0sd/ScT5Y3TE5yiIl0h4r
 Lcoos/Q2oaA8BsuF56vu9tRxnIa31+1astkcCdqA3+02spQKi0ANd79Xbiz0SdfxLpsaCG44FI
 Qf9Vn/1yXBrfPwIo4gUU9ad+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:18 -0700
IronPort-SDR: 6UadvnlFALCk8k4i48AduVs7lH7+s7szUUc6XgA3ItpUm3IEdyfqxEclenNSefmCR2y+H5OLMM
 485ai7AD9Mls8T4rKkdRliAD3AEfoZSJoQ6palV1rfM1lPEfRDWpaFlEx8Hb+jhQivipRo6oPF
 JuI5yDi7MKKnVgeP3w5cwldn5fcg7rRpDr/i0t1NyLUZPmlQNHT4UnS1QRIiEMKlwrG5JdQtI0
 HWYFO/hElGCPiYayXMTOJw9eFi5Onu0Ya5YE+/vKkuqF6RZdNMtdf2NxfpsM6jlK4VEfRd52hj
 e7A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sP0Qdgz1Rwt8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260280; x=1666852281; bh=NSdLJUes/A5o/LxxgY
 5E+Ys07xPrASvSUN2mRI+b+Tw=; b=iz7GUcMsxZlAWgFhX/s9qz4KUlmMPA7D+0
 dBigh1t7oPAYBmYTbxX/yIM9H7qQ4lLFdYjPWd65JsxMg8HcIAB6aMWEAHztEx1e
 T0RCGeO+/T48TqK+ipjA9XomNEF02DkUOAyuqRdyVozhqV9CubmdGo90YSMMLN8b
 GMOONJdVAfdj85MYJ8Ou3GHVuHXH6nEaCn/KS5EY4atrvtMNvNgmFXG0U8kwkpNy
 4ob+ulkWOijHz0Ox502Zhe9n37QjutHAPVV2ZDI+E1O1hbu8ROULhHjyCWQl6WM/
 5kuM7hB2Jrr2fHVe2K0JJ7nh49s3Vxha5zmiDSS2iRZappZYqFug==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3d6ho5fBK_Z8 for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:20 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sM0tXTz1RvLy;
 Mon, 26 Sep 2022 23:31:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Andrew Burgess <aburgess@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PULL v2 07/22] target/riscv: remove fixed numbering from GDB xml
 feature files
Date: Tue, 27 Sep 2022 16:30:49 +1000
Message-Id: <20220927063104.2846825-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Andrew Burgess <aburgess@redhat.com>

The fixed register numbering in the various GDB feature files for
RISC-V only exists because these files were originally copied from the
GDB source tree.

However, the fixed numbering only exists in the GDB source tree so
that GDB, when it connects to a target that doesn't provide a target
description, will use a specific numbering scheme.

That numbering scheme is designed to be compatible with the first
versions of QEMU (for RISC-V), that didn't send a target description,
and relied on a fixed numbering scheme.

Because of the way that QEMU manages its target descriptions,
recording the number of registers in each feature, and just relying on
GDB's numbering starting from 0, then I propose that we remove all the
fixed numbering from the RISC-V feature xml files, and just rely on
the standard numbering scheme.  Plenty of other targets manage their
xml files this way, e.g. ARM, AArch64, Loongarch, m68k, rx, and s390.

Signed-off-by: Andrew Burgess <aburgess@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Message-Id: <6069395f90e6fc24dac92197be815fedf42f5974.1661934573.git.abur=
gess@redhat.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdb-xml/riscv-32bit-cpu.xml | 6 +-----
 gdb-xml/riscv-32bit-fpu.xml | 6 +-----
 gdb-xml/riscv-64bit-cpu.xml | 6 +-----
 gdb-xml/riscv-64bit-fpu.xml | 6 +-----
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
index 0d07aaec85..466f2c0648 100644
--- a/gdb-xml/riscv-32bit-cpu.xml
+++ b/gdb-xml/riscv-32bit-cpu.xml
@@ -5,13 +5,9 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
=20
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name=3D"org.gnu.gdb.riscv.cpu">
-  <reg name=3D"zero" bitsize=3D"32" type=3D"int" regnum=3D"0"/>
+  <reg name=3D"zero" bitsize=3D"32" type=3D"int"/>
   <reg name=3D"ra" bitsize=3D"32" type=3D"code_ptr"/>
   <reg name=3D"sp" bitsize=3D"32" type=3D"data_ptr"/>
   <reg name=3D"gp" bitsize=3D"32" type=3D"data_ptr"/>
diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
index 84a44ba8df..24aa087031 100644
--- a/gdb-xml/riscv-32bit-fpu.xml
+++ b/gdb-xml/riscv-32bit-fpu.xml
@@ -5,13 +5,9 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
=20
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name=3D"org.gnu.gdb.riscv.fpu">
-  <reg name=3D"ft0" bitsize=3D"32" type=3D"ieee_single" regnum=3D"33"/>
+  <reg name=3D"ft0" bitsize=3D"32" type=3D"ieee_single"/>
   <reg name=3D"ft1" bitsize=3D"32" type=3D"ieee_single"/>
   <reg name=3D"ft2" bitsize=3D"32" type=3D"ieee_single"/>
   <reg name=3D"ft3" bitsize=3D"32" type=3D"ieee_single"/>
diff --git a/gdb-xml/riscv-64bit-cpu.xml b/gdb-xml/riscv-64bit-cpu.xml
index b8aa424ae4..c4d83de09b 100644
--- a/gdb-xml/riscv-64bit-cpu.xml
+++ b/gdb-xml/riscv-64bit-cpu.xml
@@ -5,13 +5,9 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
=20
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name=3D"org.gnu.gdb.riscv.cpu">
-  <reg name=3D"zero" bitsize=3D"64" type=3D"int" regnum=3D"0"/>
+  <reg name=3D"zero" bitsize=3D"64" type=3D"int"/>
   <reg name=3D"ra" bitsize=3D"64" type=3D"code_ptr"/>
   <reg name=3D"sp" bitsize=3D"64" type=3D"data_ptr"/>
   <reg name=3D"gp" bitsize=3D"64" type=3D"data_ptr"/>
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
index 9856a9d1d3..d0f17f9984 100644
--- a/gdb-xml/riscv-64bit-fpu.xml
+++ b/gdb-xml/riscv-64bit-fpu.xml
@@ -5,10 +5,6 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
=20
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name=3D"org.gnu.gdb.riscv.fpu">
=20
@@ -17,7 +13,7 @@
     <field name=3D"double" type=3D"ieee_double"/>
   </union>
=20
-  <reg name=3D"ft0" bitsize=3D"64" type=3D"riscv_double" regnum=3D"33"/>
+  <reg name=3D"ft0" bitsize=3D"64" type=3D"riscv_double"/>
   <reg name=3D"ft1" bitsize=3D"64" type=3D"riscv_double"/>
   <reg name=3D"ft2" bitsize=3D"64" type=3D"riscv_double"/>
   <reg name=3D"ft3" bitsize=3D"64" type=3D"riscv_double"/>
--=20
2.37.3


