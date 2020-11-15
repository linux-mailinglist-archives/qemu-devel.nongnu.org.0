Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10D2B39F3
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:42:07 +0100 (CET)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQik-0004eC-JV
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQY7-00059X-Ub
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQY5-00022d-5n
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTDyF8qZ/+kyOvEMv/zkAMXekpV6mWj/zaDDozu+j7g=;
 b=izupUJ0eVDgfSzTz6WNKbsOYMuJI7uFzhBFOkRrUlCeIZiGjzR8shND9KfPA8rlNxqsjoe
 rG0PvnNYg/lrmu/qPp/njFjQaM+x8S5lxxSbfVCTXS2osuaqq/qo2HWfuUwcsb7i+Su2ZH
 PfS34mKqnkI0+wVCC3BGzW9QSUK+jSE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-ulJksqMvOI6qhboLzqSv0A-1; Sun, 15 Nov 2020 17:28:00 -0500
X-MC-Unique: ulJksqMvOI6qhboLzqSv0A-1
Received: by mail-wm1-f71.google.com with SMTP id u123so7774768wmu.5
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:28:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eTDyF8qZ/+kyOvEMv/zkAMXekpV6mWj/zaDDozu+j7g=;
 b=Bok6WUOL54xNeABaM029s9940ydSXOLOgEAQx1PypLG9JavKTHlbPYTZ37SdTRUs8I
 gunwOCNznQ8BFQdBZnG7cMtiZ7GrZtAHUs3LoVNXem97EcXDtJeREQs4B2TVGpMezgjX
 ASoi9yOB+OrgzcF4XRRjMZJT3P5CgWbIgKTez0kzT3OBGdkhTXPR7iuT29o33qmBeeSs
 z3rh/Mspg0Rq6ghTsKzNUEHnnXvq4fG5VycnorKpOTITn0PL08T3HeqxGApcKpUuQIOg
 rHzM+iTdWRbIM6g5uLL1BMQDpxuzcEIuxRxnJBlI7r8Z8bCP24LrT/KK1w3yLCVDicEE
 tH8Q==
X-Gm-Message-State: AOAM532f/IOGakrlQSyHUuXFe4SeDWu1EPepb9mOeY6qYkb7ieoRxyzK
 hqSms2NCkszx9AJMqsw1FDhypX2gcDON4u5Pq8R4MwsyacZc4qGfvKrTu61c2wk/9Vk02gDuvsB
 ZJEnrrf1WfalGD4aGBNVdOZVet+MIuH/hLmJ3llI3CxfVxzovGP3BZVKcIGtq
X-Received: by 2002:adf:f906:: with SMTP id b6mr15874155wrr.244.1605479278715; 
 Sun, 15 Nov 2020 14:27:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHBgrC1JX1YB6mBve5qxMgW1rryENpjvFcfCa5Ef0WRz5jjZZPEmw5NtVaPaUD72Z8VrSoGg==
X-Received: by 2002:adf:f906:: with SMTP id b6mr15874140wrr.244.1605479278531; 
 Sun, 15 Nov 2020 14:27:58 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id i11sm20553636wro.85.2020.11.15.14.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:57 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] vhost-user-blk/scsi: Fix broken error handling for
 socket call
Message-ID: <20201115220740.488850-18-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 17:27:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: AlexChen <alex.chen@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

When socket() fails, it returns -1, 0 is the normal return value and should not return error.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
Message-Id: <5F9A5B48.9030509@huawei.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c   | 2 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index caad88637e..dc981bf945 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -476,7 +476,7 @@ static int unix_sock_new(char *unix_fn)
     assert(unix_fn);
 
     sock = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (sock <= 0) {
+    if (sock < 0) {
         perror("socket");
         return -1;
     }
diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 3c912384e9..0f9ba4b2a2 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -320,7 +320,7 @@ static int unix_sock_new(char *unix_fn)
     assert(unix_fn);
 
     sock = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (sock <= 0) {
+    if (sock < 0) {
         perror("socket");
         return -1;
     }
-- 
MST


