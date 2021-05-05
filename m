Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE7374BDC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:26:42 +0200 (CEST)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQuf-0002V3-7l
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsr-0000fm-6b
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:49 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsp-0000vY-BJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257087; x=1651793087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzI8U0Vh2iFMSVxjJhHwv+fox5ZJja+nCtlrHq7wrso=;
 b=Wjf+YeD1idhStaLrxffJMXxq2F0IZjoDGiP5kBNkGV+ikZ+aTUnACSDV
 dIOPEgp3j9VMS4rK/CKWdSLUArvu3l+xvBBpgq0eOYDixA0J/kt7Fjgz0
 NRgX4Kw7oLx6CY5KWRNP86dw5cB1w4wHpeOM4okioqG8cJitdEXoYVHg1
 Auvk/aWzsTqQqpgknc4mMZUSoi5uBiF1z1DRUeD9R+BoV7L0nBDzfRa09
 mgYPIuvFZ0jdTGo+dP00zEOpukVPPLoNAe6zLw8mhhSk/ymYfBlVTEZI7
 Tr0flFiYD6N+djUCj0W96uKrpJLOzmXe8kz2P91DR0OdSVCkqpBAYeJJ8 Q==;
IronPort-SDR: NsYxWVGKGtfhD72s9qBdDeuOEFh8n9Q7o40NOX2UNZ7EwQ6W3Zd6rPtjjppVHTn2BB62RDCmTb
 T35O4LwYGMcAEijHM8W/U8h7HD/FU1JbBmnNMqVqMgBz3pfbwLwDuLrF2AyXj3dJ4wVobL+L9A
 IR2AGKoVFI8smWp9uJQKczORpIl2uGSeS6oNNMoD2EANEsnOGyoQTjrav7wcfoYWuE1U3/fEG3
 t0v7rweo+3p+7p2A754MTI+jwPn1vlEIlcwtTiOX80CC4KMywjG0moPUoWS0eUghgovtz9oOQA
 fK8=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585962"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:46 +0800
IronPort-SDR: pEZ44HYi8ezaFYJwNppF0lAhraC9nPbxV+KZQ+xLowExq1zTy9NKv2oeI0px5s8PVVTD9YuHGj
 vdrVolsEWanGqYrD+Kg+FIrglsKXXTy+lYLw9bKhIj2XxwWiT4swPL7FkZz6oU0a3jViMwy12V
 5f+92cuDgk1RR34qrQTrQOUdvh9ebaPB8jNVp82aAPskFYeifm1523NiMiDJ8wOdc8wX+Pg8Nh
 dJIdErctWnwDxP9oSE7znrg0wT6n+PcwOPVE+mUF9LIVrCfqW/z74ockvXu3YC9HW9KoPcmOdN
 CjQM/Ucdjy0KMIun0pwed9kt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:26 -0700
IronPort-SDR: +DPhSYCYTbcf1a4xhR3XZfP8ZZMVmvQMoM1EAFV2UMzf9k92QWCslA4IRzHd582E1o49zf6BZd
 aTcEkNuaCWGzdQiOZxapTi5sK/cxxxqhl0B0iiz7+AfUJTUcr6iLv8nfzp7AYuwMIe8GAi3/hh
 hNxcv0sYi63uCNiRuKSYts6XdwZ/2WiUf/KICm41Eq017af1LDRMzXcxbSbAEjplV3mmVZ4JME
 lNFdVW49ogPBKGfquLL7HuHhxo7X9emoI6WrvweXXjWmFbGf9DIFE6xAtHSqhsGMIR/LdLBZO1
 2qc=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 26/42] target/riscv/pmp: Remove outdated comment
Date: Thu,  6 May 2021 09:22:56 +1000
Message-Id: <20210505232312.4175486-27-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 10387eec21d2f17c499a78fdba85280cab4dd27f.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/pmp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e1f5776316..78203291de 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -19,10 +19,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * PMP (Physical Memory Protection) is as-of-yet unused and needs testing.
- */
-
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-- 
2.31.1


