Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2390344A42
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:04:19 +0100 (CET)
Received: from localhost ([::1]:50504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lON2Q-0000bH-NC
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjj-0004w7-4h
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjh-0006yG-B9
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nQQq4fHiGykQygfi1oKmBz5Z/Rv0I+HheOSqIDO6h3I=;
 b=ZbiJW1VLFUcdh7/5XXbqOLza5sNWZvJfx/XywssB7oKcQsAnriPWbG4Hkmo0eolqUO2jJK
 BS9q3AW52t6czDQFoNO/5lnM8PfAL00qiaGUh7JRMX1PHQkz2bHpmSCYx5Skif74wFCj4g
 w6cbfxGM/GIz8HwvNBozZMq6ZhdGhPs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-U9WV5r_0OKiaGRzc2hExCA-1; Mon, 22 Mar 2021 11:44:53 -0400
X-MC-Unique: U9WV5r_0OKiaGRzc2hExCA-1
Received: by mail-wr1-f71.google.com with SMTP id 75so26114296wrl.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nQQq4fHiGykQygfi1oKmBz5Z/Rv0I+HheOSqIDO6h3I=;
 b=d3KZGF6uAARxErol/EvdE/mzDchJ3OPQQ0nCaSJyb64tFGE1/KI1y1mScHc+Cx4O3t
 QBqC/39DKD+RNpPDIZsqWY3EqBTP6DbH12Oauwj8+Y/iQ4ATMV9OviyU4Tko4Jw3VDCc
 IvsdWC07JAOJJ4FZLS0eW3DtTl5QjoAUtmAkYSybAbDTDS0ofx4ME2/X25J+jUt1Nf8Z
 66Fg3gdaFMOuPvBjJT/jgBaia+O4RtFD4mUpNHRyOB5KpDa7soVpEi+NoeTqDHDhvOAQ
 JWepbLTVavYlyMs8IbpZWNqNvseaUXrzX0yqvmq8SCzlpqdvzSljj4pMj+t8zcWE3Mjx
 jZgQ==
X-Gm-Message-State: AOAM531UWNApLT4ELnESt3dYx3oBGUQiMPZ5ciNJ0iMQA7iNIhg0vzWC
 UfbHSc/00CPczTxf9iL4P+4snnHZWaoZNGBjLPtmx8+RaPGz80S8IBthfDDE23mTUTS0jTCix1L
 wk23zLJSB0/p3sjT/ODeog9i1+jKz8pDnUFG4nkLvoVhNOrKxXb8JTLtIdRNQ
X-Received: by 2002:a5d:4523:: with SMTP id j3mr185297wra.288.1616427892054;
 Mon, 22 Mar 2021 08:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5u8bm475fiwy41kgWHmCfGfH9t9RWxTe2NJ5j/GQ1TUEtU8wdGr2I/NAwTQTFQdp6mzQx9w==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr185277wra.288.1616427891818;
 Mon, 22 Mar 2021 08:44:51 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id p18sm19827303wrs.68.2021.03.22.08.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:51 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] vhost-user: Monitor slave channel in vhost_user_read()
Message-ID: <20210322154417.524229-8-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Now that everything is in place, have the nested event loop to monitor
the slave channel. The source in the main event loop is destroyed and
recreated to ensure any pending even for the slave channel that was
previously detected is purged. This guarantees that the main loop
wont invoke slave_read() based on an event that was already handled
by the nested loop.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312092212.782255-7-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-user.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 00256fa318..ded0c10453 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -345,6 +345,35 @@ end:
     return G_SOURCE_REMOVE;
 }
 
+static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
+                           gpointer opaque);
+
+/*
+ * This updates the read handler to use a new event loop context.
+ * Event sources are removed from the previous context : this ensures
+ * that events detected in the previous context are purged. They will
+ * be re-detected and processed in the new context.
+ */
+static void slave_update_read_handler(struct vhost_dev *dev,
+                                      GMainContext *ctxt)
+{
+    struct vhost_user *u = dev->opaque;
+
+    if (!u->slave_ioc) {
+        return;
+    }
+
+    if (u->slave_src) {
+        g_source_destroy(u->slave_src);
+        g_source_unref(u->slave_src);
+    }
+
+    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
+                                                G_IO_IN | G_IO_HUP,
+                                                slave_read, dev, NULL,
+                                                ctxt);
+}
+
 static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 {
     struct vhost_user *u = dev->opaque;
@@ -366,6 +395,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
      * be prepared for re-entrancy. So we create a new one and switch chr
      * to use it.
      */
+    slave_update_read_handler(dev, ctxt);
     qemu_chr_be_update_read_handlers(chr->chr, ctxt);
     qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &data);
 
@@ -377,6 +407,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
      * context that have been processed by the nested loop are purged.
      */
     qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
+    slave_update_read_handler(dev, NULL);
 
     g_main_loop_unref(loop);
     g_main_context_unref(ctxt);
@@ -1580,9 +1611,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
         return -1;
     }
     u->slave_ioc = ioc;
-    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
-                                                G_IO_IN | G_IO_HUP,
-                                                slave_read, dev, NULL, NULL);
+    slave_update_read_handler(dev, NULL);
 
     if (reply_supported) {
         msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
-- 
MST


