Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5991C2D32BD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:38:17 +0100 (CET)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmioR-0006wO-Tv
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikJ-0004j7-38
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmik5-0004df-85
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1SVHdVGU4Xx3+1TvaSIiSga1fTtl00R2aC0nHg/hx0=;
 b=EA4icgfx0xJPdjCfTzZ9lEbuZ5LZL+68laaGmkfragBroPz9AlFZ6wVdWrZiFCKW4OxQY6
 ce2pFarUothV9KQ89KUkdzqmH8/mY4mA6jiPRy54/3WscBnGRP5aBoo889/GJNTfazvIFN
 Gvq+9cFd9GzJM2Aszn1w00omnsMRB1M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-_IIFLxVUO0uV5r0gq-H4Hw-1; Tue, 08 Dec 2020 14:33:41 -0500
X-MC-Unique: _IIFLxVUO0uV5r0gq-H4Hw-1
Received: by mail-wr1-f72.google.com with SMTP id o4so2929857wrw.19
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T1SVHdVGU4Xx3+1TvaSIiSga1fTtl00R2aC0nHg/hx0=;
 b=RKCbN/oaIIgFFXaKXsOoqIp+ihVI0kZJBCudlnIL8Qk4ObOgms3fUJmKSPB0SYDM8O
 5CEC6qhScJ2z2gAPhSvBu8T3TP8R0C2GOEFvtXmokMdoV88p5VXxynR+CvhF89Q3CbOE
 7LKcqiB+78PP6Y7wP3HHkzkmJ5xGO7AlbR2aLhqWnIZyIaNTV3yNNAMwwjPyoveQ8+AW
 iqZ/+dF2+LVdFRF6SMXW/5meNq2Ckaui+TpY0JjTedKffJuN1use3LTREPhYmmzMJDUA
 XTB7aI1E96S8z/4xR4tDO5D69Emz2x5ZhR+EyXyAECKW2x6J5AHWYDKWZw0+QFpH0I1M
 DKlw==
X-Gm-Message-State: AOAM532ZfcbCp3+E4Cs3ZOFKQgouw346agkzk5m0mKvdAWdGNRiIvzRf
 bSt0esmyjJIjr+FhTZ5JdM0NRvAGaSpyDHhyO6TI/3FGn6m36u6gBqHVeuCjvZoA/ECntjqP2Cr
 JINQL5OLCErJbqDhf6Kh66vnUm1YW18C/S322Wuex49q/jh7zou9u/t4JRj+3
X-Received: by 2002:adf:d081:: with SMTP id y1mr8279507wrh.388.1607456020396; 
 Tue, 08 Dec 2020 11:33:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSQYdFCqZPwsZr6YeQAnX3j/tZT3HV8RNkEbnC+8Nvk8+WVcopWgYRO2MgyomHUxo6zTYznw==
X-Received: by 2002:adf:d081:: with SMTP id y1mr8279485wrh.388.1607456020220; 
 Tue, 08 Dec 2020 11:33:40 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id y2sm21154456wrn.31.2020.12.08.11.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:33:39 -0800 (PST)
Date: Tue, 8 Dec 2020 14:33:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/66] vhost-user-scsi: Fix memleaks in vus_proc_req()
Message-ID: <20201208193307.646726-2-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


