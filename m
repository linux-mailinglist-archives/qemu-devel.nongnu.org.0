Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E8487667
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:22:07 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nJu-0002xj-VC
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2Y-0008NS-TU
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2W-0001rq-8i
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNzO3BmzKsU9XDhTDAgKzBlwWRwUQVLphv/ivYXligU=;
 b=fA5RwpN1Vumad5yvWasvC1CL9YOBMHUM4dHZPOlnr1l4h1/arxGy10JURXpiyLSFUewI5A
 jV1N7wTFhUXv3RKQeNDPQNC4f5gU7SRKJ4nhm1biK+bpnMs6Mqk1zdDjwghnuGy+dvvEaZ
 qkKr2KGHzFynilfw6YjiIlE++ri7NXY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-0UkaKcBROZO2FvGAmNtgNA-1; Fri, 07 Jan 2022 06:04:01 -0500
X-MC-Unique: 0UkaKcBROZO2FvGAmNtgNA-1
Received: by mail-wm1-f72.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso309114wme.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mNzO3BmzKsU9XDhTDAgKzBlwWRwUQVLphv/ivYXligU=;
 b=PH+8AbUJpQYOm/tpOAB8c2AP3bo9DIZbqtGrRbxYTf0f4zelAIYgRrKZPTLKTwje8A
 /ihi5WcFoNgK2IOlMLAz0tr6KdHuhZ2ZneDeCd04zPDgNXuQPx/4xm19njDWTXrU0zWf
 tSyRfA43dXp6SSGf3kuEGnnf75PQBofqh+XLL/XivCY/eeoqzfHTtPMvBksFtPjoLKHA
 nWe9WWYQYqmrICF6mvJRvIny/8KOOdKy3H/EtaEzCzDrAi8Rom8uTYKzI3F1FcuTTVfc
 qKIcA70lml+HfI+JDTGcbzkaN+UxTiwfXHXNQuxm/gxrfTnQKcVzB3y1lUbKzgX1G8es
 wECA==
X-Gm-Message-State: AOAM533BCIwtOYIDrYtAhoj9hh+hmUh1F3zHdKl8BjRpTawmiSJNNSj7
 d4w8cki0Pb7NezIzChthTCzZklvbKuPiexvfJSIObJcQJZySixRXH7sI06gf7tUJdGLSdgs+3qc
 4GoLtqrylhR0sFQLMRm5qmHtM3uH0ZwemKKEhhl8JNMspDlFDD6cmPm/DHIhM
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr54184247wry.447.1641553439993; 
 Fri, 07 Jan 2022 03:03:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytNh5EhZo43ZN+Ku8G2tFsEu2jTVKuNOtmFDW33svOxz/QuZBNwgAaVD4XMZgKwMWww41k4Q==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr54184235wry.447.1641553439776; 
 Fri, 07 Jan 2022 03:03:59 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id e12sm4853225wrg.110.2022.01.07.03.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:59 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/55] vhost-backend: stick to -errno error return convention
Message-ID: <20220107102526.39238-19-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Almost all VhostOps methods in kernel_ops follow the convention of
returning negated errno on error.

Adjust the only one that doesn't.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-7-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/vhost-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 44f7dbb243..e409a865ae 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -47,7 +47,7 @@ static int vhost_kernel_cleanup(struct vhost_dev *dev)
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_KERNEL);
 
-    return close(fd);
+    return close(fd) < 0 ? -errno : 0;
 }
 
 static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
-- 
MST


