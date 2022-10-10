Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079925FA2C7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:36:38 +0200 (CEST)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwhh-0000Ab-0R
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaG-0007ek-Sg
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaB-0006Ow-Cl
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rfuSsgJ8/3kGgCVZkv5tOI5S+PHvx8Oz4NxCMhgWj98=;
 b=foacEpD4kKc+/BPbk2MFBrNj6Ryr6iCAyIOAlX/EZrbM4rLtRuuPQ9amREaHuTxwPiHIy2
 LB17pMHbbRp4x8aaqs1XLzE7oZ5T8c1cd2DAjXUi9F3F+HJNwhp2tWFiVhHY7mJ4OENJUb
 lQtOTTMfVRGxlwwR9LmyJ+vW/etanEY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-XR5EWz1kP-qh0nTlV7iA5A-1; Mon, 10 Oct 2022 13:28:47 -0400
X-MC-Unique: XR5EWz1kP-qh0nTlV7iA5A-1
Received: by mail-wm1-f69.google.com with SMTP id
 k2-20020a05600c1c8200b003c3dd3aa638so4806635wms.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rfuSsgJ8/3kGgCVZkv5tOI5S+PHvx8Oz4NxCMhgWj98=;
 b=B0H+rsiKqDAy3uJvUkUT3GBbhCM45drGjOeSghJXK6Po1fjEpGItK9MhaSZay86ExV
 Vh11StvKzsk0MLT87TurbWjiKzuzmMh8rk53O+etc533CLYwOIVIIF6xo+MWSJVKrNYd
 YXCf2nWK3RevSV2iEv9f821txIItDdeMDXF/R5dG/nNaootqv4jz+mQMTqB/VL54qmFb
 YEvmHVJKzDlog8OMLL+qSPM/jA/BRMZArXoG41BqbgdTL8TwWSPAyRSbxBEZ3yrrHhHb
 y/S0UHjRAN4AycKKiuar6Zj7wJ6snlQDyZu2rTfygg2JEMVDMl1FigUwPvCCrei8ai5C
 iyjA==
X-Gm-Message-State: ACrzQf2ffiGtoPTgPAg2rQ5AuA7H6MMg3PfcKTpTew+7Lart8yJNK0ZG
 QyFl0IP/C5BHgZOzh151H5Gsm9LVIyqXA88XnDuPN8wSAYhiy+sf/JJLYr4buZirBZdHipxmMfE
 4t1ew6puPflLGhAEv0QfMhJNtsTQp/xZsiSw3k68bFOfRfCGl7edZXyU44xLa
X-Received: by 2002:a5d:608d:0:b0:22e:7bde:c19d with SMTP id
 w13-20020a5d608d000000b0022e7bdec19dmr12336886wrt.494.1665422926188; 
 Mon, 10 Oct 2022 10:28:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5o3cIFVeOGgH4fTbL+6bxsbACT0BoYm2+38BQ4Z31ouC+3BUrUf6MC8VJ/v5tfYOb3yUTLMQ==
X-Received: by 2002:a5d:608d:0:b0:22e:7bde:c19d with SMTP id
 w13-20020a5d608d000000b0022e7bdec19dmr12336866wrt.494.1665422925889; 
 Mon, 10 Oct 2022 10:28:45 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 u2-20020a7bc042000000b003b4e009deb2sm12924785wmc.41.2022.10.10.10.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:28:45 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:28:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/55] hw/virtio: incorporate backend features in features
Message-ID: <20221010172813.204597-2-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

There are some extra bits used over a vhost-user connection which are
hidden from the device itself. We need to set them here to ensure we
enable things like the protocol extensions.

Currently net/vhost-user.c has it's own inscrutable way of persisting
this data but it really should live in the core vhost_user code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220726192150.2435175-7-alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-2-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/virtio/vhost-user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 70748e61e0..0b7e41ffe8 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1460,7 +1460,14 @@ static int vhost_user_set_features(struct vhost_dev *dev,
      */
     bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
 
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
+    /*
+     * We need to include any extra backend only feature bits that
+     * might be needed by our device. Currently this includes the
+     * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
+     * features.
+     */
+    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
+                              features | dev->backend_features,
                               log_enabled);
 }
 
-- 
MST


