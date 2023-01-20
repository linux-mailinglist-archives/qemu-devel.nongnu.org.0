Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAD674E9A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:47:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1i-0001wE-Ic; Fri, 20 Jan 2023 02:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm15-0000pM-6O
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:52 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm12-0004qg-5f
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200448; x=1705736448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5UmDhHdivyXvZXkB+ebiNtlq6eeUv4uMJna0z0QHno=;
 b=YxunFu/Puiqc+8csgwstyR7GRfwDfIZuFkWgt3kcWWwof0t21e1DmBO1
 rpQ6g+2dFuNzN/BpRbPGDakDpe8BURdvYsnBpt9wl0PFod3pUpJerBSCt
 JHSI2UVN0AbcC0I4f7/kNPwdkyzMK6RSpXmYFSlJngIknlrvavxV1XfTI
 oDuvnIz8DJw2DMMY0GK5/b7NlqUV0n4mqq0WAwwUhvddmrACiMonlasvM
 66tdtmxgPO0/Cl/KdGfIBbHEKEMfs/MV6axSeriBk70oPF6td7lcIEO8J
 0vkt9S1jS4Tl/01Za3BYlOrLLCfDLytQ4pXDAbWirTWXSwrlaEV2QKD3z g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176748"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:14 +0800
IronPort-SDR: RfYtSWYT0UhZ24dy1uGNNwmJFuG8Keh883wJttpunhri+FvLZfsAeA2R47fKC5wYyRmFcCLj8F
 8xFeOK9YnssWmXDzWo8yMpoogCeR4f8/0uD1JMrZDfAjR1fpcUW07BEeefRQ8VNK3DY6tZ1kG9
 31ivAYWwg6ON+47weCjBC1fzA6rObJt6iNctrwCST0vkkFBEb0zH72wZ7Y7fTuCuaHlo4V0PLQ
 /JqltvtSqORCFQ79VOtCA06zYO/vIVwcchjzwFkq7GQbAlw4VbXc0E8tZGCeQteCP0WllqzQsh
 Xo0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:52 -0800
IronPort-SDR: 7vPGdWJR82FR7hPSIQlD+Zxy1Y3lKBY9oDZvzPciGKPs07Z7+yp+VbvlDd3FULor6cDkhTppL9
 eDf1Yn/2iKsJnSbDGccEmoEsRyXPuFsis2Hvq9UJCvC480HgtfN4RSpwMiv1XeGjHOgbS3E70u
 rEHQGP1GUCxlz0ZKe3zGt6aj0WWTFfk8Hc6r7kXB1Qwf9doYk4HYYwbl4w0gfzj2FH0tIya/jy
 kPuhLdLjM+1cNN4ruBLToEB4e2biith6NUXz2cyMQUgYAhd8XAh/HiQBNJ8UUjOFnropK0q5Nh
 Uyg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxn6rrgz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200413; x=1676792414; bh=F5UmDhHdivyXvZXkB+
 ebiNtlq6eeUv4uMJna0z0QHno=; b=Y6I2YSIJq1biJgKr2aqF9YnWReRr91Ym0C
 70JGLWdADN2sErYeo9fyekxOBaDiMOFIZAMZ3Gjc8pd3nb0AXrTwPfTplIXsWAcu
 yBVBMw/cRj9SGSCvsQoLyfLFuLT3C+htqY8IE6wtkEHCgLXt2jKlchSdGcKWbPHm
 UcdVX9/cqaqbMIh/xaAmvidAmOdsQD83QEg1iIH26/numDmA63akex0z0Ai/dlel
 DXOKdqYuqcH4B6kUbJqtMk4DLctXSid9wunHxh+G9k4eYnPvFt1gkUXBmBhksFH5
 C9mH506mfYiQzd/Ryp00AlxkUuABeYWUgqrdzOQ0HfsG9Lov02Tw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id M_ucBC4wLeAL for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:13 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxm2skhz1RvLy;
 Thu, 19 Jan 2023 23:40:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/37] target/riscv: Use TARGET_FMT_lx for env->mhartid
Date: Fri, 20 Jan 2023 17:39:01 +1000
Message-Id: <20230120073913.1028407-26-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bmeng@tinylab.org>

env->mhartid is currently casted to long before printed, which drops
the high 32-bit for rv64 on 32-bit host. Use TARGET_FMT_lx instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230109152655.340114-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c192d96a94..14a7027095 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -867,9 +867,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             (env->priv_ver < isa_edata_arr[i].min_version)) {
             isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
 #ifndef CONFIG_USER_ONLY
-            warn_report("disabling %s extension for hart 0x%lx because "
-                        "privilege spec version does not match",
-                        isa_edata_arr[i].name, (unsigned long)env->mhart=
id);
+            warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
+                        " because privilege spec version does not match"=
,
+                        isa_edata_arr[i].name, env->mhartid);
 #else
             warn_report("disabling %s extension because "
                         "privilege spec version does not match",
--=20
2.39.0


