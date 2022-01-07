Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF74876BF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:48:06 +0100 (CET)
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nj3-0005WE-V9
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n47-0001fA-Ne
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n45-0002aA-SG
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sZKl68SrJVJX9J/g8uBNG773VeE63EY7yyNvoTLPOxc=;
 b=RQ2GtZXLWwmw69kSvw+uOO1/akzPuLnoir8K+iBI94ayKqZQXolN9yOYcX71C64jJAs/SR
 sozDFvTc2fbuxcuGzWbCsA0kBe9OjDM6q6LUEtPAzNGMr+xQhpv9296GJlgdUn98L1sje4
 t+JiEecFe+K4cl7+XRfOvnivxuxfaLs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-HC097CGQMDi2BKE3-8Hz6w-1; Fri, 07 Jan 2022 06:05:44 -0500
X-MC-Unique: HC097CGQMDi2BKE3-8Hz6w-1
Received: by mail-wr1-f72.google.com with SMTP id
 q2-20020adfab02000000b001a3ed59eb96so2100537wrc.20
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sZKl68SrJVJX9J/g8uBNG773VeE63EY7yyNvoTLPOxc=;
 b=etWDQxXBMKl60VUFRo3bQhy6EES+CK2HeiMIlAm6ON0nw45cepEbYBDCz/arYDEL7y
 1K95BvGB/oxysIjkY3Ckuthl5U31MxTZEfECVOC6X5MSw9v7YyHLfVR18eWY5WH+Lssi
 bXo5Q2fwkK9ggcRiYS+sXc9rgqreu0xk4CTgPWc9bkDkbpcsVYYv0j13pfZYSezqe+vJ
 jACCl1lu2ma/V7j7YdIHnql5wXlbhgfy9Ec58IoSTjv/LOUPOuXX1u2ap/U/LTrWEO3h
 Ko3o1NcebjAcgVMYu9OKOpiGo7O9foBBZqs0LYemd2wS3yBEtSKVKArJb0Hh6yUCNKzP
 e2vQ==
X-Gm-Message-State: AOAM532+vaKZ9HRwkqy/YN0UlxyT8zrSP8V+PbFNeru7qssxRigVpJCs
 /P2r4iLETkjDdWm+JzpuFRBQ5sJZXkdwcwCYoufmmfMP1qMD+4Gw3GU29/365C+DHzSHa3FrGl/
 B4ulrTwHmBLFjEZ46W1Y4dpARc8g/C/sO2DizlGb2ThF3Kl3fEaQ3U5UNn2Mk
X-Received: by 2002:a5d:66d1:: with SMTP id k17mr1399710wrw.239.1641553542845; 
 Fri, 07 Jan 2022 03:05:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxE0ci59xpFPNg7Iq7Wpf3Dq63UhbA/fVu0oG9i+Xx8/V7CJ7HHcCkO59eB3crmF7unyZGrEQ==
X-Received: by 2002:a5d:66d1:: with SMTP id k17mr1399698wrw.239.1641553542631; 
 Fri, 07 Jan 2022 03:05:42 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id l8sm4511510wrv.25.2022.01.07.03.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:42 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 52/55] virtio/vhost-vsock: don't double close vhostfd,
 remove redundant cleanup
Message-ID: <20220107102526.39238-53-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

In case of an error during initialization in vhost_dev_init, vhostfd is
closed in vhost_dev_cleanup. Remove close from err_virtio as it's both
redundant and causes a double close on vhostfd.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20211129125204.1108088-1-d-tatianin@yandex-team.ru>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vsock.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 478c0c9a87..433d42d897 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -171,6 +171,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
+        /*
+         * vhostfd is closed by vhost_dev_cleanup, which is called
+         * by vhost_dev_init on initialization error.
+         */
         goto err_virtio;
     }
 
@@ -183,15 +187,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     return;
 
 err_vhost_dev:
-    vhost_dev_cleanup(&vvc->vhost_dev);
     /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() */
-    vhostfd = -1;
+    vhost_dev_cleanup(&vvc->vhost_dev);
 err_virtio:
     vhost_vsock_common_unrealize(vdev);
-    if (vhostfd >= 0) {
-        close(vhostfd);
-    }
-    return;
 }
 
 static void vhost_vsock_device_unrealize(DeviceState *dev)
-- 
MST


