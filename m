Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D415333AD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:52:10 +0200 (CEST)
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdNq-0007yF-1I
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGg-0007TG-O3
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:46 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGf-0002Yx-3O
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432284; x=1684968284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3AEYFDB6hQDbT5+7pg6v3FCy06YHNWSG0CGrvKZjDs=;
 b=NgxK/S3XVbowINgovekh3LMejNVaEEbXxJGssXBF4f3RDpnAeTWqihwG
 Uk8+3talrFeBengMsNgGTbL2HHYSBcM872tI6HpprMFxWs1GeSrzMH7q+
 +KbTz95h3O0snHT+iNme3KN8yju0RhqI/GaWtTerSzshfgTiaJYu8TOeD
 uWnJduFi2wXwEkg8YAP/LZc+swgkNPcb29O0Khy1RGNJyNGqMFPzihPIP
 kfDaN+Stp+FJB1KdCsPbuO2UD2niwhWpjERY5h3hO6dDEgm+dmavxlUUc
 bSMbKXp8sSdngEGpBuK896Xy8mKhxF78YW6yFwnybGK1E8yXxjA+3fqCP Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566654"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:44 +0800
IronPort-SDR: q7D7g265gBFJjm4Js3WD2bFDrEf93/4zknjNatFaLf7nYMe2x1qdFFEdt09cH+M2187pZMTm3g
 qaRAgIX5IyUMVCMiIHKvC+Dh1lc8cLAqzgH5Rr1XWYOTo/ghJtH5V3ZZEPlFyQROFR3HDuuIQu
 TaLgaUX8Yb6C5kSPgXeaZfYQNjvZFJmEdE2yjwZsBi5cMKRWwDcj1y0gZXPpNYCBGxNBs6ttz8
 OlU7tTNzegymy09vH+V0Tu48tVGQoruzFxLVW66kd2JA4WtM57gUC3+FUM8Kh2acJx3pNVAkev
 k8mH9lnAmcF4cvv7NeuugJ7b
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:16 -0700
IronPort-SDR: ULgCUdVJG8iF3vGAhGvXFqAdxty9zcy6cuJV7z4i85vh83Ne0zF8s00Ln8M+e4oRTanVUc8qZL
 oSSTiQihVDnIYPvN0NNnFRkoXpPKOF++kpYULgIqSuuGY6cTsubUStCaSd7ZXfOuVRdAldExcI
 o1OHsCVW+CCgPioisfv5PdmvO/2Fgb1TMsHp4vatCYgT8B5f1oXuT8oCZ0V3yxVGahfAqG03O4
 oMqIbKfFvpNklIgv0fjtVsItLNPFAHDJCDHHbnSPK/F4V5iLWdi+15m04EdCKoRh9kiAaUoiyI
 Sqc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qh1NMVz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432283; x=1656024284; bh=M3AEYFDB6hQDbT5+7p
 g6v3FCy06YHNWSG0CGrvKZjDs=; b=G04pbmDsjP8itbKMN2Eu1nEtF11Rsv7naj
 vIfOMClGGypoqHlckuPzOMSwkg+0K6GT1sA1ZsmFfmLuWwA/l/R/AFOAfFBAQaSM
 7/OauDcBgmAHGr97JsUPSRbkLiC2yWgxvrKRQlxbHGHmt7HinFUO4DYw27EnuiHy
 94KFUXASP+chw3mzsFWcA8gG2bIz525ChtHxkWtIy4CqSeZ35MyfMmTSpsmqmZNF
 y6eWha22dkHdwjMPPxMStV64w346uhMBwy9E68KPBWLA/qEHSESQZMW2vtn9m8pN
 7KUt0UL/a7ZvRORMtYdFEashsvuZYIyupBHmHh4IrIN1+gILafaQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id efl3KC5ME5f2 for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:43 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Qd20Rjz1SVny;
 Tue, 24 May 2022 15:44:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Frank Chang <frank.chang@sifive.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/23] hw/intc: Pass correct hartid while updating mtimecmp
Date: Wed, 25 May 2022 08:44:08 +1000
Message-Id: <20220524224428.552334-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Atish Patra <atishp@rivosinc.com>

timecmp update function should be invoked with hartid for which
timecmp is being updated. The following patch passes the incorrect
hartid to the update function.

Fixes: e2f01f3c2e13 ("hw/intc: Make RISC-V ACLINT mtime MMIO register wri=
table")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220513221458.1192933-1-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 0412edc982..e6bceceefd 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque, h=
waddr addr,
                 continue;
             }
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
-                                              i, env->timecmp);
+                                              mtimer->hartid_base + i,
+                                              env->timecmp);
         }
         return;
     }
--=20
2.35.3


