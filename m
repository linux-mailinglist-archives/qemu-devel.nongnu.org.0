Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A074B31CC
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:16:03 +0100 (CET)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIg54-0002wa-4Q
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqx-000543-AH
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:30 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:14681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqr-0000Au-95
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624081; x=1676160081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJhe4C9xKTUjuHDZsArzEwaH2LLLcRIH/N5JeKNmc74=;
 b=otztxEmS21r6Me16lVzaAURitlQShgrbf4BQ5XBiHaNhPleyNvKr/f4h
 e1LfeiHK0+PlHRzqj9hOETXjv/e8mU1gPF7cQyZENspe+e7KuJHZDwBye
 Q27UgMRKV0+IDjwe7elLoIjiRDT+6eHMD2BgsoCrEWyuNqKAVQNW6JEwN
 6j2HQK2H90n5WqW3asXTDFId4mVpeFa75qmQw9e2P3kzNpgmQ8h4NgtaJ
 J/yOjBRaAPYPivfmjOdNPL/LW94I0n4bmh4lT+wGp//CKwSdr/F9qgWyF
 LHch6yJ9pkbQSk8yFQzOEu1Zf/nVbD6FqNyoqXAQTc+n4Oyv4zKXZtVZl g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="191669398"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:19 +0800
IronPort-SDR: JHhYU0tTlpwwVv/T1KQzEH0XtNRCIy4t//IbqD7wyYL1KVANQBsjmamz56y9JzRiBNiQKQdtCj
 nH7080m/7SCpeJINalr2x8JQ9CJbho52e/yxn6tfprJuumyovWHJ7slXMYCoO3C2SUrjnL1O2s
 m5kfP7DhRUBWqQ2gqmVk3HPNiEBgkJbfduN/9S21kk10tJUy+Z7xW8Hh+qWXNolELy36R4de57
 4ENS0NSjcANHLXvYqp69jmEqg2DYokOB7QRw+XtH60GpDi7juCVAKqO9k7xdAlcBhUH9trVqwB
 rhyW9BSKPrDkPSKoIYls+6HZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:04 -0800
IronPort-SDR: Aoc84PFmlywasy6rLCfQdPuXuxFMPhem0xR3xjB1jEyH/TMtS9N3Ok9jLAVryGqaR20ZIAStmg
 umBEHSJr6SIb7NeGPO33DOnGqdd3T5fhOeHCS/GWCqK36Lg2B/o+MAk7Me7/ZKvuNakWjwugZC
 fgSiWgKPiziDUn7UIF6ZZy+4W4gPXK699UNgND01wQv2Taf+7h3rSkGvw4i0JGSyhtXZTn8/rz
 Kb7ELu+s3DC1g6iXiLSI+ViVKE8U0qZOvLCMy7kBKFedKP2mKcBda6WL2gpfsr5+uNXKguk4th
 5SM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVy72l98z1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624078; x=1647216079; bh=jJhe4C9xKTUjuHDZsA
 rzEwaH2LLLcRIH/N5JeKNmc74=; b=grqweNVYQJ28tKXjiaahR1piUkMkY1yEmf
 V2gj0BkzsyChx9iqYpcUx8/KX8Yp7NqJJXlGCFvhjHR7oQ7ntj5wEs+e57oXYCDQ
 DvezZTJ45DlJvDNMUuPH8ZUwkIwOJQLtOaYM1vxy6uJnfUFONMiT18I+XBdRfKhl
 WaO776XFgl5Qn5BS2Uig9oT91NhZ9uzclYkMPNyHSIzLrtiZCbFk4hqn/vOWhQQO
 PaaGtDotsB7+od1bovjHNJCrhibCHI04MU6arzsp4DfeimUhC1PxPmvThWU6aOaM
 WYpl3d6Jvcfs7tBQi7d1F8to06wRxQd612FsEjwHvycPdq/LLT9Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id miCGaCQdgL8s for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVy36jMDz1Rwrw;
 Fri, 11 Feb 2022 16:01:15 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/40] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Date: Sat, 12 Feb 2022 09:59:56 +1000
Message-Id: <20220212000031.3946524-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

As the number of extensions is growing, copying them individiually
into the DisasContext will scale less and less... instead we populate
a pointer to the RISCVCPUConfig structure in the DisasContext.

This adds an extra indirection when checking for the availability of
an extension (compared to copying the fields into DisasContext).
While not a performance problem today, we can always (shallow) copy
the entire structure into the DisasContext (instead of putting a
pointer to it) if this is ever deemed necessary.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202005249.3566542-3-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0bbe80875..49e40735ce 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,6 +76,7 @@ typedef struct DisasContext {
     int frm;
     RISCVMXL ol;
     bool virt_enabled;
+    const RISCVCPUConfig *cfg_ptr;
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
@@ -908,6 +909,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
 #endif
     ctx->misa_ext =3D env->misa_ext;
     ctx->frm =3D -1;  /* unknown rounding mode */
+    ctx->cfg_ptr =3D &(cpu->cfg);
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
     ctx->ext_zfh =3D cpu->cfg.ext_zfh;
     ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
--=20
2.34.1


