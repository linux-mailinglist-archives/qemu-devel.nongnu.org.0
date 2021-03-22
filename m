Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20623452C9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:09:23 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTfm-0006qk-S5
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWp-0006k2-T4
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWn-00016W-IK
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6vu1+ACkXCKQbE27Tv6eHhaq4c2H7x25sMTUeP1pT0c=;
 b=O6UbKEk11Ol5vBtsB8y3p7ySv7nzk+rjFJSe9aGRieT3fBcDxaNIT99xAGY3iNkCWj0j8k
 bwp4SA/ffwNDXnsD/O9tlvT7xsBBLk8LY9+YhpVNeNANzoA6xVU2oxxIvwB1zkdVxu1Ju2
 Zr34/6TxG9v2n7nMehbzVGY/UnkmDQU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-eI8g3IfcOjG-M7SSBNBweg-1; Mon, 22 Mar 2021 19:00:01 -0400
X-MC-Unique: eI8g3IfcOjG-M7SSBNBweg-1
Received: by mail-wr1-f69.google.com with SMTP id p12so142819wrn.18
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6vu1+ACkXCKQbE27Tv6eHhaq4c2H7x25sMTUeP1pT0c=;
 b=EsbfFtoRSgTct/wD2UjZOfKIpEQcFugmbPBdbh9lRhO098fiqne8J87+eQuxUAgS9f
 6EdT7Fw+nMOWkFdUEPMsfC3YHyuq5udQQG6eHxzrDxIMJ2ZDyKDnL513FuTx/Xp7btZ2
 AH0vXaQany6xLq0tozcR93WcAb8PAodzSZStEXIhJPrmNujeLJA/WuNdQbxSiSZT4lWr
 MXzUm2dmIXlmVxC5VdhL3576UvQjSgTmuJWUWGgcTtdD1gvY3eOMIm3C5GNbcC2v1FE0
 BCeh7qIqky+kFZlZqSRIq59e1if++dSzEg0mZPpbFqL8wMJNWvi94DtdOr6OlDLArRB/
 PyOg==
X-Gm-Message-State: AOAM531Tx7EAiAQhOXhhul1WqXR56PWQnXcgr1Ef+q0qXhNsQvj5GKDN
 O8lMhXLND/YfvN3/2ffqv20yOZPnSowJVXohaS3GAw8kd9dkNPCYIWYUKlGmUIksfUSC4IAs7sp
 Zvb+Il4h4t2H5uFt/E49T5koEZ7B7bll4bKQWqnVs9FqfQ57sG1LiyPY6yPRB
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr795132wrg.167.1616453999806;
 Mon, 22 Mar 2021 15:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHGhLUmWcq/ug6RwdlhBfK2TJItj1VxXC6X+IBM6xzL5bLZUYACwiNcUbflEtVZNV6JSjzfg==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr795120wrg.167.1616453999659;
 Mon, 22 Mar 2021 15:59:59 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id k13sm12079566wri.27.2021.03.22.15.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 15:59:59 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:59:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/19] vhost-user: Drop misleading EAGAIN checks in
 slave_read()
Message-ID: <20210322225907.541943-3-mst@redhat.com>
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

slave_read() checks EAGAIN when reading or writing to the socket
fails. This gives the impression that the slave channel is in
non-blocking mode, which is certainly not the case with the current
code base. And the rest of the code isn't actually ready to cope
with non-blocking I/O.

Just drop the checks everywhere in this function for the sake of
clarity.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312092212.782255-2-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-user.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2fdd5daf74..6af9b43a72 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1420,7 +1420,7 @@ static void slave_read(void *opaque)
 
     do {
         size = recvmsg(u->slave_fd, &msgh, 0);
-    } while (size < 0 && (errno == EINTR || errno == EAGAIN));
+    } while (size < 0 && errno == EINTR);
 
     if (size != VHOST_USER_HDR_SIZE) {
         error_report("Failed to read from slave.");
@@ -1452,7 +1452,7 @@ static void slave_read(void *opaque)
     /* Read payload */
     do {
         size = read(u->slave_fd, &payload, hdr.size);
-    } while (size < 0 && (errno == EINTR || errno == EAGAIN));
+    } while (size < 0 && errno == EINTR);
 
     if (size != hdr.size) {
         error_report("Failed to read payload from slave.");
@@ -1503,7 +1503,7 @@ static void slave_read(void *opaque)
 
         do {
             size = writev(u->slave_fd, iovec, ARRAY_SIZE(iovec));
-        } while (size < 0 && (errno == EINTR || errno == EAGAIN));
+        } while (size < 0 && errno == EINTR);
 
         if (size != VHOST_USER_HDR_SIZE + hdr.size) {
             error_report("Failed to send msg reply to slave.");
-- 
MST


