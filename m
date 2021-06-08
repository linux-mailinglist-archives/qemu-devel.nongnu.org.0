Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0EA39EAE2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:39:57 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPme-0005KH-AR
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdo-0000x7-Ub
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdm-0004Fk-Cq
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112246; x=1654648246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rfJX++WBMUJHi6aa4CHUXmIQ+IPjuDWemrAHtPHxEJo=;
 b=ZVvovAK2cA8Uvzx16IicEIZZvDpr96Jjolqam5NFM2mTcks+ETzobj81
 p9GKBpmDlixB3xBId2960XVMcWDntPdUkuc6b7eZUgiP+xUkNMSKtnpVd
 Nf9UdLV8jeXP4MBel/DtOqvTaljiZtxtHxo2pR/CcWaUbbiWGlSUt5/cc
 JnnWQWft20Zirqa0Qh/tG5WmK1pfVOjkhybHODaIbksrGzrgOjk1Bcj89
 IXCvWuD6//8lAuSmynLhJSErO0BkzjlKhs6qgzYN3meEZoVdOaV1QRJ1z
 YbrqTPBuAA+Kvm5lFYDWxyr9gIQhWXn/uy31jdotfkEdz8Fx0CzXKkLhM A==;
IronPort-SDR: /lIj8PTz3y7rhyt794MFiY04AB0ibd1tHpVLtpladi9JjfQfEnI97nYYiYvIj8ypqo1pZ7fMNE
 vik/Kf5kZ03yaMJk654TslccmVgiNZmJXOjP6P//e7OF/ud/RTl4OqcLTv3Rd2KVn8D1a6mIqr
 0Smhc3a/rK1HzVRaHlSd7KO2bFB28ncF5YZk8mmJ7Ovi6dyNGGXISmOKzKELnQaH8RnR7SykYE
 u5QfMMrx9ZXJW0X4Khi/Ffu6PofYaShPpjzsFZKGANyvsGSMq8FuTaETHNNnsbtaUwcxcvihv0
 Tg8=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087370"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:44 +0800
IronPort-SDR: bkwIvF/aZErx6sNNp/A0Uf3y7AevttJqm+uJEooyO7Zf1p67GOeXRi/ijPUop53YgaCVbeJFfr
 CF4xP0H68EEJHx7g/KXB9CmUQYQ5dJwZkCsK4Veg7Aku2nhLjHYHfcg/Sw1Py+I4Mov7LzWPH7
 k9eeRC5FllDCUNeHrwFFsmOWdjkVRZPaDHDihFnCMZafikP24m/tcdYL4S0fGcv5dFLbVh00hl
 gsg2nVb9DnKQXf4zrKdaoBQkXb6A81smbsMvlqzdO0q5wC/S3AwpDClVxWb0wtcofxnYRGFkZ+
 KTj5QRZ40FYOiNQm5TH31L8+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:51 -0700
IronPort-SDR: TB6qp3ta7GKhfGdmQQiwNgr4DekAH30z6sBsfcyA1TcYoQOji5dv7BfffFYZkbVhdLVZyLjqGT
 g9x3Ujl6+Dd1i3YKHFkngrrnfHcZTUyHt2/XNmLNsb9iHzs9/7dfjjGEWFiY8WxV5lJMHGvcJN
 KbAmzMEAMKbGbrDBf7zcofqHN5xfMIYr7lWWOKAtyqznmWA4QPuXkpJL+EPm5DyPiKtRB85325
 erpZPR3yPkDRXwM3U9K+jzZ/F3YM/320aLxwU3P/tWroRawdNV5iCMtYgiu4bxJqdmmqcOJVHR
 sVI=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:41 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 11/32] target/riscv: Do not include 'pmp.h' in user emulation
Date: Tue,  8 Jun 2021 10:29:26 +1000
Message-Id: <20210608002947.1649775-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Physical Memory Protection is a system feature.
Avoid polluting the user-mode emulation by its definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210516205333.696094-1-f4bug@amsat.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7e879fb9ca..0619b491a4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -97,7 +97,9 @@ enum {
 
 typedef struct CPURISCVState CPURISCVState;
 
+#if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
+#endif
 
 #define RV_VLEN_MAX 256
 
-- 
2.31.1


