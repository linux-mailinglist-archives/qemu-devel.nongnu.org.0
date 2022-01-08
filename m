Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C343488207
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:11:11 +0100 (CET)
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65sc-0000V1-BE
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fv-0002J9-8n
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:54:00 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fq-0006wZ-JW
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621233; x=1673157233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6PQ63XjsYFlAVu/rEAiBCYh3DSwkhM9DFV842/eHTdo=;
 b=DLkxjH5Jm/b1V25FZnnKw7YwEw/WCEKHkHO97Yc4nNpx7VkpssWxV3hS
 tDkL5i6sXi3hHK0aWhbjdsO5kTMrtlrr0x/Wb/JapF0hLitAYc9RzIfJk
 Y7JxhwT9cracie94jKWqqwyngbT37cTWB4PDerBFS5i5IZaPsxSDCABet
 eA6ReWEjJYD/KDGHvQShD4W+W4pXDdsaPjMgGjRiI1F76Aatin4t4xy9J
 qz7hUnecQnV1kFfZLd9uTPyTu/1jPQutIjCRGZdI1TKpHYrf2m/8X2Mfe
 4i7sn716zY92bCZipsPPu3xtIB6OaUreGZYOx91JiiJhqj+Ov4SZc28cc w==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984964"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:48 +0800
IronPort-SDR: D8lwiiuSMW7Plh8VHrQtm514VD5b9taBPGz9qiCa+/+QZ8BNnvWP+q80PfhVTcA72I2ExhR6tU
 TbR+Hy7UUtIYBA7LrhsPmyC9j+/6s35i3jDHvEFh9O14MYvqgHD7vdWlnL8GYdX58CRU1KsBf+
 AWMD7KOGkblN1LY9T1lnulWAwslVIXPz5aqCN05r8m5zcWp6AUl9k9jv9m04gkzYy/b8Q3/W9q
 S12JzRbpBh4mNt46zWB8XZRhE3pc1I2RyjfAotE7yQpFgpSehZxl3Plrfy3pCKALWfm5JnQzEC
 bZ0L+3WPBaMYO0dCX1+S0kko
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:26:16 -0800
IronPort-SDR: a77+LJ5YiOw4u2fKFF+/nKe8EX+NDKpegi3QXD41wE6uYyJcgcX4+jn42O8N9wS6/WwBAy1CXP
 bI6MEJHKtIuJV1mFgv1YjnbCWGAGdyhrZzwVjNw+8+/qrhW9FprHFIMLHGGqgJqfmDkESJ6wRv
 PMSLwY2LVCs0XGo4GtcKzwQFQ/7RnZ0tZ2RPRdelfx927oKMC7Wp8AcjOj8GamNmIkagqHiujp
 4AXBQg1GOA5/Bxg1wz870EdESTclBnY9YIlFyrtoAnDiHMAi/OKDJ76So5CB04XjeD4jZqVGqq
 siQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8R11r5yz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621228; x=1644213229; bh=6PQ63XjsYFlAVu/rEA
 iBCYh3DSwkhM9DFV842/eHTdo=; b=K31AtacpI3QT8tGYXMcYoAcx9+aCBogmHh
 gZxMa38Cx/ZjWG986THOkbZT3eKUaex1HZK7Fsw+D8E7/7k/1DWUFXB17sD3uJOw
 6KW0GVLQXg4ymH+iHH18XjuBqUs4qbKBTlQrauSDAur88tarT1qMluUwTRhHhNC5
 ZLH4VSn0ugvtNhbsd6dim2WmrRw+It0zm06zHkr52rRHQ/qNbeYicxOzNwychDij
 DpK6s2jrKnaPHoK8jX0JiaEvZOEe6PGvi5Ob1echV2KnJx402ry5urUpdtSD38nX
 YWifXdlIv6c8GlmXtkJ8A1HthE1ZpTFbyFIFFhJJfYiqcriZ5JSw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id E56zG6o55rIz for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:48 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Qx2wT8z1VSkW;
 Fri,  7 Jan 2022 21:53:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 37/37] target/riscv: Implement the stval/mtval illegal
 instruction
Date: Sat,  8 Jan 2022 15:50:48 +1000
Message-Id: <20220108055048.3512645-38-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

The stval and mtval registers can optionally contain the faulting
instruction on an illegal instruction exception. This patch adds support
for setting the stval and mtval registers.

The RISC-V spec states that "The stval register can optionally also be
used to return the faulting instruction bits on an illegal instruction
exception...". In this case we are always writing the value on an
illegal instruction.

This doesn't match all CPUs (some CPUs won't write the data), but in
QEMU let's just populate the value on illegal instructions. This won't
break any guest software, but will provide more information to guests.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211220064916.107241-4-alistair.francis@opensource.wdc.com
---
 target/riscv/cpu.h        | 2 ++
 target/riscv/cpu_helper.c | 3 +++
 target/riscv/translate.c  | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9ee01f761f..4d63086765 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -132,6 +132,8 @@ struct CPURISCVState {
     target_ulong frm;
=20
     target_ulong badaddr;
+    uint32_t bins;
+
     target_ulong guest_phys_fault_addr;
=20
     target_ulong priv_ver;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ddacb8533a..434a83e66a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1038,6 +1038,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             write_gva =3D true;
             tval =3D env->badaddr;
             break;
+        case RISCV_EXCP_ILLEGAL_INST:
+            tval =3D env->bins;
+            break;
         default:
             break;
         }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9e4f9c3342..615048ec87 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -208,6 +208,9 @@ static void generate_exception_mtval(DisasContext *ct=
x, int excp)
=20
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                   offsetof(CPURISCVState, bins));
+
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
--=20
2.31.1


