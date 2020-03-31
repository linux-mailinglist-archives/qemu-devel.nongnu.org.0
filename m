Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82019992D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 17:06:02 +0200 (CEST)
Received: from localhost ([::1]:39748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJISn-0004vT-Sp
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 11:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jJIKZ-0000Qj-GA
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jJIKY-0005Jo-Gb
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:57:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40673
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jJIKY-0005JO-CI
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585666650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EX4DdBDhDDZZyh+2RG837/MZoX3Ur21s6lnBV3Fy1bk=;
 b=gk5nOQCy8lFnt8iYU0yQ2zoypYNjjbMEu41r7yEyjbXH9wLJd9sg4MKoPPSCRus7zXxL+S
 ucvOk+xX6PZCVjBpNCe+N78cyyFkjDSKJmC7SR2NRaPULjPgWVWbtVRWrtyeFCPamvdgb7
 11H3iA9BPTH9YMt0mPwO1/MZna3qN2M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-z-QwqaXvOAyKs_q4CyYspw-1; Tue, 31 Mar 2020 10:57:27 -0400
X-MC-Unique: z-QwqaXvOAyKs_q4CyYspw-1
Received: by mail-wr1-f72.google.com with SMTP id w12so13067875wrl.23
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 07:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T5KbyKMpvzo40XJ5nR1jV2vHhbQADCZ+A9k5qVWlqLE=;
 b=OFdISj1ZsVuo5gGkIWp66b84ZjaC77gpMmV0mrNND0zbeo1M+yTvGJRiEpE3kKRomR
 6JEJwBlsoNkG6JWg5RhMXMPl8yHJcN/8Mk0DKj3zhFREyaLEXueGDFawXAnQBFU7AnxH
 VtNf4D88WpPVNPgMzMEXLob214Pj1b908npOKcz7oZsd5N0T6eSbenzVgihAMqjQCSxo
 /QKoavoBomCsZYcfdBizOhHFAv14Yr2DAkdAnQy0SZMk0r6oUS9EdCYTOEf7MCxzW+/+
 1PzOdq4BaDsb34g4fH8ci8HmDS/HdHmy6WIZTZCeYLcjc5b7Zq3i5KiXljKvotDnUhCq
 OcxQ==
X-Gm-Message-State: ANhLgQ1kLS3xKBrYjolgwEMjQjPXXZTzOrwWjdHe7tWTDwglPBaR7/V0
 ZeskWgKDRWQeLWPRi8om0VAe9HHbOjX6KdnTcmvc8v/iNelJWA4L0wGmNTX40hbQ3wsMkKnpdBN
 g+G0F8l9SMbmTRaM=
X-Received: by 2002:adf:f64f:: with SMTP id x15mr15969489wrp.70.1585666646357; 
 Tue, 31 Mar 2020 07:57:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vve3FdVcmaozi8BMqvtIxs/GY/iMwN6yd7UWbLLIDqFdvXh/4HK7aDwRaE3Yys9zDib6flWZg==
X-Received: by 2002:adf:f64f:: with SMTP id x15mr15969473wrp.70.1585666646212; 
 Tue, 31 Mar 2020 07:57:26 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id d13sm26563832wrv.34.2020.03.31.07.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 07:57:25 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:57:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] vhost-vsock: fix double close() in the realize() error
 path
Message-ID: <20200331145631.135630-11-mst@redhat.com>
References: <20200331145631.135630-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200331145631.135630-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

vhost_dev_cleanup() closes the vhostfd parameter passed to
vhost_dev_init(), so this patch avoids closing it twice in
the vhost_vsock_device_realize() error path.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20200331075910.42529-1-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-vsock.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 9f9093e196..09b6b07f94 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -364,12 +364,16 @@ static void vhost_vsock_device_realize(DeviceState *d=
ev, Error **errp)
=20
 err_vhost_dev:
     vhost_dev_cleanup(&vsock->vhost_dev);
+    /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() *=
/
+    vhostfd =3D -1;
 err_virtio:
     virtio_delete_queue(vsock->recv_vq);
     virtio_delete_queue(vsock->trans_vq);
     virtio_delete_queue(vsock->event_vq);
     virtio_cleanup(vdev);
-    close(vhostfd);
+    if (vhostfd >=3D 0) {
+        close(vhostfd);
+    }
     return;
 }
=20
--=20
MST


