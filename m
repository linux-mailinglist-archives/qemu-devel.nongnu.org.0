Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5987A3452B5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:03:01 +0100 (CET)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTZc-0000BH-E0
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWs-0006lU-Ed
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWp-00017Y-I2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/f4sPKYnR+jmUvWYKdHqcmtAZpHXplnd+zjl3HCMvLg=;
 b=I2+q6aLW+zNgO2xsTJ/NVQyBEkjf2Btv+kNYJvT7xHeVVXxmXStGWNc1rFBlQED+mp5Pzk
 miLr02+h5umrCR9jLUoGujnfJbe7WtsWJH4Z959F46iDHPLe40zKhPkB1msXVKpdhKqQXq
 0udshFxgs9aG0r6cu6K4w43vRP72UJc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-YfDodTdgMnWVeQhoQ8rS1Q-1; Mon, 22 Mar 2021 19:00:03 -0400
X-MC-Unique: YfDodTdgMnWVeQhoQ8rS1Q-1
Received: by mail-wr1-f71.google.com with SMTP id p15so146506wre.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/f4sPKYnR+jmUvWYKdHqcmtAZpHXplnd+zjl3HCMvLg=;
 b=Gxr3UcFx2tBoNvYg/vWmCJ6+ed2sBgrANtp9oPtC+lsfbSNPPPAj5h9jyen21VXHO8
 tc9n6grlnQpJ/InSK+uVDBfkrTvD09OAO3c4DuT4l+be4VCI/4kU3LR8NiIjdfdps86u
 pelnUx1M+GlYOTMr6x2fb8RJvbTTGcqrAJjH4qK5Nhuffqz/DEnsoetEk2r60pWlP9f5
 pQe0zIkzHX8YtgpRXOjIHOBSHsSZNt1t9i1+pNi7Gkf+yN8JKuXsDVNXKDMePnj9Kgcu
 yOgkD3p3b2bdQV5tTHfKjw4XBzKWRD4+x62koOm//sxlKUULgfRlhAsxrV9+qHmaQreo
 yTYQ==
X-Gm-Message-State: AOAM531GbVuvm6hoqJa7/GjSHDIIQqhuHRwCr8mpD/O0UwStc+Gaz4oG
 JyLhC5ErqUPwz1w5U+N67JFdP8lUiOijSkl05rLvg6J3YSedqeu4SoUE3Kajbafe8tjvd9maPRm
 2oWVMrBlFBR1PRwv4NlxV7YA2fUC5qk0TcUuCMUwuS5fZ0hjFc4Kgby+Hg7aK
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr576750wmj.185.1616454002138; 
 Mon, 22 Mar 2021 16:00:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmq1n8eU3OQbtAvF31rAUHxo0tI01XhCZNqi3wPGpKsw51axNjjvITZjuOUB1tVfwF9hA2QQ==
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr576729wmj.185.1616454001846; 
 Mon, 22 Mar 2021 16:00:01 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id i3sm22429110wra.66.2021.03.22.16.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:01 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:59:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/19] vhost-user: Fix double-close on slave_read() error
 path
Message-ID: <20210322225907.541943-4-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Some message types, e.g. VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
can convey file descriptors. These must be closed before returning
from slave_read() to avoid being leaked. This can currently be done
in two different places:

[1] just after the request has been processed

[2] on the error path, under the goto label err:

These path are supposed to be mutually exclusive but they are not
actually. If the VHOST_USER_NEED_REPLY_MASK flag was passed and the
sending of the reply fails, both [1] and [2] are performed with the
same descriptor values. This can potentially cause subtle bugs if one
of the descriptor was recycled by some other thread in the meantime.

This code duplication complicates rollback for no real good benefit.
Do the closing in a unique place, under a new fdcleanup: goto label
at the end of the function.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312092212.782255-3-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-user.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6af9b43a72..acde1d2936 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1475,13 +1475,6 @@ static void slave_read(void *opaque)
         ret = -EINVAL;
     }
 
-    /* Close the remaining file descriptors. */
-    for (i = 0; i < fdsize; i++) {
-        if (fd[i] != -1) {
-            close(fd[i]);
-        }
-    }
-
     /*
      * REPLY_ACK feature handling. Other reply types has to be managed
      * directly in their request handlers.
@@ -1511,12 +1504,14 @@ static void slave_read(void *opaque)
         }
     }
 
-    return;
+    goto fdcleanup;
 
 err:
     qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
     close(u->slave_fd);
     u->slave_fd = -1;
+
+fdcleanup:
     for (i = 0; i < fdsize; i++) {
         if (fd[i] != -1) {
             close(fd[i]);
-- 
MST


