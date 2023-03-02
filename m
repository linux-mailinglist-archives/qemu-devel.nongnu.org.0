Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FE66A7CA6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:29:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGc-0005M2-FC; Thu, 02 Mar 2023 03:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGY-0005HL-5b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGW-0002RL-3q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzM2wIWwmRCmPsQ/RXdn+I3G0TDRllMNBrCQK4/Zu3g=;
 b=ATRjRu2LNipv4yl7yeEnzQf1nsJ6j5G68K8bsA7i6fXP61FsXiHmTd37riLAm3AVyabwGC
 3rVFBn6dZHrAiCkfi8ROx0Tm0M/fWcqlxSK/385cqoMwGKPIP+KDt8sD5I7mj/EFUNw11K
 xUznfzwGHqjfRGMawM5o8JG6sTsr+/Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-Y-kfZAx8P0uxREkqnvaxGg-1; Thu, 02 Mar 2023 03:26:14 -0500
X-MC-Unique: Y-kfZAx8P0uxREkqnvaxGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so926728wmb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745573;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HzM2wIWwmRCmPsQ/RXdn+I3G0TDRllMNBrCQK4/Zu3g=;
 b=qW7TTkYBjPhH93+ohEC5glvReKcIEofzOWHcuLL3fUkoaPMM8a7ljAnJR1whC1Owlf
 MaarOrOeoly4VTGZxqsr4xdqytAWgxFLaSTWMrha2UJqAUAKov4dS5T1RoKGXFI9UCpW
 78i5ga6Cm8sEWjn2MbAgRMKNwQUuTKq53qo1IyWubIA6SaJa4ZRnfkIvBMqBwv7YCn4j
 YYc+ycisqit7OzOv2aEBjZNhlWadBDWH5MPmzJpSKWP6Ep5BUmYefXZNd/5sRMfqWdNn
 mF+B8OS590SFirdqDK48cB1ApcaA6uzSnFpd1jjyHBWfB6SUtfGTbnNMTmdi1ZMF/0Ho
 WDGQ==
X-Gm-Message-State: AO0yUKXmKNCzKr87R0/6QYKEM7/RsMtMMo/xfQmt8VH12M/2YQ9eh/Do
 eHkb46rnc7RgplldVS5m4/EbA7DZ4rf0ioPcvYctaSDbooFXfP3LVLqGk2jVmLfI3q9T4Ayz8yq
 6kS3mjC0mizDwxTaYBxOqVUmNp6gdYTsdXhJppflrMyOTCE1ZxUibKmdtEC6v/dI3Iw==
X-Received: by 2002:a05:600c:1898:b0:3eb:2de8:b732 with SMTP id
 x24-20020a05600c189800b003eb2de8b732mr6861821wmp.0.1677745572985; 
 Thu, 02 Mar 2023 00:26:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/ENeI2+Blsy5XbEQJb8xTOJCdOAGYod/9lMd074LbPB6a9ySE6REiB+NbSvHvDYRQpQLgSDA==
X-Received: by 2002:a05:600c:1898:b0:3eb:2de8:b732 with SMTP id
 x24-20020a05600c189800b003eb2de8b732mr6861807wmp.0.1677745572748; 
 Thu, 02 Mar 2023 00:26:12 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 iz2-20020a05600c554200b003e11ad0750csm2088753wmb.47.2023.03.02.00.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:12 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Subject: [PULL 33/53] libvhost-user: check for NULL when allocating a
 virtqueue element
Message-ID: <20230302082343.560446-34-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos López <clopez@suse.de>

Check the return value for malloc(), avoiding a NULL pointer
dereference, and propagate error in function callers.

Found with GCC 13 and -fanalyzer:

../subprojects/libvhost-user/libvhost-user.c: In function ‘virtqueue_alloc_element’:
../subprojects/libvhost-user/libvhost-user.c:2556:19: error: dereference of possibly-NULL ‘elem’ [CWE-690] [-Werror=analyzer-possible-null-dereference]
 2556 |     elem->out_num = out_num;
      |     ~~~~~~~~~~~~~~^~~~~~~~~
  ‘virtqueue_alloc_element’: event 1
    |
    | 2554 |     assert(sz >= sizeof(VuVirtqElement));
    |      |     ^~~~~~
    |      |     |
    |      |     (1) following ‘true’ branch (when ‘sz > 31’)...
    |
  ‘virtqueue_alloc_element’: events 2-4
    |
    | 2555 |     elem = malloc(out_sg_end);
    |      |     ^~~~   ~~~~~~~~~~~~~~~~~~
    |      |     |      |
    |      |     |      (3) this call could return NULL
    |      |     (2) ...to here
    | 2556 |     elem->out_num = out_num;
    |      |     ~~~~~~~~~~~~~~~~~~~~~~~
    |      |                   |
    |      |                   (4) ‘elem’ could be NULL: unchecked value from (3)
    |

Signed-off-by: Carlos López <clopez@suse.de>
Message-Id: <20230210112514.16858-1-clopez@suse.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index f661af7c85..0200b78e8e 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2553,6 +2553,10 @@ virtqueue_alloc_element(size_t sz,
 
     assert(sz >= sizeof(VuVirtqElement));
     elem = malloc(out_sg_end);
+    if (!elem) {
+        DPRINT("%s: failed to malloc virtqueue element\n", __func__);
+        return NULL;
+    }
     elem->out_num = out_num;
     elem->in_num = in_num;
     elem->in_sg = (void *)elem + in_sg_ofs;
@@ -2639,6 +2643,9 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
 
     /* Now copy what we have collected and mapped */
     elem = virtqueue_alloc_element(sz, out_num, in_num);
+    if (!elem) {
+        return NULL;
+    }
     elem->index = idx;
     for (i = 0; i < out_num; i++) {
         elem->out_sg[i] = iov[i];
-- 
MST


