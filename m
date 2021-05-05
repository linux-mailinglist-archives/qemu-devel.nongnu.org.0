Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207CC374C1D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:51:59 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRJ8-0001z5-2k
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtu-0001zu-Va
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:56 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtr-0000wu-Sl
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257151; x=1651793151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PH9mV72E9bXrh9R0MkptPiiHh1DAnrn6j54hAeX+lmw=;
 b=ahKeKMtjmUbTWrXULWXc7+N0vOHy8aYCzIGapgCdiXBgVUfQuh3v7rYG
 foJoUzMrkpNrW6GgmdtKOVKR4m//vcThu47pVY9kaLITrm6rpP8HwyTWP
 HyONeggi8UhRkYT1Wp3ZLIxrp1WB8Ggf1ZXUGaiQCUI3MEyuVkxMicxkx
 iSkzHkB1FVnA34f21F9l12NO2uv9z//occyDKN4dmOMHI6oqaW3qmDBaC
 IdbM2ibjbJqw9wOwbwc9DUxJfLEii3w3fLxCJDQiOqN/aXF5hnp0K35AL
 xoWppz7aXxxBiDa6GXUcUfcpZyDB21qNX4aq61E2REs51dtYw3FrFAx0C Q==;
IronPort-SDR: ijjwfIw8qX93fTDS0LkCo5MOo94nPRqeN9vuvKlkZDcj/VLFIi1CdQdJjI/GNsVBoql2twZEl6
 zmqepg6txdur5lwF+S+5UCFYqsWZDhcT9HgmLyDtpDZgEPu1RYBn2gPKrNc1GekDnoow3J3nxx
 UcKd37XXdbMitmtv6lreZwC+1efAlTAOBdleU6I+XG21epxcoyhVl0YSqM5pa2K2yFapvhuKLy
 tc3f72sxbl3gpJblj+/2FB2KtAwRv6ADzn1IVXnrLhbR+bR7evZQNf78K85JpBvNIhJ5gFRSFC
 +j8=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586035"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:30 +0800
IronPort-SDR: KEeCFfCJ5kslB0v5nYi9GFBS05leSL8NhVJ9Y7zxRILBizxTV3cCIGnnvsWyboQdIVknHiyDtW
 PvWVtmEytTqmrtWR12Ir2iJQ90LF1rI2RO27zQfRWqrlaxQHKHxdpsgsplBS92wgcN3XcLnHLw
 isMoEkYMPeo4M6KTPhRXyq3oEb2F4h75rSWH3wGUL5HhpD7P5ycVb42265GMu+WRS886o2BdKs
 6rSpigBGvPpKvWtFqx12vUEDyEMSYp5G9kzH3IfUyJJrWQgqLHLzQYlfHQpVsncE/Ocmogtcxf
 VaSb0HsmQZ0XUlZf5Y3yvvcO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:04:10 -0700
IronPort-SDR: +JurmuOsBmmAxIVZ4Ow8+/cy7wMneHXclVhjHZH30Z20cEpSPTtwLvZ+TRrPn8uLU7VviM2C1h
 hOnNxTVuhAap5a3JhfvnFyXvIKxTJxVbiuyMp+G5/zSfrsoMBwges+40WtGrlJ9JUViLeeEDxo
 qoBm321ynTuL4/fzv7aOeRV5R7E5I94zqjD8u/elg1m9Yto76Zn3Phuc2skQ5Ahu783BIaSr2g
 P4ZgEpmgRXNtFuAJ40QPuL2p42lioxV7UEd6w/ADOEJhV/adFr+QIPetTg1uRWgHv0SM02AzEJ
 RHI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 39/42] target/riscv: Remove an unused CASE_OP_32_64 macro
Date: Thu,  6 May 2021 09:23:09 +1000
Message-Id: <20210505232312.4175486-40-alistair.francis@wdc.com>
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


