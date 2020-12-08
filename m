Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11E2D330F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:17:10 +0100 (CET)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjQ5-0007fA-DJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminP-0007eF-Ru
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminK-0005nx-00
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c0kBt8I1oCPYpFP4q5PRaWZkMHzl2YDLms+Egf+MHrY=;
 b=D+pJ90ok+QTlUVucUc2j0ahx/+wRlO5W1OcIteQJknlr4QM8iusFOjgL/KuAQwHf4xReo7
 2UBCzJ4iHyZQZorS2XlXZLXOweTpq7gh3PQFIv6E1f+bH8lY3SREWUQtDYBDeTtMw6p7lM
 bsQ5UlL+BN2AqJMfBbOloFK0MhJ9Qx8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-woOzQdT2OIeYHbT-2VxTPg-1; Tue, 08 Dec 2020 14:37:02 -0500
X-MC-Unique: woOzQdT2OIeYHbT-2VxTPg-1
Received: by mail-wr1-f71.google.com with SMTP id z6so6544551wrl.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0kBt8I1oCPYpFP4q5PRaWZkMHzl2YDLms+Egf+MHrY=;
 b=tlpTLB8ltTmhuOEhw1N9sFvIahuu4yBSjHQsqwWCxuLu+/D8k5wU8TLIUvpPGCovB6
 mpEIvIr2kuQQaj3vFS9YX6tcGjs1Yd/4GMK7mdRzupsNxdc0dRgVQwAD3l2jdsH9qO1I
 LKKx0K/51WInBAQYegSWFMHyeRTnCApadoP9BRSSfwertbz7aOQaBpxYFtf54eNwIyjl
 hY/hSNhcyU98WSOdk2+8dq61zdsH5leSHkoASyu3pY4i9M7FFO3QwRXeBo9BFBVAC/FM
 SK6ZGJMCdHOdXboNN9B2sXwqWNEXAc6SozUJa82qfKt+S0NyF6yrbLK1S2Syk2P9fbrn
 3J/Q==
X-Gm-Message-State: AOAM533id2R3JgyDbvbk9wnwJCYkdijywoiyg/1IJa0ghHAMtmPIT4th
 EttfZMqKvSrRAb+6DKJDf6uhhU1bFhd/S2tZPM1HNAg3pqcbngPArWhC4C9GwSKWOjEupqaSLPL
 TR9xRI82Ktqd8YyeEo99+B1f4m69pE919WQxGLAPD24+9R3vrvFaj+NPX+ugM
X-Received: by 2002:adf:f401:: with SMTP id g1mr3635818wro.258.1607456220849; 
 Tue, 08 Dec 2020 11:37:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8pWgJziB6ytnibla5JGKT3KYD9LSBdrSIYc2iH2YAy86FLJSU/8SEkAkrucX4IiG4YLP29A==
X-Received: by 2002:adf:f401:: with SMTP id g1mr3635799wro.258.1607456220634; 
 Tue, 08 Dec 2020 11:37:00 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 65sm19646106wri.95.2020.12.08.11.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:00 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 53/66] contrib/vhost-user-gpu: avoid g_return_val_if() input
 validation
Message-ID: <20201208193307.646726-54-mst@redhat.com>
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
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not validate input with g_return_val_if(). This API is intended for
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.

Use an explicit if statement for input validation so it cannot
accidentally be compiled out.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201118091644.199527-3-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index a019d0a9ac..f445ef28ec 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -1044,7 +1044,9 @@ vg_get_config(VuDev *dev, uint8_t *config, uint32_t len)
 {
     VuGpu *g = container_of(dev, VuGpu, dev.parent);
 
-    g_return_val_if_fail(len <= sizeof(struct virtio_gpu_config), -1);
+    if (len > sizeof(struct virtio_gpu_config)) {
+        return -1;
+    }
 
     if (opt_virgl) {
         g->virtio_config.num_capsets = vg_virgl_get_num_capsets();
-- 
MST


