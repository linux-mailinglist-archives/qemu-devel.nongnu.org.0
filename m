Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE465E72D1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:22:14 +0200 (CEST)
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaCa-0004zB-DT
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyR-0001hq-1C
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:38 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyM-0005dr-VC
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906050; x=1695442050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NSdLJUes/A5o/LxxgY5E+Ys07xPrASvSUN2mRI+b+Tw=;
 b=Gx8qyD6tzDp5gh6e3nO4/2ktK1Vngu3s267brVZ84CrbyPFE7zU8YggQ
 fweKKXx9N/eJ23vGRu6Dw+IJymELXFDV1kV5LhbjCFxsLnTJ7pYwW/d0f
 SpUw+LgKJzRpFKCA2lNSVAiav8Qjwca8mJcThASikMutyWnOB1mNGPFEQ
 zSwA1efbyoifVTrclhVxtuqwOh9Mg/jskLYjHtpRKVxvQozhT3IMqBVkH
 9La8x631EB9vtp1/3aCb4XMiuAukYEW48oKtEFvVX5gmkFsX1GXAj7mB4
 nO+guW1ijMA5Q6c7Uxjl9wgE4PTwQ4FgD7HI2E8arckvgK+HZWRlVKZmB A==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; 
 d="scan'208,217";a="212510473"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:30 +0800
IronPort-SDR: I+dJy7LTbnkRebHsd/B9KBQFiNkPcjhak+9IcaWj3Xj+B+8J/xr6BnO0VRPJ4nXBcEdaLasazJ
 zfeb+powIVQ0oXn+eDGSarI5rvcb2nGfjQdNGQobP3Blf/QITJM09RPKP7YdyY0n5DVvrVz4oq
 FDcmJkr18R8MwZxBmT7iFcsAkvjTxJNnhnuNY3JGlya/7IMDWX/+XNfFpZKoJF84oi46EF/r7S
 uKHXpBUKBXW1aPM8n/Q2rz9eAXunXqHon5QGuE/+xgusj6DGTW/F/1LdmBkgEUQQmi25QR3t+q
 iGGxFXM98X6D6cm5D3qnCbFX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:32 -0700
IronPort-SDR: veny4s3IpDrzjcSeyZ+Q5iumWORpXq7OHXWTqrPAmPegdWS2GDxY4JotMndIzFquBBS9dPUtk5
 6CnpNF4f1pD0EKSQn0xmwaSg4CfgFG/YNSji5NnBwYkzfUJoHX+ZPew/rwbxuovCTNdFoLF3j2
 HmZu7CTGzGwlQ1GpK1fp8v3f5TCgYsCEvZIQHL83KgknzTsYQezNZMwKg9hPPeESToUQLw/8db
 ZTDTbabxJNpYzJGalXf1dl5aHO47gp0zOiEaq1Vi/sxn/NZ/DcR6UqWpYdI1siHPJYBuNLniLO
 clE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdsG0C6Sz1RvLy
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906049; x=1666498050; bh=NSdLJUes/A5o/LxxgY
 5E+Ys07xPrASvSUN2mRI+b+Tw=; b=JaSr8/Je9Gdjor2x6Cy01mnJ7+zkolIHxK
 ogBnrOo05FO/uRnm6zrZKsjMxgugBU1GCYV3RMffQtghBainJhDRtbXpbiwnq2vb
 L0GLWtm8RJEoDLg052Q6+pIbc+NaREBWYrx7OEYAzdTROZgLTkMN2POB+b25aV3u
 i5zLXvSXqEm36jPJWPCoG42gXMcp8zrHqxlMalJlRbdaMYbmgfRxqLG9vAcGk7ZJ
 mj91QVXrtG/UKOIuaiTRpvenpYk9TeXD0DwveghvPmxtVwXgbiMI5j6mNSBwTJQK
 kFgx8y9YqmQcxNQBBLeEOiV4FtNRGfQ3aGJxaBqVHv0QTJtwhWjQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iFIDyVTXZOnO for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdsC4cN8z1RvTr;
 Thu, 22 Sep 2022 21:07:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Andrew Burgess <aburgess@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PULL 07/12] target/riscv: remove fixed numbering from GDB xml
 feature files
Date: Fri, 23 Sep 2022 14:06:59 +1000
Message-Id: <20220923040704.428285-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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


