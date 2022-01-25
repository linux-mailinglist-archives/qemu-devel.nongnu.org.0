Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB149B9BC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:09:52 +0100 (CET)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPKJ-00075J-6J
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCPIA-0005fP-RU
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCPI7-0004Kw-Ds
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643130454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3vZEJPyCIXRIwrjv/vH+KgXa5LXIVDKVoDJ9vJcXJ8=;
 b=LAjdDWop78acfTERrS+Gpc4huR5EYST8LLyKowe2lKroAgJHqR7dAHxGHAmY1CKz1cSdHl
 noPBdunao1PJCT9TF4RuRUmT10Qh23JtEAOmi1AieRGEIfJXzz4gDNcE3OJn7gqtmV+AFV
 HsjEk2HZZTLrEgyh446rswQJr45/dbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-D8daUbBGOC-ogwf1nrYJrQ-1; Tue, 25 Jan 2022 12:07:33 -0500
X-MC-Unique: D8daUbBGOC-ogwf1nrYJrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 999588143E5
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 17:07:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D99079A19;
 Tue, 25 Jan 2022 17:07:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] migration: Remove unused minimum_version_id_old and
 load_state_old
Date: Tue, 25 Jan 2022 18:07:16 +0100
Message-Id: <20220125170716.7903-2-quintela@redhat.com>
In-Reply-To: <20220125170716.7903-1-quintela@redhat.com>
References: <20220125170716.7903-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They were already deprecated and after ppc removal no users on the
tree. RIP.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 docs/devel/migration.rst    | 7 +------
 include/migration/vmstate.h | 2 --
 migration/vmstate.c         | 6 ------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 2401253482..98c5e4a13f 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -394,14 +394,9 @@ You can see that there are several version fields:
 - ``version_id``: the maximum version_id supported by VMState for that device.
 - ``minimum_version_id``: the minimum version_id that VMState is able to understand
   for that device.
-- ``minimum_version_id_old``: For devices that were not able to port to vmstate, we can
-  assign a function that knows how to read this old state. This field is
-  ignored if there is no ``load_state_old`` handler.
 
 VMState is able to read versions from minimum_version_id to
-version_id.  And the function ``load_state_old()`` (if present) is able to
-load state from minimum_version_id_old to minimum_version_id.  This
-function is deprecated and will be removed when no more users are left.
+version_id.
 
 There are *_V* forms of many ``VMSTATE_`` macros to load fields for version dependent fields,
 e.g.
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 017c03675c..ad24aa1934 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -181,9 +181,7 @@ struct VMStateDescription {
     int unmigratable;
     int version_id;
     int minimum_version_id;
-    int minimum_version_id_old;
     MigrationPriority priority;
-    LoadStateHandler *load_state_old;
     int (*pre_load)(void *opaque);
     int (*post_load)(void *opaque, int version_id);
     int (*pre_save)(void *opaque);
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 05f87cdddc..36ae8b9e19 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -90,12 +90,6 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         return -EINVAL;
     }
     if  (version_id < vmsd->minimum_version_id) {
-        if (vmsd->load_state_old &&
-            version_id >= vmsd->minimum_version_id_old) {
-            ret = vmsd->load_state_old(f, opaque, version_id);
-            trace_vmstate_load_state_end(vmsd->name, "old path", ret);
-            return ret;
-        }
         error_report("%s: incoming version_id %d is too old "
                      "for local minimum version_id  %d",
                      vmsd->name, version_id, vmsd->minimum_version_id);
-- 
2.34.1


