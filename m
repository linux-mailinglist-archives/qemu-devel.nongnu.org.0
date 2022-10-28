Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7912611AC5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUsF-0002TU-2h; Fri, 28 Oct 2022 15:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUrP-0001ka-Tx
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:55 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUrO-00035Z-A8
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:43 -0400
X-IronPort-RemoteIP: 209.85.166.199
X-IronPort-MID: 235077471
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:paKVoav4vaSR1RX4hstfTgElDOfnVOtcMUV32f8akzHdYApBsoF/q
 tZmKWGBPf7eZGT1fI9zbonloBlQ6MDWx9BnHAVvrH9nH3wQ9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlI5gdWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJHkTL7QzovcuO1ENq
 uM6MhBVXk+Rp+3jldpXSsE07igiBMziPYdau3U5iD+AXKdgTpfETKHHo9Rf2V/chOgURaeYN
 5dfMGQxKk2RMnWjOX9OYH46tO6sln/zaRVStRSYqbdfD237llcsiOeybIWMEjCMbc92rGGVr
 2vWxX7gEzg3DIKU8h6asUv504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6Kk2rQmlF4isGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYdOLTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:HWh2vqz7sYUUmdc6PfmvKrPw+r1zdoMgy1knxilNoNJuA6ilfq
 eV7YgmPHrP4gr5N0tQ/+xoVJPwI080sKQFmrX5Xo3SITUOxlHYVb2KhLGKq1aQeBEWtNQtr5
 uIG5IfNDSaNykcsS+V2njcL/8QhPOqyuSHv9v/8ltaZT1WSshbnnhE48WgfnGehjMqOXP0Lv
 ShD7J81kKdkL0sAaWGOkU=
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:23 -0400
Received: by mail-il1-f199.google.com with SMTP id
 l5-20020a056e0212e500b002fa8ea32922so5740508iln.15
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yacxBjd9WYnOr14Yvueo+2F2nRf/DEFGUT3gl3J6l4s=;
 b=gNSVOOX+VxBfHFbMTmgXw2BVWWOJUCYr2rGoIzZL41PoPGYrto9Mw5lYWUb9KQwD9i
 V6k3UpNXZxjLaL9FQXxn+VbmxStvFHZOp/pPUSo7dAS5eDqEHzprCdiWaz9eQuJA6HL0
 Vxz78DTUbxpYSOtl8g2HCS81ZcWwlaolpCsSZPI4eXtg9KKXsVLVqzlyUa40zewRrC2V
 +pQyprjYmjW9RQDchDeaCjcY+8x5MjIMigbRUPPc4n0O6CyqnP+wp4sLdO3Xr0IbIUI2
 Vc9xTPSZGZTHGSefCQ4gqfIKwt9yM6DVvBiEWbmwjion9GgCXTNVsraAZlhDyj9/O3V6
 +Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yacxBjd9WYnOr14Yvueo+2F2nRf/DEFGUT3gl3J6l4s=;
 b=UVgfd2z6zi1xwyx+daYWKc8MyGGbLa3Lu3MHxuOwFNMUD8o4cosIojv2+DXZX/tlBz
 uKPHYFtaEdsJRfWX7G52xXhFIUGjKBPE7DAKe7kgVu+VnZFfyraA6c/fJ+lYrOpJO4At
 dB3H55k2n00VXAsGROdFN0obvHZwdKZRnLh/mBcTw8K6mWuk9mPtIUgPtwENAadbkZsu
 g+/P15O4ZkvB0ZLsTV0/yinsUD1Ie9CuwM3W9cIdaehhhfXFb7dxDJxHH6hvH2HHiHqy
 yT/hifPW3dJiED5O5zvY0QEsgV8RIYl6EYkb7ndM5XEz06BsgcTLBz3Bly/0R8/5OJUo
 BSHQ==
X-Gm-Message-State: ACrzQf2IImi4rcJOBTqVCPQn3uH0hAE+BIUjLe3zszJSZkxiE3gxR/46
 0ps8F5CRQtpUdlnPjuFRhEPZHEtA3Afsxl0pGz5WmtVZY1SBk7iZTJOqmxW5oyiddb/8qDsLEfe
 APoSiPPMpOly1HVaGLx4mghgOZRJNqA==
X-Received: by 2002:a92:730c:0:b0:2f5:7dd7:45f7 with SMTP id
 o12-20020a92730c000000b002f57dd745f7mr485932ilc.12.1666984642962; 
 Fri, 28 Oct 2022 12:17:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5nEiX91yzJmO74zDO+JYuoQJTVYuYm92jb22TnDQy3QDaN+KxeJzXwGsV3ooulZcOHjhlD9Q==
X-Received: by 2002:a92:730c:0:b0:2f5:7dd7:45f7 with SMTP id
 o12-20020a92730c000000b002f57dd745f7mr485903ilc.12.1666984642727; 
 Fri, 28 Oct 2022 12:17:22 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:22 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v3 5/7] ehci: switch to guarded DMA accesses
Date: Fri, 28 Oct 2022 15:16:46 -0400
Message-Id: <20221028191648.964076-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/usb/hcd-ehci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index d4da8dcb8d..b93f4d44c1 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -383,8 +383,8 @@ static inline int get_dwords(EHCIState *ehci, uint32_t addr,
     }
 
     for (i = 0; i < num; i++, buf++, addr += sizeof(*buf)) {
-        dma_memory_read(ehci->as, addr, buf, sizeof(*buf),
-                        MEMTXATTRS_UNSPECIFIED);
+        dma_memory_read_guarded(DEVICE(ehci), ehci->as, addr, buf,
+                sizeof(*buf), MEMTXATTRS_UNSPECIFIED);
         *buf = le32_to_cpu(*buf);
     }
 
@@ -406,8 +406,8 @@ static inline int put_dwords(EHCIState *ehci, uint32_t addr,
 
     for (i = 0; i < num; i++, buf++, addr += sizeof(*buf)) {
         uint32_t tmp = cpu_to_le32(*buf);
-        dma_memory_write(ehci->as, addr, &tmp, sizeof(tmp),
-                         MEMTXATTRS_UNSPECIFIED);
+        dma_memory_write_guarded(DEVICE(ehci), ehci->as, addr, &tmp,
+                sizeof(tmp), MEMTXATTRS_UNSPECIFIED);
     }
 
     return num;
-- 
2.27.0


