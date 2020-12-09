Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659D2D48DA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:24:42 +0100 (CET)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn48n-00075I-8X
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rL-0000uq-KF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rH-0007Yj-LQ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1SVHdVGU4Xx3+1TvaSIiSga1fTtl00R2aC0nHg/hx0=;
 b=Nj/aqltYduTruQ6lcgFvRWCSHN0eE8APJTnJfR9e+uyqCqGyafU3abRCizL95Xndihkfwp
 kg53LRrKjbn/R27E9e0ycTciEXZF9VVMZHm69W82g8qyds5UVaYKIMnmtLMbycj15z0O5x
 rxVnF8ZJYAequMwfImQUxR95SF2J4eY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-zMiQaJFbM7uZkiwH3p9PMQ-1; Wed, 09 Dec 2020 13:06:32 -0500
X-MC-Unique: zMiQaJFbM7uZkiwH3p9PMQ-1
Received: by mail-wm1-f72.google.com with SMTP id z12so861877wmf.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T1SVHdVGU4Xx3+1TvaSIiSga1fTtl00R2aC0nHg/hx0=;
 b=M31AhrauhwLsRBsM9gF47djHEL1IZpOMJ7urBK5126vZrKbevgDmwK+kPbrpXsGfaV
 tihN9U8EBKdhDlf0SaAoRbDVVOId//feDIdu8Vv1ZuzmMolMk60nE7Q40/oeroLgHMNd
 LrQzI2t0RVb93pQb+iH1RiIpYgf45Rtn7D0rrt8/VQv5aL7C9lK53lvmw32J9wt3Qh5w
 VQvMNovaTD6MMMd3QIzEU5DnH/HdOwkrKBvk3OiqkPvAvLMV4gXH2k2swzeXWZiQ+ZcG
 NymRrb9Cp5LRjmbOIE8ldnYSeQcdtGvmO7Ipbrc45GFhy+SMV8LWsSwStocDDZvs8rnk
 cVHw==
X-Gm-Message-State: AOAM5330FXtkL//eGMkSC1yY1qvum77mJCiRAKLUhJxPq+Aw6YW7ZGP3
 bgRPVbHc0I4LATqWouf+VstR6MSiMUaZAvnSJnpV0ikOBdQsyf5vlpyh35yzg5c+ydi61+Y5P9A
 FNAwTTqGWIZVdE8gsgti/JOGQRMCpfu6NVoMAg6ZYiPMl1L52BAG+48JKkQWS
X-Received: by 2002:a1c:99d7:: with SMTP id b206mr4161234wme.12.1607537190273; 
 Wed, 09 Dec 2020 10:06:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCKBCd+1WdpIIopC75eEUD5aonFDjfWW9CBf8TKxUM74k6apxUQHSH8IB+kaSpLSp9YvizvA==
X-Received: by 2002:a1c:99d7:: with SMTP id b206mr4161213wme.12.1607537190045; 
 Wed, 09 Dec 2020 10:06:30 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a65sm4292369wmc.35.2020.12.09.10.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:06:29 -0800 (PST)
Date: Wed, 9 Dec 2020 13:06:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/65] vhost-user-scsi: Fix memleaks in vus_proc_req()
Message-ID: <20201209180546.721296-2-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


