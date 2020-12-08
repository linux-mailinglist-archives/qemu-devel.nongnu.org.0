Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2E2D32F6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:06:54 +0100 (CET)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjG8-0003Zg-ND
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilN-0005Om-3m
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilH-0004xW-2N
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0gJ2VpSbCOtbZxPOChuV1mVFMIO/b+gNgYfj7nsR0w=;
 b=FfcIRc+xIDZcJ7tD6TMbw0pmtkwTEMRrS9aFzN9hjQrHK+vAG0B572dWfGqv1svWodNjXF
 BNT9kkjYj/yoF3zHr1X9Q/gGaS37h5hWOSG1jBIEffx/R5R5UIHhjYo31dvT2rLyD0hfcX
 xiQFTEtX6oxSBsNglNePfN/ZD5t08Lc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-YVTOnwo1O1mPfDpV0axe2w-1; Tue, 08 Dec 2020 14:34:49 -0500
X-MC-Unique: YVTOnwo1O1mPfDpV0axe2w-1
Received: by mail-wm1-f70.google.com with SMTP id v5so1288005wmj.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l0gJ2VpSbCOtbZxPOChuV1mVFMIO/b+gNgYfj7nsR0w=;
 b=QFXLH8X+uV9ewgCL+7vkVed+e2RcsGdoosrMcur6L1p7G4ESfWWzIVyQinQjUzZqSR
 ARgP3IXNT+eptajlXeD5kqCjYXnRNgyHXKamuTcZj0HpZDyb5Z2sLzOT0i9kNH/ehTLF
 yubKVBLHbPEhT5Hs21f5OGhWpU+Swkr44cIkF5Tl4EzeR9PDs5qnTHVzy2PTkmJeWXfb
 aaOyjbjxp4KZ/+4fxlMwstW7a+SPAPMNQwXqtaNZdN86vGVcVh1BxVuZ2NdJOh1R+Tqu
 TNE6PO9bSJHh/WBn4w3YNqyktOwV1Xl8w4sb62ut9B2oJ29VOcCZqcUFJqDBBzjiDpML
 kNtw==
X-Gm-Message-State: AOAM5319Q8mBGSVuG0XgAzukLzWVN1ZlNGPXmCYixMMzrcITBzhTtFDN
 sudmSx4ZuXp+B21yssIqK9Nz6pnWPBG9YC2rslyaKpfPHZHK98im5yzthy6U+ucq4zt09I0i5AN
 h5I57GKeyjTW7RE8cwyamwGygY9Mxdgl1yjvcd95df2d166U8xS7vBmIuRdE8
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr26919800wrn.207.1607456088164; 
 Tue, 08 Dec 2020 11:34:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUo+DXvYFve8+Khhklfv4cyJyDFpIyC+UOhSUHqg6RP0mcesEY1/nKS7+gb49kmvfVx97EyQ==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr26919784wrn.207.1607456087990; 
 Tue, 08 Dec 2020 11:34:47 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id r13sm13211618wrt.10.2020.12.08.11.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:47 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/66] failover: qdev_device_add() returns err or dev set
Message-ID: <20201208193307.646726-23-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Never both.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-8-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6ca85627d8..3e82108d42 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -803,13 +803,6 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         if (err) {
             qemu_opts_del(n->primary_device_opts);
         }
-        if (n->primary_dev) {
-            if (err) {
-                qdev_unplug(n->primary_dev, &err);
-                qdev_set_id(n->primary_dev, "");
-
-            }
-        }
     } else {
         error_setg(errp, "Primary device not found");
         error_append_hint(errp, "Virtio-net failover will not work. Make "
-- 
MST


