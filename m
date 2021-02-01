Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7B930B0C8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:51:31 +0100 (CET)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fEQ-0001ma-93
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1r-0003R5-KC
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1p-0005mq-1H
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3+ryZNwoGVvGYw7CoQhMgPDqLmYLIIR3HRlFNFcfdc=;
 b=HJzvfVO/DkIF2IaRZSLFIPfndQpJ6HsJrnmLLOB3HlUXnfVochncY5wc/IGVqZyGiyispG
 Ab0sgjKKncRV92zsjLl7zNzxbrQsXR9QbuwpvzG40oveduYLbav5CBvPXxBKCcae2cjOft
 nMxR8LxU75z2lLq3ZvrrpyKdV3gSQb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-gW2VWeIrOqK-rw7efwsxVw-1; Mon, 01 Feb 2021 14:38:25 -0500
X-MC-Unique: gW2VWeIrOqK-rw7efwsxVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 408BA1005D4C;
 Mon,  1 Feb 2021 19:38:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20DA760C05;
 Mon,  1 Feb 2021 19:38:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/16] qapi: type 'info' as Optional[QAPISourceInfo]
Date: Mon,  1 Feb 2021 14:37:46 -0500
Message-Id: <20210201193747.2169670-16-jsnow@redhat.com>
In-Reply-To: <20210201193747.2169670-1-jsnow@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For everything typed so far, type this parameter as
Optional[QAPISourceInfo].

In the most generic case, QAPISchemaEntity's info field may be None to
represent types that come from built-in definitions. Although some
Entity types may not currently have any built-in definitions, it is not
easily possible to constrain the type except on an ad-hoc basis using
assertions.

It's easier and simpler, then, to just say it's always an Optional type.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py | 2 +-
 scripts/qapi/events.py   | 2 +-
 scripts/qapi/gen.py      | 2 +-
 scripts/qapi/types.py    | 2 +-
 scripts/qapi/visit.py    | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 13a9dcaf894..54af519f44d 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -296,7 +296,7 @@ def visit_end(self) -> None:
 
     def visit_command(self,
                       name: str,
-                      info: QAPISourceInfo,
+                      info: Optional[QAPISourceInfo],
                       ifcond: List[str],
                       features: List[QAPISchemaFeature],
                       arg_type: Optional[QAPISchemaObjectType],
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 079c666ec69..8c57deb2b89 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -213,7 +213,7 @@ def visit_end(self) -> None:
 
     def visit_event(self,
                     name: str,
-                    info: QAPISourceInfo,
+                    info: Optional[QAPISourceInfo],
                     ifcond: List[str],
                     features: List[QAPISchemaFeature],
                     arg_type: Optional[QAPISchemaObjectType],
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index ac3d3e687ef..63549cc8d47 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -325,7 +325,7 @@ def visit_module(self, name: str) -> None:
             self._add_module(name, self._user_blurb)
             self._begin_user_module(name)
 
-    def visit_include(self, name: str, info: QAPISourceInfo) -> None:
+    def visit_include(self, name: str, info: Optional[QAPISourceInfo]) -> None:
         relname = os.path.relpath(self._module_filename(self._what, name),
                                   os.path.dirname(self._genh.fname))
         self._genh.preamble_add(mcgen('''
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index dbf58c0b91d..2bdd6268476 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -350,7 +350,7 @@ def visit_object_type(self,
 
     def visit_alternate_type(self,
                              name: str,
-                             info: QAPISourceInfo,
+                             info: Optional[QAPISourceInfo],
                              ifcond: List[str],
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 568ba35592c..22e62df9017 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -336,7 +336,7 @@ def _begin_user_module(self, name: str) -> None:
 
     def visit_enum_type(self,
                         name: str,
-                        info: QAPISourceInfo,
+                        info: Optional[QAPISourceInfo],
                         ifcond: List[str],
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
@@ -378,7 +378,7 @@ def visit_object_type(self,
 
     def visit_alternate_type(self,
                              name: str,
-                             info: QAPISourceInfo,
+                             info: Optional[QAPISourceInfo],
                              ifcond: List[str],
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
-- 
2.29.2


