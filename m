Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088FB37A534
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:55:18 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ2n-0003k6-3a
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXx-000494-K6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXv-0006TG-Uy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728603; x=1652264603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PH9mV72E9bXrh9R0MkptPiiHh1DAnrn6j54hAeX+lmw=;
 b=O2YfnKnGJKVt87AKspCX5im/lp7OBvWKvJTTUe//AbAzkDwC1rO8Jt/+
 k8kZuO3Lm2EsUDfknYv2jx317H59ntyGPvvn95k62PmsRuFpkZ98s5Oi3
 /w6kvMZMhHIWmOr8AKon88JUxvHFbfNv7vIinUv9atjV1bfN8v85v/A98
 8W4Bvc7y/7QFJzrLJPqj3eeboY6xpzHPIekz62DZfqqFYxlp+2buJRdFf
 tJPOcahyiE0ekc7Tjh8JGodiGYRU7rvSGcG0sprW5XHRD2wzMuPjYVbwu
 b93JazHzoFZuEXoQ0fMoiMQRGzUf4b/P38lYAtHxT1atImhSrLsIWTOqE A==;
IronPort-SDR: pKVK8XGVZBEx6IjN6ah/nI9kQkgDgABRHtPG6eZvJ/iBIh5nze4nF+wd/VWWvpip4eE5fwtHaB
 SkvjYmWZ5d6gKBbAS+gsQtMcmDPtzT1xL7pBpFJnvnB+60MAW8JjncX2mgkDl1q6+wqi3OP2/I
 ezaVnIQKhehX/HXhZKN2HPP5JVPg0HQO3JqGHTuUi+P7anDFwc+E9jVqbeArGtaserRRwduKyI
 BEjwKeC1Q5R30x2CHzDp/0RThu/isaRXGnnAN5OKtynLb792poJN+WcdM3xcBqOuBWLhLZ3amh
 MWk=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735514"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:22:08 +0800
IronPort-SDR: JiU5tRkkn2gYwAhUyz615w477WEIg9zUqLb5Xj+pj1FBfJ+I/f/g2cr+2qoPZlvV9q7IzLt5sx
 5xpOxjdqCdKp7uL7droNfW7dhDOJmrhaEDMFW+wK9NEnSwXOV2hluquGQiRO+AMY2JNSyxXTzL
 8MqLue2u1PxOKkqhojFfKPCzmiSuEdJKwKEBPsm1rIljH0chk+mMLtfOa4K2uDAxnXgwuYERlE
 YEGJXfMi9ZqC3xJeaSBLxdXPF0z1d5YINUauZF6x7FJqZMdS0vtb+KZ2+8tVuZH2CiCcZnPQ5P
 rNnFLSyf4Dt2XjkhbdQEBnR5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:02:09 -0700
IronPort-SDR: r8cK6OnipqcsPX0cx8V65YXGqgh5mTHRdvcJAQK6cc/wwryChrC3OPd8HhKCn02olVbUSyUZgr
 2indBXQI7s93GYBbWmkZUtFkHWkfNn2MiH9x0Ha1I13AsbMdsIE/agzePFumhXUdYMegiZDLg/
 0IlXBI40GEepHZKHFmmCI7ZF2+r0ZxX8bJEDAFSgxgTCXlePdFiTn4gTc92VdUoXIOvAJs09Za
 GTwqJ09HUZpzIrL5idHSz94z3WpA61+U8D3JeFV2WCii594eiyBijj6DjPetrmekUUavDiZclq
 Xxc=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:22:07 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 39/42] target/riscv: Remove an unused CASE_OP_32_64 macro
Date: Tue, 11 May 2021 20:19:48 +1000
Message-Id: <20210511101951.165287-40-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 4853459564af35a6690120c74ad892f60cec35ff.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a596f80f20..a1f794ffda 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,12 +67,6 @@ typedef struct DisasContext {
     CPUState *cs;
 } DisasContext;
 
-#ifdef TARGET_RISCV64
-#define CASE_OP_32_64(X) case X: case glue(X, W)
-#else
-#define CASE_OP_32_64(X) case X
-#endif
-
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 {
     return ctx->misa & ext;
-- 
2.31.1


