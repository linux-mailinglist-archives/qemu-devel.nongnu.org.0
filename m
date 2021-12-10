Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF346FAB1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 07:36:33 +0100 (CET)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvZW8-0001hS-4Y
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 01:36:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN5-0005a8-1N
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:27:08 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:64254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN3-0006Fg-27
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639117625; x=1670653625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6wAGSI6QUZs5W11re+UV7WaEUxAjGogCqsZ8UfXLz34=;
 b=gGWdmPSDoZuCXG1Su9G8yVPM56Ok4ToPbWkthKWBug0WN3m0uBoqzJHX
 3OS5xhSi3zxLi8xvpqIPZ+yN+LpmiuC4pnR2qApRsrFjKd0ZtBnIH60sc
 azz4k3MNXwOJ5u/Uamai0yX3qJgv5rAzVdA5qJQ/d51HI8mkmcTif1wVs
 U7zcY2KYrLgHFs0FxsRwLvDkH5ikmPJ4FNonC1Ln7j+kiu5SqFb3Z3a9F
 /HjmpdUBlK3e88RBPXqB7smmQIKgUGXhTkXHrdJNSug/2MJqxHJCj0yuU
 Uftx6r7y1fIVvAZX5MizS4BRuMiDJkaRiUh8t2UmzV216k8FJUDdUlSoM g==;
X-IronPort-AV: E=Sophos;i="5.88,194,1635177600"; d="scan'208";a="291899832"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2021 14:27:01 +0800
IronPort-SDR: E1a6dYdA25JUfrfOFSIbALKPvogEs3HwcqGI8/rNG6c9/WwjmhwPBfMxiLsth/OmEYEWAY6PAl
 udRXYsOcUl4unWj1INomT5dLpjU4jhpk0bEvC0sTNXyB8Zf9asfbRu3fYP5LPHEP6kL9ddjDv/
 H4zvFY5QSyDlhzwL3bnpZl9GJBr0f/Bgw87MiYO8p0ZBgN0eQwV5uNxyRWMEL2JidLRX76lPUp
 qNK7QqLfO779DdO0PFaYQK845g3WywqWRQma/1Eg/k/ytLL3ncHz6Y0AN6Z0iui71cI88V/yom
 VwpfyMgVDDQTfIXzKhw1+mJb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:00:03 -0800
IronPort-SDR: mqNEAupesQ1zTTktXvsgRHiReFwF1awyoXSdYQ+PXpmnygsHd+ip5nWU/CmHZojXF+nuYizBiZ
 B5kMaI6/XviUTTgZlNS9NAzHtG6hGdjXNXMuYQnXOXEcOqLa9E9YBSnwFTphS5Y3V9DqUA03Ai
 J1qSLHFTpZXpQh0m6BsTQzAVVsO6qkorZpJ4dU4/9Lr0zDPIrV6Q5T6hMXJYhoDNsFjHpQIE7+
 mmwa9s51mw1/dnVg0Uivh0KoUH4LqWFJ76r3meWWZCqnAFkDuEoYPVRD9U8An3KhPPRrhlh4FI
 DKk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:27:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J9LXj2fGyz1Rwns
 for <qemu-devel@nongnu.org>; Thu,  9 Dec 2021 22:27:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639117620; x=1641709621; bh=6wAGSI6QUZs5W11re+
 UV7WaEUxAjGogCqsZ8UfXLz34=; b=GBTW1AjyFy/YqvqYJxukhcJ8Eom3ttXvIW
 1fT5+G6MFyTJRdIwn1YxYOhAEq5XlEDJzFk28yDOkKd6fX/oHoe5qbD11oLNBfVh
 C/FlFRmRrqb0noovCH722LrHCwoDrVdz5HcrP99cuA6xiBMXzbqLMJzgIoembv0i
 kBROm9teEvZIl8SvYxpEX0KOC+6GcwXv8rU/xvzvf1Urhu6jt8wDI/1HnkGXlOZQ
 ZvZKXMTF4qeR0AqKhZBbJtTY0L+mIWPj0BJ/ikIn3USq6LmMRpAdsl58uYxmgofI
 rY3gsZNnXZYSLufNxBpSkDpYaCBjK+0nA83wqOeAwQbwIhvA/26A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id B1YYf-SYcFZB for <qemu-devel@nongnu.org>;
 Thu,  9 Dec 2021 22:27:00 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J9LXc5Pk6z1RtVG;
 Thu,  9 Dec 2021 22:26:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
Subject: [PATCH 1/2] target/riscv: Set the opcode in DisasContext
Date: Fri, 10 Dec 2021 16:26:37 +1000
Message-Id: <20211210062638.824672-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
References: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9719c98f0=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..24251bc8cc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -586,6 +586,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
+            ctx->opcode =3D opcode;
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
                 gen_exception_illegal(ctx);
@@ -596,6 +597,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
+        ctx->opcode =3D opcode32;
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
--=20
2.31.1


