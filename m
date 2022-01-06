Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6BC486598
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:53:32 +0100 (CET)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TCt-00045O-Pn
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:53:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sej-0005Hc-LK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Seg-0000z5-Ax
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LQElm98aHXjiuFao5xnlm6/WpTSh3F0rFcwVGDak2Y=;
 b=PLrh0Z+vkWUEOP6Y0/qPzQ36x97Y9RwWwb9UVRa+OFazI9DE5OtnbZxLx3Kh7C1lQyc6rg
 WR/4pILYG9Vj6iellUEldC7m4M44z4gDyeS66eKnpBG7kTcWAwopbeNx2gg+msVfPM2AVQ
 nRmWsaj1B2ix7TPkl0jYavhvY6zULZw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-_VU8r7-MOJuF4l8ifr4aVA-1; Thu, 06 Jan 2022 08:17:58 -0500
X-MC-Unique: _VU8r7-MOJuF4l8ifr4aVA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z10-20020a05640235ca00b003f8efab3342so1950559edc.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9LQElm98aHXjiuFao5xnlm6/WpTSh3F0rFcwVGDak2Y=;
 b=GKjWxLRd40GYNIP9Jt3RbGU2Rtq9rDGxS6eCJNo7CobJnylqRx/ORDtYA7Xj1HJ9Th
 x5q3JzCtMMnRH4tWP7KgS28EhtON0ioCGasXamsIOBYl2S4UGTd+4KvRLIZyjn4gXWJy
 p3kSLytCog8rPspjgv56ZmwC2fPefpjgzWBvNGIbbWhsue96hyqW/IY7ZhjcJfqtSffj
 qn17xeTCWmguGG8BvH9MWqAmk2veFMLTHoGZ3LkMC4MirmCtEFetI9hYz4yYH7wJ6z1V
 e+gD3SLC5tOIoNZl3hetnvZTdlMp1C97yUd3i57e6P1AuUx5NX9W0iVs3PqKaJg/hv0C
 rhHA==
X-Gm-Message-State: AOAM533u9UEpNlm1EGN4cs0ZjV4P0YjperxGhsGP+WiGAc0K1u+6tywY
 0nz4Vg1bU3dzCGbcLSj7LN0F774Yt1hLXvTWVAM98CvNSPwFW6KQZ1h3jMNW/fNJy13rTLFtASt
 LIRyUySDqNFu7cdB0FDnY160A5+int2m44ky+pMhaFOGaA1ZusDW63GLiTyro
X-Received: by 2002:a17:906:5509:: with SMTP id
 r9mr2334033ejp.389.1641475075804; 
 Thu, 06 Jan 2022 05:17:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY+U8jtuQeB1mop4I/8s59M7oPnHiG4RUQJAhAn0e9spoj3i4MKpGm9J2cy6ejJmfe4bXAcQ==
X-Received: by 2002:a17:906:5509:: with SMTP id
 r9mr2334013ejp.389.1641475075612; 
 Thu, 06 Jan 2022 05:17:55 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id l16sm731820edb.3.2022.01.06.05.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:54 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/52] util/oslib-posix: Support concurrent os_mem_prealloc()
 invocation
Message-ID: <20220106131534.423671-35-mst@redhat.com>
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

Add a mutex to protect the SIGBUS case, as we cannot mess concurrently
with the sigbus handler and we have to manage the global variable
sigbus_memset_context. The MADV_POPULATE_WRITE path can run
concurrently.

Note that page_mutex and page_cond are shared between concurrent
invocations, which shouldn't be a problem.

This is a preparation for future virtio-mem prealloc code, which will call
os_mem_prealloc() asynchronously from an iothread when handling guest
requests.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-7-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/oslib-posix.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index efa4f96d56..9829149e4b 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -95,6 +95,7 @@ typedef struct MemsetThread MemsetThread;
 
 /* used by sigbus_handler() */
 static MemsetContext *sigbus_memset_context;
+static QemuMutex sigbus_mutex;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
@@ -625,6 +626,7 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
                      Error **errp)
 {
+    static gsize initialized;
     int ret;
     struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
@@ -638,6 +640,12 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     use_madv_populate_write = madv_populate_write_possible(area, hpagesize);
 
     if (!use_madv_populate_write) {
+        if (g_once_init_enter(&initialized)) {
+            qemu_mutex_init(&sigbus_mutex);
+            g_once_init_leave(&initialized, 1);
+        }
+
+        qemu_mutex_lock(&sigbus_mutex);
         memset(&act, 0, sizeof(act));
         act.sa_handler = &sigbus_handler;
         act.sa_flags = 0;
@@ -665,6 +673,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
             perror("os_mem_prealloc: failed to reinstall signal handler");
             exit(1);
         }
+        qemu_mutex_unlock(&sigbus_mutex);
     }
 }
 
-- 
MST


