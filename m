Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF18400D33
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:49:27 +0200 (CEST)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdXS-0003dr-Ij
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLr-0006ro-Fo
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLq-0001dL-0g
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjCtuAOy6SdTHjv5qp1otabN9iGtptn9vlMz9BZZt3o=;
 b=EPzwUO1JF6TN1nhZx5HYbC3rPmHWX9EATYkzE4+YxiVr3Mh6lPCkPW9Dw2F7fm4Z5hGi83
 HoOuVBlcTDTn3obdAc1Dxj1+xXHhCq3q39wSiPtF53ww9MW5j02V9aQJB+Vcj8WpKVghcw
 D9qcm11yqK4OOPx4CyvoDgFh04XWv3k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-QPelkxL6PtOjga6JvWoVPQ-1; Sat, 04 Sep 2021 17:37:24 -0400
X-MC-Unique: QPelkxL6PtOjga6JvWoVPQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 d25-20020a056402517900b003c7225c36c2so1517493ede.3
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IjCtuAOy6SdTHjv5qp1otabN9iGtptn9vlMz9BZZt3o=;
 b=SS4qkMD834S9eBMCXEPmUMu2rqMiWQ6j144Dl64ohyVDfWYP+pkzlphCKgzU4zGMGo
 Zd+AGtT79i4SMebt+mbFaM0VmO5QJXLixImIu2UC7GXrXlm10yHMEHPopVoBV2RGzumV
 3Vu3Y3ie9WIinGF0ASBhGFh9Thezhb2v6WJ5CSwiq4tzbicIlJ0QoOmf90dlsDaeSotz
 /gK8mG+PO/hy6TmmS4betzw5bB04SZs4iepfg6TfPKAIs7u0k0nVwkoulxi6daEk5Gav
 1uQYhiwnD7RIQo933uz8DikD2aGFF1SJXldkpFL6qgrLhLSFklI1gEinHUTfW9uyVyNU
 CsHw==
X-Gm-Message-State: AOAM5327szVASZULdm9EuM78EqGUbMZlyjNC5h1iTwaXcWMnOr6kJRkI
 LN4sjU9rPtyjoIF4ZnZ4nBny6ET34OQi/bI7I4tgaDOQJnWheDcsAty+m4nnKZLYcFVCd4Guu9S
 A+rUFQJQNJNIYUnnEoDXxitLbsaV+CXC5G/iMymHD+rkoVfsFr6BLyHgYSxoG
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr5926795edu.359.1630791442799; 
 Sat, 04 Sep 2021 14:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYLMyMYMs/g6WyaGScdWTtpyZid5tJ5hVZ979/z1iYFPK6ny6HQo/W1AWxPvFhqS+Bvmmfuw==
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr5926773edu.359.1630791442536; 
 Sat, 04 Sep 2021 14:37:22 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id js21sm1529826ejc.35.2021.09.04.14.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:22 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/35] vhost: use unsigned int for nvqs
Message-ID: <20210904213506.486886-29-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eli Cohen <elic@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Switch to use unsigned int for nvqs since it's not expected to be
negative.

Reviewed-by: Eli Cohen <elic@nvidia.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-5-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 5ee306568b..1a9fc65089 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -71,7 +71,7 @@ struct vhost_dev {
     int n_tmp_sections;
     MemoryRegionSection *tmp_sections;
     struct vhost_virtqueue *vqs;
-    int nvqs;
+    unsigned int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
     /* if non-zero, minimum required value for max_queues */
-- 
MST


