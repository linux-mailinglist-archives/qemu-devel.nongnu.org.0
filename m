Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E481C11744A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 19:34:35 +0100 (CET)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieNre-0004xv-I5
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 13:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNam-0007Kp-1G
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNak-0007Qw-Vr
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:17:07 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:52960)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNak-0007PQ-OI; Mon, 09 Dec 2019 13:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915426; x=1607451426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aGs8STi+UYS3gVpX3cGTtqnOz2SPlJMhPqFXkU5A5GI=;
 b=jUZ5PPUSXK3dZHBWWuA2xAdC2W7N5SyuvTr/djjZzBHwG/8z6wjdmMj3
 SK13/dtj6wVgnN0KEkD1Q5jhZvWyfF6kIflNZi1jj6lPEnHGhnAtzD7dW
 hh5TTTY8A45TWuQtdwK1GKw38+C06bgvGhjEWSBkq/hCcw5MXMop/z8hy
 uEXz8jdFbD/SPha2V7IGg5qDYl8KBUPr6Pdg+0CLBDNKT1lCbItd2jyQY
 iuguOHwEDFyEEqzNzO61KZdBGhhz3YqjY0SSEn702n3NrZsjNICk9Ax8n
 RxNi7ZzJUvrFUmyu6Z3E8NYqJVu3iEFO3O8Pn40QGq40uF14JFmxgik3L g==;
IronPort-SDR: TSYqHl1zbfE4hS4iWd6izqwHKyTRbtgV6OtRJD5RJZYwiEQ6chqMVxGo7jJWaNzexctgNlL4Po
 lpj4GL1hjl+oYCqcUlC8UozY3VYzhrQlrlCGyaMz5Hnq8R9tYkQdVHqckPgDuPvv58HuCdNMwn
 RRrBhdYeoJm+AwvjCjZtu4wSQC4gsfZFnycBlJx70MyjNEhSSkVGs6oPwRrUTExaTWsu8lxdZS
 Ec2yzRH2G/H55c2xj9pePFyaEuD2Ttg4ruF7rvsz5ogF/PbdWx6nTHxG8zrY6S7axxikeolnfT
 xG0=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="124925571"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:17:06 +0800
IronPort-SDR: CkDh//JFXkKdz3yV+Ld+PW2rD/blNZ8t66OTxEnsOUHFJ9tbZXm9GzCkNenPJjRt2KQNhKRx4M
 CehFkg1IUxLXeRWnF8PUcQ2GNPKeCCbopLzxPBoWi1iFz5cS26neXmuHM1WA1IX5hRG19DJSxz
 6lNdD42GXMmOGiphcnaff/33VFwgXbr/E3UNFFW7rseGzRs8yerpSdGbO4dHt7MfbqC6Y6TB34
 h1gH5N2VrcY8stnAENDhof0pdMS5KxMPe89F1WNLnCPy8Os28y0OkLaSQ3dvydSSFIb5PmL/oO
 bkm1Xx4HzDdIU4VazRVH3ArH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:11:44 -0800
IronPort-SDR: J/y7U3lKLtqCZ0QvgO/j0jMBFNKEhPp3jWewNfuqJh0Dwa+JiOEx3eVEo5ySdCzix4KmQatuHI
 z2GcdEsi59U6l36C5xRz8BFtJGJAxPEGcDFtYCxQgwSLib53ORHpJCT766t4M0GCP49PWgN8/S
 vQomQ28ZNuc0KlVnhgilXQsN4hAFa03h0GABO46hF3XENkCc+dpioxSUbDWtgtxNMj2xy0NxyN
 Ee0hjj9nueMEA56xE+0s5Fw2SzRTmQnC3/F8DPQLqMYK5qMeA27ktPVIlLNXS2085dgqAQ3RIL
 NMI=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2019 10:17:07 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 17/36] target/riscv: Set VS bits in mideleg for Hyp
 extension
Date: Mon,  9 Dec 2019 10:11:24 -0800
Message-Id: <b1313a76928acfe101247e33248f000e1f82f558.1575914822.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575914822.git.alistair.francis@wdc.com>
References: <cover.1575914822.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.42
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a4b598d49a..fc38c45a7e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -449,6 +449,9 @@ static int read_mideleg(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_mideleg(CPURISCVState *env, int csrno, target_ulong val)
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
+    if (riscv_has_ext(env, RVH)) {
+        env->mideleg |= VS_MODE_INTERRUPTS;
+    }
     return 0;
 }
 
-- 
2.24.0


