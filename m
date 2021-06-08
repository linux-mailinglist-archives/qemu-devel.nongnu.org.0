Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EF39EAC3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:35:32 +0200 (CEST)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPiN-0000Od-4X
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdM-0000B7-Dn
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:20 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdK-0004Fk-OD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112217; x=1654648217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IL3XvHYakEcvvRS+Tnnr76vwFzke4/093a0umNMp1H0=;
 b=HZ9WjyBGUoiQR5XLiLDXg0TRJdiaRygMwblhaREph+mo6+voZzXHT7HW
 7+s5l5FcDrQALQrmzx1kJQwdx+6/RLXEIJdXsy07NtbgFo6W5tyQWTx11
 0wIgujgjou7uFeLVfQpeOIcw4zSZ4uTtMurnaDb8KdPebNOzTxyBD2FzB
 tYcUBNw7htRZZdQGchOoPiUnkgD27rLh2bo77vIY/G+zqz3v3rWUlAktN
 CUTnD3uSgg35kUSTORIc9WUix62oROsPuaTMMGJEcUII+xAiIx1sbzudw
 Kbhs0zHsqcAz5xq5UzwoblQz/ByduVxU+MIbPKTIN//WPUGnM2YRqeHtv w==;
IronPort-SDR: AOnLbEOz0pJlLZeH1swj9x6pgX5gmYL0rgIPkRCKfus3gDrqQc3p6qgUCgH2bxiTz33aSO46mD
 1wUAfD6ftffFtiR5J5ssBOXzNkA1G/Kq/j2iVAtV6LWaJ6iWRjrUy1S9gnYz7Kuqi8mDx7PwEy
 oi3rGGV/bL9Ox0xelw5jnENuDyIvY634jEEco1srfAqU1IGZs0OQLKVuN3EMPdzMG3a2g7xR1E
 l+bOgSJGA9BtvI5x5Y8rU3WuP0xjoGi4ttCoOUudPfzbq2o9n3STFYt3c4V2rBq1/hDJkF9K9p
 KuM=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087340"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:15 +0800
IronPort-SDR: v2GDN02gwit/o38Ruqy2fztD5NzQ/VY1zqaVsiTPgYrCuykuHv0ml2n6GuGKJ6j1XzFQszUQnX
 iinvsOzIarkU5YwCo9hG7n8JaszTQ5SmBUaBhu5rZCsipqlOCI6SswkazSLCR7rkoWA1yzSLFY
 5jlpzG9SxDRUQ+xTOfnIDm8BucWZgpDE+IggafQPkJzS6b6A5cmYNNFdPz99WsMZ2svXKwgyh6
 Y9Z9RnOYhNUq71fzjSaLIh856YnXgm6HGqDJAPqVw6c8ocnt6hcUAkSb2Ptm1tw0vFCm8qaHdj
 C8ztyhFoAXqesgB+TVMefKxw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:23 -0700
IronPort-SDR: jM0wDrDpllfVEKdM1ql4nvj3N6/7baBgvHVCW3AdLqcZeuEQ7n4yUiFeCgeGk52Yqkte3k0fIy
 k08I56FCEF3yDLD794jQy6DSQ4m0C5iB2mkbvm7l95wylAdmI7rqbomP//OqgoRXMjedbVxtu/
 uugVoBq5uYRj3cwulRuLso40tRA3GFqc25HAwMBxeUDP/gPBuLl4adrOapVGGKjMiI1KV0fATH
 NndOZ0RezH/lUCBnTqB8FBMKgxerUTqM1ja6kEXnYac8zF4ePj15gofpPcjTKovNApvbaPuxU/
 eeo=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 02/32] hw/riscv: virt: Switch to use
 qemu_fdt_setprop_string_array() helper
Date: Tue,  8 Jun 2021 10:29:17 +1000
Message-Id: <20210608002947.1649775-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
we can use the new helper to set the compatible strings for the
SiFive test device node.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 95a11adaa2..1e017d1c52 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -394,8 +394,11 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, name);
     {
-        const char compat[] = "sifive,test1\0sifive,test0\0syscon";
-        qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
+        static const char * const compat[3] = {
+            "sifive,test1", "sifive,test0", "syscon"
+        };
+        qemu_fdt_setprop_string_array(fdt, name, "compatible", (char **)&compat,
+                                      ARRAY_SIZE(compat));
     }
     qemu_fdt_setprop_cells(fdt, name, "reg",
         0x0, memmap[VIRT_TEST].base,
-- 
2.31.1


