Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF8560D90
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 01:34:31 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6hCY-0007Rf-72
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 19:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9V-0003Op-Te
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:31:23 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9T-0004Of-Ew
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656545479; x=1688081479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLOOBif4pCDYgoFjEfB6Feh5vEd8rtZcstKimUQcuvU=;
 b=OFVWti5dZG4AI9MdVsxOaAtHx9I/LGP7VgStlY8slXXiCdYnZ/YzU5Oe
 ypsaeMun8e/l8jIDiRGfhQEYqO+bpMoJL5Qdl7ZFcIN7P2A8K81D4NP2K
 xS1davYIdsJgAHc3lG/c9nu6xM9paqziUPObNIYRgu4PrUxi6MjxdS/Vx
 U3PzCi851jcecqdawkzKgKjuHrIYxizZB+oqgvVETFtzRnaFFF+9+BxuD
 S1TLCmaaN/8hClYs8uQZ7rxYj4QA49zEtorGmjKqLGwAsjo/rpBcXueNd
 ZrYXQGxXqjihaH6QIZMt+fAvuJZ7CoZvgk/gWCyKuFbE35Pd6ixfw01a8 Q==;
X-IronPort-AV: E=Sophos;i="5.92,232,1650902400"; d="scan'208";a="205161712"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2022 07:31:13 +0800
IronPort-SDR: P9/DgsVf35oO/mvz7V9m1csejfK8XQQFWGx3JZw2gAEG0mmehuaYsXmvNhGcSW0NVRH9o5oWkb
 PH7Gea2iRXVfZWyq/EQF2m/aAxXvW3JQICjEYrvarDCCeRVUzQRU0G1CrTmoNefYKyXcPj/Bqb
 g07zHsgDnk9P69To6SH8pO7f478NJJ5qilZJjA1ndD+vAYRrj5/43AC+T8GbXr2IM53SMHwl0l
 Gl3TNObPPY6NjbW2Jydz6MXKsIhMuvU/SYr7FesmCtBtrYHfMKWsCg5mTxJysOBjn0S5K98Foo
 yNlJgaZr5B/h2PQGKYUDnR/d
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 15:53:33 -0700
IronPort-SDR: E2zOjBRAs0zTZAbtiG8KRWRNFmvp79MvHQl+F83qoWZsWKnASI3tzhfoVimCwYs29+4EhmAM+o
 Ko4bn4d9ot7Ev+WGXr3aP+W6/h5aqdAYMPF2eV6lyxQCmsa81vyzNse8t9BqdLnjMKZG8CCmP1
 tfKzFVDOhblVQnWa7ZU3QyX3p/7J/Ldzye5NDPgQIrK14SfGjFfHpdh1gF++jsvM4HNl1kIjcn
 sRrktJT3UZ9y543Zo0D6DVPPojza2hIyJBj50Js2IS1pXKpXXEyDVBok7PE5kSCVpuzurn41nf
 TkI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 16:31:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYHlj2c5xz1RtVk
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 16:31:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656545472; x=1659137473; bh=OLOOBif4pCDYgoFjEf
 B6Feh5vEd8rtZcstKimUQcuvU=; b=FjRR9h7oOxD3xyfcHBGp70X83aRcFFJBNy
 /JRh1bSGZ5br6NQVxXh+qQ2NWzanqy9w/HW0heUtfuBjNl3Ct5QWuaiYUlplHLoR
 u4eLIwFKZ9BE/Fx+KVtBTqwUXc/f2QAWPMldbx6/6M/Vu6Na8GCfee8p/QipS394
 zlqIte2iazBF9gcZqj3T7TXN2i+9aklBWzzXED9CMItTzPNeqLAIWNZY69JCY91b
 ZY1Gl9fr6T+ipno1FYUM6Xobu/8EmvKvYptbvDBlqgVSKIVcEIHJdrUrsSsdLjLg
 6NC2oUMu90Mx45kto1RH3emO0R9IKE/U+dWEvCRddX1IslD+1vqQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4tXICD_C-mUm for <qemu-devel@nongnu.org>;
 Wed, 29 Jun 2022 16:31:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.111])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYHlf1P3yz1Rwnl;
 Wed, 29 Jun 2022 16:31:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH 2/2] target/riscv: Ibex: Support priv version 1.11
Date: Thu, 30 Jun 2022 09:31:02 +1000
Message-Id: <20220629233102.275181-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
References: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1723d02fc=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

The Ibex CPU supports version 1.11 of the priv spec [1], so let's
correct that in QEMU as well.

1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05e6521351..178b4de51f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -237,7 +237,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu =3D false;
     cpu->cfg.epmp =3D true;
 }
--=20
2.36.1


