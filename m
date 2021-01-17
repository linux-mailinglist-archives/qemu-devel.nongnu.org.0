Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3B2F95A4
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 22:55:42 +0100 (CET)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G1M-0007HG-MN
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 16:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzv-0005ef-L6
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:11 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzs-0005UJ-RF
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920448; x=1642456448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ys3DgxDIzNqMty7G70cUegQ6LRqHf44ge9b+5j2f4k=;
 b=EziPpFZRc3+vXyEQkzAQEMn4W/VA4m5ly9qUBvH6YpEVxR/Sxx0kJlXg
 4XPmHxuTm2gF0RWHxKNxjI6XHQ0jG4Xc8giKCcSWUWa8E/zwPdtnJNMx4
 YaQ3VMrldkojsBTZgvc7NDRLa9ff/Du3nFWGt2YIOCyBqOwfRRKMD5XIM
 4MjYOfbFkERKUEts04gYCbv7KY5OES2l8vmrUo3OXdovhUr9AcePtb8q1
 ACqAqG3MOkkHNk0klWM+lQvxbiyis/te6Gi69yCOckgnO9J57GNYXOTnW
 hLHbX6eTAvMqBOPVxY6PNDNscAL8MYIws6NkRMP2cv4t7jCuYFCISFmr0 Q==;
IronPort-SDR: LYl81xpQz/D9Qfe0JVBzk5pxATjqw3yiPTDEpwHJXyUol35xXNjHd6riH2UR4ESp3tEOM4eJ+D
 0zmOIBVeAb41DcSBdwPybNCToTfHVYeJLx/Y99IQgpaqTxVs92RuzhDQOGcKR5GKPdcEj52ei2
 vbmAG/95OZkSBb/DX8jMBEq3d888fNrCLHFcA/DZ500dhMJTipuZ55b3v4t5F+0x3NTSqTV1x7
 6xPjEJC0YN0ylFgK/qYwQckNqkMITkdik5bjWxM0EPsvCi9GhFAGHepy32F0v4HioZzYRJe4+S
 jTc=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645958"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:05 +0800
IronPort-SDR: P/ePjYWMEoy8FgSHZyxZ6F3hUqJxK5/yg3VOHxgxr+MQqTnYvYNJR0kePlslE26+VZjegGhyLl
 GRlzIRI5zJjpZysDQvttk2CBChcTKNvf41YDljXGPsmtz8gxvD42egRU8UJ9J2tR27T8PTM//M
 ehSwtYxbIj2tK5fo7rnMMJ7KcDDG/yC7JMIi94i6jct2QoB5RiMs2HQbYZPCeZaWno2CkCSE2Y
 eLujjLyMKqTuWg8cnEt8hLxE/nxANnNPXl91cgwlXHf/ohlstouW+csgXcOuwJ73pAEy9chkOZ
 O/DvynjxAc5cHAoKsb1udeGW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:44 -0800
IronPort-SDR: uRvU3o4atUZjreQdFBUzUrDLvP+0jsyRUlcReT+Q797thJqT0hbFKtyKlDp7KE43dGzPCRIT9P
 +TYgcE6CT4cPbC3W262SHwb7GaimTFk6F6lLboIgV7KPtfxIHx6wGOYrP77IdBbTt1eEiKc/Qi
 PVqZpDU1LSkn8Lol4oQlnQnKDvkNCTyT3KbcJ8NwUQbx69UmYJY5p0oOnloP9J+UMkSikHxrUJ
 u8FK7RXpE5QuJWkCNjBs4MSKGSyPRCdK6mNp9NDMocIExUbkzCK4Tk8MBmUkmG7MVjymDUzNqu
 uAY=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:05 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/12] hw/block: m25p80: Don't write to flash if write is
 disabled
Date: Sun, 17 Jan 2021 13:53:52 -0800
Message-Id: <20210117215403.2277103-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
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
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

When write is disabled, the write to flash should be avoided
in flash_write8().

Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-id: 1608688825-81519-1-git-send-email-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 1b3f2405a1..63278cbda5 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -601,6 +601,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
 
     if (!s->write_enable) {
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
+        return;
     }
 
     if ((prev ^ data) & data) {
-- 
2.29.2


