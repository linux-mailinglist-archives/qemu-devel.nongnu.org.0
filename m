Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A358D68E5EE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 03:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPZxS-0002jG-Pw; Tue, 07 Feb 2023 21:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxQ-0002iP-Jy
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxO-00040T-2O
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675822389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wpKnnp2mX2s8IwhDrHQSvpNtqk7kr+dAB4saNeuHZQ=;
 b=HLyd6hNXvTNXa3vJtJgmh5q7+GWAWwGi2NAelZLpPJFKMoVTcA/qYwwVQ0fL4/h81098Ms
 4cCgkzZIiFRRe/ULJnUtwTJ6heItGYxa8CNmsAFIfFfmu5SoAv6RhEAzijILMcUTbQwjaA
 SXFwS/ulo3qc6u8+V3qeDKdUY8x1JWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-3rBiH0YwNBaQUH83fu_n3A-1; Tue, 07 Feb 2023 21:13:08 -0500
X-MC-Unique: 3rBiH0YwNBaQUH83fu_n3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A974800B23;
 Wed,  8 Feb 2023 02:13:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE8E61121314;
 Wed,  8 Feb 2023 02:13:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 6/7] qapi: remove _JSONObject
Date: Tue,  7 Feb 2023 21:13:05 -0500
Message-Id: <20230208021306.870657-7-jsnow@redhat.com>
In-Reply-To: <20230208021306.870657-1-jsnow@redhat.com>
References: <20230208021306.870657-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We can remove this alias as it only has two usages now, and no longer
pays for the confusion of "yet another type".

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py   | 13 +++----------
 scripts/qapi/parser.py |  5 ++---
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 83fa7a85b06..0a74feab92f 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -48,14 +48,6 @@
 from .source import QAPISourceInfo
 
 
-# Deserialized JSON objects as returned by the parser.
-# The values of this mapping are not necessary to exhaustively type
-# here (and also not practical as long as mypy lacks recursive
-# types), because the purpose of this module is to interrogate that
-# type.
-_JSONObject = Mapping[str, object]
-
-
 # See check_name_str(), below.
 valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
                         r'(x-)?'
@@ -192,7 +184,7 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
                 info, "%s name should not end in 'List'" % meta)
 
 
-def check_keys(value: _JSONObject,
+def check_keys(value: Mapping[str, object],
                info: QAPISourceInfo,
                source: str,
                required: Collection[str],
@@ -256,7 +248,8 @@ def check_flags(expr: QAPIExpression) -> None:
             expr.info, "flags 'allow-oob' and 'coroutine' are incompatible")
 
 
-def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
+def check_if(expr: Mapping[str, object],
+             info: QAPISourceInfo, source: str) -> None:
     """
     Validate the ``if`` member of an object.
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 88f6fdfa67b..315660e8671 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -42,9 +42,8 @@
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
 
-# FIXME: Consolidate and centralize definitions for _ExprValue,
-# JSONValue, and _JSONObject; currently scattered across several
-# modules.
+# FIXME: Consolidate and centralize definitions for _ExprValue and
+# JSONValue; currently scattered across several modules.
 
 
 # 3.6 workaround: can be removed when Python 3.7+ is our required version.
-- 
2.39.0


