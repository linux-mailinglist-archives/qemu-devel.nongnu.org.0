Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B03FFECF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:16:54 +0200 (CEST)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Bl-0004JG-Ak
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72f-0004tE-77
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72d-0008WA-5A
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJcPcmBTlXv680lRxXxIAa1x+QW8hhus++pQyqguqCw=;
 b=V/SfpYV7HmvJcM0PSpEHkrMoa4BgjNle/sjDb4SjLc5s+yzzqfpr9sYZ81SDdwOYvXNayI
 4P/0a62EDus10mELJcW0TjGFHhkarUD+GWH4yFulcrVpXKcJG6atm8diSl68oBfp3AONx8
 Onsx4IL3moTH0NOGFcMCdf5OalmeGTw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-ALShyFXlPoSao37Z8RQQPg-1; Fri, 03 Sep 2021 07:07:25 -0400
X-MC-Unique: ALShyFXlPoSao37Z8RQQPg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so1458750wro.10
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IJcPcmBTlXv680lRxXxIAa1x+QW8hhus++pQyqguqCw=;
 b=C5tDgzgiAqss40OqFXybevtcrqQc9HXkVCyMahMNJNBTVi775gy0LvwXkcM/eionh/
 7TrqAxuhG1RAqMLtqRqmFEyOd15SxjK/cl1dBdZDZPbOz6HE/1XTbcqSOxz1CV9la9bW
 tqDwUQrZQicJw8mXOLjhjZk8fynVdvqEGNiJFN8AXKPOEGeKOZSg+pZ1+K+92oMhJ2Fq
 jWHPTCho32FEMiM+ffnrtcg8t7A01ZCCS7PoBnkGsDpzuovswtW4rB4iat7Y625QtkDO
 uqDDAcst2XUv0zPf9hiMFbiV7F5f23OzF9aYiMMCsGuU9jnElIyd+qMSFmWGH0c6D7Ed
 pnMA==
X-Gm-Message-State: AOAM530LPveyc8UwpZDmJCqnJS9z4TRNvzobNmTfOVUbHjduycdGTTfe
 D2rmfykXT01F7MfoEeki1XEkD5YjaAWUM+fgxH8ehvHPdEGf5Snw6u9/Rn8cBdxez1wdJcBs0ou
 shbZNpNXah4WEtY0vo1Es/Elgvwwu2xd8i8qTUZ5Uey58gKpHXbEpyWfPjqmRTVwM
X-Received: by 2002:a7b:c014:: with SMTP id c20mr2767843wmb.81.1630667243404; 
 Fri, 03 Sep 2021 04:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx907zJ6KqO6waEP4roxOCLkQUMR0ZCH7m0SU6uYQccu8GgebksOgpFBvIeXxJzbM2ctmPo7w==
X-Received: by 2002:a7b:c014:: with SMTP id c20mr2767781wmb.81.1630667243141; 
 Fri, 03 Sep 2021 04:07:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 k25sm4747138wrd.42.2021.09.03.04.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/28] qapi: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:37 +0200
Message-Id: <20210903110702.588291-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/qapi-clone-visitor.c | 16 ++++++++--------
 qapi/qapi-visit-core.c    |  6 ++++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/qapi/qapi-clone-visitor.c b/qapi/qapi-clone-visitor.c
index c45c5caa3b8..fb38505d982 100644
--- a/qapi/qapi-clone-visitor.c
+++ b/qapi/qapi-clone-visitor.c
@@ -37,7 +37,7 @@ static bool qapi_clone_start_struct(Visitor *v, const char *name, void **obj,
         return true;
     }
 
-    *obj = g_memdup(*obj, size);
+    *obj = g_memdup2_qemu(*obj, size);
     qcv->depth++;
     return true;
 }
@@ -65,8 +65,8 @@ static GenericList *qapi_clone_next_list(Visitor *v, GenericList *tail,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Unshare the tail of the list cloned by g_memdup() */
-    tail->next = g_memdup(tail->next, size);
+    /* Unshare the tail of the list cloned by g_memdup2() */
+    tail->next = g_memdup2_qemu(tail->next, size);
     return tail->next;
 }
 
@@ -83,7 +83,7 @@ static bool qapi_clone_type_int64(Visitor *v, const char *name, int64_t *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -93,7 +93,7 @@ static bool qapi_clone_type_uint64(Visitor *v, const char *name,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -103,7 +103,7 @@ static bool qapi_clone_type_bool(Visitor *v, const char *name, bool *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -114,7 +114,7 @@ static bool qapi_clone_type_str(Visitor *v, const char *name, char **obj,
 
     assert(qcv->depth);
     /*
-     * Pointer was already cloned by g_memdup; create fresh copy.
+     * Pointer was already cloned by g_memdup2; create fresh copy.
      * Note that as long as qobject-output-visitor accepts NULL instead of
      * "", then we must do likewise. However, we want to obey the
      * input visitor semantics of never producing NULL when the empty
@@ -130,7 +130,7 @@ static bool qapi_clone_type_number(Visitor *v, const char *name, double *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index a641adec51e..ebabe63b6ea 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -413,8 +413,10 @@ bool visit_type_enum(Visitor *v, const char *name, int *obj,
     case VISITOR_OUTPUT:
         return output_type_enum(v, name, obj, lookup, errp);
     case VISITOR_CLONE:
-        /* nothing further to do, scalar value was already copied by
-         * g_memdup() during visit_start_*() */
+        /*
+         * nothing further to do, scalar value was already copied by
+         * g_memdup2() during visit_start_*()
+         */
         return true;
     case VISITOR_DEALLOC:
         /* nothing to deallocate for a scalar */
-- 
2.31.1


