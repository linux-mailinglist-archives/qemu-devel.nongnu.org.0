Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C49430F67
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:56:51 +0200 (CEST)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKhe-0002Hz-Bw
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcKKA-0003R3-Nn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 00:32:37 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcKK7-0007XY-0h
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 00:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634531550; x=1666067550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k9+jJycySsg7FyDvzL/BjLcA82DkwIf3DJ2Mq2Bl/Jw=;
 b=pdKZ1XMMzkRHNtLxgr9b0sgKQkpSfoPVv6ideV4xD1cLK0S18+rQ+1ul
 i2Bk1TRQa3pgHShkhtau8o+Rt/z695qnIukZ/CqSz88GSvOlgxEbGFpFw
 KOI4zYjWvj1N3Rf+7ejleBW6EPmiU1ao/hKnw/mSIoO///tky6AMJIU+f
 j+JZIvLd6K2dCiyR6Ge6U6idtpHF4Q7KoFsYFOLf9NtIiS34tnEqaNINl
 Pi+/m4x8W6zrQN7hejWGucYgp3LhxybhJtlojBXBWE2DX0Pyu3RAWpdEG
 CQGXrUzVpxuGthvfZf/K0hJUtPJzoEdfXt7B3/AfJjn8AQhpVYzUdOwdU Q==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="187922693"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 12:32:27 +0800
IronPort-SDR: zNcg2VMNSfTAC4zCgzVJV2rO4AGU8l3OIEAQ7VXt14l/pcpoTwVHaUklcDJS4Bov3ULOrEIEgR
 3Tq7b7ehHk7gUDcrRfkkpo57bYEMgpwFdkY4oo6ckIj068YWdMHvfsFT/osZmbpFsl/GsuA2cl
 Ww2JpEmev+iljw2afSdii+K4kCLSxdQZ1XBayTUprDUFm152Yoih1ZxzdbIvBQ/D50Eaq/MVd2
 X6yoZOH6Dit8Nyp1iKS8Kgj4m7ffhVekndP8JjpDyZgcR4itxXi3lAXE2G35IHaotnDim87Isq
 lLVN0MPopBGgVLdN2Q6VJedZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 21:06:35 -0700
IronPort-SDR: WKOZdPZc541MP09tdw4RLM8r4YGS6hOxhSjKqp+/NJZtd8TlbHYmV3B9AkHAcnCGHs59QYvVp7
 KElfzF/74CYK40hoZluTzsmYIMN1WBdtGawGjRwAQMU8Pswq3xWw3ABPdf30GUz1pYrKjYdD31
 bmEWzs2RTtsWtWnjA5DD8PCS6Jd4V9sbckgJl+WlDlkLLoK8chIguXegweyYi5MsQIVzyFhD1u
 +Rc/+ZDw1tucsM6OWEb5s0DpF6y9byTqBb6Pk7U1+ybDRO0kQXXGjHK3yDG3kCTBqTAifvqiYO
 Vy8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 21:32:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXkVz6S7Wz1Rvlw
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 21:32:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634531547; x=1637123548; bh=k9+jJycySsg7FyDvzL
 /BjLcA82DkwIf3DJ2Mq2Bl/Jw=; b=VfNgz/BA3/tZXEmvLMtQZQrNndW35tRHg0
 Z+IoWzrNfp3PAQN6fNrrX172R6FgrUl5pIAheRGtPQNau+wYUDGsD3+MJt/ZmUgC
 DKGgmXi2RrB5D1uJ/P9BepDkvGEVbtHs8rkDw/kIA8FJkmL+XXbHDUw5y/MGlxVj
 HgcKFYs5IjtXIFD9Bkf+jwKnITCvl1qB1WBRK2R0JwpIKPJLhK6iSGCvo6ZY6TN3
 G6G9EPnQph/qEAZ7NTU+V1l916xVPW4+CI6KTCpn5wffS+rY+e0ya7q5oQ7bV1jP
 YlV/6J19Btj57GPsoTHo2yD8J0Mz6AgFURKJ7/8SJggyCVdAY5zA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XXsRafpMiAQN for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 21:32:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXkVt3Qn5z1RvlJ;
 Sun, 17 Oct 2021 21:32:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/2] target/riscv: Organise the CPU properties
Date: Mon, 18 Oct 2021 14:32:15 +1000
Message-Id: <b6598570f60c5ee7f402be56d837bb44b289cc4d.1634531504.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e..837bea3272 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -581,6 +581,7 @@ static void riscv_cpu_init(Object *obj)
 }
=20
 static Property riscv_cpu_properties[] =3D {
+    /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
@@ -591,22 +592,24 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
-    /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
+    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+
+    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+
+    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
-    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
-    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
-    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
-    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
=20
--=20
2.31.1


