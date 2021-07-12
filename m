Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE73C6691
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:58:07 +0200 (CEST)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34sJ-0004qy-03
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oK-0005F0-EN
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:00 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oH-0006rR-R6
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130436; x=1657666436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qe5NSgZWinSdjj7ZsUlkyN3Gf/d5eMq2C8L+vF+ROQ=;
 b=oVm3/kjQ+ncv8dNkDpp2X6i0l23iPojQxdbXG2Qh6dsIBKkhwo7FRBRe
 qqm16c3bEZSvmYY9OCs0LK10xm1+JenMBAGLOBK0XnHcoIEjaI02MOKHZ
 vsPLivUCcmI777tGUyaZYVTvzP9P9er/20Zdbo0BX10/yo+mnHZSXSu3N
 FFGFRPwv4v/HbBQu7Mzp65k/WasogBTGIpevyv5WqKTFpKzibxqU/9lEW
 ceRDxvWyloaL0bJ9v+5TNbKPAOCdQEXBELoGM6ttUzTe0j3EKOI0APps9
 44CEO3/XEQPXkFRmNmP7zlOiT3xHk+iPAnLy9x7Dx9zmkOiwCKSf+DIL9 g==;
IronPort-SDR: jeyZLM/vmNnvt6dX5LqhHEfgk1cqeun9S9Vg5rWxeiPcVsWHQ1YmzsFLZMOaxRkmhKlyJF1AFH
 1swTeUTp4W6Y+awfsqD89Y0stWtg63iswH+g3UMHGi+zZ2kOOQY79XbJIlWlS9lBRH1AzyJMt3
 U9a5/9mZtGH0sfmfdnIVsWMDItuL8N7tjq25Zqxq0NVQWzVCkVTBCI1JBHZyCisuC4WemSunXM
 VzkyAs2DfDHH8gPyuJsYMqvdZCjCoJtrsWI6oD5oSmSZZZ4I+RT3vsNDoR72flgUqV/DNbPtzP
 bUM=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174398529"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:51 +0800
IronPort-SDR: MoRFZt/GBo9FpJFjE9AAlCxNBkgKe84UzSNaWqnFUZbagzWPUp3Sa9mL+WtgMz09ehuZs2dk6W
 YsUMY4lEn2kK6EWySsJSJJ81qf1JWGKwYHosoyT3xLT7lYZ1YBdjn3uplUuiF2SBlcR6ADqyO0
 bYsDq5UP4n1GjGSQ4bI4CIvzkuHzTXpaRR6VfZwWo2qCZiDPTQ3clF8aw75HTpaLY5Fx3DEevN
 LKW/6TR444YKEjdsUum0MI8Ng9J61mNKtdxqKOdfPNnrQpRNda6S3PhTR5SWWxqMosu41vdZTZ
 emsdBQODifaTOOwBAYjCkwd2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:30:36 -0700
IronPort-SDR: D41MzVei6yKbFLsNUuMxt19dyCdR9B4VHJQ4ajWVIfxVC78lVdOq+kmMUZDLe8HaYge0KcTF0e
 XLfi06tb0He3S24HcM+lsYm9JnbYWYMpbne7dqfIT1QjE/vu4MAWAhOVgmhzv8zwL+QUu6liyp
 XdbdxORinbmwQnrHB3aXW6D/7SvA99B7KbQ2c8ZwCZwsHiitr/Ts+Ce3AciqfIBK2bT0gvHxkr
 miAiYG9iI1gjrguuTSQKFeFvAXilw/jVZMpf0pA7xYZ6XGsSPmeyq+7SLM60rZqO86cQZLjNkO
 ZSA=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 08/11] hw/riscv: sifive_u: Make sure firmware info is 8-byte
 aligned
Date: Mon, 12 Jul 2021 15:53:45 -0700
Message-Id: <20210712225348.213819-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Currently the firmware dynamic info (fw_dyn) is put right after
the reset vector, which is not 8-byte aligned on RV64. OpenSBI
fw_dynamic uses ld to read contents from 'struct fw_dynamic_info',
which expects fw_dyn to be on the 8-byte boundary, otherwise the
misaligned load exception may happen. Fortunately this does not
cause any issue on QEMU, as QEMU does support misaligned load.

RV32 does not have any issue as it is 4-byte aligned already.
Change to make sure it is 8-byte aligned which works for both
RV32 and RV64.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210708143319.10441-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e75ca38783..87bbd10b21 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -602,10 +602,10 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     /* reset vector */
-    uint32_t reset_vec[11] = {
+    uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
-        0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
+        0x02c28613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
         0,
         0,
@@ -613,6 +613,7 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr,                    /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,                 /* fdt_laddr: .dword */
+        0x00000000,
         0x00000000,
                                        /* fw_dyn: */
     };
-- 
2.31.1


