Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EDB68D04D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:13:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI9b-0001rD-RC; Tue, 07 Feb 2023 02:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8m-0000os-Sj
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:46 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8k-0008RS-U1
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753902; x=1707289902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MP0C+2m3+enuehum4RyKcU0ml6Pel2g/4/nOPc7lILE=;
 b=WtzKcQOPVZVmxFDQdNfVh3D0nfviHr/PTXoGXSx6ylKiWuUxqNyd9OhU
 SAZ+qy3dvmQSJICv+qHqFp/3lpa2kGk4M8S9BojBEpIlQpND8p2t5ru7Y
 6hOjlsNmMJPXkSFbCI8EEFcW0EE26Jpr4KF+mQmXSpBRltyHA3QzFB1xL
 AqATAiXPY3OvGMUlHVEYvFQqE74FY7J3oPsvWyPxfCRr/QWFT2XJdtEES
 7SlwIxN6kcJmw6CA5xgTlQp2OR6UKwZRkRiTyNLk/nDLkmTIF4OMMimxE
 fKPi0x1vMOmnycd3mA2tcI9YshGuE0nxMkTsXkZRIaY5dhF8156FVcwQy g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657576"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:48 +0800
IronPort-SDR: AnRFaumTCqGmKe8uLhsJsIgVocCDr4dRLDFpGSEIWsN+wWTKQskOMzb14MW+MrUS2UN4fI7TV1
 /RJjWaiz5VkCzIKYHCD4tN//Ut6OeySwyUYvDPTQhtqMhNwjbsjOg1zkwDxKQrzYtZmicbQDOM
 pCyXtk7b1pSTQWij2z+Kjl4t7WzkeZtkgwlmIq1eEg2MAf1rXCREDsbfatgFDnvAVZiuwLr2Xw
 JOFr8AxSejKR2f+xDlq4R74ixArQ6/z2B3eFSQVh5vjSYN5CIJWxnP4IrW9loP7TeMGWXRMHoV
 8Mo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:28:05 -0800
IronPort-SDR: vTMutlnPQPWJncuGBdV1Q3sG2L6wq5SQNrn4OwMElxvfzs3UFwHJNl+N8sZp2CpWkWOoDVFBZW
 miEVasLChCWYvT2RyoTDd/qWLtaX/JhuRdCZ3ES1VIoXIEHQC3/IwzenOJ8ZeOpFx3uGjWGmYQ
 246H9p7pXqpypUWagQM7pnGjLCymLEE3ELzY8lkUynb/JJa0UAYDT+gyAU50/viNthG4sOo3L1
 qKJWtQmpxa2sM9c3tjlRjVtHHSNtzsRnt9mCwr6qIb51+LX8Nbszqbu8icEDIUPD/LuRcQdZpd
 Uls=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRX4JPFz1RvTp
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753848; x=1678345849; bh=MP0C+2m3+enuehum4R
 yKcU0ml6Pel2g/4/nOPc7lILE=; b=ST6KI55PJzqkzvARTCP1mgxVRY2ukrDqy9
 +vHEXWJKIgrNtz/PhW0SoS4IeeNh9uqYgQdbok3EGBZDEhqqEJa1EwyQGHOml598
 RjNExMJxQGtbj4JWxHc+munIbPrbNAqwKlbY2YXZbli1HP3IFwWIYk+NmjvKU94F
 4uYCMOT1Y4aORH4lU8RgJgOdMgusFSOcXstIPbGEMwYnw3v30DhflA6513UfkH7H
 CcKsOb3Yf5SQdeky7k0wf81eLqrZ1QoUXPsdwR1v9RtjzqoC0V5au890OT2HTRzB
 jhYUk7c+UZtzwQqXSkg48LbQhunKM6x4cq0zI8OyDnQyMA1VpGuw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id zgCiuTnQtTLE for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:48 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRV54jQz1RvLy;
 Mon,  6 Feb 2023 23:10:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Vladimir Isaev <vladimir.isaev@syntacore.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 30/32] target/riscv: fix ctzw behavior
Date: Tue,  7 Feb 2023 17:09:41 +1000
Message-Id: <20230207070943.2558857-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Isaev <vladimir.isaev@syntacore.com>

According to spec, ctzw should work with 32-bit register, not 64.

For example, previous implementation returns 33 for (1<<33) input
when the new one returns 32.

Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230204082312.43557-1-vladimir.isaev@syntacore.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index e2b8329f1e..990bc94b98 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -401,6 +401,7 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
+    ctx->ol =3D MXL_RV32;
     return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
 }
=20
--=20
2.39.1


