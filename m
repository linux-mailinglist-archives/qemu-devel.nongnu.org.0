Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629B038B321
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:24:41 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkXQ-0006zC-FB
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljkR9-0005Da-7W
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljkR7-0003y3-9O
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621523888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMwqCxL0/Oie3R9kHWhs0nBDJoiSZY0mAFzDPUPiEcA=;
 b=b38dfIX0K3M4/GlV3Uba3Og+LhLLCBlB9B8QfdOUxoMKYQufTAC/C1+RGlfhOu5hsOSgQs
 eXlgYDWy7IXFepK2NiJDAiTHwt9huVwqPTSvhy2B+P8sHXNgFZM2VamgdaMMZehrILQMOb
 my2w0oSPeOMCTpN8PAdMPaGt5QKEq6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-efBEHYPgOt-IqSewIkjizg-1; Thu, 20 May 2021 11:18:04 -0400
X-MC-Unique: efBEHYPgOt-IqSewIkjizg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 140F3107ACE3;
 Thu, 20 May 2021 15:18:03 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74FA36062F;
 Thu, 20 May 2021 15:18:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] qapi/parser: Remove _JSONObject
Date: Thu, 20 May 2021 11:17:59 -0400
Message-Id: <20210520151759.91929-4-jsnow@redhat.com>
In-Reply-To: <20210520151759.91929-1-jsnow@redhat.com>
References: <20210520151759.91929-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use TopLevelExpr where appropriate now (Any function that accepts
exclusively a Top Level Expression), and replace any other remaining
user with a generic Dict[str, object].

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 6d89343897c..005fbf3a7d8 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -44,18 +44,10 @@
 
 from .common import c_name
 from .error import QAPISemError
-from .parser import ParsedExpression
+from .parser import ParsedExpression, TopLevelExpr
 from .source import QAPISourceInfo
 
 
-# Deserialized JSON objects as returned by the parser.
-# The values of this mapping are not necessary to exhaustively type
-# here (and also not practical as long as mypy lacks recursive
-# types), because the purpose of this module is to interrogate that
-# type.
-_JSONObject = Dict[str, object]
-
-
 # See check_name_str(), below.
 valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
                         r'(x-)?'
@@ -192,7 +184,7 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
                 info, "%s name should not end in '%s'" % (meta, name[-4:]))
 
 
-def check_keys(value: _JSONObject,
+def check_keys(value: Dict[str, object],
                info: QAPISourceInfo,
                source: str,
                required: Collection[str],
@@ -229,11 +221,11 @@ def pprint(elems: Iterable[str]) -> str:
                pprint(unknown), pprint(allowed)))
 
 
-def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_flags(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
     Ensure flag members (if present) have valid values.
 
-    :param expr: The expression to validate.
+    :param expr: The `TopLevelExpr` to validate.
     :param info: QAPI schema source file information.
 
     :raise QAPISemError:
@@ -257,7 +249,8 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
                                  "are incompatible")
 
 
-def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
+def check_if(expr: Dict[str, object], info: QAPISourceInfo,
+             source: str) -> None:
     """
     Normalize and validate the ``if`` member of an object.
 
@@ -430,9 +423,9 @@ def check_features(features: Optional[object],
         check_if(feat, info, source)
 
 
-def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_enum(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as an ``enum`` definition.
+    Normalize and validate this `TopLevelExpr` as an ``enum`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -468,9 +461,9 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_if(member, info, source)
 
 
-def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_struct(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as a ``struct`` definition.
+    Normalize and validate this `TopLevelExpr` as a ``struct`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -485,9 +478,9 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
     check_type(expr.get('base'), info, "'base'")
 
 
-def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_union(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as a ``union`` definition.
+    Normalize and validate this `TopLevelExpr` as a ``union`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -522,9 +515,9 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_type(value['type'], info, source, allow_array=not base)
 
 
-def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_alternate(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as an ``alternate`` definition.
+    Normalize and validate this `TopLevelExpr` as an ``alternate`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -548,9 +541,9 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_type(value['type'], info, source)
 
 
-def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_command(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as a ``command`` definition.
+    Normalize and validate this `TopLevelExpr` as a ``command`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
@@ -568,9 +561,9 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
     check_type(rets, info, "'returns'", allow_array=True)
 
 
-def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
+def check_event(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
     """
-    Normalize and validate this expression as an ``event`` definition.
+    Normalize and validate this `TopLevelExpr` as an ``event`` definition.
 
     :param expr: The expression to validate.
     :param info: QAPI schema source file information.
-- 
2.30.2


