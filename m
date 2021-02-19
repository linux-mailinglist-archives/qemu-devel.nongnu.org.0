Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B731FC11
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:36:14 +0100 (CET)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7pF-0002nj-EA
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76P-0004l9-EE
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76L-0004hm-EY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNrjT1Likzm4FHeJKHVlEcPZfAcKmK35Uffa+RKx6sw=;
 b=DZLoUYcTfjhHpdB62nlyTcMpJEhvN7Ai77b69zZGkg5gVGlY4oqiCUCCbSa/FVZwzqEcYf
 HO3i4DZMwU9iXNaQqcwFYNLPrkfoRJIksmS5U+1prZOxe5tRcF9yRu2usCwozWUXbBdV/U
 1gsNtIg/IF0tummeZvGyqdZqrqS5oF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-gjbHWZ1fPnqDU0WxUqyZ8Q-1; Fri, 19 Feb 2021 09:49:44 -0500
X-MC-Unique: gjbHWZ1fPnqDU0WxUqyZ8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE5C256C9E;
 Fri, 19 Feb 2021 14:49:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E0675D720;
 Fri, 19 Feb 2021 14:49:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D96B112EFE5; Fri, 19 Feb 2021 15:49:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] qapi/introspect.py: Add docstrings to _gen_tree and
 _tree_to_qlit
Date: Fri, 19 Feb 2021 15:49:36 +0100
Message-Id: <20210219144939.604488-16-armbru@redhat.com>
In-Reply-To: <20210219144939.604488-1-armbru@redhat.com>
References: <20210219144939.604488-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-16-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Doc string improvements squashed in]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 05c1a196e9..15cce6854d 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -100,6 +100,15 @@ class Annotated(Generic[_ValueT]):
 def _tree_to_qlit(obj: JSONValue,
                   level: int = 0,
                   dict_value: bool = False) -> str:
+    """
+    Convert the type tree into a QLIT C string, recursively.
+
+    :param obj: The value to convert.
+                This value may not be Annotated when dict_value is True.
+    :param level: The indentation level for this particular value.
+    :param dict_value: True when the value being processed belongs to a
+                       dict key; which suppresses the output indent.
+    """
 
     def indent(level: int) -> str:
         return level * 4 * ' '
@@ -246,6 +255,17 @@ const QLitObject %(c_name)s = %(c_string)s;
     def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
                   ifcond: Sequence[str],
                   features: Optional[List[QAPISchemaFeature]]) -> None:
+        """
+        Build and append a SchemaInfo object to self._trees.
+
+        :param name: The SchemaInfo's name.
+        :param mtype: The SchemaInfo's meta-type.
+        :param obj: Additional SchemaInfo members, as appropriate for
+                    the meta-type.
+        :param ifcond: Conditionals to apply to the SchemaInfo.
+        :param features: The SchemaInfo's features.
+                         Will be omitted from the output if empty.
+        """
         comment: Optional[str] = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
             if not self._unmask:
-- 
2.26.2


