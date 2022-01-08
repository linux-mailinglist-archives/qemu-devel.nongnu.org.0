Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB79488096
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:34:47 +0100 (CET)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60d4-0004MC-6B
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Ar-0004sF-Mf
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Aq-0002hy-3R
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LQElm98aHXjiuFao5xnlm6/WpTSh3F0rFcwVGDak2Y=;
 b=O2BMID/xyH5rO1ahnmP1YUnyXRCAtYLQxoa0Pxz5Uljk3sHslA0nzIKipAazZw7MGAbQdu
 pr6ZMKhlLiquzrjcU+b10h8fMhh0mTjy/AN29OQP5hI9k+Ca8bj9zODbwdmLCDZ3TMSy8a
 m9ex34G2ZX4nYOyL5GqquZDgNWyfw3Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-CV53PyQXNk2V6Qvfb8UZzg-1; Fri, 07 Jan 2022 20:05:28 -0500
X-MC-Unique: CV53PyQXNk2V6Qvfb8UZzg-1
Received: by mail-wr1-f72.google.com with SMTP id
 k14-20020adfb34e000000b001a5d060e1edso755840wrd.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9LQElm98aHXjiuFao5xnlm6/WpTSh3F0rFcwVGDak2Y=;
 b=2zZqIGl75spADC9ezG45L8zxIRthKTAMj2z2D0RQ+6rcwNZUhklKi8rJc2K0V1VjSC
 81LNFGmdnn5w3a2hz5thVY7DDNuyQsYN/xqxgvcd+C82S3HqglN39JGFsDo7NFYVFfq7
 Jne/7/HDLZtXmh+AsU5vNdYUruTG6pdTTFxWk8GdlbW2BOhWWTkhG86oXHaxGGnDQJ21
 PgQHWPAFn3qXgXX3KO+GhuQj4y8TFgTSOIUSA8Q7eAA41MJ0WdhlcS8h2+VWfr0oRlsv
 4M1oH9+sCQIzjomuDkA77yjMmPJNQZlMtiweK2/YkOd3jGgCguJ8WN0Ylo9Q5Vz++nBG
 PZEw==
X-Gm-Message-State: AOAM530aGapwl+bXgAX8StA/DVNWkdB/2LZP8zpU8KD81J1uKsqxqvtw
 QZCFxTmwTKo+IFrIo3eecU+c5NFj51BZ30JEu2BCI1VNkz5MkfxKy7J4/NbmOpO3E+dBpDKBMdi
 u1jq7XWTf2Q+31kOK7D7gX1FRA3WnjF81HACZmQXhqCZqqziVzzmBLjIJJl83
X-Received: by 2002:a5d:588f:: with SMTP id n15mr57349888wrf.279.1641603927181; 
 Fri, 07 Jan 2022 17:05:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIe+zdeY9s1hgnVmP3hSEbm5vnj1qeGsU9yGC9jyumyAkBpa4yBbyS8cNjnu7WlA+kVbrulg==
X-Received: by 2002:a5d:588f:: with SMTP id n15mr57349875wrf.279.1641603926927; 
 Fri, 07 Jan 2022 17:05:26 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id n4sm236750wrc.1.2022.01.07.17.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:26 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 34/55] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
Message-ID: <20220108003423.15830-35-mst@redhat.com>
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


