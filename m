Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AB447E307
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:14:14 +0100 (CET)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mz7-0006e6-24
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MiP-0007Xm-Lc
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MiM-0000fO-VN
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KD1bdQAKpfL3b0XM21dLq9IX92qtFC9hzQYY4WdApis=;
 b=Ojnccz3OCqjcPXsc2EQZs657efYaccJx5yvmYretYCeAQ0yWwQVSbYPuoMqLV4gR25ugLl
 BFXPvE0tOvBzI+F0IACTQ6TFkEJSxplyi0NyDoCAOoFGvaKxmukW6E+f17astA0QD+T9HR
 g87WkbAQYmq25HULeEfOCGVnGX8YB3U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-R6UIgpE2MNmnetfxLLhNNg-1; Thu, 23 Dec 2021 06:56:53 -0500
X-MC-Unique: R6UIgpE2MNmnetfxLLhNNg-1
Received: by mail-wm1-f70.google.com with SMTP id
 64-20020a1c0443000000b00345d1448d3aso307310wme.9
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KD1bdQAKpfL3b0XM21dLq9IX92qtFC9hzQYY4WdApis=;
 b=Ml4HzLoVVlCQtB2gvhy1ZURFPWnBptMIxK9sQhx0kpqRkAizVlZ/yEeOey6k3+Dug/
 qmuhD/RNsaz+dspKRcqgCuYwovYsnpmO+ony+7QL8Yev3+91rvFK6Ex1Ozrun7Eo+UWv
 +7ono9CZOOfbMHS8rAV+yBI2AQ0sG7fQfIZlhz4QJjcF8VbDRRlPdxX2zFSE/Z7Yew8Z
 1DlLOo2c3Y8P4+IUsYDF5204zGaMGQAkclENEqD7WP5bcE7d5vCj6HwcI/5IJByD9UJh
 ImWEVzCJMDHv8winF9aZWITlJjkJKIPCDlqSXG+84Soa4LkeYwzKK1/xFpY9hG8xEDUf
 1IBQ==
X-Gm-Message-State: AOAM531Re/aURzkK3U3PAMk+4c5lWkSgSPs7Vic4DPitJaJitzVd3Qkk
 rZxuntGNTDnHRg5Nr/j1ZfYFtHKOJvmFyBifPEaDJaJqkLdDa0MQiMFFRP5a84+IcpEHtPii44W
 +tWrojnThTFRyFA/GEchBEDOPQswRhSU2+CdzMnZwb3tjwx7k7rC74Ejnqahd35SD
X-Received: by 2002:a7b:c397:: with SMTP id s23mr1557503wmj.183.1640260611933; 
 Thu, 23 Dec 2021 03:56:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu7mXK63Rruez1aXJEdASH8IPRR0dIq17cEOuTuIdV4IcRI4qs6NE2ZCrCWSnYx4KCXywfbA==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr1557451wmj.183.1640260611654; 
 Thu, 23 Dec 2021 03:56:51 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id n7sm4764633wms.45.2021.12.23.03.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:56:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/23] dma: Let dma_memory_rw_relaxed() take MemTxAttrs
 argument
Date: Thu, 23 Dec 2021 12:55:34 +0100
Message-Id: <20211223115554.3155328-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will add the MemTxAttrs argument to dma_memory_rw() in
the next commit. Since dma_memory_rw_relaxed() is only used
by dma_memory_rw(), modify it first in a separate commit to
keep the next commit easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210702092439.989969-4-philmd@redhat.com>
---
 include/sysemu/dma.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index d23516f020a..3be803cf3ff 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -83,9 +83,10 @@ static inline bool dma_memory_valid(AddressSpace *as,
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
                                                 dma_addr_t addr,
                                                 void *buf, dma_addr_t len,
-                                                DMADirection dir)
+                                                DMADirection dir,
+                                                MemTxAttrs attrs)
 {
-    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+    return address_space_rw(as, addr, attrs,
                             buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
@@ -93,7 +94,9 @@ static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
                                                   dma_addr_t addr,
                                                   void *buf, dma_addr_t len)
 {
-    return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw_relaxed(as, addr, buf, len,
+                                 DMA_DIRECTION_TO_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
@@ -102,7 +105,8 @@ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
                                                    dma_addr_t len)
 {
     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
-                                 DMA_DIRECTION_FROM_DEVICE);
+                                 DMA_DIRECTION_FROM_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -124,7 +128,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
-- 
2.33.1


