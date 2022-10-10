Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1315FA2C4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:34:08 +0200 (CEST)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwfG-0005o2-1n
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaL-0007v3-Q5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaH-0006QY-Az
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C17R4uZqGLEi0seyRZv7bdzpjpcef+51Q4h/UGlzozI=;
 b=Y+OB9/KFgKj2khtazSClewo8GHZ2F5J05YfVLYb6oDjOFEthRIpCPsVC3D6tPkzerUrT2c
 t5bZnoouj10VIOhjIL+2n9612rAqR+CWyaCOuotY1B8aFD2J9s1TaPU4itMhEFDMkpaf6H
 RayS00/8AHpAtsrGV0pXB5uc0m4/fhs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-tCd9lUVgO3uPgHdwj7OgTw-1; Mon, 10 Oct 2022 13:28:55 -0400
X-MC-Unique: tCd9lUVgO3uPgHdwj7OgTw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k30-20020adfb35e000000b0022e04708c18so2982630wrd.22
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C17R4uZqGLEi0seyRZv7bdzpjpcef+51Q4h/UGlzozI=;
 b=MM5Y8CWOrBFU/yEr+H24n8dByhms4fLr3vcL9WXwoo86CuOIWpOO/D2hITllINJpB6
 dG3D++TZOXCO86P8W3mIDe91SF8PrS3j47hHZPOS//weQzVZrLMvD/Tf/Dcdsfpov275
 2Rr+oF1a1nrAVkmudHqYcAkNb3obYf0VmV3YamF4nMoPbPgZ/8xv76vGzQYmmSdXb6Rr
 BWnmBt9wcKEs1URszlp2EFpj+qEJ5TRi47igbTw5wMf5yMWlaUhqn5D8p6u8UVJOaUDN
 lEB89JxCibs/nA5OYBBcQospCH1hwP2IEMUxV80HVfwcmSiRq4T+tue8plVco6TKc7Cx
 t+Qg==
X-Gm-Message-State: ACrzQf32exYkKews8dHCtIrK9brHijM0yzQ6wTysoMh4y04dC4zD2tJt
 yzJ1wDge7ht2w4B2I9e5NveQvZD99YcukS1aMB0RESVo7UWIjFxEHHhQBLFwgP8ys4n7Ocvr393
 4V3fFUu0aV2Hz2LCG6mMHQhw/3Ruikk7r50xV1O93pTwPNBXrVGx98shNucff
X-Received: by 2002:a05:600c:34c2:b0:3b4:7a98:5f5a with SMTP id
 d2-20020a05600c34c200b003b47a985f5amr13509088wmq.156.1665422934217; 
 Mon, 10 Oct 2022 10:28:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ScZhY6vvzjjysGPhGw5ZaTubJxKoW+/2JYoD3/aQZ39eYMliJs0k72iXdzQJbgMIaxJqI2A==
X-Received: by 2002:a05:600c:34c2:b0:3b4:7a98:5f5a with SMTP id
 d2-20020a05600c34c200b003b47a985f5amr13509063wmq.156.1665422933862; 
 Mon, 10 Oct 2022 10:28:53 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5229000000b0022cd59331b2sm9540464wra.95.2022.10.10.10.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:28:53 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:28:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 03/55] include/hw: document vhost_dev feature life-cycle
Message-ID: <20221010172813.204597-4-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Try and explicitly document the various state of feature bits as
related to the vhost_dev structure. Importantly the backend_features
can advertise things like VHOST_USER_F_PROTOCOL_FEATURES which is
never exposed to the driver and is only present in the vhost-user
feature negotiation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220802095010.3330793-7-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/virtio/vhost.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..586c5457e2 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -86,8 +86,11 @@ struct vhost_dev {
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
+    /** @acked_features: final set of negotiated features */
     uint64_t acked_features;
+    /** @backend_features: backend specific feature bits */
     uint64_t backend_features;
+    /** @protocol_features: final negotiated protocol features */
     uint64_t protocol_features;
     uint64_t max_queues;
     uint64_t backend_cap;
-- 
MST


