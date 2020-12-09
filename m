Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4892D4916
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:35:29 +0100 (CET)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4JE-0000ib-QE
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3t7-0002Cc-2F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3t0-00085H-QQ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gA8OZSVFzke8UQRwamLZeTSgAvZS2ts8NQ1bKDBCEMU=;
 b=N7jp+fW8VChaLq5iNqcr5GCfPTfp57DsaU0SUyShz8O/oszZEg7hE1sfA90jsdZqp3BOZB
 +G3EPMZ1BtoP/c1UVNSn4D0LUtPag1/09bg2t3JmJi+7HuPEOXAKVAgaZnGWjmQGx8LsJ4
 olexhUPlrkra08iG54maw4dhaGazQ+E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-7PrA87RZMSOomXVJMSwGjg-1; Wed, 09 Dec 2020 13:08:18 -0500
X-MC-Unique: 7PrA87RZMSOomXVJMSwGjg-1
Received: by mail-wr1-f69.google.com with SMTP id r11so938269wrs.23
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gA8OZSVFzke8UQRwamLZeTSgAvZS2ts8NQ1bKDBCEMU=;
 b=r4GJB/vOcAvA0BXlSbGrYsOdt5k23R4dIyZoT7J+7D0H9DjFvoJBdYkLstVZaxd9jw
 t9vc1cucWbn7bfaDnZY+2dLAJrmc5MfeAOao9EAU7TamXv3KmZoncdXYmBL3bfBekINU
 dBg1s3OePeHhUzavof8L9xUe08BryAh5igBYtFxPAHIsY+B8O+Sa9KknMAm0Hy1saFIj
 BCUjPlLy1cenLIL2OxgDTD4HZOKeQLA5NUyxC4M/NwhCU7RUBw9Ul7sMOV9LIv2Z2w8u
 9KTKQcafaSlLvWDq9zfRxgIuNIvNcx+PpIYbvv/O04zG7C1EVluMlP+Foj55CtpLnwVu
 cT2A==
X-Gm-Message-State: AOAM533yemi0s88ThsH1bgwwGH3+WXi2Tu4lie4/BH6Rtw7G6t7+6aI4
 jrPcMyeyXwJXiIRc6tYgP/xQFKwOvrZRukTOOsUg7DKDt6G4iSo/+lRsr7e4i1YPBpH816gXtvU
 yE/WbXWDFNh+EIbhBtkUWbzmZHWhZ+iS/aosw29DgGAhtCkTTnkayE7Jy92ns
X-Received: by 2002:adf:9b91:: with SMTP id d17mr4045825wrc.32.1607537296836; 
 Wed, 09 Dec 2020 10:08:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHKE2wIsJ0MuGiR1xZL8tmb9OitSai8rLaw1gRW6ktFKwAi91IGgYOsrNUlJ5a6pcvI2JUww==
X-Received: by 2002:adf:9b91:: with SMTP id d17mr4045803wrc.32.1607537296668; 
 Wed, 09 Dec 2020 10:08:16 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q15sm4835884wrw.75.2020.12.09.10.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:16 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/65] failover: Remove external partially_hotplugged
 property
Message-ID: <20201209180546.721296-22-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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

It was only set "once", and with the wrong value. As far as I can see,
libvirt still don't use it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-7-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3f658d6246..6ca85627d8 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3135,10 +3135,6 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     }
     qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
     qatomic_set(&n->primary_should_be_hidden, false);
-    if (!qemu_opt_set_bool(n->primary_device_opts,
-                           "partially_hotplugged", true, errp)) {
-        return false;
-    }
     hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
     if (hotplug_ctrl) {
         hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
-- 
MST


