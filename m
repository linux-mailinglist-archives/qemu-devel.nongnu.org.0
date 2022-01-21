Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03E495CD0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:27:35 +0100 (CET)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqCk-0000Ay-UR
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1L-0000Ee-O0
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:37 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1G-0004B6-K0
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745010; x=1674281010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8GLgidKFmTM0na/tvygKsEkZ/UYLfAM6RbzY3orjP+k=;
 b=TnjUN5VEuyXCcwwXQw/KaWpIdUZ8S6r4UEiZpOOaiVWylRdMgT+FIJFg
 kJ+cD9TupH5MX1OlImFcNbqNPIXj8MrKNYSmkLqv0cG8l/fYhmN3U4W/d
 pCV5IVZDtzLrtDvDbJQM/l2/vkzeYaqZ3YaSM6HiOTTcih8/94rsh2SG0
 L5w/7Epehn1QrSQ3ytAl9Hgyh/kCFKb+uqofZB0o7Th3tLICOiEK4FiJO
 s4DY7QPOJNkUzu1m0xRn70cJ9y9CugoV397nHB8lt4o0OwxEKqk5mWrga
 LsXoS7sh8hDC6hgEhpB74YzX/O0F6Agaq9hkQ9bb0BoUUlB5GqzmKbaar g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083161"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:36 +0800
IronPort-SDR: zOFTLOCgr/DMU7grj4cBsQM4knaVrUQ1y4hjm0P+iBKlU2UQ9LKgcuaIxVcVqwlLwORDLR1mFn
 2F4PuQMeO0i+Xi5kLRXA6uP7s+APGB1KOTaUJOA0ykhDauk9oFFMzLZWahdzhlj4xy5dB6ZYRX
 0QMHfBBbFTW2ReogN1DFbtU8hxtUgT2eHdAHje9YssUrr8uDRT0/LtLv3JMmOu9w+vR4sshN3t
 AaOcc8UkQUgc7ZkDcNRk4YX5xKFrNGwiRzp0M0xbb98gMUHHhcbB3/8l0Al+3RsSyL1VBKcz8h
 q+Wi6zXwIwG+rFW0tiFgHBpv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:36:04 -0800
IronPort-SDR: 3cXTo8+tdkL1zxD2ieYR8n804dCVE8MUGzB8GJ9LbY2+VnY1hdiqKjxmO/3evcpOxcK5mqr/sR
 z5txD9JiOmyLft8t97q48yb5yY8THfzjlXEOOXqVNnoAMb6mBXmWjDjrs0Z5a+k1DVVPMvKea/
 4lvehHtSIMA7MZHZFaf2VZznh9X9OFxaTWyeTzgLmrm3DyP4/sl6XZpwBV+IIWAdCCWhFDDDiX
 6wMYgaiw2lbxI6sr80vLjOsGN3cUmh2yS4GP1d+0jY6CpKGXX8xZbGKka76gHtUFW+l43UnMAd
 v18=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg81831JVz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:36 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744956; x=1645336957; bh=8GLgidKFmTM0na/tvy
 gKsEkZ/UYLfAM6RbzY3orjP+k=; b=LrqM1J7kRxJqg2pGPeFkEwC+Cu1QvjaKHF
 py626t0+Gt25fPX+UXr3eJov4oWfhh2kJcbhBRKxeJ1TmEPaAhFfAzbW1uZjtmzz
 PXVb2FXr3KTUGAjFsFBTfRY9N1sHz20Cnt5wVbLLUIEg5DsPnx1hYpvh2PIU7tLC
 wx35v+2GcJqcFShKjTR+XcEf4Is78Ymi098WjXoalSNEnMnO6oBbOsiGiyhW3cH9
 ExIYxD4JVMsCj3lkmKs+1RDEu+4+/qJLYwZe/AzJUayQS6O+GdCumaJjnus0D7c2
 q/hB+eXFOiSk6tdVSX7NQDZFBFYCKUv0p0jlbJLgfDBYQJjnESag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KMI6urYlwk9d for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:36 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg81500cpz1RvlN;
 Thu, 20 Jan 2022 22:02:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 56/61] target/riscv: Fix check range for first fault only
Date: Fri, 21 Jan 2022 15:58:25 +1000
Message-Id: <20220121055830.3164408-57-alistair.francis@opensource.wdc.com>
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

Only check the range that has passed the address translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-19-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8b7c9ec890..efb3129532 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -500,12 +500,12 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                                          cpu_mmu_index(env, false));
                 if (host) {
 #ifdef CONFIG_USER_ONLY
-                    if (page_check_range(addr, nf << esz, PAGE_READ) < 0=
) {
+                    if (page_check_range(addr, offset, PAGE_READ) < 0) {
                         vl =3D i;
                         goto ProbeSuccess;
                     }
 #else
-                    probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD)=
;
+                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
 #endif
                 } else {
                     vl =3D i;
--=20
2.31.1


