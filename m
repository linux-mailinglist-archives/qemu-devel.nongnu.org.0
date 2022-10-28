Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D60611AC1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUrC-0001hR-GB; Fri, 28 Oct 2022 15:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUrA-0001h1-S6
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:28 -0400
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr8-00032c-V0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:28 -0400
X-IronPort-RemoteIP: 209.85.166.69
X-IronPort-MID: 237806689
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1Mjc26BqzeWu3hVW/5nhw5YqxClBgxIJ4kV8jS/XYbTApD120TFUx
 jcYC26EMveKa2HzLY0gatvlo01SsJWHzddiTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyCULOZ82QsaDhNs/jT8EgHUMna41v0gHRvPZing3eDzxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu+Tnn8iG9Y+DiDX4pZiYJVOtzAZzsAEPgfXA9JHAatfo23hc9mcU
 7yhv7TpIesiFvSkdOjwz3C0usyxVEFL0OavHJSxjSCc5x3fbES856hvN2AzJ4II4cddJV5nr
 cVNfVjhbjjb7w636LeyS+0ph8N6ace1bcUQvXZvyTyfBvEjKXzBa/+StJkIgXFp2J4IQ6e2i
 8kxMFKDaDzJZw1JNk0/Ao94keu17pX6W2cD9wLN+/RnsgA/yiR64oPHOcr4JOemTPtnvGO3p
 UfY+Vn2V0Ry2Nu3jGDtHmiXrvbCmD6+VI8MGbmQ8Plsj1uOgGsJB3UruUCTpPC4jgu/XIsaJ
 RJFvCUpqqc2+QqgSdyVswCEnUNodyU0A7J4e9DWIinUlcI4Py7x6rA4cwN8
IronPort-HdrOrdr: A9a23:Dx0/Walr78FAx+99aVPbFsLEJXTpDfIL3DAbv31ZSRFFG/Fw9v
 re5MjzsCWetN9/Yh8dcLy7VZVpbxvnlKKdorNhWItKPzOW21dATrsSlLcKqgeIc0fDH4hmpM
 VdmsNFZ+EYY2IXsS+02njdLz+M+qjhzIm4wc3l5zNGSwVybqFp6A10TjycDlZ9SGB9ZabRUK
 DsgPZ6mw==
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:21 -0400
Received: by mail-io1-f69.google.com with SMTP id
 x19-20020a0566022c5300b006c7e5c33b6eso4094035iov.7
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qKjWcvqbYAlP1L6WLudSWRDVzn6+aLRL1kY/UEGm4k=;
 b=LsxyIb9E+yp9dZcYkoppNQJ5ze628sU4ovMw74piW88dVvBUaaQjq3jkR//7td5pP4
 pIbYsVimAqe1yOL1Cp1oyah8sY44HqRpcxju5lUggeJuHUmYxGPZT5pI6OImGAqV3K2A
 Ai7ktsQhC+r+FMH56uJmEQ1FDZfyEeFZZ9eCcRgYj0YP+QkIrMvnX9el9eq77CNRV/YQ
 I0snTDrprsa4CYj8F8XAccZ2P8E1Y5XTEIlPriUYkfcEJ3RKCSVZQM+QHUGiXyjB5hoV
 XXpM9nWvrKf06QQ+s7BQbRf7ItytOwrAY+Qt5rbDYPF/s7jnNGdDkMSyeaSa5AQvwMib
 AThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qKjWcvqbYAlP1L6WLudSWRDVzn6+aLRL1kY/UEGm4k=;
 b=bw1a+kgjkl4xSLYV3Nb9qfefBhFMdOMrdgBqAQM0VZwXbEerRPlqAqAbmcV91GPQim
 LrT6aTdLvTb3+57RgqC5JCUSyPc43dvhAExQ2IDDlWGqPOkgPis3Fmsj5PlqF2eyl+3q
 cnA0OgPO57ckglwlsbqE2q3YIOtxx7JLEuJ00bv/KSkA6JmXG0NiUQW4CMJdNivpW/qm
 RDsqUfKZ0V8dV+idVVUGOSy22QwLX+8JHgrFJrJ8L9NGXA8tz8tT72Rqb/ob4ld+ZpBE
 rw8LDJLukMX4GvS+7uqofS3UJjyOa4W+cazTPbbXWmZkiybVaeJjj/B3Amrf3G6WkrSe
 XIyg==
X-Gm-Message-State: ACrzQf2N5j5pOCgLsFgtu42QzYamYRJnqvdfD7mdyBVB9duic2FzCq5W
 N7lC3hviiVf4Tqjy9+mkI/mDctxIzyE2zjXexE2PXnURiJ+i1mtMzraCnkxXi3HJTfgL02he48B
 bt5hpfQqwaaWMNdbHr/2rXgLbRWVw7w==
X-Received: by 2002:a6b:8b0a:0:b0:6bd:3b81:c75 with SMTP id
 n10-20020a6b8b0a000000b006bd3b810c75mr500883iod.197.1666984641196; 
 Fri, 28 Oct 2022 12:17:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5mTrqcx+tvIeMKmYtE7khY5uvhlTJ2INPJYvltyUkQEaLFwfnG8RVnE9vHeRterN5tz8WwzA==
