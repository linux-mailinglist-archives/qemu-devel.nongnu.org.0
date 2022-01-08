Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EEE4880A3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:39:54 +0100 (CET)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60i1-0003mr-Lj
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:39:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AD-0004TK-90
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AB-0002Nk-CE
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWTwMV+ZCbV0IF1/mOnNkd5ZGkoC7/f6dcJ4TuYv4Y0=;
 b=IbH+ah+Dvo0QgsZhdR+LcIzZmhWAOQn1AN1zGYnBv5/pG6IcPwaj84WaxQP8G0K7c5cAzw
 0G5izQZJ9uE1U4pCC2RSzAh6KglNjE50/XIC0LuxVDmAxPb59i7IOJBPaTmuy+7X9jz9R0
 t11OzaraArGbpW16XCH4+lNt7OZ7BFE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-igyV5ey8O7-ga7YoJS3c6g-1; Fri, 07 Jan 2022 20:04:50 -0500
X-MC-Unique: igyV5ey8O7-ga7YoJS3c6g-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay41-20020a05600c1e2900b00345a568e6b2so2501647wmb.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uWTwMV+ZCbV0IF1/mOnNkd5ZGkoC7/f6dcJ4TuYv4Y0=;
 b=eVuu0hDz6yHxXp9wch5Ai4kwzGNM78qF7LL9yB+oM+4mqSGGBrIdjnzfDkfa9vNyaY
 mGUU1lihosxVwO51NNr/J85qK9Khir/au2Gr0ZW3iyOJyHyNhWeu8mToyaccAlDFqyo+
 qyG1mSfFNAZXFdJjRCh5qvpYdWrl79pCuM/8S89TrV1RMs4EUtT+1WU9FG0FHznvAc79
 oIdvzU50hD82B8oFjryUPzFms5sluvC8ZnZzHWZPc2BIyQvGBvhNfMg/VYP4yKXRkgHv
 QWydeNaVqx6oDfTtMLcLglvaoWE/trajuvHOO4/2cnURR7CE9vpQms9QpqFif2iM4+tI
 UiFw==
X-Gm-Message-State: AOAM532V38gkpQmqq53hUENrX8GOm+VcGr3CrUTMYU/9LfGCiwBJPd6S
 V5dx5DyeUf/frBfBZOnPUzEAINLEvM0FBEahKnqXiLxrX9v/j3eyH7ZvZgqQ9boRQ+Q/Rtp4OK2
 xBivihqusuQce7S6ylgYS7aseqf0KP9kDUqOlSRq7so596o//jWFqkbo7OVC9
X-Received: by 2002:a05:600c:19c9:: with SMTP id
 u9mr12773988wmq.92.1641603889329; 
 Fri, 07 Jan 2022 17:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRX7RSfhIp60ddBEC/v+IiHx1fCxCNyR2PswwVzcJoZ6iGqrm0NY6h/aOv1dnPw5KGqSA5KQ==
X-Received: by 2002:a05:600c:19c9:: with SMTP id
 u9mr12773974wmq.92.1641603889060; 
 Fri, 07 Jan 2022 17:04:49 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id o1sm228071wmc.38.2022.01.07.17.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:48 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 24/55] pcie_aer: Don't trigger a LSI if none are defined
Message-ID: <20220108003423.15830-25-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


