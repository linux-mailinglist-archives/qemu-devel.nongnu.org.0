Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB9450A13
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:49:55 +0100 (CET)
Received: from localhost ([::1]:39766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfB4-0008AU-4f
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0b-0003e1-H2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0a-0005It-1N
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlgH4ZQ1sk94dkzayfKgJifhXqc9wwB8Ay+7c8m4Bko=;
 b=LmQwUCX2Av+VDXideT2wL4YXLpNJTw5VOtKLOCIMd4tqdx/Wx08sxqXQTC0TytP2ijcMCn
 Lyw/RIgeK80UukxC0G2LR4mxNal16vX1+gq9GI99brAAWGRuBQzeUcZoNeqLNlPpq8ttMB
 H8sW7n1dMXuSzJS3a+GmaVlKEXA88/k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-rT0HDrnwMSmzO0fbMKUTwg-1; Mon, 15 Nov 2021 11:39:02 -0500
X-MC-Unique: rT0HDrnwMSmzO0fbMKUTwg-1
Received: by mail-ed1-f72.google.com with SMTP id
 v10-20020aa7d9ca000000b003e7bed57968so3293220eds.23
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NlgH4ZQ1sk94dkzayfKgJifhXqc9wwB8Ay+7c8m4Bko=;
 b=VzaLC1FEyMti0tauELAxhO1fUszkpZ9Jrl2l61QQuOHln6Q37sWzAXVLNkgq0JKuLr
 OOrsZhLWmsPNtCJ94WuDRBTtWxm1aRbzNIqYFvUplWuyRKgEh106f/VpdPiwl1cFXAUn
 X/OYIprZ8IVMlSkLeCLxjIQIiodjCikwh1Ufg6S09DG77mWIgfjuc7WQtfoMIAD5lENl
 d1Ttrp2wX1JHiAU5BYl8uoqsx1gbVqqRZzYpiHsqzEoYu1UE8U/txrvnpmQZQYOr9auj
 Q4hNt7g5p9Pn0ou3FW4k7g5GGTln/5GOPualVX0KWrIRGpvuNRlwjFG2e5AD8NHINy8j
 gO+g==
X-Gm-Message-State: AOAM530hpN11Lle8MtZdVjSVqPq0UT0AfHICqx1KFynUY0tPLS8TH77F
 XWhg3m967yUkPKOI3Iddp7JmVHNH74q0LeyX18S445nV5ZSHGeUhiBdV88OhlImEJ84QZY+s+vY
 hjkN9zKkTfIJgNcldr7Hn6xugbnA2wPU/2ijbtyj2uB/lxCdqyYMOTnpZG5qd
X-Received: by 2002:a05:6402:278e:: with SMTP id
 b14mr32592ede.354.1636994340542; 
 Mon, 15 Nov 2021 08:39:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwszcQIFyXnBSPIpoSRh4bGxSQ+oBpDXPMd7ymP0w6jtgd9wAVNUSh6lAMLqnG9izEdHdkilQ==
X-Received: by 2002:a05:6402:278e:: with SMTP id
 b14mr32544ede.354.1636994340322; 
 Mon, 15 Nov 2021 08:39:00 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id ch28sm2408929edb.72.2021.11.15.08.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:59 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] pcie: add power indicator blink check
Message-ID: <20211115163607.177432-18-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Refuse to push the attention button in case the guest is busy with some
hotplug operation (as indicated by the power indicator blinking).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211111130859.1171890-4-kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 13d11a57c7..b92dbff118 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -506,6 +506,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
     PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
     uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
     uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
+    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
 
     /* Check if hot-unplug is disabled on the slot */
     if ((sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
@@ -521,6 +522,12 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
+    if ((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_BLINK) {
+        error_setg(errp, "Hot-unplug failed: "
+                   "guest is busy (power indicator blinking)");
+        return;
+    }
+
     dev->pending_deleted_event = true;
 
     /* In case user cancel the operation of multi-function hot-add,
-- 
MST


