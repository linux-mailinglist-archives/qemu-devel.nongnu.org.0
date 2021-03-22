Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2385F3449F7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:58:27 +0100 (CET)
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMwk-0002mP-5l
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjZ-0004bE-RY
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjY-0006s2-5V
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/f4sPKYnR+jmUvWYKdHqcmtAZpHXplnd+zjl3HCMvLg=;
 b=cs9xWEX4e89MunO9a9duD2KHDE+nkMLXKwwssvAJMyk0aAVu6BXs4NromrbiCQbOH3Lv4F
 ZQi2aOiWTf15JTq8dQtqxToTt9ZXPcxQoiah0/1AjKWCrgFiw9ljh1peSBnMN888l194R9
 RNF2tNLgT/TAZyb1c9XubQ2H1/AGHMA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-nPGjR1wcNd2zcwq7iJvyJA-1; Mon, 22 Mar 2021 11:44:44 -0400
X-MC-Unique: nPGjR1wcNd2zcwq7iJvyJA-1
Received: by mail-wm1-f70.google.com with SMTP id r18so14997800wmq.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/f4sPKYnR+jmUvWYKdHqcmtAZpHXplnd+zjl3HCMvLg=;
 b=ST5/MqbEnfBeNzP33k0xAVGGIIBmfoAWER23ayFoJtxEemN6Np6n11NY8sHzawugKw
 C976kbZGRmXyAUYfF+UVSVbkw2tB8k0j9IQu/111CBbXpEd/Kyci81qs/zNM4HZ+wLIV
 rXM0D2Q9N7fjqbiH8CqQLZ4ZACmNwDHtEsb3C9yyG/nOt88X0NkjkzEJyYn/4V04BwRF
 PwJ5vs4j/KCDX+cHFbLrV1EDV2vlXZG+ki4uNWFsydxzveKc2PA/zF6DX/v/vcFSM0f6
 KNUsanVzV1ODaRHZP+StxZ6q23cKjtIvMWBHmz0C3hkj8b1cLO3OGCgrX4NlvhFZVYJ2
 zakg==
X-Gm-Message-State: AOAM530+Y+iDzpq3INuAGTe2pu+ZtrPyc1oKfECE3HhQmaBq973JyO6U
 nobEIpQRkuaRlcGtGpthW1gj29EZPbWrWhkcrZ4shCW24Qi/phGELg9KQEhSd/qIfjawOyII0j+
 vXqc4ff5q6+AhoYwwEG/2S6S5emvb8J5A47L2x5IvTI0ALhJp2Ia9m7l7dVtV
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr192048wrj.248.1616427883324; 
 Mon, 22 Mar 2021 08:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEgBlcu0bEBT0nEZpOrJEn42zHVz5prvVJEKLdZJil0Qp3/Ck4YzgSrCLobqoNJ4bb26FalQ==
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr192026wrj.248.1616427883089; 
 Mon, 22 Mar 2021 08:44:43 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id r4sm2180247wrs.15.2021.03.22.08.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:42 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] vhost-user: Fix double-close on slave_read() error path
Message-ID: <20210322154417.524229-4-mst@redhat.com>
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


