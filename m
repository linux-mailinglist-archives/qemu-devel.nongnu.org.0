Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45E274B56
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:45:09 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKq60-0008FR-OG
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpgK-0007ou-Gr
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:18:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55507
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpgI-0006fI-4j
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H43aEkn4ucruqYZhQ3PVuRfDgHbpJPGfshtNgSVV+is=;
 b=GpyYOcprQsCvBpGtM6Jzga80W4l7Qs7rHdhhm47FqcPj/YXCCUjujkMvG9/AP7eUqqJ5gm
 9ZNfX+RUkuo7BhtXpgGKlvm6T5HIaz4ewtVIPwQusqtQ9wprik2XFGHrccHxli/sfQVny8
 czjpICFQSJYSxjMRZADWzKqcnM3YEtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-oWIjaINsNTqB744vVeJ_oA-1; Tue, 22 Sep 2020 17:18:19 -0400
X-MC-Unique: oWIjaINsNTqB744vVeJ_oA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5707B801FD7;
 Tue, 22 Sep 2020 21:18:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2504D5DE86;
 Tue, 22 Sep 2020 21:18:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 09/14] qapi/doc.py: Remove one-letter variables
Date: Tue, 22 Sep 2020 17:17:57 -0400
Message-Id: <20200922211802.4083666-10-jsnow@redhat.com>
In-Reply-To: <20200922211802.4083666-1-jsnow@redhat.com>
References: <20200922211802.4083666-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 17:01:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/doc.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
index 74d017f60e..5f2b0cd51d 100644
--- a/scripts/qapi/doc.py
+++ b/scripts/qapi/doc.py
@@ -203,17 +203,17 @@ def texi_members(doc: QAPIDoc,
         items += texi_member(section.member, desc, '')
     if base:
         items += '@item The members of @code{%s}\n' % base.doc_type()
-    if variants:
-        for v in variants.variants:
-            when = ' when @code{%s} is @t{"%s"}%s' % (
-                variants.tag_member.name, v.name, texi_if(v.ifcond, " (", ")"))
-            if v.type.is_implicit():
-                assert not v.type.base and not v.type.variants
-                for m in v.type.local_members:
-                    items += texi_member(m, '', when)
-            else:
-                items += '@item The members of @code{%s}%s\n' % (
-                    v.type.doc_type(), when)
+    for variant in variants.variants if variants else ():
+        when = ' when @code{%s} is @t{"%s"}%s' % (
+            variants.tag_member.name, variant.name,
+            texi_if(variant.ifcond, " (", ")"))
+        if variant.type.is_implicit():
+            assert not variant.type.base and not variant.type.variants
+            for member in variant.type.local_members:
+                items += texi_member(member, '', when)
+        else:
+            items += '@item The members of @code{%s}%s\n' % (
+                variant.type.doc_type(), when)
     if not items:
         return ''
     return '\n@b{%s:}\n@table @asis\n%s@end table\n' % (what, items)
-- 
2.26.2


