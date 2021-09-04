Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11264400D3A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:53:14 +0200 (CEST)
Received: from localhost ([::1]:36992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdb7-0003vK-5S
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLv-000789-Lz
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLt-0001gs-2j
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DfR+OS/tguqo24I2t3557CNvlcUjLWWgLMMyFe3f2DA=;
 b=OUjLVgNcv4I6oGzFljMm5UL2gbeOKqHZXURhyUaJGhb9qTpPYHeStj/HM4NH8W5uFrHfcN
 unrPvNpWHRR5dWzKhXYOpNtD1cjcCn7LY/ksRveWXgmHBKU/Q5DMiPzfsTbChS6F9YgaPs
 Zl85hxCbWne6Aj3U6olJjvMdCje/FtM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-AqVAdjyQMVmtF9B24AH8iA-1; Sat, 04 Sep 2021 17:37:27 -0400
X-MC-Unique: AqVAdjyQMVmtF9B24AH8iA-1
Received: by mail-ed1-f71.google.com with SMTP id
 o11-20020a056402038b00b003c9e6fd522bso1356607edv.19
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DfR+OS/tguqo24I2t3557CNvlcUjLWWgLMMyFe3f2DA=;
 b=FaLDX5Y5i04vivGN3ouVFl6YA7Eh6aA5Pq66RhiJNz6SDCoOeceWi0kMDs7BWPP47G
 bwcQ0rS9lbKWpRpG4oSCmaXguKIhpP7VPAB4RP/ZSHFWSUOrYYbLOlyNceZ1Yk/i/OmB
 DSq8Rgb36NjnqK0S22aEMFgJHD919e5FdrxsQxJNdz/toVXB4YzzbVbEcBkWu/eOmhcc
 fVmP54rnEk8BoVWu4IoL/mQS39TYcNm51lSqW8uV3ueW2+2CTjSEk4VKbhHlpANQkYIa
 m54Ft6eXVDl6GrVS0oSZtt32T2Zy0ZW37LHkubRRHhrI1mbiaKL8OIIbNEDD8G3R7jdt
 uhHw==
X-Gm-Message-State: AOAM533TOCyjXlTL8wA1E5dPulX83xNBYshguJCyYvFWY8MYDoi5eMmH
 foaq6mfE02XBl56tjqh1NlEcU+nFW0nF/YP3sYY6cCW1sLwjSJwOyRd5EQvDpgfXRrbm1e9rhpQ
 Xika2PpTeqBt2Uksp2qnFs3t/fOO0fzwugJY+dC8hHWH/Xkd1HdkTY4dDi2Gy
X-Received: by 2002:a17:906:680a:: with SMTP id
 k10mr5978908ejr.298.1630791445742; 
 Sat, 04 Sep 2021 14:37:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwessc/3wByNsrSQ7BTVzg6qkW58e43/dxwiVDVhMwVQEPG4y7+A/1EdDGIzjKqtSZNRN+L9g==
X-Received: by 2002:a17:906:680a:: with SMTP id
 k10mr5978889ejr.298.1630791445524; 
 Sat, 04 Sep 2021 14:37:25 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id q6sm1521890ejm.106.2021.09.04.14.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:25 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/35] vhost_net: do not assume nvqs is always 2
Message-ID: <20210904213506.486886-30-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch switches to initialize dev.nvqs from the VhostNetOptions
instead of assuming it was 2. This is useful for implementing control
virtqueue support which will be a single vhost_net structure with a
single cvq.

Note that nvqs is still set to 2 for all users and this patch does not
change functionality.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-6-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h | 1 +
 hw/net/vhost_net.c      | 2 +-
 net/tap.c               | 1 +
 net/vhost-user.c        | 1 +
 net/vhost-vdpa.c        | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 172b0051d8..fba40cf695 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -14,6 +14,7 @@ typedef struct VhostNetOptions {
     VhostBackendType backend_type;
     NetClientState *net_backend;
     uint32_t busyloop_timeout;
+    unsigned int nvqs;
     void *opaque;
 } VhostNetOptions;
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 6ed0c39836..386ec2eaa2 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -165,9 +165,9 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
         goto fail;
     }
     net->nc = options->net_backend;
+    net->dev.nvqs = options->nvqs;
 
     net->dev.max_queues = 1;
-    net->dev.nvqs = 2;
     net->dev.vqs = net->vqs;
 
     if (backend_kernel) {
diff --git a/net/tap.c b/net/tap.c
index f5686bbf77..f716be3e3f 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -749,6 +749,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             qemu_set_nonblock(vhostfd);
         }
         options.opaque = (void *)(uintptr_t)vhostfd;
+        options.nvqs = 2;
 
         s->vhost_net = vhost_net_init(&options);
         if (!s->vhost_net) {
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 6adfcd623a..4a939124d2 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -85,6 +85,7 @@ static int vhost_user_start(int queues, NetClientState *ncs[],
         options.net_backend = ncs[i];
         options.opaque      = be;
         options.busyloop_timeout = 0;
+        options.nvqs = 2;
         net = vhost_net_init(&options);
         if (!net) {
             error_report("failed to init vhost_net for queue %d", i);
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 72829884d7..395117debd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -104,6 +104,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     options.net_backend = ncs;
     options.opaque      = be;
     options.busyloop_timeout = 0;
+    options.nvqs = 2;
 
     net = vhost_net_init(&options);
     if (!net) {
-- 
MST


