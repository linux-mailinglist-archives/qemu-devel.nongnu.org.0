Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E165E7E3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMI-00036A-5W; Thu, 05 Jan 2023 04:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLv-0002or-SN
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLu-0007QK-Cs
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66nQmgCzgyTcX+lgKs/BtGyYgun47XDZ8ZsgQt4qE64=;
 b=diNbE4gxyl+DUrn/dENGaBNKfSNhoHtb8JHau0NIbtaC8AchLUoBBvGkAv4auuNLhIBOXQ
 5lHbTEZFcwzzD8xTkPVE9ardcG+cTwm1xKBfJvzj021bNrnJFpS4gEoh+MvrtrlQs7byiS
 qHe7ZFVRWLjm9SZYt4LafN6jxoJziJk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-8CkOSClKMWinvn9muVQExw-1; Thu, 05 Jan 2023 04:15:56 -0500
X-MC-Unique: 8CkOSClKMWinvn9muVQExw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s3-20020adf9783000000b002ab389f64c1so532781wrb.22
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=66nQmgCzgyTcX+lgKs/BtGyYgun47XDZ8ZsgQt4qE64=;
 b=dgcXWrtdNYQ5lxKd3pEr/GmvA2xoY6qsVkUlhPS7ly1E1VUmNG328DYl5LV23bhysd
 2f/wgcG2OKS5i2MyBYJDZ4NrFFPvLh8LXrP+4CQioLzPv1XU/hGMuUWCo9tZPRSHB1KC
 AXEiFVo6z16jM5Ezo2gATIt0goggFKXchNJ26wSTFaCGjbqz46+E2ZctQdCVCCpqPz/B
 a2Ayt8rYUu/nQwpvITpIFV+jJKjKR47tVHeyiv1U04mVOcXqwzVX+LbVuaH4B6g/RB3q
 m1yTPSJd92mKX8+ionDvuP8qhegkJjDrKQCfjmqWDjOT6S0QxFCSggb3ScKpzejFj+c0
 +ojg==
X-Gm-Message-State: AFqh2koC24fw3Lv0Cukx9dq4rTwc2GgGlgAw0lf+8nQMv8ICn/oIcZb4
 VzEe0pg4JF7z2ygbSFaL0ycRTXrqVxCZ+pPd3objNcDR77Pq1MWqSmephfIyeLtqcTsU2Rtw6eH
 DOmKjSRDhqrGxv7m7PGhPlwamhY/aJ3ZBQ1J3J68QKeQiBxWYry13OLrptdWD
X-Received: by 2002:a05:600c:1503:b0:3d0:8722:a145 with SMTP id
 b3-20020a05600c150300b003d08722a145mr34673992wmg.40.1672910155300; 
 Thu, 05 Jan 2023 01:15:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6ZFhoks+vR3dYRJEbrZWGmOWleJoI1flL0jso8gxb1JgWMrCQtcfm0KW7VtCWxT3DISIyhQ==
X-Received: by 2002:a05:600c:1503:b0:3d0:8722:a145 with SMTP id
 b3-20020a05600c150300b003d08722a145mr34673977wmg.40.1672910154991; 
 Thu, 05 Jan 2023 01:15:54 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003cf5ec79bf9sm1744568wmb.40.2023.01.05.01.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:54 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 30/51] include/hw/pci: Clean up a few things checkpatch.pl
 would flag
Message-ID: <20230105091310.263867-31-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

Fix a few style violations so that checkpatch.pl won't complain when I
move this code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221222100330.380143-5-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 954f260f84..5ca2a9df58 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -284,8 +284,10 @@ struct PCIDevice {
     /* PCI config space */
     uint8_t *config;
 
-    /* Used to enable config checks on load. Note that writable bits are
-     * never checked even if set in cmask. */
+    /*
+     * Used to enable config checks on load. Note that writable bits are
+     * never checked even if set in cmask.
+     */
     uint8_t *cmask;
 
     /* Used to implement R/W bytes */
@@ -299,10 +301,11 @@ struct PCIDevice {
 
     /* the following fields are read only */
     int32_t devfn;
-    /* Cached device to fetch requester ID from, to avoid the PCI
-     * tree walking every time we invoke PCI request (e.g.,
-     * MSI). For conventional PCI root complex, this field is
-     * meaningless. */
+    /*
+     * Cached device to fetch requester ID from, to avoid the PCI tree
+     * walking every time we invoke PCI request (e.g., MSI). For
+     * conventional PCI root complex, this field is meaningless.
+     */
     PCIReqIDCache requester_id_cache;
     char name[64];
     PCIIORegion io_regions[PCI_NUM_REGIONS];
@@ -943,7 +946,7 @@ extern const VMStateDescription vmstate_pci_device;
     .name       = (stringify(_field)),                               \
     .size       = sizeof(PCIDevice),                                 \
     .vmsd       = &vmstate_pci_device,                               \
-    .flags      = VMS_STRUCT|VMS_POINTER,                            \
+    .flags      = VMS_STRUCT | VMS_POINTER,                          \
     .offset     = vmstate_offset_pointer(_state, _field, PCIDevice), \
 }
 
-- 
MST


