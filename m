Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B3611AC6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUrE-0001iK-8H; Fri, 28 Oct 2022 15:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUrC-0001hk-Gf
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:30 -0400
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUrA-00032v-QE
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:30 -0400
X-IronPort-RemoteIP: 209.85.166.70
X-IronPort-MID: 234207978
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tFcKLKpwNH8g/dfV77xMlm27pydeBmKpZxIvgKrLsJaIsI4StFCzt
 garIBmBMqqCZzf3c4olPN/lpkwC6JfRy99gS1Fv/n1kEixD9pacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtC7gRlDRx2lAS2e0c9Xcp3yZ6ZciOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDX4pZkc/HKbitq/0Te5p0G2M80Mi+7vdkoc+dZk
 72hvbToIesg0zaldO41CnG0GAknVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kpHLJG2eJsXlpQ/
 NwjAm5SMRLAmcyflefTpulE3qzPLeHuNYIb/3BnlHTXUq5gTpfETKHHo9Rf2V/chOgURaeYN
 5dfMGQxKkuYC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJl1AriOe8b4q9ltqiY/pZtByWg
 Fn/9XX0MFI3G+yV+T6Lyyf57gPItWahMG4IL5Wh+/t3xVGe2GEXIBsRU1S9vL++kEHWZj5EA
 0kd+y5rrK9rsUL0Fp/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsElattPROWBcKeAEX
IronPort-HdrOrdr: A9a23:X/ViJKl0yaOQKDyEV3HUsX6NkebpDfL63DAbv31ZSRFFG/FwWf
 re+MjzsiWE9Ar5PUtLpTnuAtjnfZqxz+8W3WBVB8bYYOCEghrUEGgd1/qa/9SIIUSXnZ8/6U
 4jSdkFNDSZNzhHZK3BkW6F+rgbsby62ZHtr8vli1lWcSFWR5dJ0zpZYzzrbXGehzMrOXP6Lv
 ehDwZ8yQZIAU5nFvhTz0NrPtT+mw==
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:26 -0400
Received: by mail-io1-f70.google.com with SMTP id
 n23-20020a056602341700b00689fc6dbfd6so4917064ioz.8
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0K6LB5X3Bhl0LmaoOJyUkeJEAh422fW3bU1e7OTrys=;
 b=Ug2MFfV1H7RIGW/P7ozDd145OdZYX6/qvpUCIiR4W5YH82POAZZOuOlG/DdRAl1KTR
 nvhxeAnrYjjb+auZaBhXxqYBObfy3IvKf6mrtbME3QbQXuX/JHDXeriDUHhqfN+1smt5
 uBX9ApHjoJ9YzkvPYMaZkRWq5WbUFbxbsTd8MD4WQG+zDAoCSjvaFAQu5Jh0F7hU1603
 hIRYo3TCudeDYyp2eT6Xv6iz3Th81+xZXyCz4CBovjwSzZFh+BeIQ/NFjaL8Fw/0ROR2
 XhO1+KX4QHSIF316ecmwOFnCiDUxv9apc0qQ1Qn7A/GXHn6wyBhihn8h+YxKSob9v/Td
 Fhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O0K6LB5X3Bhl0LmaoOJyUkeJEAh422fW3bU1e7OTrys=;
 b=1jGYiQlwsb/2+adf5DaifvEk2GloXDa/U1TkXNgge4EiNprG6U7l2kkpUKZfH1zKuF
 E/LjYIq6473t0rj3XB6N4mLiPV5TJugyib1hXtyLcC3E370g+0cva3K6p6ub6bnsWQd4
 x2LRcgYBgYyk1wCTWe0uGRhvuJ0kXFzu92VcVoK/ooQf9vMUiHI3JeZv6lkkT4QifG+u
 m3ToufHafsKdAUCFgqHKOOD3CdqWM73KOsC6OOXYBfD9nqgGfbOLAOMJZvIa6pDySR3T
 D2vVWHYvCSfFktAlSattpd5mzZnVkmSQXrEI4DsrmTKaEApEtMvjPAsZARXbkroA8tGE
 OCbQ==
X-Gm-Message-State: ACrzQf22aJeW4gLpRBAwdVyyURrVHCGDpbNO5Iz27uwJwy+WrVK+XbUu
 BcJCBphqS94vSwZdwrf8S9o4o4u9eGIHgHo/kwmY/GltGSHOTHuyP3thQeGMjYiW+mY8uJgCEl1
 u6SSbHu+fioCLMEBvYApphkNmEmzlFg==
X-Received: by 2002:a05:6602:1648:b0:6bc:e8b6:8cc9 with SMTP id
 y8-20020a056602164800b006bce8b68cc9mr512016iow.77.1666984646421; 
 Fri, 28 Oct 2022 12:17:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Pb3iuujC3oJs9B6JdbzM6aBNbsKvnSXzCeGPPikQJ+70XE04V8plDHJeEjQBbgf3w37F4hQ==
X-Received: by 2002:a05:6602:1648:b0:6bc:e8b6:8cc9 with SMTP id
 y8-20020a056602164800b006bce8b68cc9mr512003iow.77.1666984646227; 
 Fri, 28 Oct 2022 12:17:26 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:25 -0700 (PDT)
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
Subject: [PATCH v3 7/7] usb/libhw: switch to guarded DMA accesses
Date: Fri, 28 Oct 2022 15:16:48 -0400
Message-Id: <20221028191648.964076-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
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

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/541
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/usb/libhw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/libhw.c b/hw/usb/libhw.c
index f350eae443..a15e97f76d 100644
--- a/hw/usb/libhw.c
+++ b/hw/usb/libhw.c
@@ -36,7 +36,7 @@ int usb_packet_map(USBPacket *p, QEMUSGList *sgl)
 
         while (len) {
             dma_addr_t xlen = len;
-            mem = dma_memory_map(sgl->as, base, &xlen, dir,
+            mem = dma_memory_map_guarded(sgl->dev, sgl->as, base, &xlen, dir,
                                  MEMTXATTRS_UNSPECIFIED);
             if (!mem) {
                 goto err;
@@ -63,7 +63,7 @@ void usb_packet_unmap(USBPacket *p, QEMUSGList *sgl)
     int i;
 
     for (i = 0; i < p->iov.niov; i++) {
-        dma_memory_unmap(sgl->as, p->iov.iov[i].iov_base,
+        dma_memory_unmap_guarded(sgl->dev, sgl->as, p->iov.iov[i].iov_base,
                          p->iov.iov[i].iov_len, dir,
                          p->iov.iov[i].iov_len);
     }
-- 
2.27.0


