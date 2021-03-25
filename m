Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0B348915
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:27:58 +0100 (CET)
Received: from localhost ([::1]:39876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJTJ-0001Rd-Ls
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6V-0002N2-6R
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6S-0008V8-4d
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI1DqCHDMOwRH4eVuX2MLP4sz4erf8MUt7oEgFn+W7w=;
 b=HA67bNGrzE1mv8ZWvcSoM3pKB5K+0T4z4nPbGGIvpH9Vr34NoLXlg6+G5jooar5m2P0rfC
 2RSc5h+p2hgPuOHAKm9X23/PjDYlOQq+rTZE6Rdci3uoxP2v4ES7rQT3NIyKF6y/DmT2U5
 2cDx1MDNdC4M9izK1RazYYCVSXk2juY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-DECAvpxXO0OBes3CnXPL0g-1; Thu, 25 Mar 2021 02:04:15 -0400
X-MC-Unique: DECAvpxXO0OBes3CnXPL0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA44A190B2A5;
 Thu, 25 Mar 2021 06:04:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 219B8866C7;
 Thu, 25 Mar 2021 06:04:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 12/19] qapi/expr.py: add type hint annotations
Date: Thu, 25 Mar 2021 02:03:49 -0400
Message-Id: <20210325060356.4040114-13-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Annotations do not change runtime behavior.
This commit *only* adds annotations.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py  | 68 +++++++++++++++++++++++++++----------------
 scripts/qapi/mypy.ini |  5 ----
 2 files changed, 43 insertions(+), 30 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 7e22723b50..ea9d39fcf2 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,7 +15,15 @@
 # See the COPYING file in the top-level directory.
 
 import re
-from typing import Dict, Optional, cast
+from typing import (
+    Collection,
+    Dict,
+    Iterable,
+    List,
+    Optional,
+    Union,
+    cast,
+)
 
 from .common import c_name
 from .error import QAPISemError
@@ -37,12 +45,14 @@
                         r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)
 
 
-def check_name_is_str(name, info, source):
+def check_name_is_str(name: object,
+                      info: QAPISourceInfo,
+                      source: str) -> None:
     if not isinstance(name, str):
         raise QAPISemError(info, "%s requires a string name" % source)
 
 
-def check_name_str(name, info, source):
+def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
     # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
     # and 'q_obj_*' implicit type names.
     match = valid_name.match(name)
@@ -51,16 +61,16 @@ def check_name_str(name, info, source):
     return match.group(3)
 
 
-def check_name_upper(name, info, source):
+def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
     stem = check_name_str(name, info, source)
     if re.search(r'[a-z-]', stem):
         raise QAPISemError(
             info, "name of %s must not use lowercase or '-'" % source)
 
 
-def check_name_lower(name, info, source,
-                     permit_upper=False,
-                     permit_underscore=False):
+def check_name_lower(name: str, info: QAPISourceInfo, source: str,
+                     permit_upper: bool = False,
+                     permit_underscore: bool = False) -> None:
     stem = check_name_str(name, info, source)
     if ((not permit_upper and re.search(r'[A-Z]', stem))
             or (not permit_underscore and '_' in stem)):
@@ -68,13 +78,13 @@ def check_name_lower(name, info, source,
             info, "name of %s must not use uppercase or '_'" % source)
 
 
-def check_name_camel(name, info, source):
+def check_name_camel(name: str, info: QAPISourceInfo, source: str) -> None:
     stem = check_name_str(name, info, source)
     if not re.match(r'[A-Z][A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):
         raise QAPISemError(info, "name of %s must use CamelCase" % source)
 
 
-def check_defn_name_str(name, info, meta):
+def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
     if meta == 'event':
         check_name_upper(name, info, meta)
     elif meta == 'command':
@@ -88,9 +98,13 @@ def check_defn_name_str(name, info, meta):
             info, "%s name should not end in '%s'" % (meta, name[-4:]))
 
 
-def check_keys(value, info, source, required, optional):
+def check_keys(value: _JSONObject,
+               info: QAPISourceInfo,
+               source: str,
+               required: Collection[str],
+               optional: Collection[str]) -> None:
 
