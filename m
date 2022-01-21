Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBD495AA0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:27:41 +0100 (CET)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoKi-00046d-GG
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:27:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyW-00070y-3F
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyO-0004B6-O8
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744832; x=1674280832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xp1VSiEe9HFt0e0WXbOseF5xgToeCEmetPZiqBjE/dU=;
 b=EcURYpVxvLyI00qSFBn+nB+3rroT/vV7kSto2fzAAjsgPXUtfBBGdCuP
 OujY89saVNQEe+foi33rSKRfcLKm8mFUhjH/uxIrsp8c+nRSuUUbIoQqV
 zfaeHtqdu8ghDUI4QQTf0BInRkPjGluS1DS0TeTgsRYFO6VzV8Y5H+OVY
 xTlR1DtHgYhhMhgfoN8BltG/hxlN+MCq7evAyguwbu5tWJlqL8ZkVQENC
 RdKfFp1TulS+uRguq7mAfK1HpndKd+x31Yei0ZmwvZQoEC1r9yyHnpBnA
 uFptq2pe8UaZDOM3xP88iPz6gU56nVR2ww2F/k2Js3aucHdfPahV3j4MM A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082942"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:30 +0800
IronPort-SDR: 7fBV2tcoecDVDm/Slt8K2hEE+uNIWh8OCpAogNcHYRqmmc097tS+1ukpd3w/bfhoZjOV9cWthw
 J4b5u6Ny7f0/lw1cpkRVIfx9sMkKaC+29p2I4nAK5TMc9OfMtiV3TacDuTAE5KvvNqXGDcyP51
 hAMFfoi6wXhSOfnNm9dnblv5SQZ67iSqVwl4kx4pVRn5unLeDOenVTATRQ3i+eXFJBqiEl23OI
 SJCXySVq6634bEqkGkssVKXvsSfdIuclVHPNj2zj5BGQSbS2EKvZsonR9OOQSTCFV3T5YR3zus
 XsMA7X7B9KKRls18UMVBPiHU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:58 -0800
IronPort-SDR: mAUNXHgWQjXHVlYdcppKfsubIGS31sMDOoJsj99HhK9HveDupUAaZ4eKEpAHEwkoTty0RHHW1v
 gVh2o4j2Sph+tl7HyV/wY/70ZNc6AwD959uA1Hk4jF0bMBp+wpsaI6XMEXcH+o5wspmijJMfcG
 JjA+k3SbGD8wgQvnGnkt8n+J64c7c22DaIWjOG94NwIe67K2zoIHWlHcSmcOilHg5SmRURKoM7
 Q1rsdWVhec5kYdYZT/uw2vtn5p2xJkBkVpYcDVsYpbsFQSBFJWSDoaq5NAbb7N5oJtXxptPkV2
 nn0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yk2hsdz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744830; x=1645336831; bh=xp1VSiEe9HFt0e0WXb
 OseF5xgToeCEmetPZiqBjE/dU=; b=VIyktQx/n9FDmxVvp8atxwcavXNDZgwS1v
 iqnDWsSOrWM6Ys1UoUK5ktb+4FzohdwvRGZIIHKssuYzO2vVRoLRJToxs1NJPhiJ
 7Q16SwDniTGRmwbnVmQAsc99jK6Lj1Mx68FRslTTpp2IO2pknY1cKewWAVrqL/fl
 cpuiCHP8RjPf0YiUzAW5NQ7EPNUiVJLrS11N6SKR1V7y5wVu1fvBj+AhUQsY1F6O
 D1OEpb3R69fw2KtlIzNELhG82kwg6fMO4nowKXa04m7K9dQFUhK6nlW5zfsq83Bl
 xZtOC18+Pe8Yb/aHpMa5JPXnapd2cJrT/DPo5TyaH1Ei1AzkEeWQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nLH7ofenGU3m for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:30 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yg3c78z1RvlN;
 Thu, 20 Jan 2022 22:00:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/61] target/riscv: rvv-1.0: Add Zve64f support for
 single-width fp reduction insns
Date: Fri, 21 Jan 2022 15:57:54 +1000
Message-Id: <20220121055830.3164408-26-alistair.francis@opensource.wdc.com>
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
supported for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-8-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 56246a5d88..08f25e3ce4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2937,7 +2937,8 @@ GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen=
_check)
 static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
=20
 GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
--=20
2.31.1


