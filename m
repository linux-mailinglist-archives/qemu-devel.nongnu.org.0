Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A0495B76
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:59:04 +0100 (CET)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAop3-0000We-UQ
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:59:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1Z-0000LP-6o
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:49 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1X-0004B6-DJ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745027; x=1674281027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mj1JliWDqzl5tTrflTFMlO7E9sAym+qOeYWZYR05TZc=;
 b=Exu+cVShEi1GsQSAontaQKzmJI6QrYmYxDa2Q3Pi7jVS+RrXKkkc8gOB
 4RgLmU+/d3XMKg+aSUw644eyVaE+HBSPoVUB2kTOaSJiBnSnat8Q32UYh
 7sYWsJ1qO+wP4eNp+nH0uTqanmscCKLjjMNqsVpUxyGjXjgQu89/TG1Kb
 S4m9MFZuWJdD+1UDsSnjU6J1ArX0D0izTycRiYfcSsRMBrds5P/fLPDQL
 0iR7ojFrC1Kc+vsF403hgToJKWhEIGzdI9XpkhLUksGt05CLoOf7/hU6m
 03lF9/Ir4Uz4Esv6IgjG/IIPKkgS7yMdlbPNCLW9JaDVsvuqA5R75uzCd w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083173"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:48 +0800
IronPort-SDR: 8ixz0qx8kNBkj1MOS5wuJ/TmIs3/GuOHCng3Gd06uZlnqCbGbmKdPCauuvkwSvqB9vI18gJ0cg
 ulYRm7TsIxYA+u5ssgbK0E8viX5gYCvBogGTFkuHJcSNE1qOeM5SNWOccICVkwn7Cf1IRHOB8U
 UvftxvfhMraZtLv2u6LSfZkO/IGlBki+bausUDNLy+EgmVxHJvju6WpeMH8uD19pN57I+jaUWM
 ilx15Y6qRlMEh8LHtlKrbfVYCgw/F9kpRa9KPSN2aOY19rYNFnyFdwmCTb/bGR4+f0bOXT7xru
 tleuwuLdqK8ioHvMO7IL/G5b
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:36:15 -0800
IronPort-SDR: FJanx85kWxnrF4GQzMS/N66Q5KOKEQGG5NUYolBIqPAmi/zYJN9/toorNLxSPDtjuCR1mYYENc
 +E7l9XpMxbZjWZAGwlRcwOCb13h8dJHIpTe4S/UgRPHl6TRsb2t1TjnuTaMPPbj1Siifv/AQIb
 lnQTC/EN05wao17J/O92qCoOD0n+HoymseDD4130l1FwlKF+ZDj9JSbfoFfRZj362O0qC7CFHw
 ZHIGnbQnpOcU8tpBppgElNzzqZj4BeKDAUrAwmuenJx9usMX1E2tL9naEjIFSz+ho2e4AYrErR
 Cog=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg81M6lyhz1SVp4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744967; x=1645336968; bh=Mj1JliWDqzl5tTrflT
 FMlO7E9sAym+qOeYWZYR05TZc=; b=nAAsahb1frSgnlMCqIHIRPDkvH4x/Ewlro
 34EFCj4eF4Io7OnaJwUQpKfMWvZ4Qk5YEkZQtpwa7HalHkDGd3EYr+MiQali2EkA
 /I3gqtpANrTJ63wB5YDRBnj1vvErSCENKmUK32b1SyNXjNJgF+gXZz+KjpQPvNA7
 cem3Q2dgDr9O2w/IaRIZitSlpMTz6BMY7ZtMncfSk71KEkyxEixZKxC08N2v2zbL
 HmpDvY8TxuC8uv6amsUOSI4PQ65lolU0nO2J3ede3qIgLALFB7nVJR6X4LXzZUf8
 CEfa+ILonDAXQcDF7Bv8PeJh8ZGIPvZa4J2wE+jEv131mGnPW0hg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id afK8QhFeI1Ne for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg81J6cBYz1RvlN;
 Thu, 20 Jan 2022 22:02:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 59/61] target/riscv: Set default XLEN for hypervisor
Date: Fri, 21 Jan 2022 15:58:28 +1000
Message-Id: <20220121055830.3164408-60-alistair.francis@opensource.wdc.com>
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

When swap regs for hypervisor, the value of vsstatus or mstatus_hs
should have the right XLEN. Otherwise, it will propagate to mstatus.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-22-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a120d474df..1cb0436187 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -422,6 +422,16 @@ static void riscv_cpu_reset(DeviceState *dev)
          */
         env->mstatus =3D set_field(env->mstatus, MSTATUS64_SXL, env->mis=
a_mxl);
         env->mstatus =3D set_field(env->mstatus, MSTATUS64_UXL, env->mis=
a_mxl);
+        if (riscv_has_ext(env, RVH)) {
+            env->vsstatus =3D set_field(env->vsstatus,
+                                      MSTATUS64_SXL, env->misa_mxl);
+            env->vsstatus =3D set_field(env->vsstatus,
+                                      MSTATUS64_UXL, env->misa_mxl);
+            env->mstatus_hs =3D set_field(env->mstatus_hs,
+                                        MSTATUS64_SXL, env->misa_mxl);
+            env->mstatus_hs =3D set_field(env->mstatus_hs,
+                                        MSTATUS64_UXL, env->misa_mxl);
+        }
     }
     env->mcause =3D 0;
     env->pc =3D env->resetvec;
--=20
2.31.1


