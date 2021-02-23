Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9D0322E83
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:14:59 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaKw-0000bt-Nu
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDK-0008HL-0n
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDI-00054G-9l
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6gI52FLqNUGPgAAMMiiYEtH8SUBM+MxPOhZvMXUJHo=;
 b=JbGUGyxBPhCHZEkTDittwiS4HK5GciV15dFmEiQeFYKeQC2mgdf0c8WCD3O0AhjrnnnOVo
 bb2hQieK1+2f3sS2yfWLtiY7r2se2ahmIZIHpEOl7jQW6CJxnmcNqJ3TlLX5TkAx7nImRK
 G9KpuSwr42XwJCAFN3bWB7I5EnlhTy4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-RKXkyEkzNtus0hIiIiXWnw-1; Tue, 23 Feb 2021 11:03:46 -0500
X-MC-Unique: RKXkyEkzNtus0hIiIiXWnw-1
Received: by mail-wr1-f71.google.com with SMTP id d7so7488606wri.23
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H6gI52FLqNUGPgAAMMiiYEtH8SUBM+MxPOhZvMXUJHo=;
 b=brS+022T6dqoB37KyTFLcxugxtXh3Vs/q0gOtHBhDSz1St/+HQpxtPaPXTx7iwpXdV
 Hidj8K87KDmv1MHM6XTk4jVlt9HTPshsEkdk6hav7uDBbJipXiz2StTNm8QUj/b3/kKf
 vGrwcaUAHDQ4lSEL1cZJkvMYd46RolJj2IclzsM5DxV/OYARjR0GVD7lbYP0Py3cxSsU
 JlLWAwf79JfR2F0et/F7r42D7zwDjbZe7KJMma1l5ftQQ1lUb3ypaOFDTWMuMV1HRMKC
 dY8tux8un9KwvOx3TLejFWRVLc7BmISbiZ4MjhPIfRU/pd5xGkokpju556gewW6jF2w/
 gBKw==
X-Gm-Message-State: AOAM531OLUyr8QhE2uIz1a/6h+q3JFi0JkQPeCRYYy9LKNZRT3YJOTFB
 Brz1nFCQdv+NI1WGvl24HZxwtZ808BdhB5zWho9cz8zM0pyNxkUwPcZ6K1bxnpD3zhNPDUopm54
 O61sSFP/TRAyrXgv2FxlQlK4uzEgWZjy3dWBJ3NwInLJ2DCMDhv/RvruKvSYI
X-Received: by 2002:a1c:a90e:: with SMTP id s14mr25720760wme.36.1614096224788; 
 Tue, 23 Feb 2021 08:03:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ5P44wtRIg0eloWnjU2HvWf0WXB4sCWx21CbX9aeNS6xLcMWudiXSEaeHilHgHxHbTT+hjQ==
X-Received: by 2002:a1c:a90e:: with SMTP id s14mr25720736wme.36.1614096224583; 
 Tue, 23 Feb 2021 08:03:44 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id b7sm8570827wrv.6.2021.02.23.08.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:03:44 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/17] pci: cleanup failover sanity check
Message-ID: <20210223160144.1507082-2-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Commit a1190ab628 has added a "allow_unplug_during_migration = true" at
the end of the main "if" block, so it is not needed to set it anymore
in the previous checking.

Remove it, to have only sub-ifs that check for needed conditions and exit
if one fails.

Fixes: 4f5b6a05a4e7 ("pci: add option for net failover")
Fixes: a1190ab628c0 ("migration: allow unplug during migration for failover devices")
Cc: jfreimann@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210212135250.2738750-2-lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/pci/pci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9ebef8a35..fa97a671d1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2127,10 +2127,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
             pci_qdev_unrealize(DEVICE(pci_dev));
             return;
         }
-        if (!(pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
-            && (PCI_FUNC(pci_dev->devfn) == 0)) {
-            qdev->allow_unplug_during_migration = true;
-        } else {
+        if ((pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
+            || (PCI_FUNC(pci_dev->devfn) != 0)) {
             error_setg(errp, "failover: primary device must be in its own "
                               "PCI slot");
             pci_qdev_unrealize(DEVICE(pci_dev));
-- 
MST


