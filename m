Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5282CBB63
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:19:37 +0100 (CET)
Received: from localhost ([::1]:56628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQAa-0001cH-75
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPv0-00031l-Kh
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPuz-0002ut-0o
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606907008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxJ3f9AkcimEoHVGFWIULEfxtXcI3G+nN2yyJC0qTJU=;
 b=MCo9EFnaA2c/zW23cLHn+J4S/HWZo/dlo3WiEwUHAxSGBi3EERcOHetKzd+w5KfKeOxr3h
 OkNpCc+s0ShxrPufpAT3dDgERSX6JT9r3VHlRymZv/rOV+/R6gb4A4gSQMe2AAoHV6diTF
 lDrDTyx72SpT5VmzhaDUxJrFlDeXTrY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-g5CwY4g0Ni63cTCCNpolhg-1; Wed, 02 Dec 2020 06:03:26 -0500
X-MC-Unique: g5CwY4g0Ni63cTCCNpolhg-1
Received: by mail-wr1-f69.google.com with SMTP id b12so3304590wru.15
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zxJ3f9AkcimEoHVGFWIULEfxtXcI3G+nN2yyJC0qTJU=;
 b=RlXaaX8R2jmcb0bov/YA/POrTRfeorFy6a7kQUpdddaK3xd9+DsKT8pZW21zRN3hMc
 bTFd4sFNGEWHjckJURlKU8bX1vtBSk8Oocwypwtb4HnrdHuLzrXt4mU3jOKEyBi5r3/S
 I4v0LFqN03HjNMFLAQxpHLn8KVSdPbBZiWJ82DmzpV7cqDgLzyQ4EWFxvS/D/ayndzYI
 rqbK+4ykM11Efyx6uGzzNg5Le/DuiBLqt1JCWXsQHfHj6s1BrEXs/Xy1YMMbH5ukwYMr
 I3TiVLHNjxmVhPq3sWK4GILN3fPouYJqgSZiy6HCviLfWfeQbnWLZasbXs4JKPqDoKJQ
 DO7g==
X-Gm-Message-State: AOAM533HYYb1ytfjT4WltckveD2N+BLAUioAveRik0Z2mB+QkDajCpk1
 f27p2Ejtzg3btevs1pbDb+13oNVSXe7scMWMchaTn0JJrFMrsqP9weko7/vNSULFFnyfuc5sRl8
 1I9fQtL1g6I6l3grHVyofq4im6dJMdSZS+Vp0OCCOWhvXVdviw+70xcxwkIXJ
X-Received: by 2002:adf:a549:: with SMTP id j9mr2716547wrb.199.1606907005498; 
 Wed, 02 Dec 2020 03:03:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRZGmsqZ80Aj5NqXQhVY1vaZpvY1Pnn5jQ4J/5DSm7RX2LtlT1AB2jArH32E4pWvLTpG9H4Q==
X-Received: by 2002:adf:a549:: with SMTP id j9mr2716514wrb.199.1606907005247; 
 Wed, 02 Dec 2020 03:03:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id u26sm1665480wmm.24.2020.12.02.03.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:03:24 -0800 (PST)
Date: Wed, 2 Dec 2020 06:03:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
Message-ID: <20201202101655.122214-7-mst@redhat.com>
References: <20201202101655.122214-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202101655.122214-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Device IOTLB invalidations can unmap arbitrary ranges, eiter outside of
the memory region or even [0, ~0ULL] for all the space. The assertion
could be hit by a guest, and rhel7 guest effectively hit it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20201116165506.31315-6-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 softmmu/memory.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 6ca87e8d73..22bacbbc78 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1947,6 +1947,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
 {
     IOMMUTLBEntry *entry = &event->entry;
     hwaddr entry_end = entry->iova + entry->addr_mask;
+    IOMMUTLBEntry tmp = *entry;
 
     if (event->type == IOMMU_NOTIFIER_UNMAP) {
         assert(entry->perm == IOMMU_NONE);
@@ -1960,10 +1961,16 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        /* Crop (iova, addr_mask) to range */
+        tmp.iova = MAX(tmp.iova, notifier->start);
+        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
+    } else {
+        assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    }
 
     if (event->type & notifier->notifier_flags) {
-        notifier->notify(notifier, entry);
+        notifier->notify(notifier, &tmp);
     }
 }
 
-- 
MST


