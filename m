Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879E952836D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:44:04 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZ8t-0004ig-FD
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7S-0007w2-Eb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7Q-0005V4-Ph
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQz4ehzFlsyqaJdQtd3oII5C6sWLvrd+BwENnYaq6Qc=;
 b=b5wKxkfG03pgQ7RHLjOsxsHJuSKw14M3ivnEq5FqdNtiCwmp1DG6TdtpFQZH4idkMLElrw
 LSFZ3jWipONG9TmD11Bd11TGrI0xwo0KX25oi5jd+jE9eG+Az+FuR3MHPkMAo4CuAp6sKk
 yAwF0YeWHLAtOvvBSSBr3EFiqzHxOVU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-FozH1d5yP_aHWkHEGhq4pg-1; Mon, 16 May 2022 06:38:27 -0400
X-MC-Unique: FozH1d5yP_aHWkHEGhq4pg-1
Received: by mail-wm1-f72.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so6565706wmi.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PQz4ehzFlsyqaJdQtd3oII5C6sWLvrd+BwENnYaq6Qc=;
 b=UIf6lzVKAtGrUQiW1CwYsXuJApnh9BLCvcaqYvuQ4hE8LnO3VOZWcxjBmiyQgQrCWL
 NYCbgTR2NJ4KhWjHjZ9SGXYM8NdvvG8pjr/vWRkDaLyYSGRUm678PMnmIoo5cWMHN6T/
 IUw5NtJBVy2haYGPS+9nDpcCle3ss/PCSotVXdtvPKApDLKZEmqLHjFMphSMRQmIez/Q
 QyrFnldLVCnvAmuIp4AXaGhy9PdI5kxpCneICY6Os/bowPut9yQdUpNWZDn7AUWMe6F1
 z93svv5tcY1+NnMvJyfY12AEGMfC/7+ompxOo3u5dzI8+SKfWln3nKJUyTzcO+jsJnD2
 H0Jw==
X-Gm-Message-State: AOAM531qwVpdBUDbTbw6VemA1oLNNoRN7qgvnP6yPs7NvghDouL4pl+v
 W4h1J5LuncfrZ7sVE2qFeg8W8YeMw+gysFjA68DFtv7rd46KctsBp2HKnGzT3wI5AoriprMmhqt
 /Gx+DxllTt+DlP5fg8ergdO5jplF54a+k6n2JHk6zDuYRYx/LU+wMaBK5I3ar
X-Received: by 2002:a05:600c:190b:b0:394:96d3:5780 with SMTP id
 j11-20020a05600c190b00b0039496d35780mr27163995wmq.82.1652697505586; 
 Mon, 16 May 2022 03:38:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdv5eKMekBSRyJdGvgtShVpUSqsQZQ8trBiaSUuHdIXCyfl4jkHuwUVyU/zbYPLcgr6V4VAg==
X-Received: by 2002:a05:600c:190b:b0:394:96d3:5780 with SMTP id
 j11-20020a05600c190b00b0039496d35780mr27163973wmq.82.1652697505312; 
 Mon, 16 May 2022 03:38:25 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 x16-20020adfbb50000000b0020d11ee1bcesm193103wrg.82.2022.05.16.03.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:24 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PULL 48/91] vhost: Fix element in vhost_svq_add failure
Message-ID: <20220516095448.507876-49-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: Eugenio Pérez <eperezma@redhat.com>

Coverity rightly reports that is not free in that case.

Fixes: Coverity CID 1487559
Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220512175747.142058-7-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index a8376ef82b..56c96ebd13 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -199,11 +199,19 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
     return true;
 }
 
+/**
+ * Add an element to a SVQ.
+ *
+ * The caller must check that there is enough slots for the new element. It
+ * takes ownership of the element: In case of failure, it is free and the SVQ
+ * is considered broken.
+ */
 static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
 {
     unsigned qemu_head;
     bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
     if (unlikely(!ok)) {
+        g_free(elem);
         return false;
     }
 
-- 
MST


