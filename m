Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A848659D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:54:53 +0100 (CET)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TEC-00083t-SY
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:54:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Seh-0005EQ-Nh
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5See-0000y7-RV
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnGOLm7lT8LwKDlvBDBF9jJhmbOnmc0+Fq8lIxyOVLg=;
 b=bfA5L1p1S3odbDxbXg4HyluEfyWgChYUw1WW2WLt8EmO3vjWgfIT8mGRciDHiGyrSrOrJ6
 hnXdJTUIlrjfKf7cez1SWjc/yrzrPLGCaZ04/HQ7cvWkkqiGXm/1sySYiCtSE3vwm9bbGC
 1LUEkTXHr2yD3t2Tuf7OiarDSh4OpXs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-85AJpeVDODuYn1uIhD_ubQ-1; Thu, 06 Jan 2022 08:17:54 -0500
X-MC-Unique: 85AJpeVDODuYn1uIhD_ubQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w6-20020a05640234c600b003f916e1b615so1908261edc.17
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TnGOLm7lT8LwKDlvBDBF9jJhmbOnmc0+Fq8lIxyOVLg=;
 b=SJuxxUDj+OxMkc6bc18ZixUcxizyz2m+65rMh4ffmTNx28yymTxlKLY1CjFXkub/H0
 Zxh29VvfoZdC10auNdMwTVHP+hz9H35fAN+YHiiBkdU/7rTjidUIhZqAb/bjC7ON6x6r
 Gg1Fq23QQBnhNV1ySyvELBWTG2p8vEUKPRKvU5cNCc/xwcAHTb5Gw65KXvWp0N3muvXk
 0ohK7RYc8+TVVPEiL+9mqmvXHhSF/LdxQ1UojolDU9BSKRSsjcu0nogG/qP8PBZvxFNv
 qccHgfzBP7ZQxo3XQHGcs+IfvFGoqWG0dOLg4Uy36v2RjECZM758KwPWsT1s6K5NJKJh
 6tsg==
X-Gm-Message-State: AOAM530O/pzH5zOYXjdN3xvrl4TVQTd4m0rN4hLVTb6eNB1sMLoQK02i
 HToe3ScXwsm+FtAhLLUysD70zmBZAn13cbK3RU8RJLRO6GnmgmH2dCExCnTr9xNmgn5owYSZKdt
 HxJVkNjc30s7VMQ54I5TcDqH/hD5zMu+NIQzkbGnWEyWKysf5z2KPgPsn5U/9
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr46204017edd.407.1641475072583; 
 Thu, 06 Jan 2022 05:17:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxREDbZk5jA/1xuBHLVkP+/BDMfcGBLL9VnltSxcOCOerNEjdHav9ANBPDfftC/Omv6L+0J7w==
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr46203991edd.407.1641475072308; 
 Thu, 06 Jan 2022 05:17:52 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id dd5sm493669ejc.59.2022.01.06.05.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:51 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/52] util/oslib-posix: Avoid creating a single thread with
 MADV_POPULATE_WRITE
Message-ID: <20220106131534.423671-34-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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


