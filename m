Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DF39EAE4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:41:55 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPoY-0000uC-Md
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeK-0001z3-SW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeE-0004dW-NS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112274; x=1654648274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SICtJ+9ud8ZW16ZgMLmacpnUPl4RTQHgzsyoRDF5/98=;
 b=c/1yhSJLLyCWDESjS4LHBqfF0a4T5IWcTJE0lSDgU8AmQjrpsJMkSj7R
 npLjAUwEbQWpwppZJI7Kv6dLNJhjDI96DKkVjNLnIZy/F8Zhm33nGWDRV
 64iUy+20kJIcLdwd+eDs9NjPLiYclPtitiMRcgPBb2bI6+7GTamfq7Dk3
 J2ALPEVPGfj+SRRdDZeDh8H/0077i/+HIOcks1+PKYBPSSbQCNKqnZjm9
 TFQNgVzl8798tuw5WXX3xL90BaJ9qazR7m5MURHW5bEe1SFB4odR+tinR
 tJWcpAseiL+8WHgMm34w0Tord0v4lrvhmG2qI3PbCfPzqB8E85/0Tqie8 A==;
IronPort-SDR: R89lbSc1tWY9KJvK5nv7Hau6M5iLa3cWV2BjJP5PN97fPmi8NjG+VPz1HRMjoRFJhZYjUvR80O
 MdR5h3L2hGjxnflfp4ONGvohqWNgiyOdzfzUicl/bGk/ZbLKx4fur+0mE6N7Y0YRiDEsqhc3OB
 gR3B51tvtcb1jmQe2pJvvgH8j9+13ld1xVVSnW6Po19UOIRjOsUBao4u3LoFK9UgHSKhhAQKeV
 5mYa5JVWc4It5LhgWRUPa9xRAo7Dfs7pA/4KK+XU8fJ2quT5w/j09j5TJsp5zmOxEpwuHbbB4a
 dxU=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087394"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:03 +0800
IronPort-SDR: v3F5BTMb9/eyfnNQEAgXbLronzbLrA14oN9TmgyQY/YpEUQQpF90E/gs7FHXMuBYlO2BhXCfai
 LoCdRgCwRiM9ZYfh6cM2YPO4iaOGxRAyZF5GtHtp6TQB2K7fpiZtDQr7/ut+WqvFQSs26SGows
 mD2yxRDWpK1tHyI/qg33aczC2hxiFfWX8RMRjpKWgX2rvGXlNrpgYfLkaJz+bnR8TuQzrWYnag
 hgeHdaCQOCobTNTIbWe+X5iL/iwa4qHYG9j371iOP7V8FmWoLfyDnj5JxacaobIedulLmAsF47
 5BekTGDZcyR4bXPCLOQ05SKL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:09 -0700
IronPort-SDR: NNmPE6c7xv432vtL4otLK2tZZehASVMDCtsKAPOs18oOjz4MXXi0THVdyjfO6k2K7MCFXwe/ny
 VRRaTUHyRLSimUIJXnJ1t5sbMlKc3trsvEeM7JQrh50rVQj3lKdVmUTK9cQ9tkfqUxIjKpsTTN
 hmIJMiH6iMcZb29HmJ0iZsL2gCcIMmwtheI2i+ku2ybfPB08Zl68aDB8yWTJCm5/M+6SkYGQxb
 le/7nKzzh7DyTZgffK4lQ85Xj/SKXjxvT9hDt7Hin6bHiMDP96/BgTLSzG9vJA0xywG3UV95xG
 y/0=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:59 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 16/32] target/riscv: reformat @sh format encoding for
 B-extension
Date: Tue,  8 Jun 2021 10:29:31 +1000
Message-Id: <20210608002947.1649775-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210505160620.15723-2-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8901ba1e1b..f75642bb0d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -23,7 +23,7 @@
 %rd        7:5
 %sh5       20:5
 
-%sh10    20:10
+%sh7    20:7
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -59,7 +59,7 @@
 @u       ....................      ..... ....... &u      imm=%imm_u          %rd
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
-@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -125,9 +125,9 @@ sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
-slli     00.... ......    ..... 001 ..... 0010011 @sh
-srli     00.... ......    ..... 101 ..... 0010011 @sh
-srai     01.... ......    ..... 101 ..... 0010011 @sh
+slli     00000. ......    ..... 001 ..... 0010011 @sh
+srli     00000. ......    ..... 101 ..... 0010011 @sh
+srai     01000. ......    ..... 101 ..... 0010011 @sh
 add      0000000 .....    ..... 000 ..... 0110011 @r
 sub      0100000 .....    ..... 000 ..... 0110011 @r
 sll      0000000 .....    ..... 001 ..... 0110011 @r
-- 
2.31.1


