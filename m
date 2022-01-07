Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B9487684
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:31:06 +0100 (CET)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nSb-0008Kd-8M
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:31:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3l-0001JC-1e
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3D-0001zX-70
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnGOLm7lT8LwKDlvBDBF9jJhmbOnmc0+Fq8lIxyOVLg=;
 b=WI4TdFTH+eWAwSt92vLD0FK9psmXGzfEZIhsJmYjwFTQvdYe/25aCRMd9A8Rv+y8ch4Q52
 0wxTnNLo6r/HNOGPP5SIk0/NlCDOFZ0NJcOQ/lbypvWrc3VFNL/iC4lsOKZHprG7LaUPZ/
 0OHMqksppzuMo15E60JuuTWpaV4laMQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-8IBhRD90NM2646DvbdCoYw-1; Fri, 07 Jan 2022 06:04:48 -0500
X-MC-Unique: 8IBhRD90NM2646DvbdCoYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so1354103wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TnGOLm7lT8LwKDlvBDBF9jJhmbOnmc0+Fq8lIxyOVLg=;
 b=yg1q+vRUIqzZ4pcVoR5PiP7ElCNE1MzIP6dw2m8emRPrfwj/kXTnm+Y4lNpnGPqqX6
 oS3yRsnEAdjg0Ae4rj4JkUbawypTTSBfMVXQCGoYZZ/ogz9GnQcqDSdUg/GxqAhRXWYc
 7WjmPZ/kUQgJheW3rFCb08u9LdCFj4P/z4L6n0jjdbirW1RyyQkcf7MQBwBz3ptyy4QG
 8bQQuG4AfQnK91ORoqMfUI8lW5Gf0qRl5hILDkZxvvhOv0+qpik6RhrHXmLuaWAxXUJL
 Do0U2ZpKxkbAPMZFf0MSbcgVVEWcLfKqIae2y3JLjRkdSbm/Nb07hPcrUyxXRVg8ssa3
 b2hg==
X-Gm-Message-State: AOAM531sfyQuL0aivSpZHzZWWUd7tAJCxkam9CyhSkGlCwdj47ZYZmZX
 mJazddcuepvpPr5FGkbLunixIULBNZAVRxqTnV79rnEAW4aWl7FMnH8WfYKc8RcZOXAqglEyxLM
 ncuT3soceVuIHHfhhhLl0c5JtCrlgN9TxYa1O6c6ZaBYdq+iPEp2k4iXcFHid
X-Received: by 2002:adf:a1d0:: with SMTP id v16mr8068660wrv.622.1641553486474; 
 Fri, 07 Jan 2022 03:04:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqUIXu61xSeOgWuQwjH7xYxk2x16Ctjya88vmdqXWu3lF7D2UGeq4M659cDbLa6uy9a/gJtg==
X-Received: by 2002:adf:a1d0:: with SMTP id v16mr8068640wrv.622.1641553486199; 
 Fri, 07 Jan 2022 03:04:46 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id r9sm4616859wrm.76.2022.01.07.03.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:45 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 33/55] util/oslib-posix: Avoid creating a single thread
 with MADV_POPULATE_WRITE
Message-ID: <20220107102526.39238-34-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


