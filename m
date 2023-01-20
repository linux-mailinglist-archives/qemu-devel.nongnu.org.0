Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C3674E9D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1v-00036o-MQ; Fri, 20 Jan 2023 02:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1h-0001zZ-42
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:29 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1f-0004qg-65
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200487; x=1705736487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cDRw4IBpTpo6zSRlPlUYTu4a56emOYbfmxDFaCQi4Bc=;
 b=JJ2tzNai6Ke/nRud3qSspDcIZbwY5eToGst3bgcfyFOVWspwa0WdnABs
 142A/yUpQr1DGLSeL9iYzcBEKVrpusaBx54IfstNDx34uSHrD6rI8/VMY
 fEDQwVR7Ew2u05cJxGvTazBaqbjHm1TPl34Ti5AI0CAohabhyOe411Hu7
 3KPnRutxZ7jRjDREmLYn54q/1uIk+5sj1SU0JFKZVBC5SoHWjR8w0u8cK
 yni43YGA3F9OHJ9kR4nZBZQgVpBE/759NSRp/kDpo5hu21XOELL4QQDd/
 75khiOLBFm84CXc8rPx4Vw5Q7j9SSrqensLFtHSdrulFCbKc0n6B/GOAz g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176766"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:31 +0800
IronPort-SDR: 19xCBPmQaoG7hsa08tjpoRStfhjrWSx3A7GQAJj3pFGg/nuD4GWyZ/jHZzD7b7KMjj3Yc5Mxw6
 vWvF+yYJsoM+8MUNjd6zpviVm1GtaSvM4AG4KUIOwg34I1WMnP27xcMUblaTHUTOoicDUNqvZo
 y1Yk+KiKL5lW7luRY1MdpD2lMeKl8JhpiXbpLL5oShLR9EfLWzFQYEZO+zu3s85IUkgarPqZJf
 nHEKrjUrkmOZzhFQu+gNfnDtkvjkq9NjDIvRhzl8Flw7MUpVYmNP38G6gejAQ3iHQudXFF8ZzY
 UQw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:09 -0800
IronPort-SDR: yWKQFK3FuTE/7eqISQ9116oqx8P+1oUCw0DgMwP3pS4HjQISo8WYR1MxCEQCJjn+5jsMJ8FWfQ
 IUKYKasxCTdJ8fTrc320PlLQ0HhkWTYnWitUEnQ4HlGuNNjs7Q0XO+S4NdqJA/jTTiw+FOprZZ
 /nEq4szuMwtJB+IiRozAe2uehLE5aCXoImabcDLI+WiKQAWrnPo+Zpwp+1LdBI+dEU/CuQYMup
 6dHmbAhJgIHvyWBv0o2OqqaKcYLAUTwpSNaYQ5pmmftCXlXjCq8S0dNfO2miqhd4t3aEWgv9VY
 VSw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyry71SQkz1RvLy
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:31 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200430; x=1676792431; bh=cDRw4IBpTpo6zSRlPl
 UYTu4a56emOYbfmxDFaCQi4Bc=; b=UXoiUpzJW5wFplIwVgec0bbuEEONVSFnYE
 K2sPyKc8m2qAbFv4lt7zinP37swnuWVxb9lLy5GKosic8JMGnYkZHsfjRYUhlrAj
 KC1jJFXUVWT05YAQw7GY/Cno86i2UNeRacdfv2APsfKhTtqLB8M5PPTw0kaFTQmC
 hWbAu3msPANJ6SjdLTmOLDQGEb+2wLSml2Ep+JbnaqUcUPYcIl09KnBJAGzZL+VM
 TXDXebMbuW9QHY5TfkftUvGe5GcM4uaZ/ZgON7226vqg5X1FfrEpRhBhBGM3L6ZB
 YS+TlRjiLdir8hC7ndpjPHhKoVHkU12w+jv9JJcWHZWAbJfsrQ1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yyZYE4UyPuGW for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:30 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyry55ZYzz1Rwrq;
 Thu, 19 Jan 2023 23:40:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 34/37] tcg/riscv: Use tcg_pcrel_diff in tcg_out_ldst
Date: Fri, 20 Jan 2023 17:39:10 +1000
Message-Id: <20230120073913.1028407-35-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

We failed to update this with the w^x split, so misses the fact
that true pc-relative offsets are usually small.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230117230415.354239-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index fc0edd811f..01cb67ef7b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -599,7 +599,7 @@ static void tcg_out_ldst(TCGContext *s, RISCVInsn opc=
, TCGReg data,
     intptr_t imm12 =3D sextreg(offset, 0, 12);
=20
     if (offset !=3D imm12) {
-        intptr_t diff =3D offset - (uintptr_t)s->code_ptr;
+        intptr_t diff =3D tcg_pcrel_diff(s, (void *)offset);
=20
         if (addr =3D=3D TCG_REG_ZERO && diff =3D=3D (int32_t)diff) {
             imm12 =3D sextreg(diff, 0, 12);
--=20
2.39.0


