Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2869547A433
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:10:21 +0100 (CET)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAwG-00024Y-4l
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAk9-0008HC-K3
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:49 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAk5-00082a-TN
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976265; x=1671512265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ArGPMCh97PSnibEy/GXUjh6KAJsQvEfIS19bm7YPrco=;
 b=VmVPLi/puiv2Evet67ZKUy/zk7r9C6E6ys4mfTQnprUzxd8nXCK6cmed
 +784xSbKyuTXMo8Ncd0DPPbIY0UzBPAhk0xR2YCFi6C6Df4i8qVfAvABh
 lhwN/pnEMc5Etom76BOFPUrREDIk2DJ4Sva67QqyDn0rOL7ETjwo2xJRV
 QWwmqhF2jzvkYRqh2xPx2yclIC2k0QCZLlTv50wB0PTO9NbRhWrEYRLzK
 cZIppKlEXTvxEsvhnzyLqtGU5qPxSzRucE5pjHMlioKnq7ChNvNiQXOnd
 6HZWgJRCG4lVs2FjwOCGYWwjmWI2ZBHEFXzPlAawJuE0N4nQxow0nLax2 Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661883"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:44 +0800
IronPort-SDR: j5nk4AyKxwo8CqbcI1gLf6hjXxQmq0lCZNNaNtTQUIhYcg5lx45qrD8aKYTqtye9YyBCwIwe9k
 6G5Ve9PwILppoBX6S22CMTeKuQSNs/Gl7Bn01gOfjG6ZdwyTxMH84qcnqIQqhLpy6JVmRh8Q3b
 U7VC/EWSdjS1fyZmfhyfoMrDy2tfvmajasIFYSbnLIrjuxWwa6FkqOXxJdWdmyf6ezrXzoTLp5
 bx1+u2N0uaNuDN2aGq7JOYw1Dzu8sV+WSAFZTPs8o/xFVwCy+0J6tF+bVJwUKWs8g75xEgCxp7
 a1a/Xc+pbs8iBIK8Ftp02PIB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:34 -0800
IronPort-SDR: rg8BUCXbqqLrD5nPLkTa28FyAUo61xX7n2ka27woSHDhRKcICvthNdxujvk48+q06ZuP8Jr2Uz
 T3chkdeMxGD5OpnBZAZ7iRhEaXDiNYwwrzVdfOOwD/Gp6ku1+9CCy2dVVuRxpWDjtKXi2phWpB
 imE+5Vs3ycVlYmus2dcr9t42v/z8hPBX4BcxdYxiYUur6bSxWgm0DeNWTZ3RBv5pI5jRs/MaHP
 j8Drd0hjtfbcaUsR4Jpp4SnjN7fwElWxHBvx83mtDy3PyVmVeLltMcI9f6dBBM2CK9Yju4re7i
 nC8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS542dSYz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976264; x=1642568265; bh=ArGPMCh97PSnibEy/G
 XUjh6KAJsQvEfIS19bm7YPrco=; b=PPmqxsbZACFjtcPoQU4VvgXjwi8Xc0rMjE
 GztrMCC7JqmLUt0y05cLrhnVoGRxikzl0s+nqFvpQ/lFzWWqdiklZW1SR04CG+ke
 BNZIK0Ww4le4C0qMvzn9N567HVSR7cJaboqlufJydRFaGvBhBgMCq45rJqE2z/NK
 LjyJHEKZTXZzR3Yej7jscLiYpbvA8+Jzq7dWy6p9RCoR3Vrw5VyyC4OzWyASs9Di
 67/4pKrOztm355qPxpzrpotk0LH4anNZ/xqnV1J/tNL8PY57oJidtRISIcmsVwHO
 YUzlnvG5WuaFhxYGmqE1kUTy6gltmCbWkab5MQu6JFl9I+EMAuKQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tVISMe9p6ZL3 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS513PGRz1RtVG;
 Sun, 19 Dec 2021 20:57:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/88] target/riscv: zfh: add Zfh cpu property
Date: Mon, 20 Dec 2021 14:55:43 +1000
Message-Id: <20211220045705.62174-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211210074329.5775-7-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..0f808a5bee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -629,6 +629,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
=20
--=20
2.31.1


