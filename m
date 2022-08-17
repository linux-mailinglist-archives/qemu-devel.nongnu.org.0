Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC5597799
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:12:45 +0200 (CEST)
Received: from localhost ([::1]:52648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPP9-0006lw-PJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIo-0002z0-UG
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIn-0000FT-KK
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlFScFbd6bA9xQKNfgYlcaL7eylrZChQGwf+YKV00bU=;
 b=NliMa2iMB23DfIEWKngjfUO7wM4IDkp/ZvQMXt5/K32OmXID4NAv4JtwgWoDDZVQQydfxM
 gRmOkBEKUGW9Fdq9qqChyEL/CWHiKUjhFhRFc33D2BNgZL6FZk3yT2tZPB4pFU6/nuTBNv
 Tg8i4dMfzNXNroplVhnOA2I9LSobGbo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-8IEXyy0rM5WOAnmWuCWBsw-1; Wed, 17 Aug 2022 16:06:06 -0400
X-MC-Unique: 8IEXyy0rM5WOAnmWuCWBsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 f5-20020a1cc905000000b003a60ef7ec71so601560wmb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=rlFScFbd6bA9xQKNfgYlcaL7eylrZChQGwf+YKV00bU=;
 b=XvP5IxLInow/SIsyMVhCXW97rKA1lkgPxmicTXKAplmB/S1N20CsSvW8soM3mc8Qyg
 czalNQnme2w4I2t3oaLIN9oVDnx+IYT7aolPJhAYPUtshsjG4O66lE6JdRHB83gQnGP2
 FPPskVKWeRCJtGY2rvU711UnmPV9HgB1VaNRDN3eQV+wv7/0BX3gjMnxRDcoN9R7TlxR
 t3B8pxRMpMWiGV+DcTsEtENwZffX83F7yc566Z/h408XnETzZCm+n4mTnb7mqyTpg0Rb
 LfbusGAlok8qug8phTRvE5DmBcJs/g5CdFLa+XoC46Ad7iGW4f70UZ2xM4cUabN4Cd2H
 N8Nw==
X-Gm-Message-State: ACgBeo2xM88C2da5o8sJuDNGoR2ZaOtEjAdf7UUydK/l9+ELXzwlfPIb
 vyEgSRwHJxT84vEAOoMVqIZoSToL4MKhqbt0RsL7LaS1p2mrMMmmdPxC1jLVJhLo6iZMuOYZaj3
 q8utGH2BIt5vBUJJGVT1Rt1jH9hPDz9uKTZQ0QjREdxzkmhiX0mLdCP0+Rbsj
X-Received: by 2002:a05:600c:206:b0:3a5:abe9:8a91 with SMTP id
 6-20020a05600c020600b003a5abe98a91mr3066595wmi.155.1660766765156; 
 Wed, 17 Aug 2022 13:06:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ZewWLcpM48Wj0uMqKFj1ccKUTe9j/OC+aDlRxbfidwOvLSVwg0kwP6kN1P3JzdigfNPgAlg==
X-Received: by 2002:a05:600c:206:b0:3a5:abe9:8a91 with SMTP id
 6-20020a05600c020600b003a5abe98a91mr3066583wmi.155.1660766764835; 
 Wed, 17 Aug 2022 13:06:04 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 r15-20020a5d52cf000000b0021f73c66198sm13813537wrv.1.2022.08.17.13.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:04 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 04/12] hw/virtio: fix vhost_user_read tracepoint
Message-ID: <20220817200536.350795-5-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As reads happen in the callback we were never seeing them. We only
really care about the header so move the tracepoint to when the header
is complete.

Fixes: 6ca6d8ee9d (hw/virtio: add vhost_user_[read|write] trace points)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220728135503.1060062-5-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 75b8df21a4..bd24741be8 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -295,6 +295,8 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
         return -EPROTO;
     }
 
+    trace_vhost_user_read(msg->hdr.request, msg->hdr.flags);
+
     return 0;
 }
 
@@ -544,8 +546,6 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         }
     }
 
-    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
-
     return 0;
 }
 
-- 
MST


