Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04630495B9E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:13:19 +0100 (CET)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAp2r-0006yP-Od
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:13:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0T-00082u-AG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn03-0004KU-67
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744935; x=1674280935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lprmGJLTu2ZrN13aa8EhQPPD/xU5ZwL+7vgWEEfKfbQ=;
 b=DR0dq44L8AFLnzMqr0fhNeSe7S7oYF0A7uf2Xj1S/YWn1qY61d5IbsFn
 m3U3aZB/4ROdOEx8yz4Z0/ifYxLceZj2pKN9e7ulJZQHcnEelhwz2M7o6
 NXo1UaO/J+AVpqdi+aXgGTng40nzWAfyDHpekzEGjmoBsfK1dwaT86E68
 d0grl6oWXHm7uK0WU46XF7S6Ok7zqyfdEyYhODD0x7tiAKrQ12SFLgtZX
 /9/mrSrvH027bUutsFo8zFvdGgMjouDyMMNxl4tMz12gXNW4e4daNnLAc
 e1KkzCURGcHIrotefrOrUAI582bQZ+YFaiauWeGzjt2679bQ/em+5/1yA Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083019"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:07 +0800
IronPort-SDR: NUJZaTH8puGtKTlR7lwbkNEoxJsxXXfMkUzf/Atly5qe+cfc+qobY6KxMBGIhycPL4MrP6rCQA
 v/Q67raSo3XmJHnb9t0Ysm1vCghRbRznI1oMMTjc4rW4dzx4hocQnm/e40slJC3KmN3DyuS79K
 fzzY3aNg9VsQydPpObWxTdkxPogZ/ylfc6votc7u8A4hA1IUjpUHcT2GxhhimYs1c6IJOz+9qi
 3ZbbhSes81Hv4Q7MuHs+Fxetz8sRcYk3r+UMqRAZxoHYyvoqTIObeXgkNQCmSzoG6NUs9NrV0a
 HcIHhOvrDnsnBGcXx/Q6acM9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:34 -0800
IronPort-SDR: nqVT9rQr1hg11HH8r4MIMRQB6aJXRRpBYM/3K7FyMd9zO1PY9LU3xCgDXIOXN8tZKll3X7mrhQ
 k59hoG1gVQv1tL1m+srLcmDYUi8nkFU+0A4W0XJNq8wN5xi8tiIcUSqSJ/FJBwcU1N8CU8fekZ
 iQQeDaSYZQ5pmrqJXZk1rosUVtKOWsLMdoRPPtiuJCmlDG2vBXWO+KNtQ7kdTNA+jZY4gqBo0M
 4hb7Zf3A99cW+nOdlryZtSyM0iLN4vAjpSFDGeZFaSnK6i/6B7Gc+bRAzgejW4IVZoWB+8MJkR
 C8Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zR0vsxz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744866; x=1645336867; bh=lprmGJLTu2ZrN13aa8
 EhQPPD/xU5ZwL+7vgWEEfKfbQ=; b=JNqq7ph+1Jg5OdmFxkHOlWejzwJp/vLunA
 XM8w76cCA2AW2H55Um6zbQBFlAjWk+4PLY3ahJYpmIDk7ME33lt9T6Ji/xPy7JuO
 Ue8DQiPrSu6xrjJhENsKfb0w2dy4HFouwhMEMKx4OzjnfveOjx/cizxGvv8Dq7JC
 /8KFAgUJSVIWTQzbT+Rlbb25iynwXd2lEMcoRV8ti54/q458KONXXnfUsGA6tMiu
 nv1k9I3DoKZWQaT42YlvpqFbtk0sXu2fz01iwcV4A+6i1JQ4V/D/eqh+CRNosAfk
 K0pJxPxFGi8tANQbd6/b7pFi0SzBq8O8CEK4ABr5ZkQ3PBgSx6CQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id USbTCCg-iphL for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:06 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zN0f4Dz1RvlN;
 Thu, 20 Jan 2022 22:01:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 35/61] target/riscv: rvv-1.0: Allow Zve32f extension to be
 turned on
Date: Fri, 21 Jan 2022 15:58:04 +1000
Message-Id: <20220121055830.3164408-36-alistair.francis@opensource.wdc.com>
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-18-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ef269378de..c2b570e904 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -688,6 +688,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
--=20
2.31.1


