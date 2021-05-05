Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1843374BDF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:27:07 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQv4-0003E8-Kq
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQs3-0007Rh-Pz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQry-0000TN-Ao
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257034; x=1651793034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxuh/HYpFG5/VX0DQF6fAKC2S1UYsYT0FobkIKhBegY=;
 b=hcOVTcv8ptIzMHhluFIBmBHGwUFHemiBh5SJ+7A8txviSIfObI6tgjZ0
 lNq5DekbMQGAgc3WDuWWzqB7+BSq4pPn2286b6NSein724J4fb+fpNesn
 UCiZ1nAsrfGG6ORF3+4vLF/3NwZZHErvMZU4AFN9R8lxTBn91F7fCGOJl
 QAA/doT+ZePrMdESeBbt3M8jjSHbv+WmPlpydrD6n1rO/eE+cH/rHxZKg
 SXuGLbKQCTlu81ACbm5PvpCmSfqp7zGhM9bhTZ4n6zVMLXgE0cQhwU3mC
 2jzYlaER1hl5zMr3k/1YqcO9iOmFLN1ucdpNLZaOnWqvwvIao/urCKp1/ Q==;
IronPort-SDR: 3E/KCGu6rJACOEBUq9z2W4eMv5DR5UR6A77qQdBq6QJwXd5VWU9wQE3/HIMiLf12OnPX93wQbh
 E31Nnz1WwZ/UiJhzjYxZrzWRwU95nhSa9lv+Rp+uYHmg3RYCXMqGPRwCZgsjrYFCGStPxXL/Vt
 HSmlYmF3ujgjHVwIMszZ+dJNu8M/cRqcBiZbDM52u9E5HDNpGEcj3N0S2SujAWKPq3iqNOwsW3
 yfufIREPEeAEjL18AcASssQRNcb93/NEqARMLdGNcACp08BUZ5NdREiBs6WFxUS54+6oxgKWlW
 jac=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356943"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:51 +0800
IronPort-SDR: RU5bS2cJVNsUM8iw9T1b3U8wDJ8XAOdJKQJZ3mYN7W3uF/DlDHrd+WWRFXwoM+cxApWERYISrw
 G10+PqX+5T7JnKKEgDR3wDi2zCenwp5Iu/kjTlUAsKSjpwmFH1GG/UXP/EaQGyY/S/1bzvPQhn
 tC4daZRgpNe4T7NLooI2rKg/bHheHIZbxKTaODhZt922P0xFXfL58dMdqPo2iVLMLXKqwzc9QN
 qOu7vyS9DjyZAD5bCEkZuJotZZf49KhX/fz1gD7tApGNcob5EMKiMlebebJx+VRDmNFVtRlOe5
 ge6Du4wgSjfbv6dP8OYlD5hO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:32 -0700
IronPort-SDR: nOp+PNJ+mYZd/wJscY2UAs8SD4tDSOK0tLQfuU+18iGyPy3VMlphVpwRLAaddfFx37O7FGtaCl
 nj+bQfpQ+jo2tvBbBcYsZjkLBo6oWu+WrU5es0OfpJrz5/m+KH6/+WMNcbqjrTn6B1GeZ1LkcW
 yWLZx/C58niQalALf0l7y/nnGQqT7jFpfsovhBZkdnE1IAqpCm2W5wr5HUvKR9zaECJTzkhWMd
 vSHIpBO70bWFBFnoG87LNIygQaX4Vgxppn90XWzKIDLQjqwunbcw+q5ewFiAn1YQ50wd/sKq6j
 Nmc=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:49 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 11/42] target/riscv: Fix 32-bit HS mode access permissions
Date: Thu,  6 May 2021 09:22:41 +1000
Message-Id: <20210505232312.4175486-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/csr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1938bdca7d..6a39c4aa96 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,11 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return RISCV_EXCP_NONE;
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
     }
 
     return hmode(env, csrno);
-- 
2.31.1


