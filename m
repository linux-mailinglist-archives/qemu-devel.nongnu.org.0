Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D57487677
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:27:59 +0100 (CET)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nPV-0000sl-7Q
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:27:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3l-0001JF-7q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3Q-0001zc-Cs
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LQElm98aHXjiuFao5xnlm6/WpTSh3F0rFcwVGDak2Y=;
 b=boZVSPzzqwwTrW5p6cd7U3NIKN5zz5adlfCyHCJQNoEzPcI04hzKYQhp/1NGERDntDCcQQ
 g6FR4E/Y6qkynjkz+Zut44DfE1AXcoDmgc1Ep7TwQXYdTsdWjFlHgk/RKOMflGLMwERTrb
 xsGQU3NZg5x6GYl3/GI4Jkp00NRvR/I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-L3E51C9rOR2TvEYEIGfYOA-1; Fri, 07 Jan 2022 06:04:51 -0500
X-MC-Unique: L3E51C9rOR2TvEYEIGfYOA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i81-20020a1c3b54000000b003467c58cbddso4119472wma.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9LQElm98aHXjiuFao5xnlm6/WpTSh3F0rFcwVGDak2Y=;
 b=6VakFfTqcwJ5NYPNH7u0k+UUDUl6GD1aSvX3k79+EpwqkfERHzj9rORDH1HaTcrwOz
 218gr4d60BxeDcKAwlvwjv0t71M9dgdOSQqg1G/fORyAdT/chRpNPyZtnYlriFPbsxqP
 8nIEMq9ibD6UMEQFqZq3LRZtMda6VhVS/RS2tNBX1jCGygyUOjh6AT5Lhr4iTu5bbokP
 ydkjMLcXUplTBFboYk7PxH9sakgRQLgUg59jaLxCoI/grA+qx5orhdIM3jvoVtWykN7Z
 Ro76GpGoP2n1dZ4xO4iSwJOZFwx9YedyqPlU8XV0oGuYYeU3x9ziYSatAO0botUIhgh+
 dOuQ==
X-Gm-Message-State: AOAM530Vq+8xkkpok/Fr5DYU0e6ry7ZBun4p9PY5Ez/O/aZi64O+ShB4
 TN3bii8SOJL0ZOTrfQYluDHIH+9PlWjG6b9rXDhQf88DcimvOQ66K72Wp2G4W344f6DBBOmJK7m
 8K01FEkZrPcFGOQcR3dviPudtmp42l6KSZExzDElgzTd/Peie5AlWnY4fOOm2
X-Received: by 2002:a05:6000:545:: with SMTP id
 b5mr37829626wrf.452.1641553489403; 
 Fri, 07 Jan 2022 03:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN+/jroDqJZumZsHVbpVTzxlseVKLoXCKklUzLQQSZhiNaVTNg7bkBskCL2Bi4tmj/9Mbs8Q==
X-Received: by 2002:a05:6000:545:: with SMTP id
 b5mr37829600wrf.452.1641553489166; 
 Fri, 07 Jan 2022 03:04:49 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id d11sm4796099wri.101.2022.01.07.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:48 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 34/55] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
Message-ID: <20220107102526.39238-35-mst@redhat.com>
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


