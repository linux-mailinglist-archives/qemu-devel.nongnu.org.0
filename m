Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3F3FD12A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:20:15 +0200 (CEST)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFrA-0001rm-6l
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFhv-0004tX-8c
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFht-0007hT-I5
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462228; x=1661998228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vaYxnEf/0537kt2nb0UwvsHsl3ytoVfv7r9+AnO3qH8=;
 b=gl7iGAiN/mZB6ajaQ/jq4C4zp4FxAa05LLxhehXTbo053Qb2R3U64RJD
 IF5TDZP7iyC7ssKBy+r+btn/LEEvsDNWJ4Ilsqr+NROWofNVA1BvZ8H/J
 ip4/+8cfZF5YCvrsmey9OgEaYcmitDyZUy/L/5QIN+Cb+1J5Y67ctpRBQ
 bXXD6ovuqQ2TAG22PGrtOK0L5v8E42vPJpohZGDiiz053kr+8cu2W/Drb
 hBVghsIHcHK+U+2wl0FTweJejY1mBGTXOnLNS56/kbPAMI+IXAsYl8ykn
 EKjkzo2ZpW7IrZ76i9tTg9uNs6XyC82t7JzymbADztaW1lR5zJQ9VVW9d g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910720"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:26 +0800
IronPort-SDR: 3YhRKjJUKei/cBEz+OKMvJkD6tOv2kd8zCJz63fBHfqTldzsXZriiQqb0CMq3TxFXMiyU2GbiN
 MvoHH7mvs+Muliqmfx5RLXkC9cjJl5WumCAE9NshXrKlyTcE6wsbAFNNtJw7fwc07qA/8b5GpO
 mrVQnytl2+Cnsw3GWR8sLUT/6HzjfEh9F1Xczk1f/dET6ckWRF1SWDtJ1TbI2s1qNwzEsbVqJd
 iKs00TM/t98ejgoKmfa+UWxEYJza7wyUuuUC56+eHDe6B3QLV7BZjXu6WUUwhGKqWg6hKsxzHb
 QUFlY+4N3OpdeMwaT8EwcUJk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:16 -0700
IronPort-SDR: 3sL3H+ObArbqZU8MY0yOvaOyK5ZYcw/w3UyOs3bjhMtSQCWJqIo9nb4ExV4OzZOj78++x5bwda
 tCufPFrF3+hIFz+TqQydVT5DWOPwIWI2yL1cnbsIQKlpcF1Ozx7Tr9ScDncWeqrqKPPkauiv3+
 Kmy5Js15/8pJfoQ5joIwQuvWlKKFN9XMMNP1xjqDz8Kus7ZxfZ04J+7WgWXUfdO3jnTX/24PMR
 Tj56G+bMsmJzImgd8Y695R65lVcP8bF0IoHV2V9ZvgVK6eWUn3oUFwjZUHGiJbXfdp632m3Edi
 TQM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznZq6bzwz1RvlT
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462227; x=1633054228; bh=vaYxnEf/0537kt2nb0
 UwvsHsl3ytoVfv7r9+AnO3qH8=; b=KoMfg3XWFQxFdZwq5srHY1VwNqV7EEdahE
 bhYw2cHkpfVjTzCduifvZILyQ8gSwxhtvdxEoSJlqk15Ki/5K63InKGYGcwNsCOL
 dM3o7RH7mGyoMFZNeM8/6VmZ8pBq8bONlNySjkyxADNlnwk0N4+/N3tTQXs2gdBL
 hJcjnv/rR+H+DyUEkC6ptjq559d/Ji9lsGnwi+3pNG0pKErk+whXY3LXu099iHmm
 cIvzcmneoxhXlocqyUmyAzqW30ouxDEMjcDeeSo4N298ZHasWfPKpa6yg3loYhsl
 A8j7dSvn0lm8xakYMUVqtPb34fez6nKKKtY7qNLvI0GHVWkDbx2g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id O_hdnncXAn1P for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:27 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznZl0f6yz1Rvl9;
 Tue, 31 Aug 2021 19:10:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/33] target/riscv: Correct a comment in riscv_csrrw()
Date: Wed,  1 Sep 2021 12:09:28 +1000
Message-Id: <20210901020958.458454-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

When privilege check fails, RISCV_EXCP_ILLEGAL_INST is returned,
not -1 (RISCV_EXCP_NONE).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210807141025.31808-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac5..e747fbe0e9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1423,7 +1423,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int =
csrno,
     target_ulong old_value;
     RISCVCPU *cpu =3D env_archcpu(env);
=20
-    /* check privileges and return -1 if check fails */
+    /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fail=
s */
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv =3D env->priv;
     int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
--=20
2.31.1


