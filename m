Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0C74823D3
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:51:54 +0100 (CET)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GRs-0004i4-Pz
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:51:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPT-0002cg-5T
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPR-0000Im-0C
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/KXeNIFUnY1pUcNuTPWkGRZ5r1qlFjH4izW6QJgPWUg=;
 b=Wjpc7D1sLGhLo6b2hgwVi+9y+C6EMYuNRqreOynpirAWxh90XCNEv8BniMnBZHf/4gphwJ
 9OmdpO+t1P5y82lKj9J3o6rm2ap7LBXJ0Za4rNbZ3yAMaVylCI6fftwNbwIBi25HzFq39u
 OHHJ1caUqUzQ6DrManqh6T9us0Xnzec=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-1eSpgmkPPp-RxToZ7G4hAA-1; Fri, 31 Dec 2021 06:49:18 -0500
X-MC-Unique: 1eSpgmkPPp-RxToZ7G4hAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 b83-20020a1c1b56000000b0033283ea5facso4544802wmb.1
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/KXeNIFUnY1pUcNuTPWkGRZ5r1qlFjH4izW6QJgPWUg=;
 b=7/YXKnGTmUH8eYx9xaztFtztd+WMJWPcjGpDgOwL6Xomh/U3CrnrDFfKA1BN/sFObw
 VDr4GeTxO8U6rhNOl6NeUg/DQPH4v+GVqhaS7VNOEtAPO3L9O2OWOR5TC1PKkRGVfIqK
 +O71Ssw+TQRpqoDP4iuU3wSLUiglFYfwQmL8QMtWo42iJsUL/Z/h0Bz5qsKSqvymmx/W
 5mXRCC1+Z+Uz0Ky6PT5dxXxRcIkDUgjYV2VkV9/aJvKAg6/lJX9muf0D4/GQlz1iOleH
 Yl4Nx3s7dC6BSHw0U0ZV2i5yKZfIDiL6M4rDcipHVxZJVn4DoB4UwygSlR1RSq1fflZu
 SawQ==
X-Gm-Message-State: AOAM530hHfdz+9KVPlOQEGY1h8WiLAb2vilLsg96GMVMqDMhLcSnvCSO
 WqG7eQW/8l4S0eWhpH6+4QJ++n9mQyUUMYkUA9UAewObNm0U43XaJbeIWbll7WT/jAPLvsnf+SH
 SK6xsgKMRfc5jbVZRPdHNtt3zxDS9qg00AEyoFk9LDUjZOIK0bL+49hZg6JQy5cNQ
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr29841588wrw.696.1640951356784; 
 Fri, 31 Dec 2021 03:49:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ0MH1adbramq6Rx/LSJHzXDf5WIu2+OFf7IbTHinEeLWq3jsFk+YmaSZE0hFzSmOw/pqLlA==
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr29841565wrw.696.1640951356595; 
 Fri, 31 Dec 2021 03:49:16 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id p21sm27122889wmq.20.2021.12.31.03.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] hw/pci: Document pci_dma_map()
Date: Fri, 31 Dec 2021 12:48:56 +0100
Message-Id: <20211231114901.976937-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231114901.976937-1-philmd@redhat.com>
References: <20211231114901.976937-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5b36334a28a..f0d707efb8c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -876,6 +876,18 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
 
 #undef PCI_DMA_DEFINE_LDST
 
+/**
+ * pci_dma_map: Map a physical memory region into a device PCI address space.
+ *
+ * May map a subset of the requested range, given by and returned in @plen.
+ * May return %NULL and set *@plen to zero(0), if resources needed to perform
+ * the mapping are exhausted.
+ *
+ * @dev: #PCIDevice to be accessed
+ * @addr: address within that device's address space
+ * @plen: pointer to length of buffer; updated on return
+ * @dir: indicates the transfer direction
+ */
 static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
                                 dma_addr_t *plen, DMADirection dir)
 {
-- 
2.33.1


