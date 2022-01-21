Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C302E495A3D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:00:11 +0100 (CET)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnu6-0007tY-85
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:00:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn02-0007UQ-Uv
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:17 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmzq-0004AK-Uv
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744922; x=1674280922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8b2BAPC2j6IrVHywyvVYIOZhVPc8RBiA+r/e4WZy8Q=;
 b=f1XejyOh+OceJNwQ8oCOpKBqpyxhqGCVgnIkiUOESZQ1yCfZ+tujYAGV
 NryMFwnFe3e7h8PpgMv4ARdcD3pte8/ANWiu9/p+nT+C3WQT2KEdEuMg7
 7saKiPhb7+wa9SlHzaMgvpBM5QJ4BUZxRGrgDL1/uDFPFuCpcP0OP8vyO
 IZpAm3yPZWMQShO5prgQElue/JSamIQRT9a6BMxCobHjtXmH39n6j5uuQ
 lI71IhotxMsFeNhb8EbXctqEBEQpJLcg2ZYiiP6qKtL2huZvfgMV2JUDG
 F8uFP82Q6Ef2h5Jodrw/LMkNUpH9Fd5RgqpBOBSIT4aiXnxf4qgUcMnRc g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082995"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:56 +0800
IronPort-SDR: fspjI/Ozapw/yIw0A1vUwPn14jvCj4yg6MgG/JKKR0ltuwPKPzdthhP5NRSRBtRCfBthG8SzO4
 gs7/QhDeDRfWpi9Y48XgSjcOR9q/c284fCyH2uV0zN0V8rUkgS1d8ADbnLmfi3Mn0Ok6c6J/2B
 eQLJREl79Sh5Yof96CflfmLSZrvRCAxQuRyta6uk/94flPgTHnwJobwRbFfXZhcIFJ2xYkgjuO
 boCv3NnNv8XGYDxl5uRmmQlCgwmXvy4khIUASmTjb7zySF4ERIY6eaORy4MJ0vghGsCzv9nzZc
 5x31IAq64GCpl+pbG2YfXXC2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:23 -0800
IronPort-SDR: 6GATETWobhQls8Gdv1fAu5dY5zK/GHDZlt8nh614/V0jBn+WK6/zWofrA/GVYRnjqLtAxmEVTs
 flVAWX0+GhAuC90yQCPCdcdCJVL7wbts7XFp60uRuCgeCcgQkoUWM0DaNGuTeIzGiLKST4UyeW
 aLDVvFWgjJkPzR9+8vMJsMCh7g8DyUJozsLeqaSUVOl9snGo+VxB4ITMdFMt2LKl+AM7fAd+pw
 NVuer2+kBdd2P6JxZdpY+oKNHzxfSIFombXpMbiCYT7GRTSGKUK8FZmFmJy93v5Im9MZPyBd59
 UPs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zC5M5wz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744855; x=1645336856; bh=o8b2BAPC2j6IrVHywy
 vVYIOZhVPc8RBiA+r/e4WZy8Q=; b=tn+4TNVJqOr+6S7awSJ94vxbxBVnjoOlre
 R/Sol27dNEuRYju+p3Biq1vIrFkGkXXMo2yOh932DUG8Zbd+YkDfoMf8REgTIq1j
 SwEecRFR7Rl2DNqa7DoElbXLDQPKnUpFFti4R7jFKxhNAFIJxEm2sAONkJDDtJvW
 YnJ2z43TOa3QiQxJVzlgQVdzt6vWj7lEV6/UgHlzJvFSGbjLaIJARakyzBpUsKF2
 0XRGekj9wWwOUq6UsgpUJ5mmDtn2W85ozcq85mkUG6FtG+51aI3dVQT64fns9N66
 kgSOBpzepM3k1cTEmzSRgnmcnK5lbgAAT5Ow52AV1XSds3u5QAug==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DmPk2EiLtZ0X for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:55 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7z84Hy5z1RvlN;
 Thu, 20 Jan 2022 22:00:52 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/61] target/riscv: rvv-1.0: Add Zve32f support for
 single-width fp reduction insns
Date: Fri, 21 Jan 2022 15:58:01 +1000
Message-Id: <20220121055830.3164408-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

Vector single-width floating-point reduction operations for EEW=3D32 are
supported for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-15-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index fe4ad5d008..b02bb555a6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2976,6 +2976,7 @@ static bool freduction_check(DisasContext *s, arg_r=
mrr *a)
 {
     return reduction_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
--=20
2.31.1


