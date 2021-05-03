Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E2372363
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:05:57 +0200 (CEST)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhdU-0007qv-1D
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgsB-0007Ao-4v
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:17:03 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgs9-0000Lb-7H
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080221; x=1651616221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hm1PZz5zTe2h985zHWYZPUO7Ex1Xb0pRXXDGBKNcQMc=;
 b=IU43c+1R28E+/K0n+Ycz/E5mh7vDIOnb9rV64YrBHYCEyhzA6u2DJEVS
 RsXZkIn4GmxRl4qtHZchWp11QTqZqQpMZPjnoDfzlcGycma9hFlrtHTlv
 1h1XAfDJYMBm2nk4sl7geRaOpTs849GvrTjgIHnL8Q/tL175/JR7HSo6Q
 n4X4ml+xlIaNjTC3zW4Kl39oIHB0W5wOXc19ATc8dBxC2ePABfzg1fbHo
 ZX59Lndbft8x3J/Mv8a9hZKQRrjf4FFpxS52rAeWzLJGrmQMHyv99Z3ap
 utYcn8UsJe6VgpS0h/eF2HgfVTaL8ZfuSGn7ODR0sJxckjJEWYzuj9gfi A==;
IronPort-SDR: 3euN8pvkbg0oquPHK+SJ5MvfE/ejhPwvhroAuCLvzzYmtyPwd4OP/+WsWSYZ8VX3hRVgwfl2zQ
 SVbd1W1sOH0aLt0OYh3eSOtc5a/tY63TvHOga+v9TgYQbXFzRzY6a3CEyCdgV2P14a5X9HOLZC
 TbbZ+6jf6JWiW619uUt5aYNLc5O2TQaUzWzltjFBrAL/AQuojn6J1kjLck7T2/W159XqzErtxp
 whGhcC0LQyk9VhkuJME3Tsct1J0B/4TrWQRTAXzc23maFY8eoGNMQ5s25QeyX32nrwbCnDR6Lt
 wn4=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114721"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:58 +0800
IronPort-SDR: hkMrADXNwlYBxYtVA7tjr+T06nMBYSbOyq2hRt+vuNoXNre1o5mBr5YuPmHZx9/qfKDE5r/Cgf
 NScxCJ5clASmseLViU3tK7g4WsWDPasW4v2Qf+mzTX9hC8X8bpbLp8MwmyQ8FsyjAxQhEoDGhx
 v8tHbC4EYdIQaFLoZ0AUw/QZzyB/8lbPmzat5L+tRby0uyr/8LHEOl7FKIxw4TRdp2IVPZX9mI
 qkZckeh4fzi6CV+Wc8KBFg2E0hmaZiY7I5Mxh0E3vuNlO+yphVfafJGCNtggOCAmCJWLN8WA5h
 TvTLJBXlcY9WGFqJmFA5B5GF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:56:09 -0700
IronPort-SDR: ++QhN2ZPLRpWzGIAHl6GPxCRE7e29Qx5Oi3vwbckIWwMvE5lCx5mh/57wi6/FF16CPgKAtovTp
 CkCJjeVUKH0A3OyWlb9TOxAP0cdhtymKk8Ssan4r3S72xuKH2QBlvyS1oL9tFAdX4FAh9w2YRS
 LpEzLhgyPMabOm6GdpgO6zNVLgEocWlbITDmRj0byok5RFg2SduuFddW9hBzi6g9zLfY4CoseO
 DzBSmmDlYqUdKEpf8igZzHsrNwMTElsgZcTHmlwOgDTByT6yQKrDp5gkX1k5fkz2ml+sVFxHjp
 pNA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 42/42] target/riscv: Fix the RV64H decode comment
Date: Tue,  4 May 2021 08:13:27 +1000
Message-Id: <20210503221327.3068768-43-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BugLink: https://gitlab.com/qemu-project/qemu/-/issues/47
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 024ce841221c1d15c74b253512428c4baca7e4ba.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fecf0f15d5..8901ba1e1b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -288,7 +288,7 @@ hsv_w       0110101  .....  ..... 100 00000 1110011 @r2_s
 hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
 hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
 
-# *** RV32H Base Instruction Set ***
+# *** RV64H Base Instruction Set ***
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
-- 
2.31.1


