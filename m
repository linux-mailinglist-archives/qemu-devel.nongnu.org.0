Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38E3722FF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:32:07 +0200 (CEST)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh6k-0004xL-TS
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgq1-0005TU-J2
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:49 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpv-0000Fd-QL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080083; x=1651616083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=otQOSwcYVr7RAj/nWvFHEWoMMJh10b7Yi4YNSpL0/3M=;
 b=HZW4bT8Kps3zNY1yPjGMpGIBYmmxPHrl0C3p5YHcsvKEapNGQ/vTpU/z
 cIdxRdt8Tv+LNU4HxsHAnc1tPwI2ZtNaeACq2uJQcbI3Qq5HMrHec+vY1
 wlHP2X0zi8lT7QUDhIkDhH3yp7WGM2belUuNNTSGwZZWp2PWPtms/aCiP
 jE+hGUuxoHWXQ+1NY/83WHkW4kFT2/WOnlX7wc2Ufz9pPxOqSiPsKOwWP
 29K3cWFQco2bO2qstVqSuSh3MbPSkhwNRF7/eApMPM85d7bDQlk7KGLvd
 CHzZejR1hade39hqO2jGXaeFDFVMccdtDb/bKkAORjU5N+748dmPNDRKX A==;
IronPort-SDR: S4Lt132GpipHo1B1UT9peIseUPS/TdCkI4pp2jTzeNG3lFoD1TItVD0zcann5pUjiDmiBeBG31
 d0To+BWQcP38xUOkzeOXTNqFo8QumN7jbgtQfHHaOnm2c27YeDUl5nK9RlDLf/+VVTxktUFi8/
 P8bax9PgwUJEyen1t4AX4XxLG0ZjBxNra7zN+TWbzi31hFl2A0D4LSY3COHmWYaRQej3GFXcGk
 6QjVBwsgbDyDTfPx7Y8GzpHtLOUCjo8QYXFYpHkb+WQTyRPSPSXHGa5QH1Mq7Xg4NG7zSu1Q5D
 PAw=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114645"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:32 +0800
IronPort-SDR: WPhHsu3fdp66lZ2FwLPVESwyluPNjzdxvKrT8E4vOspkZgnbb0wESs+DQSS4dkb6oZTclIF/p2
 66a/YgqO3GSagWBkSwU5BQ3DzMFvUchuWOREvkwmLF1Nm0Tkay3ETcCrw3Zgx0Yicc6IljTsWE
 Ln9kfUHYY1VIARVye50QgprdX+8Piy3L+7vd5fl2alKZOdb0qBsT/bhIwITL5LzFoq9BMAbc7e
 f0is3dqUFoT7O7xp7SV81b5S5YW70cNsI3br73mJ53k8xY+af2la4N8amQ3avFK6OAsYV23zAu
 6oK3XTgaaGH3uP3jsnG3vviq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:43 -0700
IronPort-SDR: jjt9oolv4Ft18GEShAEtiodEeNbDLUiXK8zc8twZtwWp/7zb6vtITCq1UvB8L2Xu6ga2Q5OskI
 +5LQz/5NqpxNlUvnBx7G3bwbyUOV1AferyYrtpxniN7cmCLA8eRMbjzlrHNIKaiSJBpypXQsaI
 uiQLcvkNCklEEceYoEpIsEUrUXUHuKyIIfJWbdAg2YM/FkkdO9Hqj0T1Ax070G0v79RwgYBUXa
 c+JJk+gYaK90AovQ1J+S8ts2ny59ukfxk4We4uJfDD3wH+rZ8FHQKdoR30fRYmijYOvDBLripT
 ppo=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:31 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 16/42] hw/riscv: Enable VIRTIO_VGA for RISC-V virt machine
Date: Tue,  4 May 2021 08:13:01 +1000
Message-Id: <20210503221327.3068768-17-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

imply VIRTIO_VGA for the virt machine, this fixes the following error
when specifying `-vga virtio` as a command line argument:

qemu-system-riscv64: Virtio VGA not available

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 7ac26fafee8bd59d2a0640f3233f8ad1ab270e1e.1617367317.git.alistair.francis@wdc.com
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index a0225716b5..86957ec7b0 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -32,6 +32,7 @@ config SHAKTI_C
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
+    imply VIRTIO_VGA
     imply TEST_DEVICES
     select GOLDFISH_RTC
     select MSI_NONBROKEN
-- 
2.31.1


