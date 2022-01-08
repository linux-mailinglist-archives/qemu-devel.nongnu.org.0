Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376134880A1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:39:05 +0100 (CET)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60hE-0002IS-BF
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:39:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Ah-0004iS-Sy
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Af-0002ed-Ua
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnGOLm7lT8LwKDlvBDBF9jJhmbOnmc0+Fq8lIxyOVLg=;
 b=USMkOPjoPBfaF2pb2yOKKgfQjlpbJfMfgfzKcEYkp5qhwnrikkzpqSCJDJZL1B170De8IM
 ae9AVm1wnpIh7d9J8RjilRvcIO8NoOCD7D01pwvHD6QOniosmarKkC8f7F4EAA8jicEm9S
 nMB/86502ybzh9j+15DvBhvbDXNjPiM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-hxXXM17BMUGuy60vdCcICA-1; Fri, 07 Jan 2022 20:05:24 -0500
X-MC-Unique: hxXXM17BMUGuy60vdCcICA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m9-20020a05600c4f4900b0034644da3525so2500377wmq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TnGOLm7lT8LwKDlvBDBF9jJhmbOnmc0+Fq8lIxyOVLg=;
 b=lM2VGAPf4GpzeCDOwUq3hkXUGEcbNH7Vjs7Ca1uSGR8jTbkKupcQfpeTXGPqQO5NPr
 zyUjvOJQnyXS0S6K8sph4IYNQnQHNJqIJQLDi102fUdMysqSLXVA703I1AHefrToD/YA
 HLHPqRgJmQn3BgIhnu4BZo7+YxRyz2kil7a8ftmDSvWLfXs5BO9mQuTkXBPQ1o4bwkKP
 dpeyNGu4QmvirQVHFQppAnT7YYeZDuiWOcq2njATvVcEklcwvpdpWruBcXrVuHUEMkgB
 uq0kDF68oV80+0XV3cR4IJqwF8zMOJGVWSFJQ2bW41QWV1o4Jn3WioLjIIO/5ewgIdQz
 t/Tg==
X-Gm-Message-State: AOAM533Br4D0dUFmxEvIzqe0Bpad+Q4+b8T2xRg9apTPfTJvKoEtmiU8
 I2OGhkQ0IpG/jAX+eBgGXkBHmz70gknCC1nAU0ZD+PooZgeuMxybwm5Rpg6WDrFBB942KMwuYMD
 3tYK4wQ4ex/8IxdTMIc+nLFYQGzAQWretuHFiPYe78v/nwrmkYJWf2T7+GCuT
X-Received: by 2002:a05:6000:154a:: with SMTP id
 10mr55806966wry.9.1641603923037; 
 Fri, 07 Jan 2022 17:05:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznkqv6R0SGW77U4L+BzgHA/XT6LDP3iD0oXYlSBD8zcd3xOcv5z4xA2BFIFLCFWweroJUisA==
X-Received: by 2002:a05:6000:154a:: with SMTP id
 10mr55806954wry.9.1641603922808; 
 Fri, 07 Jan 2022 17:05:22 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id o29sm471487wms.3.2022.01.07.17.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:22 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 33/55] util/oslib-posix: Avoid creating a single thread
 with MADV_POPULATE_WRITE
Message-ID: <20220108003423.15830-34-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's simplify the case when we only want a single thread and don't have
to mess with signal handlers.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-6-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/oslib-posix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 67c08a425e..efa4f96d56 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -564,6 +564,14 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     }
 
     if (use_madv_populate_write) {
+        /* Avoid creating a single thread for MADV_POPULATE_WRITE */
+        if (context.num_threads == 1) {
+            if (qemu_madvise(area, hpagesize * numpages,
+                             QEMU_MADV_POPULATE_WRITE)) {
+                return -errno;
+            }
+            return 0;
+        }
         touch_fn = do_madv_populate_write_pages;
     } else {
         touch_fn = do_touch_pages;
-- 
MST


