Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE947A50E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:36:22 +0100 (CET)
Received: from localhost ([::1]:55508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCHV-0007Vm-Q8
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:36:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoj-0004cy-1y
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAod-0008MN-85
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976548; x=1671512548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nF014PF0ncq/7tiF9C7+5gdGvof/XHrVDqhfqvJd4Ag=;
 b=EI83Av+bNz0Eakeh+P4Q6eO0K4lZeVCA5O8Gm1hnjUQ7hXDNjOu+3Yuo
 yvP5X5weiCXnNcuQ78/CHkyHQFles9lIo3bonJaqdB1el6atRBEu4PYK6
 TrKvjqEFb+FjN5QU6hkSH/iJc40DuztQ+K+IEXSm3kduri93uCwXYWTQe
 hvglBr15vR5FsrmMq1FDUDLyaEzwOJ4A7NoI4WSbLovToq6Ax9RBRKDZe
 t4kcWWtrSciCS3Xtl8hUf35X1yEz1U3RwbKHoqMf6a552PlZN84inJi/U
 R8BvhwthDPCoRGw5NQUmNyAWzpHg6FLhdOqSu/ViKDPzGAOB8fECfGVnC Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680248"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:32 +0800
IronPort-SDR: zCOY/V0ZLQkfKWbKW6pTJ95Fj2TIaPD9iTG8CfRqZo4jEEhdDlmhMhmIqUidImLc3NaEtuZJV2
 zo4RK89gFTn518kMWfPqwIC0AOpee3B/2ddySVHF06s2ICtLPhTn8htZDZT49JCBf06srDeo2M
 myy0oE8V1IY9PwbxRn01pzlMVV8Pk599U8d4MoaM9bwMkY73X20RExEiro7vg5Yk76aFyOw8F1
 0AkOcv+QLQBA6rqk/00brDqh4RPOxmWmErz4VKDMnrk9xST5qNYwYhXYHEnD1ma3xJPf9PBZXO
 2NCYE2q+/o9rFG6Vjzu+akxb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:21 -0800
IronPort-SDR: liFM1I893ozGXuSoFjb8VrlIKkl87AyDnHP+zJURGXMgLVBD2JW2FCLrRQolxCcQNK+MLzqgGm
 5EhxYAy9XzP9PWiZaWKBh1l+HGJEvwoDx6TmoAXxG0x1rb9nc3kmxi5K+/pxvwVcSEf2KE2lf7
 4OMBUPJtIb8hWl8eD+74JlZeYvdPRueWJMvneQseGJs8mMUY38xGK5nyY6Y13635rrY2IFsvff
 jrpmAPCrLiHY7RWwdvUeHVF3z+y1WDDVnspECihOCJ051IklzdapnYE0Ty66ylAUQ7Zc56d+gW
 sFc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:32 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9S0MQ5z1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976491; x=1642568492; bh=nF014PF0ncq/7tiF9C
 7+5gdGvof/XHrVDqhfqvJd4Ag=; b=r8+JwugsF1HktrCYXiPves8Iky/zgAEDSR
 JWdPOGtninj0fGXrbSPfSBIiaroHHOw4m4pR1nhHV9EjdK/hrJwizW48/btKNUq3
 rz8lTbtmH0dV8vWn6xhmuBoJJGvwbzngv31kjpcxhWSZYHCueusboYMuf1wp75y5
 f/h7BI/YRmfvoFii2XK66Pdt3G15u2VFOkMrCuDPolFlgugg6xa9BjCOYdUiA0+B
 c5OqeqjcRQTUx5jRdQBmKlwkcFQFXvLUGnny+s7vRSX9xS6hIme+NWyiqQGNq7Ai
 SmnqQGKSenvYJPL1nrZz26kyBj1mFlE1e6CIotQsb9SrmXIp/G2A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id q7420uTMAxZ1 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:31 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9N4PSMz1RtVG;
 Sun, 19 Dec 2021 21:01:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 63/88] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Mon, 20 Dec 2021 14:56:40 +1000
Message-Id: <20211220045705.62174-64-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-56-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index b43234ed3f..03716ad706 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2030,8 +2030,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
--=20
2.31.1


