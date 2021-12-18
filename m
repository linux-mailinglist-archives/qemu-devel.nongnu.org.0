Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0A479B8D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 16:15:34 +0100 (CET)
Received: from localhost ([::1]:49332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybQr-0008P5-5h
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 10:15:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybN0-0002Fo-4L
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMl-0003xZ-HT
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639840276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5V5TxlJi1igL4wA/I5iyHRxilT99+ygriPtyHrJyIE=;
 b=Dgv0AQ6pbEhipHLINqjeq225VAEjcpUIUhLLlAVEcy3jTkKQn14giSxoq4Acq4R/q14VAR
 yN7EJ5Ln9l6MZhnxIRnfl1Ru6Rg7ZDzveQMdMRa4BksYMe8Qs9cUERziNRCq+b3OLU9F+e
 bNMybp1F8R2tzRPovZVJkI2QXupsAnM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-wv30WbeCPY6AS0lMoNA-9w-1; Sat, 18 Dec 2021 10:11:15 -0500
X-MC-Unique: wv30WbeCPY6AS0lMoNA-9w-1
Received: by mail-wr1-f69.google.com with SMTP id
 q21-20020adfab15000000b001a24b36e47eso1503681wrc.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 07:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5V5TxlJi1igL4wA/I5iyHRxilT99+ygriPtyHrJyIE=;
 b=uTYqvgeB4NBnHVo4VHStCiyZs+pEF0W39+99OkOE5gIFWAK22AWbS9lLpnaNrdkJ6N
 FoNZUgOSfRRlrjmMEnUrgS/ZHcQp3IHVojfx37pcNeTl6ZxoOPTH7yU2Q1butBHgvMFt
 O2GEydJDsiWXdDMtzcEzcf2hKt/bylmfzuwKIFOYMFL74ZXK/cgQN6H+0tfWg5OyyDZy
 zyc0d7TPQmm8LcPbRaq/eXSM9O0gAUHUeOH5C+/Y7Z4PIaEbK8lyz9eesLUe0V8xjPbk
 iA4OYykg/ScVT9j5Of8IInIvUOAp0/hxHzi/BUaWzVsXalpAPGcoJAiqDaE1eWnxKPjL
 9PqQ==
X-Gm-Message-State: AOAM530YAa9pI1hyIBP9poPo+TJpus1jtMBBToLp/x93Yb0ihDVkpWM1
 4gUMjdu8de6ToGNALK5GYLqNYQ/qIyudx4oeq9suJVaQm5VAp2uo0OIbcZKau6rv+fOS+CVR1Rj
 0VYF+a4fqAVrSWh9hoA2lCl/2bpii8htsWwgzQ7nJsdh3NHGEp5xOiveLw2txHSr7
X-Received: by 2002:a5d:6944:: with SMTP id r4mr6435327wrw.515.1639840274351; 
 Sat, 18 Dec 2021 07:11:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXk/Klzn1LBPrmM6Xv7hFPmRjsXEZNKZpPaiDzWbbljsUCfqB1M38rGqaayCQO/PxS76FxQg==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr6435297wrw.515.1639840274183; 
 Sat, 18 Dec 2021 07:11:14 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n3sm4161509wms.46.2021.12.18.07.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 07:11:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] dma: Let st*_pci_dma() propagate MemTxResult
Date: Sat, 18 Dec 2021 16:10:52 +0100
Message-Id: <20211218151053.1545962-5-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218151053.1545962-1-philmd@redhat.com>
References: <20211218151053.1545962-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

st*_dma() returns a MemTxResult type. Do not discard
it, return it to the caller.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7a46c1fa226..c90cecc85c0 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -859,12 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
         ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
         return val; \
     }                                                                   \
-    static inline void st##_s##_pci_dma(PCIDevice *dev, \
-                                        dma_addr_t addr, \
-                                        uint##_bits##_t val, \
-                                        MemTxAttrs attrs) \
+    static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
+                                               dma_addr_t addr, \
+                                               uint##_bits##_t val, \
+                                               MemTxAttrs attrs) \
     { \
-        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
+        return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
-- 
2.33.1


