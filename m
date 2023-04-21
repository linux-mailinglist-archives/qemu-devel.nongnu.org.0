Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE26EACED
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:30:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprlX-00078m-17; Fri, 21 Apr 2023 10:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlV-00075L-4c
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:33 -0400
Received: from esa8.hc2706-39.iphmx.com ([216.71.140.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlS-0008Jd-Iv
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:32 -0400
X-IronPort-RemoteIP: 209.85.160.200
X-IronPort-MID: 271878708
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XJDOia78jslKylY+5uHzhwxRtIbFchMFZxGqfqrLsTDasY5as4F+v
 mMbCmvSPa2DM2H1fN1+a4Tk9k1UvZHXmII3Gwdt+StnEysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9C5wRnDRx2lAS2e0c9Xcp3yZ6ZciOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDX4pZkc/HKbitq/0Te5p0G2M80Mi+7vdkoc+dZk
 72hvbToIesg0zaldO41CnG0GAknVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kpGdY61/goOVgQ/
 NcdCxQoYSqqpL25lefTpulE3qzPLeHuNYIb/2h8lHTXV65+B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2MxNFKaO0Un1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYuieiyYIWNKrRmQ+1Krhupr
 Wb6xl7oISFEKIa7wCOc/UiV07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r6BXuQIOlB1u3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMrTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:ctwqL6mTd67zz4cYA31RpAZ55ZLpDfL63DAbv31ZSRFFG/FwWf
 re+MjzsiWE9Ar5PUtLpTnuAtjnfZqxz+8W3WBVB8bYYOCEghrUEGgd1/qa/9SIIUSXnZ8/6U
 4jSdkFNDSZNzhHZK3BkW6F+rgbsby62ZHtr8vli1lWcSFWR5dJ0zpZYzzrbXGehzMrOXP6Lv
 ehDwZ8yQZIAU5nFvhTz0NrPtT+mw==
X-Talos-CUID: 9a23:mF+QxmxLkZKK9ZVS42BhBgULPpsHX2OC9E6OKmS9KkJMR4e8agCfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AzsMCuA8xVJF52NsoKm0bWqeQf9hYvpWlDHw0q4Q?=
 =?us-ascii?q?li5eYbwh5Ii6Stg3iFw=3D=3D?=
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:29:26 -0400
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ef5c322d56so4681691cf.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087366; x=1684679366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8GI8TPnDeU5RXJRb4tASFOks03coGmKLGJ9EfgPTRg=;
 b=nxBEmUWJUQRdCc4RS0r5Ur1KEzA5AGlXQJOEyW8dsAwgXVBD0B78SgwIyZAWsxab9i
 n5zGYcU5bwZ/p/g/SPWDfA+QLe2o+pnCqHzSWu4Ntd4AVl9YM50THG0BXrZlz4QgV8a5
 0mutyTLisYWF0igJ6HrL1aq8jOevl56zVa/D332Lu/KMeKc7EXjWHnQS61Fm27255JC/
 PK9/md8KugGz2osMUr/wArbZItaXJQ/4HCyk3iQgIG9KJejM0v8RJePhWHFizxdA+KRh
 f28RXWHJRhMPkf7WYhrRbKu8/CFsW5IWThVSf6YC7PcotmtFpFCPSmIc/XU5LAiT0q9S
 khlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087366; x=1684679366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G8GI8TPnDeU5RXJRb4tASFOks03coGmKLGJ9EfgPTRg=;
 b=jLCqwiV+f1YGMsf3aH5Jhayqy5lkAPtISYKSBqZNVNXgFHK4tFQUzkHH1eLVJ2bEAD
 074mp4fm8LYAl+63gZYhk4/OfUr9u1lBQtUnfOWnrj5jsrH9okoEF1eFOYHwGRf4HNle
 aMrpw4kKZEXAGZymEKCj8Xk4dLti16hXvTjtt6Tag0OECBAy6T4tP/0C+Nbr30kpqkFw
 38xP3Lbu/RBA11XRvV8M7QL0VXsYAPjfghHiiZn76erCGAOUvx5rahYKtzCgZ1g0rDE3
 DeNzsZBx5FBVSHlxBbVuVtc201ex9WtEVTKZbQhdVB9e63y2MyVV/6l9woTGau/KjkvL
 IrbA==
X-Gm-Message-State: AAQBX9f0kgOJQAXev86kX4glEPsLshC0djwNzgcMSXA48bRwYvPHeY0j
 RkjH/CiADgkkAB4SGgbhOK1qk/lmzpWrt37CU3vAFLtJ5ucBofNBrJ5AqwaiEOuVYhpHBvyzq79
 BapCjCX8IcogRscgDHVKDXNpNqqkQc0HJymsU0tDPws8=
X-Received: by 2002:a05:622a:1041:b0:3ef:3ca6:c77d with SMTP id
 f1-20020a05622a104100b003ef3ca6c77dmr4928620qte.47.1682087365902; 
 Fri, 21 Apr 2023 07:29:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVJws0v8ZMsddn7WwcOAgpvHrpuICM1QC5IZVvw1+ioyapfZ0PQDzwcJZilbgl1pvB/eZ5/w==
X-Received: by 2002:a05:622a:1041:b0:3ef:3ca6:c77d with SMTP id
 f1-20020a05622a104100b003ef3ca6c77dmr4928574qte.47.1682087365660; 
 Fri, 21 Apr 2023 07:29:25 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac8488d000000b003ee4b5a2dd3sm1350911qtq.21.2023.04.21.07.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:29:25 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH v8 7/8] bcm2835_property: disable reentrancy detection for
 iomem
Date: Fri, 21 Apr 2023 10:27:35 -0400
Message-Id: <20230421142736.2817601-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.196; envelope-from=alxndr@bu.edu;
 helo=esa8.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As the code is designed for re-entrant calls from bcm2835_property to
bcm2835_mbox and back into bcm2835_property, mark iomem as
reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/misc/bcm2835_property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 890ae7bae5..de056ea2df 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -382,6 +382,13 @@ static void bcm2835_property_init(Object *obj)
 
     memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
                           TYPE_BCM2835_PROPERTY, 0x10);
+
+    /*
+     * bcm2835_property_ops call into bcm2835_mbox, which in-turn reads from
+     * iomem. As such, mark iomem as re-entracy safe.
+     */
+    s->iomem.disable_reentrancy_guard = true;
+
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
 }
-- 
2.39.0


