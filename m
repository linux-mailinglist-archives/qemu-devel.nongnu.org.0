Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE248655D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:39:44 +0100 (CET)
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SzX-0007zH-3k
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se4-00050P-92
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se0-0000uK-IA
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3xpoxaSN5NdlrS8+eCK2NDrLznN6O18Ki1VxrmK5/M=;
 b=KfBouZyqK/8eqaRRArA6t9u1DE9BafO6pX65CuH9z2vuFI+7qGhW94xG1mFckJrl+9/boK
 AF/KTlbohnZO4OI2awPa70W2GaWP2C+eb+SuzfSw+66FLl5KfHYeudmBP8DVC5xHNMt3vc
 3n2tXLBqTH+Dav47NtP9iMls0Nj28g4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-TMAf9tw_Naa5kFnj8FpGgQ-1; Thu, 06 Jan 2022 08:17:21 -0500
X-MC-Unique: TMAf9tw_Naa5kFnj8FpGgQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 az11-20020a05600c600b00b00345c4309bccso187557wmb.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J3xpoxaSN5NdlrS8+eCK2NDrLznN6O18Ki1VxrmK5/M=;
 b=4pYeM5yT8DvBKRjQzz6DGAdZYWMTdWo9QP3B/Y4bfM9w/F8SiTAgcx8Gyf+0xyZujW
 Ykm6VWY3i7ZNfmpf6/+CBipDWJ5DEmloZhiwHhUUtiTIvfIwnIL85/mw2lZekU3KTsZo
 XESowmfmHmvXZIUR1Pn5OBJ2CWtxiGI7tGKKPrbJ0E5bC03OOzh/cJAerTN61uRkcoQ2
 RCip5cCs1649OqvVpNbp+EWL7uDHQSfvn4TEe/JYO5Ctaug7ayzOhAgz7Y5MKXiMJ2sV
 zzVrwMTUsEK8q4WqmDp1DjatquvVPD6Rs5HheH0qRjYQmB4QA2Qd0Sqg04f+/X2MKrC1
 BEDw==
X-Gm-Message-State: AOAM5339wgAd5FTc/VXVwVx3QVhN0i2XZTCiR102yHtvA/BmjBc5UeAC
 ldCq5blR1p7H+05xgbSczlcBgzfE+EOn4Y2TGsflYRHSN0Hmqv4HjehiDL1ykNKsGSLIvwiNjO5
 UpzDAJbYQ6JWjDTt0T4E0wW2TnchS+ZcN209np3fT5B3dW94Ewxk7OmKzBGTJ
X-Received: by 2002:a1c:9d54:: with SMTP id g81mr4820001wme.51.1641475040104; 
 Thu, 06 Jan 2022 05:17:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGCoYF29Yq+vs29I3LjgHp1b+huQtdC4fJrlzvexyjhHK0qGpeJsd/VRYhjLioNuU9Rpq7hw==
X-Received: by 2002:a1c:9d54:: with SMTP id g81mr4819969wme.51.1641475039713; 
 Thu, 06 Jan 2022 05:17:19 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id b14sm2115357wrg.15.2022.01.06.05.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:19 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/52] pci: Export the pci_intx() function
Message-ID: <20220106131534.423671-24-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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


