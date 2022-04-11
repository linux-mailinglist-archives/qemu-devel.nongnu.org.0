Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763194FBFA7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 16:54:21 +0200 (CEST)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvQq-0000c0-I2
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 10:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=09352fbbd=anthony.perard@citrix.com>)
 id 1ndvMJ-0004io-Jx
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:49:39 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:54353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=09352fbbd=anthony.perard@citrix.com>)
 id 1ndvMF-0007EM-Pn
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1649688575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wn9b2ZopoXPD3b5UN2CUGeBDCNtWE7zFjciqiJMNYqo=;
 b=Q1Z5eKQEHRnC1JPdOcjrHYFgVmKTcYb3ujECkulNg7jMFdtrObgDyLE5
 i4r3KuewrhqqqY05Iuol2IeSgqrTrLAUFp6UiF0XkmK9B/lwi6t/R1tRr
 YumFc+Og1sclqp2bGCFlQCtCPPjfBRRFuuOaNvzkIX2IkMGUUBYeE7GtL M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68444478
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZLfxP6sHb7LDhWXgEaug6qCVkefnVDReMUV32f8akzHdYApBsoF/q
 tZmKWjUOKrfM2KmcowiPt7l9UgP7ZHRyNU1HVc/rC4wFCtG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/U4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi87b5Pw289FVCBlNC0vG49v+ZTCcFOg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQ/MEicP0IfUrsRIJMkjr+MmXOlSD9jiWmt+LAp8ljZyyUkhdABN/KKI4fXFK25hH2wv
 X7L8W3/CDkeNdqC2Xyb9H+wwO7FmGXwX4d6PKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsrE8iZ5l7S+oD1SaBm4z2ygeyAzkvUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4iDGJGT9bxgbQ+0RqnBNzEJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q2XzoiD4INkPsWsWyKJV3iEsI2GBX
 aMukVkJuM870IWCMMebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRsPvf8FqIq
 Y4GXyZIoj0GONDDjuDs2dZ7BTg3wbITX/gad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:5KD25KERBNOVd4D+pLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.90,252,1643691600"; d="scan'208";a="68444478"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>
Subject: [PATCH] tpm_crb: mark command buffer as dirty on request completion
Date: Mon, 11 Apr 2022 15:47:49 +0100
Message-ID: <20220411144749.47185-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=09352fbbd=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Anthony PERARD <anthony.perard@citrix.com>

At the moment, there doesn't seems to be any way to know that QEMU
made modification to the command buffer. This is potentially an issue
on Xen while migrating a guest, as modification to the buffer after
the migration as started could be ignored and not transfered to the
destination.

Mark the memory region of the command buffer as dirty once a request
is completed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

I have only read code to find out whether the tpm-crb device was fine
with regards to migration, and I don't think there's anything that
could mark the memory region as dirty once a request is completed.

There is one call to memory_region_get_ram_ptr(), but nothing seems to
be done with the pointer is regards to ram migration. Am I wrong?

Thanks.
---
 hw/tpm/tpm_crb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index aa9c00aad3..67db594c48 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -197,6 +197,7 @@ static void tpm_crb_request_completed(TPMIf *ti, int ret)
         ARRAY_FIELD_DP32(s->regs, CRB_CTRL_STS,
                          tpmSts, 1); /* fatal error */
     }
+    memory_region_set_dirty(&s->cmdmem, 0, CRB_CTRL_CMD_SIZE);
 }
 
 static enum TPMVersion tpm_crb_get_version(TPMIf *ti)
-- 
Anthony PERARD


