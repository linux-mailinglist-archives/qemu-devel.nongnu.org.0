Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E1374C1C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:51:04 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRIE-0000ub-Ub
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQt7-00014Y-ND
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:05 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQt5-0000ys-O1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257103; x=1651793103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HRFnRKpT6eIKGkJmmSWcNkwahgPJ7f2r03ru00s2A0o=;
 b=J/PvQ6se6ysXNyfxK8PbrwdseLR3LlsgcuIlqbMS99huiM0Zy6RH44Gh
 mnemjA6ucq55LJDnoKCvBQzQCxKXtNIoMSStfcVV+BGDvwMLBEODXAsXi
 GECtvPxJBi/hZGLJVDV8RxfKqVAbFBjbKMo2k9TonxMOfAyTGHAZ5tVBU
 mdpG8ChM/YEzY6FNuiUhqeVVuaOOM5JeVR3A19ga6xWilvHKC1xlH2iKk
 6j1EVjhtEHE5UBn5faE3eRSqpTmHr2QbVJJUOAkve9Ubme4SleggeDr/I
 bDoT7geTElT5uFZgsC5a1W8OzDpW6HvNEDez6KAy0KGkTl+15lmro13s7 g==;
IronPort-SDR: +k6h2DLeR3QpzcyxljvTAzx/RY0OzXygb+G7Zx92Kup5RpuFsdP8de76jE7MmyJg1OHoaHwj2T
 R10UQhCs0iq5NpNICfnz/zhQfIF8vqUcVFtzI5s8Zy3H0Lovyq3p4JWqcS1+zGVwviK/trvF7A
 +jNQHE5kMH/6h3TgtMD72g/gzOC3Sqj0esX6DDO3HGhN3vXYz0U/9gZMA5MA4brx9JjTzDHLPw
 cTDuNNOrWZTChMq8KUWjH9MnLVa3mEKLWsWmff66CvLYg2proTO0Lzjoyg5YHTF5zEiFUE92NM
 lxw=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585974"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:52 +0800
IronPort-SDR: bJNpDMCorW3G39ZlElDDu29aWRIdV59yMwzlZlxR9b9Yio9L0AxVqZ4QgIduJRahlxHvdD2eZf
 1WaNids0N9TmBnfQ5dZ5COhzNkZx6nwytpOX7IimD8HZRz3g9H3VVITodtP/MaCMPbJAd8d9lx
 YWp95kytX8d8YQnCMrtbH1h5nFH4rNvXqrs/4jb63mg8khAQ4vy+dhbRymUsDNrc1Tt3Z8J7m1
 aR0voA3/SWLPC5/Fdzc4lFwOMWwRur6VtbSGJQzXzi4qm59WXy/D0LFlit1fXwlt9i87ErISIe
 6RgVpamJ4Rpi+Q2J8suarDQw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:33 -0700
IronPort-SDR: +XDJ+uz/bc/i5QwWQPH1HWgzcnVPU0h8VGS68aa04bKQQn2rfgkJ39NHE8crIoPo9XLcrvZ6W+
 rNdtkONFrzAVoa0uSlgZkUHL94l3TqIq/vAJkSd9imfZroFrpR7cPiJLg7rD3Yi08HgueyWCxn
 DZ+ncx/qY3VRek23lFtGL42l4HioMGjn3EIilXlsxSJKHKXGQOSA5oXO2Jgh58TcmJGcW76qXO
 Aj0F1irUxlEavROdAFSinzaBfFX1rfjiHA0eODwQPaWqXEHr/EzPk05I//rTf8WiCH+S8kSapd
 JFA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 28/42] target/riscv: fix vrgather macro index variable type
 bug
Date: Thu,  6 May 2021 09:22:58 +1000
Message-Id: <20210505232312.4175486-29-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

ETYPE may be type of uint64_t, thus index variable has to be declared as
type of uint64_t, too. Otherwise the value read from vs1 register may be
truncated to type of uint32_t.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419060302.14075-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 356cef8a09..4651a1e224 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4796,7 +4796,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index, i;                                                    \
+    uint64_t index;                                                       \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
@@ -4826,7 +4827,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index = s1, i;                                               \
+    uint64_t index = s1;                                                  \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
-- 
2.31.1


