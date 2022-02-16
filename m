Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2264B82C5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:17:41 +0100 (CET)
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFVM-0004Wu-7q
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:17:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpr-0006gT-D1
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:43 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:31617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpp-0006hk-M5
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993041; x=1676529041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pvnxMTCRdBYWESBTahjlcU5dha2IzsUpRGE46NIzUNo=;
 b=CIyswWfu8I1qmVni2M3JjVcw0vFG4H4sjsw9OnnYl3qAkmucB7wr65ke
 X8Id0cKII5vSZBp0jaP3A7VTQtN+cLVMq0LW2kb+ddxrfSK00bQ7td+eI
 whZcwbe26Xqqlv7W5hrsYyN03BzmENUqhxNYf6wN/+SuRmEvnusNNnUpM
 X8smf0BwoUJQSpUwMXGPanjCQ542RDdHm9BjFDnz9OxWrn5prbyjlRJZw
 dCkFZjSd2QqSTzeWMvx3SIV4H8le12tSasp3/hBWwF8+UqJQvRlC7Fcqv
 4+LArzmNQpCFeiYFrltvorOtgKsdFupzU9g5TxtF/mRwNXnwwZO1QCICW w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="304974571"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:40 +0800
IronPort-SDR: VxErY+h6sWf4mF8iWDQqrG24ASxlm2rcQaF/SnCsOIG1WMBNbu9T1jFzSN8sYbfd2bO2n3vOIW
 1xO8mv8rPwSUDaGFfIXGbLk44cGg6LvqSLJv25rhhotYUAOO1X7Dr4Q8DVQyNgEEV0isxh5Sz7
 Dbp2/xi2V/gtGwcNzzNroNHDOxeEYv0M844mpfIKLs44CwDXsYa5fGOza3YQZrG9sHD0ZZOXrH
 TwiCwfmhOeJoIOSg/n/rtp4bdhsxfP+uFUQm4zqSZoE1AoHA5ccn7W5mpct0RWM42WEi7W14Ip
 p4s8sHdsw4eUFjE+EU5vAoI7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:28 -0800
IronPort-SDR: ptUXRSNslVU2QL2VFSbYX4dvX4hUzm7Yx2ZSuvS4ZSU2luCyvzQjhrXZs6naDRHrPujj8De5Wl
 ewm3n0S2zJ8Irnq/VWtTTUvC+gC9xeaGc4kWYOKsxBJi6CqdXcHAfP2FrgvIk+7ugIvn68iPuG
 tKzdnnGQXtYx1eIbePi+YQBghOZ4N9VA7aYBMtkfYMhjK0ywsRgFLQGEXN1FNPBKLBK+dMdrFJ
 QfxGKCAjG7uBhMDXew2s5muxbQU5K3wxP46yS2kdQsP4murTc1+AUuXZ5vNSezhX+ZXT/f+7rU
 sIQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7PW4R5fz1SVp3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993039; x=1647585040; bh=pvnxMTCRdBYWESBTah
 jlcU5dha2IzsUpRGE46NIzUNo=; b=Dcn3+L/hkQHsVi1AQslF+njNPLyPZtQF+b
 HUECwvk9tMnRay1ntIej+ca/eKb+QjhEC3PAmVOkAN5dGuFggVbEWMiganY7FpTL
 HXQzO3N55fyLirGaKN7MB++1lbjqJKP9I5fhe2hMhjpgyzNbQOI6SE0XHVHDa2bb
 kJgw2MNgAUCo7jqlFkztaqb/ehcPlxB1sCGkY7Q4fZZO9LTS5R4leW3QW3mTFmww
 SmEWJnjxeSCoVup2lQQ3//iwxR39lEIRTSrf5SDe++gtKcEIUU0TqpmOg3dYLUwF
 /YpqSkUMiQSXhmbfl/2DwKJa/kVMu4TyCxuQkJkNK954MnIGENGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YHkWqmnEiL5m for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:39 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7PQ74t4z1Rwrw;
 Tue, 15 Feb 2022 22:30:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 17/35] target/riscv: Add AIA cpu feature
Date: Wed, 16 Feb 2022 16:28:54 +1000
Message-Id: <20220216062912.319738-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-7-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 283a3cda4b..8838c61ae4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -78,7 +78,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
=20
 #define PRIV_VERSION_1_10_0 0x00011000
--=20
2.34.1


