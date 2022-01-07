Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230D48767A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:28:32 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nQ7-000244-7p
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2h-0000M1-Hp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2f-0001tQ-V8
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3xpoxaSN5NdlrS8+eCK2NDrLznN6O18Ki1VxrmK5/M=;
 b=N+7aXXaJH7XTrgnQ7lb6hvPkd97KUJTs/NXLxIy65DdSrtfNowPfwk0MxgN8ORxu7d26zr
 SNXmqgHxVP5zLXDQoUixJdlBoU9iFahqRIzJX0hmQftzTFxd5D7Hoox6uaLklNoYXl087a
 +Yvo151M/5034oyCqHto+oPJLdL73QI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-CRz9_MpQNKuLjYY9st1TPQ-1; Fri, 07 Jan 2022 06:04:16 -0500
X-MC-Unique: CRz9_MpQNKuLjYY9st1TPQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b20-20020a05600c4e1400b003457da1c91eso698448wmq.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J3xpoxaSN5NdlrS8+eCK2NDrLznN6O18Ki1VxrmK5/M=;
 b=dys9pmn7c320dmiaUkcQOg9owpzlkJ/TLhM5/27atyk5AtRF+2jM/XhtCigU9hVXia
 BKXpIE1wr0Z7mtlQIesTwXiPzOLVfMZWS001XIEttTWz+HcBlcitvBp78VmR5Yw65ZM2
 6dJ06UFtT38zlFjKD9+xu95yN+Ll2F1EyeKGGSwJE26KBWag3ERrVG1w8rns1lUrR6Tv
 e+vxdFS3ihgTiudjhlHsQWK6b1fIAC5r2MtxjOTrmdiF0ZvbnWcGxRXlszhecCpVjZ5m
 7hkoy7FKS8JS4wVbWesfrBylR2p2A2Q4Hnrotovm8BggWZ7lVbmSBA+S3YcC7jChOwdL
 6XCg==
X-Gm-Message-State: AOAM5327RF8dshCIXgv27zsl2r8zo/YJFDwLs3+k3Uf/jlGXNVQJyGsk
 Vn946pNzJSjfUlDjD69TJHvoGYbK2w2rFT+2xrO+O54nqB0792YRi/Nj0m6wr7RZJgYsQSdyQ3u
 bTEIHJB366A5rbgCRjnv2BocnASAMdCjtsdO1/K82UBjuEsDsc96sukHFl6Mp
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr10230061wmc.115.1641553455229; 
 Fri, 07 Jan 2022 03:04:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtS2e+I6TXBt9Zjd6KpBtpU7cRWblWQfvLJvyMt57gFvQK1EUszdo4aA9GaikXXrv2tJEACw==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr10230042wmc.115.1641553454947; 
 Fri, 07 Jan 2022 03:04:14 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id t6sm1978007wry.84.2022.01.07.03.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:14 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 23/55] pci: Export the pci_intx() function
Message-ID: <20220107102526.39238-24-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

Move the pci_intx() definition to the PCI header file, so that it can
be called from other PCI files. It is used by the next patch.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20211116170133.724751-3-fbarrat@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci/pci.h | 5 +++++
 hw/pci/pci.c         | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5b36334a28..483d5c7c72 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -735,6 +735,11 @@ void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi_dev);
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev);
 void pci_set_irq(PCIDevice *pci_dev, int level);
 
+static inline int pci_intx(PCIDevice *pci_dev)
+{
+    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+}
+
 static inline void pci_irq_assert(PCIDevice *pci_dev)
 {
     pci_set_irq(pci_dev, 1);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 322ba450e7..5d30f9ca60 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1497,11 +1497,6 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
     pci_change_irq_level(pci_dev, irq_num, change);
 }
 
-static inline int pci_intx(PCIDevice *pci_dev)
-{
-    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
-}
-
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
 {
     int intx = pci_intx(pci_dev);
-- 
MST


