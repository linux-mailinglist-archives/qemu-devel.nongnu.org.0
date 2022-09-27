Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74DA5EC756
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:13:36 +0200 (CEST)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCH9-0004RQ-QV
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2628f7867=anthony.perard@citrix.com>)
 id 1odAlB-00088w-Tx
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:36:30 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2628f7867=anthony.perard@citrix.com>)
 id 1odAlA-00080G-3y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1664285787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qdztpkQS9bwWjzYBaDyFhhZk94f4PRW+WKixa7mXMFg=;
 b=I+KIO6sHHCpCif3Fu4ukH0hNvKTg05GfjGdCPHIOMicjJsKpOWrowTFX
 VmmjrHtehQLWRZPudgZku60Nz4a5YsU8M79ycUhxQou6VadHAr9AmcrPm
 KZFeXvhmmziEYhkUbY6GP2Lw0Cu/jkzb9eF+aXsDxMKX0HhBlfUM6nOPo k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80568756
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GZNSYqh1qzlTxC5mKa0uVR37X161DhAKZh0ujC45NGQN5FlHY01je
 htvCD2FPf6OYjH1e4tyYd7j/RgHu8WDxt5mSgo/qXthEiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UgHUMja4mtC5ARvP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUsXx
 aIjAisVUiCChuDxz521UbRuu9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZ0IwBbH+
 zyuE2LRLBsFCPGYjha88CitvdTuvjvfH6AJPejtnhJtqALKnTFCYPEMbnOhvPi9iwi8WvpWL
 kBS8S0rxYAr+Um2C9XwQRC8iHiDuBEaRpxXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 nXQr43SLyd3jI2USHDa+Ziatm6wBDdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CTFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTXGI3h/5nzvZ5p1QEwZnYwd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0M/MtOt3sWpR7lfmI+THZuhf8MbJzjmVZLlfbrEmCm2bJt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLegvp6pdyn3hW+I8mbcqkp/hR+ebBOSX9pHZsGAfmU93VG4vU8FyKq
 YoDb5DiJtc2eLSWXxQ7OLU7dTgiRUXXz7is9qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:h8r0YqpfWuUQurd3FGljkiMaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; d="scan'208";a="80568756"
To: <qemu-devel@nongnu.org>
CC: Ruili Ji <ruili.ji@amd.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 1/1] hw/xen: set pci Atomic Ops requests for passthrough device
Date: Tue, 27 Sep 2022 14:35:59 +0100
Message-ID: <20220927133559.30223-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220927133559.30223-1-anthony.perard@citrix.com>
References: <20220927133559.30223-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=2628f7867=anthony.perard@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Ruili Ji <ruili.ji@amd.com>

Make guest os access pci device control 2 reg for passthrough device
as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
/* reg read only field mask (ON:RO/ROS, OFF:other) */
uint32_t ro_mask;
/* reg emulate field mask (ON:emu, OFF:passthrough) */
uint32_t emu_mask;

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196
Signed-off-by: Aaron Liu <Aaron.Liu@amd.com>
Signed-off-by: Ruili Ji <ruili.ji@amd.com>
Message-ID: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xen/xen_pt_config_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 4758514ddf..cde898b744 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .offset     = 0x28,
         .size       = 2,
         .init_val   = 0x0000,
-        .ro_mask    = 0xFFE0,
-        .emu_mask   = 0xFFFF,
+        .ro_mask    = 0xFFA0,
+        .emu_mask   = 0xFFBF,
         .init       = xen_pt_devctrl2_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
-- 
Anthony PERARD


