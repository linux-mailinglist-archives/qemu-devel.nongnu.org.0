Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CB04876AF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:44:14 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nfJ-00066Q-7s
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:44:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2l-0000ST-0i
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2i-0001u3-VL
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWTwMV+ZCbV0IF1/mOnNkd5ZGkoC7/f6dcJ4TuYv4Y0=;
 b=Kk3MqQAJLxznjyExNDQgHmEpXz+qXvBlbjLEcua0PlQGTF9nYZfmS4O2OsUkk8QuGIH1LM
 FwE10dKmuUwkTyWdH/I7nauJNqEU+j3OkMD7lKjOlFFh2L58If3iLuh06A4j6f2FG68xf0
 +UxAKZF9YQns08wqON1JGikL+C0ZaQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-RKFozgvJNBKkFv5WPRNXyA-1; Fri, 07 Jan 2022 06:04:19 -0500
X-MC-Unique: RKFozgvJNBKkFv5WPRNXyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so1353363wmp.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uWTwMV+ZCbV0IF1/mOnNkd5ZGkoC7/f6dcJ4TuYv4Y0=;
 b=yP3Ww6Pb5sF6zBH8hJOsiQWI/t1k/G6gk6Z3QDm3G7mJgyZvFn0CvZ0Dun66tBfCSY
 40fClWsCLK3m2uUzXKRVJWgQ+7QOmUTAn/osfwoXafW8y7hnOSRdz1h3K923cNPcWTrY
 LQxQvzcT0UzwIZryhdZAkHVKqfxxKcIE1h/vwB4ofb3UA9IJuzN0A7Wc1RPkcj4vHj3l
 ehRgZUdv2vru1nWrZMPErP2kSgp9GEMZ9EQMIKD7lHULL0IMDpChE32+Mw/XIvhwF+D3
 4cWa8dmzc9o9hyil5TTlo8lobUygbca+qiwADeZ43fE9F6Z/k4JDz6UX68qInC1dvkB2
 6IRg==
X-Gm-Message-State: AOAM530gXABxqlgjjKqF33FlI0UiZqwIZnJotv4M96OryJ9kPFsqgajz
 iTqJpF/d4S0vienZ/l3I5lUAqbErHLlFrLi7KehGlKAa+2bDQeKkwVMNKpZttBrjCm++7qNf/vn
 wVWj+XOe7EduZBAOsm5wTz3RJp3G4hGpgQmJvC5gByX4s+aKljKezZWrlJrOl
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr55383676wrq.354.1641553458098; 
 Fri, 07 Jan 2022 03:04:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxkoCtlvxDLaZCiG53kRr/4Xn9ScxVsRDZpYpfXwBmATSNaUI/pywQIvgO/8klEPYjC6PVVw==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr55383654wrq.354.1641553457834; 
 Fri, 07 Jan 2022 03:04:17 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id c8sm4588220wmq.34.2022.01.07.03.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:17 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/55] pcie_aer: Don't trigger a LSI if none are defined
Message-ID: <20220107102526.39238-25-mst@redhat.com>
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


