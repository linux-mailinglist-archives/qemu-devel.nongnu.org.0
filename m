Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B694B31E0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:20:16 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIg99-0000XF-Ss
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:20:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrR-00061s-BW
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:57 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrP-0000Gp-JL
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624114; x=1676160114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=32il3/FXEqWt9Om01xQlWBhHPsrFjWspEJktojPne5o=;
 b=liJxKMfwmxbwbgn+ME/m1bSJU272dg0FZTVFfM+mFoIueaX8lriUh7+D
 aH9NYpLjhyofVXEo2jEj6YUE/YAWzFT20C5r7NuYAHcK7OduhtimJfRRd
 oOhCdBwD6gElBUyQoamYuD3ArgrnJGd99s5VrgXqWAlK3Ci5WyRvSlxH9
 RpTwQ0h2ElujrJCjjqcKTqqoDAQVYOsSWGMMmA+BWoFMefJq+/50S5rUL
 Kt6fyWSacwj0eEUXdiRwnbwqQWZNZHbrmrKnCNV3SWcZS97KSW9r/zh9N
 lftgTftW2w9MuFzj7IGFVwwUKtxrD02DXNQoAuEilisQBt35h4qeC8D8Y A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="197552392"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:52 +0800
IronPort-SDR: SC6dQ7bRJgM0p3klBP243/oeDAvkd9rudhn1pIbAgb0eGtiPvyLYyj8xlssKogNuyi5y7W+XqD
 1vS+P2fWsOaZkZV/PO+jq+MhvRARdBQzIs7uv1+PWLnGNd3qIgL63Jya8PhlJq4oQr/5Rqujf+
 HslwuuWktGTErIrfGSjyecRa12tCw/uFLcoXK9xPAOfDXTH8kOr7zkwGzSGjBgVBdB0lUNtdj5
 mZUJhfseWIBTTtI99kTV65G69y/AM6cZDXMaNhTQkMYYjwlosiUjE1aWCS5CD70E/hd6L2p1Y1
 WZNJhNk/2G7sbwgBRwD69yoJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:34:48 -0800
IronPort-SDR: 2KcjnpopIQagRN5zyovBvUyKpUWHLeUcP6au26961yPx2oE0cCuoKLMR60H34Vgv1qnwn0xikG
 F7wxVjxe8a81wQrhc4tQAc3kj5NNGE2lOzcE5vMLmctiJk78UhIQrZL+PEWeB439YadyznOA5X
 JdrfNPGCUr++tXKDE9ljsiYYf6Pg9lNa8L3nq1XzBQehQ8a+1j6j3dYG9EZYdtS8T2d7OEyhc1
 Xu+LTwE4PP252hTzZMAvG002vOmzjGtCqyp7bAUH9kuqP5OMzDb6qeKokCKVpJy5Mdm7r5cXU2
 JWk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVyn46Vsz1SVnx
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624113; x=1647216114; bh=32il3/FXEqWt9Om01x
 QlWBhHPsrFjWspEJktojPne5o=; b=D6O+SrEnBN1zrXlz3yhiG0n/yU5tZ09Pqu
 /lJP/UqD+t21hVFCktJJ3NXF+EKRggSJFScwhi8pywII0pZ4w8HwTLNKBsurPykX
 8umKLoM78c4JYLY2umOo7VZynIOQIVA0+CjUQccpsbQk4FDW8w15rMzI+Ck4Ij5P
 47W5AYsG8pLlL0/Cmuw50cSBWqQL6Ct8OKQGrynOmzfyQBVGAo1hsOW5O4vzrAIB
 EkZKQ763sNuwizxwY7hMPv55kF1CK89KFDugQGtlBJhOsIOWTTs7KbTQxWDsMWSD
 E/BMKEQq+S/IB4rOloRh12/L5ZYt/0pFfHSFXXThnOy4LEKXiCOQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0YwSZPgu9XJ3 for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:53 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVyh3k8sz1Rwrw;
 Fri, 11 Feb 2022 16:01:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 12/40] target/riscv: Fix trap cause for RV32 HS-mode CSR access
 from RV64 HS-mode
Date: Sat, 12 Feb 2022 10:00:03 +1000
Message-Id: <20220212000031.3946524-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Anup Patel <anup.patel@wdc.com>

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions=
")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-2-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e5f9d4ef93..41a533a310 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -186,7 +186,7 @@ static RISCVException hmode(CPURISCVState *env, int c=
srno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
--=20
2.34.1


