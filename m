Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCE68D072
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:18:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI9Z-0001fN-T9; Tue, 07 Feb 2023 02:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8l-0000oR-L4
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:45 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8j-0000FD-T3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753901; x=1707289901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FqxN0DDoeXyJPxneOePzsGYbK2UlUP3aMNQdNoJRU2U=;
 b=f8m7dXDLclFRVVpURZExkxkICRB8wa8Kj024KWyWQ2wuGMjiaVyrlnAH
 UNCJJWD8ou9aoGLAZxv4yFqdSX6cjYSwHI/5tdPf0uodoVOzTjz+NGwsZ
 0gLg2FVJoDKQuZs7Fn1iJ2SLm1E5SuWW4vkKkIh5IGaVB0e438gitzZSP
 Dkbk/5RhTrgcYeUrZ15l3uTq+xkY69lK8d3t2r2vFhBezQnHsGifcgNJM
 bcs8X8OyX/Y9KI16i76B0iqMFcGb6W49d4rKj8e8O5BVQQ98nt686wLBl
 fnnKaoCELtH7qvkU0oDqnwPgqMM6mY/KJ6g39Uwcqw1nbsLD/+uDkGVA2 w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657570"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:46 +0800
IronPort-SDR: iVVa8Zm96IHVguEkOjrIhWPOW7hQkL+h9rj0rc8aG4uWxKCniDg/RtxhgY5zGGjbVwttr2HaMO
 3K426/4B3X+7dmBtUJqwZgXiZzTrsFxdSDlSAwx0Qj8kl3WSfZ0Hcuvia4IuFXwpOynR/4O89s
 Ybr+1PdlwiO2CARXgG140Y9wW84vWCEUjqqTnZEDu7cPRAt5/zV+sw/Mzs1VuqIaYy+dymss5H
 yE/ReVTXv6q6EKTv1B0I+rwqAzB9MTUkMV4IAmjwbrjLIjtEX9eoT9jYgOSa091ByCtIKyaMMK
 SY0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:28:03 -0800
IronPort-SDR: 9HkgtQ1+oBO9Jh+iAhvYOSwPEsikR0Afvgqn/vfG63aL5pKpSnAcb/wvefmV4lYYBtaBZiyJa3
 5r6/XHF2WHQfOPH2Gvm6x6XFgtrlom0IQZ/1O8YK6vxfixnYN3/tSxu7ZyNots9KU2NMQeEeDB
 ve5tpCvLJEpblANifbooa9F3o+Y7CvFuV8MAe61xfircTNNqpPajiNXKoMzRr92XUlBGtskCTf
 arZskiM4Zhi0idN+xJ2hklPEAgHZP6jmb+APVFG5FWRWqulw21lY0dJurH5uO6z6MDbEQfXMDJ
 Qhk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:47 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRV5xM1z1RvTp
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:46 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753846; x=1678345847; bh=FqxN0DDoeXyJPxneOe
 PzsGYbK2UlUP3aMNQdNoJRU2U=; b=YlbYPIZ0P89CrRW1P6Wjde6WdGoCoiG6ev
 SXeNhKr5s/Sr+RDR2M+FyBrPRmUcNtuVGDhE4GbBr+b7ZSasHJjNeP6DCD4JoHUS
 4y/TtATRc9aBY+HAkeNbeBSyplb8hTNAvSUoOFw+j7o5WZ+nZ22wPBSg2lE1FLLA
 TgwFhYgpoqSJizNyr6cfsIh0TgkQwQ08iHVKOXns3iOEy91T1BSRcOdooia5bUBw
 sw4bjHRK+rduVNk/xCZESF3lD3YJPhMe3LV0vwdcDE3pHS6uDTCBTJAswH1E8IBE
 i7iy8d8FdvQJ9Q6cviKQLNflm4t/tR8mjp2wE6O+5lImhIs13R5w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id REbW29BRo7q9 for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:46 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRT0h0lz1RwqL;
 Mon,  6 Feb 2023 23:10:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Deepak Gupta <debug@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/32] target/riscv: fix for virtual instr exception
Date: Tue,  7 Feb 2023 17:09:40 +1000
Message-Id: <20230207070943.2558857-30-alistair.francis@opensource.wdc.com>
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

From: Deepak Gupta <debug@rivosinc.com>

commit fb3f3730e4 added mechanism to generate virtual instruction
exception during instruction decode when virt is enabled.

However in some situations, illegal instruction exception can be raised
due to state of CPU. One such situation is implementing branch tracking.
[1] An indirect branch if doesn't land on a landing pad instruction, then
cpu must raise an illegal instruction exception.
Implementation would raise such expcetion due to missing landing pad inst
and not due to decode. Thus DisasContext must have `virt_inst_excp`
initialized to false during DisasContxt initialization for TB.

[1] - https://github.com/riscv/riscv-cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230127191758.755844-1-debug@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 182649dcb6..772f9d7973 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1213,6 +1213,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
     ctx->pm_base_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENAB=
LED);
     ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero =3D tcg_constant_tl(0);
+    ctx->virt_inst_excp =3D false;
 }
=20
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
--=20
2.39.1