X-Received: by 2002:a6b:8b0a:0:b0:6bd:3b81:c75 with SMTP id
 n10-20020a6b8b0a000000b006bd3b810c75mr500852iod.197.1666984640942; 
 Fri, 28 Oct 2022 12:17:20 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:20 -0700 (PDT)
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
Subject: [PATCH v3 4/7] sdhci: switch to guarded DMA accesses
Date: Fri, 28 Oct 2022 15:16:45 -0400
Message-Id: <20221028191648.964076-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
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

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1282
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/sd/sdhci.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0e5e988927..0ebbc13862 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -616,8 +616,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                     s->blkcnt--;
                 }
             }
-            dma_memory_write(s->dma_as, s->sdmasysad, &s->fifo_buffer[begin],
-                             s->data_count - begin, MEMTXATTRS_UNSPECIFIED);
+            dma_memory_write_guarded(DEVICE(s), s->dma_as, s->sdmasysad,
+                    &s->fifo_buffer[begin], s->data_count - begin,
+                    MEMTXATTRS_UNSPECIFIED);
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
                 s->data_count = 0;
@@ -637,8 +638,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                 s->data_count = block_size;
                 boundary_count -= block_size - begin;
             }
-            dma_memory_read(s->dma_as, s->sdmasysad, &s->fifo_buffer[begin],
-                            s->data_count - begin, MEMTXATTRS_UNSPECIFIED);
+            dma_memory_read_guarded(DEVICE(s), s->dma_as, s->sdmasysad,
+                    &s->fifo_buffer[begin], s->data_count - begin,
+                    MEMTXATTRS_UNSPECIFIED);
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
                 sdbus_write_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -670,11 +672,11 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
 
     if (s->trnmod & SDHC_TRNS_READ) {
         sdbus_read_data(&s->sdbus, s->fifo_buffer, datacnt);
-        dma_memory_write(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt,
-                         MEMTXATTRS_UNSPECIFIED);
+        dma_memory_write_guarded(DEVICE(s), s->dma_as, s->sdmasysad,
+                s->fifo_buffer, datacnt, MEMTXATTRS_UNSPECIFIED);
     } else {
-        dma_memory_read(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt,
-                        MEMTXATTRS_UNSPECIFIED);
+        dma_memory_read_guarded(DEVICE(s), s->dma_as, s->sdmasysad,
+                s->fifo_buffer, datacnt, MEMTXATTRS_UNSPECIFIED);
         sdbus_write_data(&s->sdbus, s->fifo_buffer, datacnt);
     }
     s->blkcnt--;
@@ -696,8 +698,8 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
     hwaddr entry_addr = (hwaddr)s->admasysaddr;
     switch (SDHC_DMA_TYPE(s->hostctl1)) {
     case SDHC_CTRL_ADMA2_32:
-        dma_memory_read(s->dma_as, entry_addr, &adma2, sizeof(adma2),
-                        MEMTXATTRS_UNSPECIFIED);
+        dma_memory_read_guarded(DEVICE(s), s->dma_as, entry_addr, &adma2,
+                sizeof(adma2), MEMTXATTRS_UNSPECIFIED);
         adma2 = le64_to_cpu(adma2);
         /* The spec does not specify endianness of descriptor table.
          * We currently assume that it is LE.
@@ -708,8 +710,8 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         dscr->incr = 8;
         break;
     case SDHC_CTRL_ADMA1_32:
-        dma_memory_read(s->dma_as, entry_addr, &adma1, sizeof(adma1),
-                        MEMTXATTRS_UNSPECIFIED);
+        dma_memory_read_guarded(DEVICE(s), s->dma_as, entry_addr, &adma1,
+                sizeof(adma1), MEMTXATTRS_UNSPECIFIED);
         adma1 = le32_to_cpu(adma1);
         dscr->addr = (hwaddr)(adma1 & 0xFFFFF000);
         dscr->attr = (uint8_t)extract32(adma1, 0, 7);
@@ -721,13 +723,13 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         }
         break;
     case SDHC_CTRL_ADMA2_64:
-        dma_memory_read(s->dma_as, entry_addr, &dscr->attr, 1,
-                        MEMTXATTRS_UNSPECIFIED);
-        dma_memory_read(s->dma_as, entry_addr + 2, &dscr->length, 2,
-                        MEMTXATTRS_UNSPECIFIED);
+        dma_memory_read_guarded(DEVICE(s), s->dma_as, entry_addr, &dscr->attr,
+                1, MEMTXATTRS_UNSPECIFIED);
+        dma_memory_read_guarded(DEVICE(s), s->dma_as, entry_addr + 2,
+                &dscr->length, 2, MEMTXATTRS_UNSPECIFIED);
         dscr->length = le16_to_cpu(dscr->length);
-        dma_memory_read(s->dma_as, entry_addr + 4, &dscr->addr, 8,
-                        MEMTXATTRS_UNSPECIFIED);
+        dma_memory_read_guarded(DEVICE(s), s->dma_as, entry_addr + 4,
+                &dscr->addr, 8, MEMTXATTRS_UNSPECIFIED);
         dscr->addr = le64_to_cpu(dscr->addr);
         dscr->attr &= (uint8_t) ~0xC0;
         dscr->incr = 12;
@@ -792,7 +794,7 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    res = dma_memory_write(s->dma_as, dscr.addr,
+                    res = dma_memory_write_guarded(DEVICE(s), s->dma_as, dscr.addr,
                                            &s->fifo_buffer[begin],
                                            s->data_count - begin,
                                            attrs);
@@ -821,7 +823,8 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    res = dma_memory_read(s->dma_as, dscr.addr,
+                    res = dma_memory_read_guarded(DEVICE(s), s->dma_as,
+                                          dscr.addr,
                                           &s->fifo_buffer[begin],
                                           s->data_count - begin,
                                           attrs);
-- 
2.27.0


