Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD940ED22
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:10:03 +0200 (CEST)
Received: from localhost ([::1]:40744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzZy-0004OL-VF
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHR-00072m-Iz
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:53 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHP-0002yi-Uh
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829051; x=1663365051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qHuAS75QJ7ERbWQ2Yyq5VV1sy/Bq9K+z/XHahQCnYPw=;
 b=hOkqW9YYsgSrSI8XGAOgdqYSy6t++rEF0uawdFruf+TeIBr0ut3tBEAQ
 s/Liugjeri/pEeJj7Eb/VMn7nBTDPlLXdQljduMjzB+F179ZDIDVIXvz2
 erxuIqQtqkroBonM5vnkxDfk+ab43YxKxcSJOB34gHxamdxt6llDtSZXG
 Y6Vm3k4OwTKu2ypZlFelkmdzESAMw8WgQKldXfo+7oORQJnM8W6uGThHn
 vm7AsTH6lvABOxHbUc8mzgR/48b58xn6DYfkXgQS6E2YlnYNk3RsLxLmn
 +3UMVLyEjwc7ZFWT10ug+WrM+ZvtbOJygwRcentyG0YoD2nHUUJyk94vX A==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="284004767"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:49 +0800
IronPort-SDR: aSgvHDFc4wpgjJOMPH3/t0cyngFbyD67TwBKeAl1r6XVmHU/YgDyZuqtcYRbA8YZuHRhyzWw2X
 Wj0GvODV145hAwf+P2h8ET0Nf/NZ87731x/sidy0fXrg5p546SY5b/27mvssgs32mS2GNXLVkb
 Miol1Ih544fEwEkTzl4Jvfxb+m3fLJRWZFKLWDaZD6xsiM5yruiT7u1zPsMJ6pI6+YJvhdLo54
 jaRJnTdFbuiJIjGKhopMw7SZm2LmgObEICmkgS4Y4CF41XcVk2rCuQCHzYLdwCSLiqxRxxSjtZ
 jJkoKr2VS9wy2VjchI31bBCb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:36 -0700
IronPort-SDR: T4ldlp+B57sOrKYBPioyX8eIoxVUV558u8J3+42P1RCny/5TX297kf2/rGL23NoqHG+IJCGyMQ
 X6+imG14BbmM9XToCUM0v0b5oad3Cp2zYAh7niOwo0KOw41iDzKd64n2seW73A71JWtiYk3Ijn
 gKOHOVvakWd7ixRmW/26rKy8CEtmOn3fmsJboBiGqV5m2FH4wDLq6H2J7h6t16t0irahWDNj9z
 s7se7PveJOGhZWHEJvdK7H8GIS/LpGV40a/PdaSxSOAASNsE0UD5oAPDhSy2BQVJWRWj8+vozH
 vJU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3s1CNRz1RwsC
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829048; x=1634421049; bh=qHuAS75QJ7ERbWQ2Yy
 q5VV1sy/Bq9K+z/XHahQCnYPw=; b=i4EZQOKal9j6OZU0rshN2YWyzK2sQUgjhR
 oAW9B2A7EdEEjKMZ9klr57ZQeTNTiWKzJbZjnzhsWzSkMDxMJ1Bs80uqPaWZibmB
 i1PgQR8RQKl+Wb8O8jddYd172UbrOCizVXJu0SnUuCkOBlRh17gaPVY5H/rx+O6f
 IrE3v+7JYwxAICdfU86XQ/htfeDkdrBUJt/MDlK+i+0qhwxiBsn539OM69DLp6jt
 HAfucG5Pv/um2/dZvldDCrrkDIWgSElbv7h8xxXT3yPvKFvSbb6I4ISrM+gwuPvC
 tYOyXbJl64QbjQe/GoH0t1o4FeRPJUvdCui3/yv7nw/IXDxpEwgA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Qnttlx7KeYQ3 for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:48 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W3m6kdJz1Rws0;
 Thu, 16 Sep 2021 14:50:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/21] target/riscv: Backup/restore mstatus.SD bit when virtual
 register swapped
Date: Fri, 17 Sep 2021 07:49:02 +1000
Message-Id: <20210916214904.734206-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

When virtual registers are swapped, mstatus.SD bit should also be
backed up/restored. Otherwise, mstatus.SD bit will be incorrectly kept
across the world switches.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210914013717.881430-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 701858d670..00ad21f1e1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -106,9 +106,10 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
=20
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
+    target_ulong sd =3D riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS=
64_SD;
     uint64_t mstatus_mask =3D MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL;
+                            MSTATUS64_UXL | sd;
     bool current_virt =3D riscv_cpu_virt_enabled(env);
=20
     g_assert(riscv_has_ext(env, RVH));
--=20
2.31.1


