Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6847A49B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:34:37 +0100 (CET)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBJk-0004xT-Kq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAl0-0000WW-7x
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:42 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAky-00087o-KH
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976320; x=1671512320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJsyyRnHS7CDdpNitSp7ueruhaYZDYhNxaupNN026vg=;
 b=C8oiJjzMrhSjVPLBR424oK3Frb14EyGYzDqlwXxpVwz+a8W6q/aONWss
 EC5dZC/FL3sClEdi/BCRWgnrUyy14A+1252JRADbbJF0wQyJFXSi0MU/Z
 wDzrJDmXl7c93nqWjg/5esW0yA6Km5rBOCoYvE2NlwZ/0uIhH0CFZrhPf
 Zhk67F+6+BhMBzUV4WJXquevxunsGnN5HjB/NhCbZTn9QQ2ZKAzChMq73
 2ffFcTxFQpTlNjiVpnn8d04mfsin1vXpiNuUgvFLoTViz3/dkI5BqRunQ
 I5PkoI3tD+rScln6c8rMmiVf1mhjI4YVOmtCe/hxMfS5IKE3z/0vI4Yxs A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661932"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:39 +0800
IronPort-SDR: 7zzo9/ionu9ccmjyjR5kxC67U5R7ziCtyyAkWsOKkRlDhSnriG8o6jIXxVVgDrt+0jyqf0RcJi
 riCd3u+DR5kERKatnlT9QBerwAyB6Eo+HIttC4CUO6z1PajQkwhDVIpL9nAWZ55ojnhdV2ZMFE
 TPCQR0e4RWWAikSKTvJsfqR0aKE0rtPaQIL+tPyZRy0PCcTlIObtNDeW4bAfCF8MNoRSUdCHLN
 BLtPryq30R6PDbZA7lZ1Dk4TElfBe8Rf7LR2ER78HiF9WiII+Dl+SliL0eUtJDr53C2UJUxy4y
 gc3tmobadmwLEf0ZiJYC5eLk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:28 -0800
IronPort-SDR: 9DIBFmGEtk110deX1gGbvHR6tatbamvwbU7zMn+ynYCHB+pI8z52N8qs111UTzGw/NWtesqbqE
 fwZm/LGUQeNHjQnmlQTDBc1vHg020H35NDGSbIi1H3swWvPXeK9pc8FdFsn0wpVYQOfflpB21H
 m3MI05Dj420/TT7eb6py14OygrvCHCGM7z6Hll4MRYZ3Q8yxwFqbBvr7HfY64FsDWZNuwL8mwM
 MwatT1OlR5en1SI3HMInvTuw8VToOPJ2UgOOHNVobernbyxE3oFF4/NcJpyasbXs7mA/9c0eky
 kV4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS671RLbz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976318; x=1642568319; bh=jJsyyRnHS7CDdpNitS
 p7ueruhaYZDYhNxaupNN026vg=; b=b9lToop0HTQu8bDDVW1wqZrQV1czVqsuFo
 K0p0JcN3lQG+179p5hK7PuTUlJeGnWUUZPbRQyoJr0F0INSQK+QbajPU24FU3LX7
 AqHZjsRGPwP7anCCgoanSt/7UrDNv8/mBWNdrmRVK8anq6+wZTSX5kJw61hTlcQd
 dsHwKIvTzTcNJ8l3RHYqQYGLLrWP03NynM/uYyLA290p5aznCbA3d1ovC7HL+DKs
 J80qLCTJFnS7OTkQ6A7M4B+qzZC5ibd4WU6dGBBZ8ZX3cp6YfT6eHJfbrbm6KsgQ
 scyMIbnriQZ2JP+I3hK2DnoRuUztEQHlzBF0+RF0voHJC6dfScYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iDU6_Do8g6BP for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:38 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6369mNz1RtVG;
 Sun, 19 Dec 2021 20:58:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/88] target/riscv: rvv-1.0: check MSTATUS_VS when accessing
 vector csr registers
Date: Mon, 20 Dec 2021 14:55:56 +1000
Message-Id: <20211220045705.62174-20-alistair.francis@opensource.wdc.com>
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

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-12-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5d1eec1ea0..3dfbc17738 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static RISCVException fs(CPURISCVState *env, int csrno=
)
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa_ext & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
--=20
2.31.1


