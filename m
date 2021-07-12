Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3143C66A1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:02:14 +0200 (CEST)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34wH-0004jp-W5
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oL-0005HK-8K
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:01 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:17601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oJ-0006rU-8q
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130440; x=1657666440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+EgUTahH6YCZijgaJWZ8Oat+gfoPTmnES7jz53Ebji8=;
 b=Z/xBzDnWUFgS3U7rawBU9xg+ZJvQ+9y4tggvUMZQA/A1w70dzmJimTw/
 2EO2kaYAPJk2KxRMH+qaBbcXSdiGTJGccPC03S5lHGPLF4XjKin9mQh4L
 tSScmnFiYXTJF5bDjvPHM6wgpf6nl0nApRflWirUBfS29O+Yf9gfG0anD
 dLgWl7EcWeoxponsLf8wUfQyP9VMjonCJl+9vfn53crPCf/lHCBXaW7kE
 RCDGAjABehu1kxKGZb1uwIOvWRXsKDvh8bf0NvCT5/p9trp/pfneB5+3I
 HAsQ0H99/XmYKaWHTdzT4Dsv4HgNO5lm46fDnMfpKw19TW3ScBGEL5Uwz g==;
IronPort-SDR: +twyEQ3jPKb/hSBeOLe3cOnHHzoJmglhkwFr4wWnJP3icD6ey26Gdy5fmRARtB2ChrbLRSbYeG
 Vibc5WfxNU8qET96HaexJ7RLBPNfvc9dYysgVfw4eBpdIo7dJhk1gXHToiLQTS0axsNsKWgimI
 1fFqf7JaN1Ix6jVhAKDvwFWycx0fy31LX2A0n0OW+MvW3CCUhvyggLjUcEYrJw8j+z2Gjoq5/E
 vrK0i97WUPaCiOR1KLcB+8weZhh8dILcYbqkWKfORghj0SZ0HIR4D8RifzTfPPkJDPA1eide72
 kXg=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973304"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:53 +0800
IronPort-SDR: D0fG5RijIDQsTuDyIdNy3ujfo1jUwGWaBURFPXmhd8De6AWfhxVV1VXeQ9gP94dMS+wxJTl/xp
 d5djXKoHFzwZ30DfaaUH2tkuqNotF3l/wYRwh07ce62k1ypPFlhdq33zSmYXk8TOlQ+iMQhPvP
 NlyQGIoYlYhE53NkZ2ZXGlj7QDUPkgyUAGCqz66lQyNJuozoXSR6t5lmiwx8MkyqNsMkbmt+Kr
 IP6TKT/ImlJX3YhV3LaBx88nh6CKzdsMuIqcTo4TN9XW8Nj+nDtsG6ZwDRQ7YP4IYM4o6ixruZ
 SsYTg70y+AFuKVlrkC0xbMeq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:58 -0700
IronPort-SDR: 74UlS8yJ3f7uIZgG0+GuaSnZlOnTPKhR63xVxijGeuRbLzXLVY7ggGCGeSMgJ6pVvq2BHP1n3j
 QClmuQA2gqtvrb5UE/AqHtKy+u6SGB+6n2YxF7bk/ZKwngqrKNtAkJzxqkiJaXcHBJbz3UE2C/
 EXqmTmUrEs59za3lZF5RmOKbooCgHzN0d+qlkE8KewrSdLAt8Z9npR38v1jiSL4mxZj5hmem/s
 SsGFKwzIGQyGrBlN0RS4qETtosM+6Bzj48rRpJ8sT3FMOQJqCnPKavc65wjKQa/gET7PUbH7oR
 gWU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 05/11] target/riscv: hardwire bits in hideleg and hedeleg
Date: Mon, 12 Jul 2021 15:53:42 -0700
Message-Id: <20210712225348.213819-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Jose Martins <josemartins90@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jose Martins <josemartins90@gmail.com>

The specification mandates for certain bits to be hardwired in the
hypervisor delegation registers. This was not being enforced.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210522155902.374439-1-josemartins90@gmail.com
[ Changes by AF:
 - Improve indentation
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 62b968326c..b904d2bcb0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -411,6 +411,7 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
+static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                                      VS_MODE_INTERRUPTS;
 static const target_ulong delegable_excps =
@@ -433,6 +434,14 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
     (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
+static const target_ulong vs_delegable_excps = delegable_excps &
+    ~((1ULL << (RISCV_EXCP_S_ECALL)) |
+      (1ULL << (RISCV_EXCP_VS_ECALL)) |
+      (1ULL << (RISCV_EXCP_M_ECALL)) |
+      (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
+      (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
+      (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
+      (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR;
@@ -1039,7 +1048,7 @@ static RISCVException read_hedeleg(CPURISCVState *env, int csrno,
 static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    env->hedeleg = val;
+    env->hedeleg = val & vs_delegable_excps;
     return RISCV_EXCP_NONE;
 }
 
@@ -1053,7 +1062,7 @@ static RISCVException read_hideleg(CPURISCVState *env, int csrno,
 static RISCVException write_hideleg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    env->hideleg = val;
+    env->hideleg = val & vs_delegable_ints;
     return RISCV_EXCP_NONE;
 }
 
-- 
2.31.1


