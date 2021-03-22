Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF143452D2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:11:19 +0100 (CET)
Received: from localhost ([::1]:52858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOThe-00012X-OQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWu-0006nt-5H
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWs-00018g-BP
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OODRMeLBe2YwGT9N6jsblOs6YEuAMEZWHaowpQ1bt8o=;
 b=Jbiv3vhp5DwwWJhbam8sH7q4UJ5B25O6ZnbiQm1pscgx0kCio2iNxXHPnJGlvNKraOCiXw
 OOMRLXJncFBnq5+cUB3dVhbWU0HL/vdGI46Fh3OmH2BYcSv3dd4qIua7B2OUsZEzoR3unP
 1Ow0E5Apk7CDHgixIFopVA8vecm1cDI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-OHcAtKITP9KZCzSX2T1uwg-1; Mon, 22 Mar 2021 19:00:05 -0400
X-MC-Unique: OHcAtKITP9KZCzSX2T1uwg-1
Received: by mail-wr1-f69.google.com with SMTP id h30so149962wrh.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OODRMeLBe2YwGT9N6jsblOs6YEuAMEZWHaowpQ1bt8o=;
 b=S7IQDesU7v8knM3Ty31f9vYEhRWoLjK24EBxNAWtsfmOUMwUp/Rf9FpYEs2aimFJDN
 mqPUSTLAUkO/8vQiFgI5orvMEkEdyUmZZxpnPypoqHvfpFeOrShYXgw8VfzwNRBiHdC4
 X75cMQqV0VB8YHQtMTy4qnhukiUsMxeAYZ8T1RmpmAZkADHPHAhhgU1ngF2TFcm69h79
 ZDxUc4xUtqatV8wxwunz9ad3Ozw51eFPKOFEIHg4Bzvu+MtqmFpyOTAZc4CSx6G/aINQ
 5FDlGe5TD4k1QZGNOQXvbGDoKb+5U+nJiEU22QS9cGXuy3N3kTmzc5m/O/cNi2avPPxs
 k0ZA==
X-Gm-Message-State: AOAM533zX3rXIrGT9tlsCUpS3ALrn8b4BJdYvP/g8PfbcdXNGFHgVORg
 BfrXcACE9IZ0pCZNq3qFCwiqjJXMmzbllY3tqHH+WpG9avIZEwlkem+izBgEoaGCIFrZ/2avTPr
 NynHDaqvou3lImG0WH2Y7099tpfyn9bzYTc62bR83wT08TREhMsXE+6DRydJF
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr766797wri.403.1616454004293; 
 Mon, 22 Mar 2021 16:00:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCxH5YsEPfS2KT/lwooIUGagW1phE4FdvsJoxiNgTUnMhgUe1xEtuOY19lw2Cmt3B0HG8GMA==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr766774wri.403.1616454004032; 
 Mon, 22 Mar 2021 16:00:04 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id c11sm22316286wrm.67.2021.03.22.16.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:03 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/19] vhost-user: Factor out duplicated slave_fd teardown
 code
Message-ID: <20210322225907.541943-5-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312092212.782255-4-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-user.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index acde1d2936..cb0c98f30a 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1392,6 +1392,13 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     return 0;
 }
 
+static void close_slave_channel(struct vhost_user *u)
+{
+    qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
+    close(u->slave_fd);
+    u->slave_fd = -1;
+}
+
 static void slave_read(void *opaque)
 {
     struct vhost_dev *dev = opaque;
@@ -1507,9 +1514,7 @@ static void slave_read(void *opaque)
     goto fdcleanup;
 
 err:
-    qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-    close(u->slave_fd);
-    u->slave_fd = -1;
+    close_slave_channel(u);
 
 fdcleanup:
     for (i = 0; i < fdsize; i++) {
@@ -1560,9 +1565,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
 out:
     close(sv[1]);
     if (ret) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd = -1;
+        close_slave_channel(u);
     }
 
     return ret;
@@ -1915,9 +1918,7 @@ static int vhost_user_backend_cleanup(struct vhost_dev *dev)
         u->postcopy_fd.handler = NULL;
     }
     if (u->slave_fd >= 0) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd = -1;
+        close_slave_channel(u);
     }
     g_free(u->region_rb);
     u->region_rb = NULL;
-- 
MST


