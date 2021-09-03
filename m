Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5133FFAB2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 08:52:37 +0200 (CEST)
Received: from localhost ([::1]:36818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM340-0008Kd-6F
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 02:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM31n-0006kn-6y
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:50:19 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:19099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM31k-0000Xe-CW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630651816; x=1662187816;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CabCeNKMr2BSUP3/hzRnLm4PnGZoL4nLnozgep7bsco=;
 b=BTZYZdMHQVQsXxo4+0IPJzPPC30aWTk25QUXhq0QSOgcuY7sSIofEOjA
 qdGbezHDIR2bNRaRZ5fqDClXbXzHUlVptU5SC2xY6xQKTarqvC4M/7RRf
 l6UxhCYn77Gityks6qmzcWupfRrB3aCbHzSrpXbICveBtkWezgPVIcIJK
 i92Pgmu5bumQ9pzcyaXQJopI6n3Qjt/RW7RDTH2HCJhLGurZMOw+yz9TL
 HrVSt5QA/wZR4iuKdUvlxzQ/oQ22zd08K+0AQFRZJdGREvnwoAimArPMP
 1ROa578YX6I5MCWNiAalrRVuI7NKQcqbE2RwMIiCR7AvxZ4dGFVzyzlLA w==;
X-IronPort-AV: E=Sophos;i="5.85,264,1624291200"; d="scan'208";a="179654008"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 14:50:13 +0800
IronPort-SDR: BjHaoPUNmtitwfx72sPlSqui30aBzF7P5n5fP2/0FnC98dfvm4qq3P3BpVFxxAlDnJ6HQcAgP0
 tMRn/ox1ENDQ94+4cTXLnftYNEALL3eFJGcmZgp5TFpRgtk/0BYP/9CJ1g+KIf0EuMxtoqodli
 WGLon1ydPCxZvEBewSJsOL65kfCn2ftqtKpO5rUvzCGUk9XeTDeZc1qZtWfFzL2MPhSfrMwjCy
 r80YzZQxuahDk5qc058aMl75rdegRqUuFel5oFEJq9zmdyCSOA37MDqWRIJ6FeB0CW0zJSRSZ8
 r5NMNLWJNcHbf0qhUvcBLEZU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:26:57 -0700
IronPort-SDR: G9zlTQZ8IW8HlN6r1hP/sXiUnlikz0wcO6gSxEibSOza9gmn4d9XkM/YXxTkcQSFDclk3nxwS1
 bLBPO+9pDFvFugc7fhTmZ4gn4tgq0IG72WYzwpZmSyF7KShQVgYMWx7BqjwhMSkGSTta1iCuXC
 nBzxOwCd4qh8A9wFJDYQSTqkzz7ccY9yOGp8igewPm0vGLJecFA3vXQngHftkOgvJvtk4p0ywi
 QRbB3aj6Cx9nrlw6kWKec3BLKpHTaB0sSE7nsBnjKuGVE9S3/meb7hftRIszRt4zutiL/aYZFV
 SGs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:50:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H17hh5g0vz1RvlT
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 23:50:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1630651812;
 x=1633243813; bh=CabCeNKMr2BSUP3/hzRnLm4PnGZoL4nLnozgep7bsco=; b=
 pT2oUiO1CRD7m6P+zHS8d1KCkKNeI12UNIJ5Gq7r9YX+8Q1fV7fAw47z9WFgiekN
 5W+iBCHxnYEQBBRYPCLBim8o04IGQ8XDLcdrQCm2MCCoNmW6Dw8zKKCC/hHonx0/
 rMmZmvm9xMjBFXWCkeDdA/ZDqBTa8/tTeCQBE7Fo06JKlWQC2T4SqjLhWg22bybN
 5pS90+nt51CtBxFO6WYmH/THtiK/mlE+eW4BNbMAhLgT7eyvOOe0h4K5gpTVFKSS
 4ZVMX92hteCfzuoo7tUomTiqdB8i55wnMMzRZXHCIHHL6CjLvCSdj/HLfkonMbyK
 dlZrslEDQEtPTBd8qxKeyw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SmUaMH67XM_z for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 23:50:12 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H17hb6spBz1RvlP;
 Thu,  2 Sep 2021 23:50:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/3] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
Date: Fri,  3 Sep 2021 16:50:00 +1000
Message-Id: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=873c9cf92=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Using a macro for the PLIC configuration doesn't make the code any
easier to read. Instead it makes it harder to figure out what is going
on, so let's remove it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5624adda58..d562ec6722 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -550,7 +550,7 @@ static char *plic_hart_config_string(int hart_count)
     int i;
=20
     for (i =3D 0; i < hart_count; i++) {
-        vals[i] =3D VIRT_PLIC_HART_CONFIG;
+        vals[i] =3D "MS";
     }
     vals[i] =3D NULL;
=20
--=20
2.31.1


