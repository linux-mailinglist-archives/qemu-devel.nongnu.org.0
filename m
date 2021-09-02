Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FB73FF1D7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:54:16 +0200 (CEST)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpyh-0006ev-JY
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvc-0001x9-4t
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvZ-0000Tv-VP
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630601461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydqzmpwIS7w421UnF6h3bFe+Afko4IEnGxAHt+H+82o=;
 b=H/DdrcNaA1sjw+SjVVOjviZlZFfCN8qQqe79eeHNdv7ifFafQdv6G4m2fvOpZ1fx7IXgYP
 99/xkf85GypYGZMFikzxbSSk/r2pxsrsynIhTwmlPkHT9XvvukF83dWrDQibIVTOXgTF6C
 2/H0DlEfxHsuTBl37ln7iDhq1AkZoNA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-RVdAuWNsOzuJezT50lpmRw-1; Thu, 02 Sep 2021 12:51:00 -0400
X-MC-Unique: RVdAuWNsOzuJezT50lpmRw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h6-20020a5d4fc6000000b00157503046afso749886wrw.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 09:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydqzmpwIS7w421UnF6h3bFe+Afko4IEnGxAHt+H+82o=;
 b=uS8KdUlWHXIp4mhcfRoM4R/HXnoPIuU9oflhRVS9ahLlEhrBxqwx+5Zzp1Epn3jHIi
 pfvR77U9EEo7V1dnvnUiAPG7fYKeEXXtyCALGu99XkTzdgTQiLG8UyfJ0Eg7o2wSLn0Z
 jFZJAwvkATrEACXoYvkoHZ9LbIPESvmSw/BuhVc61nB2TciH9rB03pzP+BS+iMocg517
 PG5uHVGjCFArmaMjBc5SUmrVVcXNT7joOeuWEBVyh4TjaLg8mB/mIUewzDnZyTXf0aoN
 WqlI2kevBFBZSc6n5C7pNGIC+23k+euOSpzSCvw2XZeLALyyEDaDoT+SU8lus4CpsSVQ
 JcQg==
X-Gm-Message-State: AOAM531N7Radx7+9Lz6MLs+USMdGcDr8hUWB+LE3UwBOwww7pfdGtuGO
 r93gYGly1Yde/DCnLJ4ZsWnNxpxLT1yLZJhiAiJ1CWITst2hLvSv8VAeDGMarEkybpcq6x1/LU9
 s1H7SonqHzE5p31cgtmIUWF6TCKrtr2GDzkbInoLNr/lWZMLp63FgvmWoVWGTce8b
X-Received: by 2002:adf:c405:: with SMTP id v5mr4922742wrf.183.1630601459025; 
 Thu, 02 Sep 2021 09:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsxF6ASqU+vuAstoHC6qZ4CFufNOz4O5rFfyQl1kKl5jUCnlfv2zuQ3t5UWCXVSXXQq2K+Gw==
X-Received: by 2002:adf:c405:: with SMTP id v5mr4922718wrf.183.1630601458855; 
 Thu, 02 Sep 2021 09:50:58 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s1sm2386940wrs.53.2021.09.02.09.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:50:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/virtio: Acquire RCU read lock in
 virtqueue_packed_drop_all()
Date: Thu,  2 Sep 2021 18:50:38 +0200
Message-Id: <20210902165039.432786-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902165039.432786-1-philmd@redhat.com>
References: <20210902165039.432786-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vring_get_region_caches() must be called with the RCU read lock
acquired. virtqueue_packed_drop_all() does not, and uses the
'caches' pointer. Fix that by using the RCU_READ_LOCK_GUARD()
macro.

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 97f60017466..7d3bf9091ee 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1704,6 +1704,8 @@ static unsigned int virtqueue_packed_drop_all(VirtQueue *vq)
     VirtIODevice *vdev = vq->vdev;
     VRingPackedDesc desc;
 
+    RCU_READ_LOCK_GUARD();
+
     caches = vring_get_region_caches(vq);
     if (!caches) {
         return 0;
-- 
2.31.1