-    def pprint(elems):
+    def pprint(elems: Iterable[str]) -> str:
         return ', '.join("'" + e + "'" for e in sorted(elems))
 
     missing = set(required) - set(value)
@@ -110,7 +124,7 @@ def pprint(elems):
                pprint(unknown), pprint(allowed)))
 
 
-def check_flags(expr, info):
+def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
     for key in ['gen', 'success-response']:
         if key in expr and expr[key] is not False:
             raise QAPISemError(
@@ -128,9 +142,9 @@ def check_flags(expr, info):
                                  "are incompatible")
 
 
-def check_if(expr, info, source):
+def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
-    def check_if_str(ifcond):
+    def check_if_str(ifcond: object) -> None:
         if not isinstance(ifcond, str):
             raise QAPISemError(
                 info,
@@ -156,7 +170,7 @@ def check_if_str(ifcond):
         expr['if'] = [ifcond]
 
 
-def normalize_members(members):
+def normalize_members(members: object) -> None:
     if isinstance(members, dict):
         for key, arg in members.items():
             if isinstance(arg, dict):
@@ -164,8 +178,11 @@ def normalize_members(members):
             members[key] = {'type': arg}
 
 
-def check_type(value, info, source,
-               allow_array=False, allow_dict=False):
+def check_type(value: Optional[object],
+               info: QAPISourceInfo,
+               source: str,
+               allow_array: bool = False,
+               allow_dict: Union[bool, str] = False) -> None:
     if value is None:
         return
 
@@ -212,7 +229,8 @@ def check_type(value, info, source,
         check_type(arg['type'], info, key_source, allow_array=True)
 
 
-def check_features(features, info):
+def check_features(features: Optional[object],
+                   info: QAPISourceInfo) -> None:
     if features is None:
         return
     if not isinstance(features, list):
@@ -229,7 +247,7 @@ def check_features(features, info):
         check_if(f, info, source)
 
 
-def check_enum(expr, info):
+def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
     name = expr['enum']
     members = expr['data']
     prefix = expr.get('prefix')
@@ -258,7 +276,7 @@ def check_enum(expr, info):
         check_if(member, info, source)
 
 
-def check_struct(expr, info):
+def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
     name = cast(str, expr['struct'])  # Asserted in check_exprs
     members = expr['data']
 
@@ -266,7 +284,7 @@ def check_struct(expr, info):
     check_type(expr.get('base'), info, "'base'")
 
 
-def check_union(expr, info):
+def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
     name = cast(str, expr['union'])  # Asserted in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
@@ -294,7 +312,7 @@ def check_union(expr, info):
         check_type(value['type'], info, source, allow_array=not base)
 
 
-def check_alternate(expr, info):
+def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
     members = expr['data']
 
     if not members:
@@ -311,7 +329,7 @@ def check_alternate(expr, info):
         check_type(value['type'], info, source)
 
 
-def check_command(expr, info):
+def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
     args = expr.get('data')
     rets = expr.get('returns')
     boxed = expr.get('boxed', False)
@@ -322,7 +340,7 @@ def check_command(expr, info):
     check_type(rets, info, "'returns'", allow_array=True)
 
 
-def check_event(expr, info):
+def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
     args = expr.get('data')
     boxed = expr.get('boxed', False)
 
@@ -331,7 +349,7 @@ def check_event(expr, info):
     check_type(args, info, "'data'", allow_dict=not boxed)
 
 
-def check_exprs(exprs):
+def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
     for expr_elem in exprs:
         # Expression
         assert isinstance(expr_elem['expr'], dict)
diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
index 0a000d58b3..7797c83432 100644
--- a/scripts/qapi/mypy.ini
+++ b/scripts/qapi/mypy.ini
@@ -8,11 +8,6 @@ disallow_untyped_defs = False
 disallow_incomplete_defs = False
 check_untyped_defs = False
 
-[mypy-qapi.expr]
-disallow_untyped_defs = False
-disallow_incomplete_defs = False
-check_untyped_defs = False
-
 [mypy-qapi.parser]
 disallow_untyped_defs = False
 disallow_incomplete_defs = False
-- 
2.30.2


