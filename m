Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D66E6FBE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:59:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pouGx-0001Ju-6Y; Tue, 18 Apr 2023 18:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGu-0001JZ-0W
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGr-0007Cd-HZ
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681858675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4L+QjbUgvxpJ4DIJDYUyZ6+HndeQMO+nRb8rfrhMnE=;
 b=OWJZZ+/o/L7+W3B7mcpg5RxI3DI1NbQTM1KILJI6rE4sV7kq+RmFshWiMkPToSyvj/Bfn9
 12Lt/aMgsu9ykTxSNPeEuqD5cc6Lz4Gy2Mmntz6iWIzMAko9uDz0da8WTQW6TvQsg0pz1L
 q3PF99cQt2RW8PcU/qO2YXrZi1G98A8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-jUM82trFN225Y8W0EuUxng-1; Tue, 18 Apr 2023 18:57:54 -0400
X-MC-Unique: jUM82trFN225Y8W0EuUxng-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef4d54d84cso4323846d6.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 15:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681858673; x=1684450673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4L+QjbUgvxpJ4DIJDYUyZ6+HndeQMO+nRb8rfrhMnE=;
 b=VLgL8R+N95zF+iAGO1k4HY/NvvFrCVVzQglBWL5EiH9Gj2ID8Pr+k1/4tb8+yxfxP1
 l9dSYxKp8Tjqb9JoR4W2l6Us26yIA5sWI+G2TKy/uQgPirm6h9whT1ixKzwLG9ZXMzdA
 iuUSYwrq/M9ahos+cXFYOdwgO30/6zxwDIdv+pQziO9kVt1m+6dz/IP8TuRTD4Ri2s8v
 LACZHC0kcE2k2qPKEGHaSFtLWSabC5bsNWNf8RfUjl+Jjb+MbM4MuYYwXqfE/y1OgArE
 WLdpxPg64PK0gjk1NklFJ6aljnEW5LIttrnw1rybWqxXwZyQEe7PhQDGYVkilhDPzPbA
 en/A==
X-Gm-Message-State: AAQBX9cM30xgvcpy9L+lvZzaxe612LM45Mz7dn2SN6Qcrg+MC4U1EqVL
 SewLLdD4eKC9Q4UCgplvifhwR5mMXdw6/IImgW4UkWkyw443DZzQqtOiyj/xqfFHkAv6LyJWRiX
 pIrYNay3syACIemuzgz2QaR18wCy+CWVhSmFXI7EpYRHEFKVUEViPNQjBV6sLziZLahEPB+JO
X-Received: by 2002:a05:6214:400e:b0:5ef:4436:b92e with SMTP id
 kd14-20020a056214400e00b005ef4436b92emr23260682qvb.5.1681858673514; 
 Tue, 18 Apr 2023 15:57:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350a2hXbPYqmGmzNmfrdkTGXs5BS0yd3kukch2d1tymdkgmaM9kkLJL8J9+X6Zly96XjBoIiMag==
X-Received: by 2002:a05:6214:400e:b0:5ef:4436:b92e with SMTP id
 kd14-20020a056214400e00b005ef4436b92emr23260658qvb.5.1681858673129; 
 Tue, 18 Apr 2023 15:57:53 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 i3-20020ad45383000000b005e3c45c5cbdsm2937330qvv.96.2023.04.18.15.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:57:51 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com
Subject: [PATCH 1/3] hostmem: Detect and cache fs type for file hostmem
Date: Tue, 18 Apr 2023 18:57:47 -0400
Message-Id: <20230418225749.1049185-2-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230418225749.1049185-1-peterx@redhat.com>
References: <20230418225749.1049185-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Detect the file system for a memory-backend-file object and cache it within
the object if possible when CONFIG_LINUX (using statfs).

Only support the two important types of memory (tmpfs, hugetlbfs) and keep
the rest as "unknown" for now.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 backends/hostmem-file.c  | 37 ++++++++++++++++++++++++++++++++++++-
 include/sysemu/hostmem.h |  1 +
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 25141283c4..2484e45a11 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -18,13 +18,17 @@
 #include "sysemu/hostmem.h"
 #include "qom/object_interfaces.h"
 #include "qom/object.h"
+#ifdef CONFIG_LINUX
+#include <sys/vfs.h>
+#include <linux/magic.h>
+#endif
 
 OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendFile, MEMORY_BACKEND_FILE)
 
 
 struct HostMemoryBackendFile {
     HostMemoryBackend parent_obj;
-
+    __fsword_t fs_type;
     char *mem_path;
     uint64_t align;
     bool discard_data;
@@ -52,6 +56,15 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
         return;
     }
 
+#ifdef CONFIG_LINUX
+    struct statfs fs;
+    if (!statfs(fb->mem_path, &fs)) {
+        fb->fs_type = fs.f_type;
+    } else {
+        fb->fs_type = 0;
+    }
+#endif
+
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
@@ -181,6 +194,28 @@ static void file_backend_unparent(Object *obj)
     }
 }
 
+const char *file_memory_backend_get_fs_type(Object *obj)
+{
+#ifdef CONFIG_LINUX
+    HostMemoryBackendFile *fb = (HostMemoryBackendFile *)
+        object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_FILE);
+
+    if (!fb) {
+        goto out;
+    }
+
+    switch (fb->fs_type) {
+    case TMPFS_MAGIC:
+        return "tmpfs";
+    case HUGETLBFS_MAGIC:
+        return "hugetlbfs";
+    }
+
+out:
+#endif
+    return "unknown";
+}
+
 static void
 file_backend_class_init(ObjectClass *oc, void *data)
 {
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 39326f1d4f..0354cffa6b 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -81,5 +81,6 @@ void host_memory_backend_set_mapped(HostMemoryBackend *backend, bool mapped);
 bool host_memory_backend_is_mapped(HostMemoryBackend *backend);
 size_t host_memory_backend_pagesize(HostMemoryBackend *memdev);
 char *host_memory_backend_get_name(HostMemoryBackend *backend);
+const char *file_memory_backend_get_fs_type(Object *obj);
 
 #endif
-- 
2.39.1


