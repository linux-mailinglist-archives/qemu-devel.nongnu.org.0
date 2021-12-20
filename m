Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F3A47A4B5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:50:12 +0100 (CET)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBYp-0005cU-Vw
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:50:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAll-0002fN-AU
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:29 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAli-0008DO-GO
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976366; x=1671512366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qMf50p7ycIupUIuiVJOmWHFM9sRUXjwuvG/fW++jtS0=;
 b=e1JBXUodlFkmWzxJoFB3faEiHpaxPKJZ9r3Nrsx9IwiSPZ2N1+s5AlQb
 fHPleAZu2tFJcV51YBUQLfuWG4W65NVV2c/3KE/Hm3hj41KNRtkkH7hlb
 S0zwef6anZxzi/jYJXj1MMI0mAsHnQp31HdHxGz242fCs/HfMDr/owHKI
 84gSVwujtl4gmvwqtaazZPCvjPHehERypby7G3qjuBzQQIC0lNsYj9fGl
 IDy8Ic8IcD7qTvenRc1JaXqtC5nOHLu8U8pyIgWr2myCj4jQc6fvf962J
 fe28XGKiMMzhai0NV9bh7+3V5lVeSY48CEw8VuKC0iime73LkJrLMPUMN w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680040"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:25 +0800
IronPort-SDR: NtfPTKLMtG+jIoOsMZrwJWS5eVVC/B4xvO/IC6xbqRl5GEdq44JtarG/mNWLkWWQ8qVfayJrIS
 R/kzrCycularJAmJp0pnxrjfCZ6njYKCFsjbFkt9T+ICYpXELsYdIFvkPGzAnz/t1nfrdhp3qe
 +7QSaQpIaLAbEI5v/bpgOOBDhCAbcO0uEg/LGb2pPYP4t3T0idZ95ztIFmR5rZ25nbX75fDtLE
 3Ky4Wc9kiEXGSqaZCPgKP4aYiniD6lzpg6MZjc5Of+NfoB1el0Yl2AgNtu92Az856fTGgBdQtt
 18Lul1u8u4PyRxgLNsn08zyP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:14 -0800
IronPort-SDR: QuarAuGZnLkVSblheQtc8c2XCCo6t5Qv4xVhi6M9d59LSJK/NjWK7AqOJSLeWO2dII2hSHkW2y
 Q8Mpsk4TC9ueG1FwwELLe/gfSWy4v3OSLK6dvrroFkq3ZMhy/6H5GHFPJjrK/6EQ7e2XbVa81b
 mM27TrSmGYYXEcuqgT4hgdB6iCTS/Hw4uVColjQyz80Q88hkMJanjoeEZ8/USahUhqF9vhYIto
 Q+NR3qmF7ooi04IyiLeAyyxKHHZs5dRzaqnrVMwPP9KSCuer25fTvynY3b/Jvxh50MxEs3UzVc
 7kQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS710Kq4z1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:25 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976364; x=1642568365; bh=qMf50p7ycIupUIuiVJ
 OmWHFM9sRUXjwuvG/fW++jtS0=; b=FR+XMKLfIDFJym3B0DonW5/4BrYHI5mimz
 HV1IbHvpP/1uMI38aCUV8s9FNK2kgnJ9jGZC3yWyj4+Gc598GnIpE2Y9LinlIOEk
 7WCsXQhAvsiScLlqza0DCedT1kTuPa7MtLLzeMeHTX4RzoAl+ShYKxd28BvpuC+Y
 /jbZAiFkdfU1EwccyrGwsChdIqcb5V1QU4g5MVxOHBJ8DElDH78oSQgUedXuRInz
 uFukFhgZ/39JfbTY5BZ8JmTZib2YKe1FIwvc4Z3LPSiHF8+RtvYy1r4KynGQ4YIO
 6ttVetcD69cYB8k3kyTE22e7px4gqEBpUjqrCjlI4rBt4CwBxQ6Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 68_YSx4Jw4kU for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:24 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6x4gRNz1RtVG;
 Sun, 19 Dec 2021 20:59:21 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 30/88] target/riscv: rvv-1.0: fix address index overflow bug of
 indexed load/store insns
Date: Mon, 20 Dec 2021 14:56:07 +1000
Message-Id: <20211220045705.62174-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-23-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index df45c1620c..3da4f3b1e6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -374,10 +374,10 @@ static target_ulong NAME(target_ulong base,        =
    \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
=20
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
=20
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
--=20
2.31.1


