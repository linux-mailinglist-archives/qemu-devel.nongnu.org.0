Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067D47E302
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:10:50 +0100 (CET)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mvp-0000ss-J4
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:10:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mhv-0006Am-6m
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mhs-0000bh-NW
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFluRvBp6z9QVaCBe8Ue+D5WXYJ9sfHm6PVL8XfDVUM=;
 b=IiY0ix8b8hNNbvlIUp807OJwaNtSYXMdiisgsS2RHogIau5kuj/8dd4tXds2lRcKJQZRsf
 FNwKDhfUcwTJKscMOToCwp/1/1mg9x2nq8cKJaDlNZS3FB5z0kvpT2GuCFSi6Vgjuy+4L9
 TEEifZxB44FeTqrp1PYtgBCd6v66/Ww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-J6zAEB5IOAmipWWUvESePQ-1; Thu, 23 Dec 2021 06:56:23 -0500
X-MC-Unique: J6zAEB5IOAmipWWUvESePQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a1c440a000000b003456b2594e0so1925069wma.8
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFluRvBp6z9QVaCBe8Ue+D5WXYJ9sfHm6PVL8XfDVUM=;
 b=X6TNk1G+F6YwsTBwyyVyjBU7B/L4rdiDqPqfb/k12lJa11UiFnDfHk29QDKgV6yXQm
 EXHfhAU2C19coZvxwn78RFRGkQxXXIxX/Q7NiUQHA6BSrj3Uu5KWDMCQSZYo1RWILy4t
 HH3YzoAdQGMpIkTXEv6AUFQAZRvfzb2bs3VTYbVPxWUZpg7KbM8MMvZWh5YQH19vwyEf
 CRef/ev0dYIP4PM4g9JUZ1+KPlHSrwGCB7VgSABCfels1aGIVw6A7GhT5c27SAsed8pM
 KfNz0X/w+O7PXUJOgas8t1isVDUgR2GimT+X2qQr2ZxsJoczg+oP2d1/NHXEtLyEUHhl
 64LA==
X-Gm-Message-State: AOAM532yJQz/jftSUfcbLSaKKSwSdyiFQnBKz8rtWHarcIlE4hFgZB2T
 F7R/+YE53VnLTwHlfB+PhBU0AqAUQW9oS4z3zRYviBDoqriZwcDZv64Fw6EGylkvIaBBQmVX8uv
 fNVIfJMyRf5GLqR5Q/ZjMB00lu6RiuSXPX5mWUoRVWeSyRtLWYB32lmh4niKOWqkg
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr1498491wmj.191.1640260581523; 
 Thu, 23 Dec 2021 03:56:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBokRYK6ALM3HGg1JCXxCJgsw/1xEQICWEVfpoFNmRzR/YDKv4JTspeT2MSnEe13aTG1tZmQ==
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr1498440wmj.191.1640260581327; 
 Thu, 23 Dec 2021 03:56:21 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id g1sm4915702wri.103.2021.12.23.03.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:56:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] dma: Let dma_memory_valid() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:32 +0100
Message-Id: <20211223115554.3155328-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Let devices specify transaction attributes when calling
dma_memory_valid().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210702092439.989969-2-philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 2 +-
 include/sysemu/dma.h       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 4bea87f39cc..4c45f1579fa 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -91,7 +91,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
 static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t taddr,
                                        uint32_t size, DMADirection dir)
 {
-    return dma_memory_valid(&dev->as, taddr, size, dir);
+    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr,
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 3201e7901db..296f3b57c9c 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -73,11 +73,11 @@ static inline void dma_barrier(AddressSpace *as, DMADirection dir)
  * dma_memory_{read,write}() and check for errors */
 static inline bool dma_memory_valid(AddressSpace *as,
                                     dma_addr_t addr, dma_addr_t len,
-                                    DMADirection dir)
+                                    DMADirection dir, MemTxAttrs attrs)
 {
     return address_space_access_valid(as, addr, len,
                                       dir == DMA_DIRECTION_FROM_DEVICE,
-                                      MEMTXATTRS_UNSPECIFIED);
+                                      attrs);
 }
 
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
-- 
2.33.1


