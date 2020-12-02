Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A172CBB4F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:14:07 +0100 (CET)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQ5G-0004Fj-Hj
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPup-0002jW-4G
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPuk-0002nw-8R
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606906993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1SVHdVGU4Xx3+1TvaSIiSga1fTtl00R2aC0nHg/hx0=;
 b=LvxsX3QwLEAO1Y1LEWJA5qFWFP9f8nmxvz7Zq+gPPz64G1QLv1u7jieL0olHdVdviK4H8X
 RIZvDuk9NhcioX7N3Uagd30Ekjilt0LPd4AduIVyxU97LKcGhPYoWhUNysSt5BLEESLhYw
 sM/IrCcJsB+LcBvB9EMlEMmQduL40GM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-jjPLdasmMC2PFHJ65n6Ibw-1; Wed, 02 Dec 2020 06:03:11 -0500
X-MC-Unique: jjPLdasmMC2PFHJ65n6Ibw-1
Received: by mail-wm1-f69.google.com with SMTP id l5so3182787wmi.4
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T1SVHdVGU4Xx3+1TvaSIiSga1fTtl00R2aC0nHg/hx0=;
 b=SPoy+WbXWeNaKcfa8UEnQq/6qqcgRNjBfPU3Qa1jR606/SeYsXlqrOX5TBzCIC4lD2
 ruhswf0xPfdWeSPBinh6xZILMqFQ2GhEP74n9xNGILbNA+Ll05Ktx3dr3vdwYA29BwjL
 OdX9iSusmkf3wdRR9jtlxco/WS+cInGmIlI1RJsYXl4kyCsUoB64wRRQlESwpJ8epAs6
 XPzL9wJ5OlIcY5SU6Pf1T1pzHEVpcNhAApDAatv2mac1c88mzX3SGMesLBElwq7lTPqS
 +WHFx+fM1wN8bjwc+4GxJ6vqcmO95onbcXMFy1O5qengpuSCmcAMBkUX5IzZ1dP4v8UH
 0n0w==
X-Gm-Message-State: AOAM532rSZ1Bly0tZKtv+XqNzJCbhN9rV0LkQ6tzSowKZfiNINLaYUpV
 K2jPrbFYZUTalznPHamOdelL1UWITmGhEDNSxxniMUUt8bvRfcNkLQuPLSp7WyqtNHLmN5P/L8n
 zzVsJF6YsXx2T/52kiSz/K6BN8eGH61il/YdNGlS2c1ef//PBWzlmPE2o/W9y
X-Received: by 2002:a5d:400a:: with SMTP id n10mr2740287wrp.362.1606906989974; 
 Wed, 02 Dec 2020 03:03:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwM1z1dgh+dLJXeEZ3uAJzJ7f1uLIJ6jwlmKCcwtvRy3KunnXnDdNHHcVL81frRvtIHDcNuyA==
X-Received: by 2002:a5d:400a:: with SMTP id n10mr2740259wrp.362.1606906989746; 
 Wed, 02 Dec 2020 03:03:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c1sm1554105wml.8.2020.12.02.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:03:09 -0800 (PST)
Date: Wed, 2 Dec 2020 06:03:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] vhost-user-scsi: Fix memleaks in vus_proc_req()
Message-ID: <20201202101655.122214-2-mst@redhat.com>
References: <20201202101655.122214-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202101655.122214-1-mst@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex Chen <alex.chen@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

The 'elem' is allocated memory in vu_queue_pop(), and its memory should be
freed in all error branches after vu_queue_pop().
In addition, in order to free the 'elem' memory outside of while(1) loop, move
the definition of 'elem' to the beginning of vus_proc_req().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20201125013055.34147-1-alex.chen@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 0f9ba4b2a2..4639440a70 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -232,6 +232,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
     VugDev *gdev;
     VusDev *vdev_scsi;
     VuVirtq *vq;
+    VuVirtqElement *elem = NULL;
 
     assert(vu_dev);
 
@@ -248,7 +249,6 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
     g_debug("Got kicked on vq[%d]@%p", idx, vq);
 
     while (1) {
-        VuVirtqElement *elem;
         VirtIOSCSICmdReq *req;
         VirtIOSCSICmdResp *rsp;
 
@@ -288,6 +288,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
 
         free(elem);
     }
+    free(elem);
 }
 
 static void vus_queue_set_started(VuDev *vu_dev, int idx, bool started)
-- 
MST


