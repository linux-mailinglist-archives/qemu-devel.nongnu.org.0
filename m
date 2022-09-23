Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0505E72C7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:18:59 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba9S-0001YG-MA
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyJ-0001ZV-VA
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:27 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyI-0005d0-Ag
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906046; x=1695442046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DHQzmPIeQnXV7uw2Rg+3jXi+Skw1XkHJaFatBF3mOvA=;
 b=bMRdr+oFFgiUCT9y7H+uArDvaFNDkYNszYVHlX5Wib+aglfAWGl01hOL
 +uGctp0zYHKCMMvj3BTfUVXiNxFnemzPcAchcdmdbbJjbqGsPg/PGAK9v
 nYwEOCpdqH8ySCrfQbtkH2lGArtpalnJ01/VsKPWztSQkbdSATmnqb0xG
 5iqk1VdWjIW9adP+v36uFVJ6cF2rvkL8rRhQFG6kAmbD1SxKzb8JQJS98
 3a/gAS82JYmmMpMy3oiykx6UCktDNQmWM3dz38Cuoor27C96LQg3OJET1
 3RXol2/ozHkVSyHGvBgi7hsgxAT46Hju6Rc0fpQTwGbg6gA/puCNPncCD A==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510462"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:24 +0800
IronPort-SDR: JH2//NmUS2YEwKqvTOe7zFzjOfWpxBVrnsKvJNj2qnR9uGwCxttVDdQ+us5bVCNZBu4XV1YyyW
 Vn8uQ7t5SpjLAmnq0h6q5Vou1WyJojTGB2ik2LZfH6o6qAfY4Uk5mHCtH1F2WcvDSE2RlkmfoK
 Rp94tY5z/2L1OFd6s87Lpt3tUyPnlQq2mPAtqkw3hLei9TLAofrfyeQZAwDyju2B3rIvhVgR0a
 vmKcKrTJzVfx0Vfs6vqo4pdNYx01//j+jY83Gf1XHmIlT3g/CcOMVoValg17KMSYp/TSeAwYt4
 tc0q7vs1wiV8sV6bN0YWNUdA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:27 -0700
IronPort-SDR: 3JxdYAkzdnojaSjWCjYyXWIeMYU5XZjPerMM/9pZRGn0ufUc+3gutxH6rzLmP+3eQ+riroE9hN
 MsfwuxsCguEQcsp5tR4iNqEt3+AXmxUYX0Dw9u41fn+nYI4uQbK5GwdoOHV94gS0gWr9sQmXz2
 g2ZGYYEL8f+EHQaYmXdr77oTkiOWLNhUptdDVayJedUhwtZR1drNRTaiB4/OlYAVQKfu162lZs
 dwwGN4nRRW0XitdjbZZZH38KL5bCwpsuShswS8/SaO4e6/PFRZVnHAhUuo7qbdA12emhi0h8ta
 7LM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYds82Bdjz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906043; x=1666498044; bh=DHQzmPIeQnXV7uw2Rg
 +3jXi+Skw1XkHJaFatBF3mOvA=; b=cvrpB6XJ7ECatoYHxhgGkaIca5Ib6515tQ
 ytS9Os963F1jebJIIpn+pqHknyxZGoccXwRH1PU6hoqXfWoWt9BEKtgJRO8vlKNA
 sIwxJQ0zOlj9Ao6L7pXJ9eJuPkUEHr9zB0cpZC4t4DB3lYipVXO8z47rQELPsCxD
 MFvELzj20LF9bkug4MmOY9qoLJ4UFHEcDQH2GI2i26idLEckXxgsmLLM4uYAFrMi
 8RwnrTjQr/7HyAxOJZkKYbBlSNpSlUSw/zPcNLtZflWYzDmPmlDf/UVMAQMNuJdy
 oIYfludotH1IQCAlV9yawbigYXT20s73+za3N8PJk4PPcHXrbUhA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id z3iUVmJZnTz9 for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYds616W6z1RvTr;
 Thu, 22 Sep 2022 21:07:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/12] target/riscv: fix csr check for cycle{h}, instret{h},
 time{h}, hpmcounter3-31{h}
Date: Fri, 23 Sep 2022 14:06:57 +1000
Message-Id: <20220923040704.428285-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

- modify check for mcounteren to work in all less-privilege mode
- modify check for scounteren to work only when S mode is enabled
- distinguish the exception type raised by check for scounteren between U
and VU mode

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220817083756.12471-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b96db1b62b..092b425196 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -98,17 +98,22 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
=20
 skip_ext_pmu_check:
=20
-    if (((env->priv =3D=3D PRV_S) && (!get_field(env->mcounteren, ctr_ma=
sk))) ||
-        ((env->priv =3D=3D PRV_U) && (!get_field(env->scounteren, ctr_ma=
sk)))) {
+    if (env->priv < PRV_M && !get_field(env->mcounteren, ctr_mask)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
     if (riscv_cpu_virt_enabled(env)) {
-        if (!get_field(env->hcounteren, ctr_mask) &&
-            get_field(env->mcounteren, ctr_mask)) {
+        if (!get_field(env->hcounteren, ctr_mask) ||
+            (env->priv =3D=3D PRV_U && !get_field(env->scounteren, ctr_m=
ask))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
+
+    if (riscv_has_ext(env, RVS) && env->priv =3D=3D PRV_U &&
+        !get_field(env->scounteren, ctr_mask)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
 #endif
     return RISCV_EXCP_NONE;
 }
--=20
2.37.3


