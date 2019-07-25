Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F161375754
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 20:56:20 +0200 (CEST)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqiuZ-0001Hq-Kv
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 14:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52857)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=10276a3d6=alistair.francis@wdc.com>)
 id 1hqitU-0005af-Fo
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 14:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=10276a3d6=alistair.francis@wdc.com>)
 id 1hqitT-0007aW-D3
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 14:55:12 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:59981)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=10276a3d6=alistair.francis@wdc.com>)
 id 1hqitT-0007UQ-0k; Thu, 25 Jul 2019 14:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1564080911; x=1595616911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MOiwMCZH7VblNcekKrXYrbsMtdS5u3vpV5/6E1Fd+4s=;
 b=qwBRLA+ktWqgGob80s8BU74Zqajd3ZkvtTDQb3eWv2Q3ZgE0RH7cA+X3
 YngQOcq6eMQiubRi3SciuhjnWvs71bLvTzjsQYcgVQ4+vLWDjrsFYwkST
 5jcOm8pxK/TPT3hnfBdHZpjavJm/NMo8dSMvX6GkPe6DdeeGxVshAo5ZQ
 v9/zZTFnlFUN0dbGN++SXnc7F6TVoCjOItqoECgI463YAO6XFaXKIRA6j
 ZsO5bDBfZCPjxdZxVHOn9hJliwNJ4TW6zJFUmub5kgip9o3cNsVcdU7rC
 W6VejEQ/pdBH5InPsgwXV558oLjCoccFZ4RbmSHesiedSkQIeXfbRVkEn Q==;
IronPort-SDR: NXDXv/h8Y+4qr7JWq/NdPdLNbOB+v62MMcwkw0FqoIlSBclor/ROq/i0fZ8HS9bYDsjkkK1LCv
 I9FrPCJ7dz2QpU6PWnAgW9UDx6+sSeek86F+bjiHWGWS4ErD6w7rlV9KjvwmtUl0vGLPfkYLtv
 EqPgnlixkA3uhpM/k96tZFXk6Af7LUOw2FbORLY7mVzK+iWVppQ1+iD78FdEUPlkC+ZSqfGiBq
 nNevnMKYXyvCgVqPMgOX4bLmoe86wyddaAWL3Z/f+ICnHrH3rbeWMQ5GPIEBE8lovBvepGVFvN
 O6M=
X-IronPort-AV: E=Sophos;i="5.64,307,1559491200"; d="scan'208";a="220533142"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jul 2019 02:55:08 +0800
IronPort-SDR: ES/oSsBTFNxlKR+5UrkLynqabZwrdo00iyah+C9WDDMnOkaLv6aDkGFPHW5lE/cMLDlabaUU4f
 e9dDuisCPas/+5R4apTyxbUmm7vgfouUsndNYPOL7Pxn5vfR3RTiH+hqNmzvc2vD0/INm1RkUw
 xeBQ87qi6HvizsYlaTI4lzZUaKu9ZpAvAWr6vT+rs2CjHD7z4vP4S+bJSJOJPcJJLNbizJ5/LL
 QsZ6r8w3yd7fF15q5xpWEY6ETn+ezRWRjg1qdCCP1b8cgJWf/Krwl2ExmiZpDgE2sFrhQsvuwh
 OV96ffWroiOoEU2TOY0r+mHb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 25 Jul 2019 11:53:19 -0700
IronPort-SDR: VTMK7LE49QEChJhBSdtvqnmI/jYWooUGoJ0JY9e9/FN3xDZEOOsqhNVehHqGb3vARG9zCer3L8
 Wx4FhJ5Gnyy069GvcwzDVz4kmdWrdy1c/CaC5vIHBCmPfTzRXnSjQ2yT3u0EiJuvSaBO/ze9S5
 pe2VyppP35joLp+EsCBtr4b3ldBsOAUl1RDRFO7Q5BrQLrVco58FVzw7986eg/mRukUu0ivyzx
 KKvm+atP2NQhM8/jsnhcwxBdNQnsNe5YgtCl6HAIBJ8vJKDThKSHv0O12hBtjdyG9sE1meNwfZ
 SNU=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Jul 2019 11:55:08 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Date: Thu, 25 Jul 2019 11:52:04 -0700
Message-Id: <b415f5b51e09418760b95e5c73fad5e68b97f173.1564080680.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1564080680.git.alistair.francis@wdc.com>
References: <cover.1564080680.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 68.232.141.245
Subject: [Qemu-devel] [PATCH-4.2 v1 2/6] target/riscv: Remove strict perm
 checking for CSR R/W
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
Cc: alistair23@gmail.com, palmer@sifive.com, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The privledge check based on the CSR address mask 0x300 doesn't work
when using Hypervisor extensions so remove the check

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0d4586760..af3b762c8b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -797,9 +797,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
-    int csr_priv = get_field(csrno, 0x300);
     int read_only = get_field(csrno, 0xC00) == 3;
-    if ((write_mask && read_only) || (env->priv < csr_priv)) {
+    if (write_mask && read_only) {
         return -1;
     }
 #endif
-- 
2.22.0


