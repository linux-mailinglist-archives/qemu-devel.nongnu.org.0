Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07026345562
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:13:26 +0100 (CET)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWXs-00085o-V1
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKa-0002Mu-ON
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:40 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKY-0006vy-Vb
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464779; x=1648000779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwkbafFkgXx0cHFkkMZ6VWtj3HM8KkoaaxCJWf09dIU=;
 b=fCB15BtUiTexkfS0dO5VFfgPnrsZANOG/SXvOAsbfDiUAQS58rSgILB6
 rVe+uU5V4h6o/y/6FMnqD+/bzSbop1rKm3xbYfA+/m3Ht/X5Gt8yMf9Ye
 +C5n0sEwbs1O22cRtPzMCix9m8R/xGZV4GwY5+uSwUA44+g5r96RtxyOh
 oaqQNohJqNYdpobjo8DhGTgZrBKWBUGovfAr3iN0vSMcSG7YzTW5fjYZE
 xSYl808+cKxVtcPDKbTgzZKVatL9AIcytZ5jULLyaXSwC1eyTktWKmBFJ
 qstv2yVvGmgeGPiY6lajYhd6eUNn12G5rswXlJxTGeqAWGPFIdUZdiWoY w==;
IronPort-SDR: n1OmZo6PsxFtm7kyZX3OKwVEQgeSmV5mob05Npj+XSucGtrxlWOlMFgEXl2bPGUDBhhsL3EP7K
 ZXQC8B7jCS0zKGVUqvCwygxlSq1OFRgpE8DFsZp+j7Sn8Ui1B3N1fCs5ctsBcXcU7PqsvgMJPl
 4dIKI4Oo3lU+Fe+w/AUnZE8PFkYGAmZ8jRFtD7F7sAiaSwDHhgVftB4e4t3MIb6PeYoukHHA3v
 yS50aYvDXOFG3RF93ZToixcbSYNlv2O+9ecuFXWSS3HwYWtHZzWxGuNgcY0zmBR5+XYGwmXJ1T
 PZ4=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707636"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:34 +0800
IronPort-SDR: IN+Aoz9lfZQGgHUaNvAAc8/tjOljrgkFxcC9zqV24TQjUnPD7yLVQu0Bp5YaEipRbI9uD9sTUQ
 Xgbux7J7BzlaGaD6McEZ8bKkJ8CBNqjXqd292iTqZIEPgpKevWMt77hMdGlbx+1NVcIHSqd8jI
 5T1iV3FExnOac8s/Hd3PPwwa5kpWXwt3owVtTs0KTWq39cWco/Q+nofk0ifdL8D4+31yom6Pjn
 yPbEMFD15HGNTd0kZjEGxP2aUeLhda8z8lJlBGn8V9x9QIZEUvK34nl5dL0shOMwAKjSv/hnKc
 n34Q+nmHTz6sGcMqM354EUzL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:42 -0700
IronPort-SDR: Q0eraa+CKHQ795u2CHim6+Vq2QBUQxI+uEzPERRkiy3PDB7JqRRUbir4UnQ4Vtw+dMpF5w1HTd
 yQ7GZph7yMVAxYdW5bdOl75923xObgC3v6ili8AlWmG8j3FPLde7KhVb3rlgW1MfC2iMnlVBv0
 hKTN6Dq8vzrETi1V0RE+WBdlW5Wp0qVZNB/4klakGyl3snoiZa5h8aQy8NnUXHRdAomFv5qRlA
 OzOu2BkoUqwgEPebqZPkFRoqFU1wNIujVn+rQRRHzBxE9UrYY+cn5yzTCvWz3+8U+Qy9HDpci2
 suo=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 07/16] target/riscv: Make VSTIP and VSEIP read-only in hip
Date: Mon, 22 Mar 2021 21:57:47 -0400
Message-Id: <20210323015756.3168650-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210311094902.1377593-1-georg.kotheimer@kernkonzept.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2ae73e4a0..a9dba7f736 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -420,7 +420,8 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
-static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
+static const target_ulong hip_writable_mask = MIP_VSSIP;
+static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
 static const char valid_vm_1_10_32[16] = {
@@ -962,9 +963,9 @@ static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
     int ret = rmw_mip(env, 0, ret_value, new_value,
-                      write_mask & hip_writable_mask);
+                      write_mask & hvip_writable_mask);
 
-    *ret_value &= hip_writable_mask;
+    *ret_value &= hvip_writable_mask;
 
     return ret;
 }
-- 
2.30.1


