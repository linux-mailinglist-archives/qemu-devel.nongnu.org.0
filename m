Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964C94880A4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:40:05 +0100 (CET)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60iC-0004IN-M3
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:40:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AD-0004TJ-8e
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60A8-0002Nd-H8
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3xpoxaSN5NdlrS8+eCK2NDrLznN6O18Ki1VxrmK5/M=;
 b=HcKcsMzpREQW+7sQz0lLyznwAwbMlgfVuyfexQpnrCEtPflnRXemIzk71q/iyqvbTxv6Ls
 lw6p2GP7SVH4DjmytYCA/WrD/etB2EPKAW19EjsVKvOUESfI64sNSV0h7HGpiKaQqkpMwQ
 P7Kb0S9PvmMaGp9U8vM+eOzHJ8L4BXM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ZxpRiJ2pOE2wr0DpReDdKw-1; Fri, 07 Jan 2022 20:04:47 -0500
X-MC-Unique: ZxpRiJ2pOE2wr0DpReDdKw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so2504092wmp.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J3xpoxaSN5NdlrS8+eCK2NDrLznN6O18Ki1VxrmK5/M=;
 b=m0HWmVhl45BNLxnJymU9AUzfTY6TdYlvMVXWiJrNTN6hX/OT2EAhxGTPoOOcwloxg6
 5igIhRAzr+KmhAi4+e2j3YZGiwEAVeaFWYB7UlaSHj95yMQho/DpUquUoCSiZUr1/2iq
 cWPJrkBXVdo7F1vp7/Buy+V/xMuhwLgBTHiXm/tN7dG18G1i+Qim0I5HPTmDAlK5ybbl
 RDx96L20NxiHzFwxusHZcTLFnlgyKpmsewHhcgYJzvKD3ea/F5MYWLM6qB6xOKSRP7e5
 zj20Ok596mQ9bZO+y9rF9C0X46UcoUNhq3bCsfFCUvnlixZLZ/zPbq4BurckxaTCzT4d
 /zcQ==
X-Gm-Message-State: AOAM533xtrqmyCa+uCCTSvNdij61XF/G6IAyClmXm3zvn0UTF2SLoARp
 KQRKnAyIRa0+VbnetDqislXNKVsXhRi2d9LQTdAxFM3ot5GvAFeab/EtKH/ecHoZ+gsL829DN5N
 Lx5Wvwo30Ldmpc8pjGjpstOP9YTUeaWb9NgB6nso7XEcZuoaf7gScvnZjwkn/
X-Received: by 2002:a7b:c745:: with SMTP id w5mr13044564wmk.96.1641603885888; 
 Fri, 07 Jan 2022 17:04:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkvT9vJbv6vxqBar7wjZGuri6ueNexslPKM4s5Kf8Mo6OlM/ibK3YTTMzLO+16RARbYFua8A==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr13044552wmk.96.1641603885730; 
 Fri, 07 Jan 2022 17:04:45 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id l2sm235380wrz.8.2022.01.07.17.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:45 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 23/55] pci: Export the pci_intx() function
Message-ID: <20220108003423.15830-24-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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


