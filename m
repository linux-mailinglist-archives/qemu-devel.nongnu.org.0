Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26924865A9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:59:18 +0100 (CET)
Received: from localhost ([::1]:47644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TIT-0007Qg-El
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se6-00052X-UR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se2-0000uU-RT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWTwMV+ZCbV0IF1/mOnNkd5ZGkoC7/f6dcJ4TuYv4Y0=;
 b=DB1EgH50FPCBZDi9i0pUmpveYo5KGcxLFsfgYHnZ9jdZjBE3fyJa03ZPz34XrIYhOMtiE8
 BvBo05WFIL/XAuv5k8fsn0iUltY07clxPF6I4Bju0LACn6z2XkwdCA/dwOEs8mzrPk3mP+
 J3RaGFYeFR+CheuH19WEEHIb6E2AsQs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-ONX9sE93NJmqrCAAXQgmog-1; Thu, 06 Jan 2022 08:17:25 -0500
X-MC-Unique: ONX9sE93NJmqrCAAXQgmog-1
Received: by mail-ed1-f72.google.com with SMTP id
 h6-20020a056402280600b003f9967993aeso1928330ede.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uWTwMV+ZCbV0IF1/mOnNkd5ZGkoC7/f6dcJ4TuYv4Y0=;
 b=gcLWO4CjW8Q7NTOaplpa1/1gt1se0Bk7ihzhZxakHjGUUEXdu71CzSzc9dCaIl0Sz5
 tTJdzgj9t5druHMBOGpXk9GLVeOyDXOo0vS27XxnBjeGcQKBq/WGp5cpXkstmvOhcqkf
 njorhP3sU5FgzS/YSJX4rG26oxouhr5vnSD181OXOcxQ8GZG5vKjSb6Bfpw4SkResiCU
 n4qZX1eKlJj0oJ/iGbYdoox1DpYZ3yxZkUHk0I2/7zzJHanfDyaXmym/IcY/XryBR+U9
 pnTXU44VWuwz3p46SrZA5kFtyd0klRKteS2CdMEZXgZgUFOWkT0D7ZuunrpzhvPFi+xO
 ZOzQ==
X-Gm-Message-State: AOAM531CblsS1cSgQVqh2mTC59/gbQirIg/ujYqhQ/Zhk2kyWoovhR9e
 sFHPgB7Iq5qxChI8xL5ciQyFesY1IeiF13b+4X4nuiWQ4hwSzmgqDIi7KkaRnaiaYEjUc2WNu9A
 bfJ2QjIYN9q3EncAjRrrdfaavgzfv5tgUQ1yMm+awNo4CNmC1771N7Nq8Wq42
X-Received: by 2002:a17:907:6e23:: with SMTP id
 sd35mr45920612ejc.202.1641475043031; 
 Thu, 06 Jan 2022 05:17:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx9QGgutMuaszm4o8KKtPnmkke00KeiIBIsjz9H4vaZQwdl7dg/MAeld3nT8QpqWhNXvDdgw==
X-Received: by 2002:a17:907:6e23:: with SMTP id
 sd35mr45920589ejc.202.1641475042718; 
 Thu, 06 Jan 2022 05:17:22 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id kw22sm489484ejc.132.2022.01.06.05.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:22 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/52] pcie_aer: Don't trigger a LSI if none are defined
Message-ID: <20220106131534.423671-25-mst@redhat.com>
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

Skip triggering an LSI when the AER root error status is updated if no
LSI is defined for the device. We can have a root bridge with no LSI,
MSI and MSI-X defined, for example on POWER systems.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20211116170133.724751-4-fbarrat@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci/pcie_aer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 27f9cc56af..e1a8a88c8c 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -774,7 +774,9 @@ void pcie_aer_root_write_config(PCIDevice *dev,
     uint32_t root_cmd = pci_get_long(aer_cap + PCI_ERR_ROOT_COMMAND);
     /* 6.2.4.1.2 Interrupt Generation */
     if (!msix_enabled(dev) && !msi_enabled(dev)) {
-        pci_set_irq(dev, !!(root_cmd & enabled_cmd));
+        if (pci_intx(dev) != -1) {
+            pci_set_irq(dev, !!(root_cmd & enabled_cmd));
+        }
         return;
     }
 
-- 
MST


