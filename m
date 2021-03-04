Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3C32D5C6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:00:35 +0100 (CET)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpSs-0004VN-5Q
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHA-0001qL-9A
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:28 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH8-0007uj-AY
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869306; x=1646405306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2y+jL9H9hPB1X/Zd43Tt3aXnUX+Z+5tpmbKYt5ZnSzA=;
 b=E3ahork6dBVEshtUSnaIqnB3yV7UAFgFnvpQrwwIiCraV2XdrRcT+ssx
 2V6eIHBFVhRWVwazxBajKYY66jfyL2oIZgIzAuNAUYYHerz0Dubs8LtiY
 wRe4KiQPfX+0yoNt2Rf7FC/Sz6WBdk1XAdsIQIy0ZQjHD7S7tI1tIinLs
 qxvE51xpgtrG5aoV5Tna5OPaik9Xjv+l9/33IF6ajYLL860xJKVx7Kk2N
 ObW9y0AmfgU8NrMpnX4u2dza6RE4JTzT2MTXkx09yun/UdYpXzCrdcb/C
 H6XBEjPPAO22ffgDqBaxan1j3IxjrWPyiNitbDLzTAaIVt68n9vJ5BeHa w==;
IronPort-SDR: yIkB/2/DF1ECSNjdWtP/wriao9w3I92MhGSUelnaNwWUhcov1WH4cc31Bv2wkDUaCLXFVocS2T
 nYTf8NfePHfJrTyETyA4M8qqdnQs9203KeNT660UZPhSFdYgt3Z052MO7cIIqjenzB/2WzoS2x
 Lq3B2DZuJxlqx9ExTFGjmjhaoBCs+8qij/WVFfBxhe6cgMN3Th8in6HEz4p/8feCyDDAVWet1Q
 gGibSKfINNi9RSSXSuCyoG3YpISPfk05aFv7WsO6AzMdG+ZguaG05SsMthk2mOwSyTg2nQ6wpf
 2GQ=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984417"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:13 +0800
IronPort-SDR: tFwedIHRgBjYG8UA4uBIo+f6wKlo6ovJsPjKSqOmm8md7o9HDL33f9VW87V9Uvcjb2W0KgUf+R
 1rCF9Jw8Z9la9boVFvTObFoyl14Qi5TPgjBbLwM0wgsRcQDu3zW8jHFmAqRB+eYkKgbAFZSkmM
 CEYrIqWqKprrpq99+qDldSL+dUqHgtmd3OcuCgug7Pm0NzgdckTKsdLkstVSA6QtTA4xCiCr3k
 O5RFfLdvQ7jgpC+RPPvE2x/U35SMTLapEvzIqboVmZ5r6wnIoynr/GFr6nxtSincufPPOnrxKg
 1Ln8InPsvkRWhmI5rUFwVAgC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:26 -0800
IronPort-SDR: CzU7rMdUIVXUUFBqml15a0v53bgg7dfYLmDJHkHKYC44PGjDc8QgoncTFxOeMgj5Tun8fhEc9g
 nOo3re0ngyfVoTFC631kV3a/4jKqWrxCo8yXGxC7lSR0IRXAR3IouURHhWJ8WNFZO4TvqyR102
 PieCuB2/EmKL+v0KS4u091rzl7fP3FJwPCWP1Ms45QDqwbDfErpEIJkawhIx1QJK6r3OiDcSPP
 9Bl3L3fNLi3S7HZSXEA0PVVOs2wiUWLBITqWHZs/K2m3ePbqjdPK17AWIhi45zxKt17dXn0UoH
 bTI=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:13 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 10/19] hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to
 decimal value
Date: Thu,  4 Mar 2021 09:46:42 -0500
Message-Id: <20210304144651.310037-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

All other peripherals' IRQs are in the format of decimal value.
Change SIFIVE_U_GEM_IRQ to be consistent.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-7-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index de1464a2ce..2656b39808 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -127,7 +127,7 @@ enum {
     SIFIVE_U_PDMA_IRQ6 = 29,
     SIFIVE_U_PDMA_IRQ7 = 30,
     SIFIVE_U_QSPI0_IRQ = 51,
-    SIFIVE_U_GEM_IRQ = 0x35
+    SIFIVE_U_GEM_IRQ = 53
 };
 
 enum {
-- 
2.30.1


