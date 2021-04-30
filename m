Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AB36FAC1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:43:31 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSUU-0002pP-6H
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdh-00037K-EE
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007cm-SG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaqmwRyPHkUwBhT6M0d+2egmb1Zv0ln/tCXglbvxVfM=;
 b=Qbmjt9TqhqBUHVuNODpJySznZ7x4KSzjbaX5hvJQQe447oLYtiidi7nvDwouRwox40AhJS
 ayLmKgrzOKD/VTqpRffFprJDPcWSV04/XiVTI3GS4aQ39VyIMel1p5aO8vxmDNMKNgxG3T
 VrxHCXoWg8TmgLzo2zE61ydJ+mxl2xA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-Pr7SHOhPOhmFdb99dG0eBA-1; Fri, 30 Apr 2021 07:48:44 -0400
X-MC-Unique: Pr7SHOhPOhmFdb99dG0eBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3D2781E20A;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3732D5B684;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A682C11275F3; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/25] qapi/expr.py: Add docstrings
Date: Fri, 30 Apr 2021 13:48:28 +0200
Message-Id: <20210430114838.2912740-16-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Now with more :words:!

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-16-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 256 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 251 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index c33caf00d9..0b66d80842 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -1,7 +1,5 @@
 # -*- coding: utf-8 -*-
 #
-# Check (context-free) QAPI schema expression structure
-#
 # Copyright IBM, Corp. 2011
 # Copyright (c) 2013-2019 Red Hat Inc.
 #
@@ -14,6 +12,24 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+"""
+Normalize and validate (context-free) QAPI schema expression structures.
+
+`QAPISchemaParser` parses a QAPI schema into abstract syntax trees
+consisting of dict, list, str, bool, and int nodes.  This module ensures
+that these nested structures have the correct type(s) and key(s) where
+appropriate for the QAPI context-free grammar.
+
+The QAPI schema expression language allows for certain syntactic sugar;
+this module also handles the normalization process of these nested
+structures.
+
+See `check_exprs` for the main entry point.
+
+See `schema.QAPISchema` for processing into native Python data
+structures and contextual semantic validation.
+"""
+
 import re
 from typing import (
     Collection,
@@ -39,9 +55,7 @@
 _JSONObject = Dict[str, object]
 
 
-# Names consist of letters, digits, -, and _, starting with a letter.
-# An experimental name is prefixed with x-.  A name of a downstream
-# extension is prefixed with __RFQDN_.  The latter prefix goes first.
+# See check_name_str(), below.
 valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
                         r'(x-)?'
                         r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)
@@ -50,11 +64,33 @@
 def check_name_is_str(name: object,
                       info: QAPISourceInfo,
                       source: str) -> None:
+    """
+    Ensure that ``name`` is a ``str``.
+
+    :raise QAPISemError: When ``name`` fails validation.
+    """
     if not isinstance(name, str):
         raise QAPISemError(info, "%s requires a string name" % source)
 
 
 def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
+    """
+    Ensure that ``name`` is a valid QAPI name.
+
+    A valid name consists of ASCII letters, digits, ``-``, and ``_``,
+    starting with a letter.  It may be prefixed by a downstream prefix
+    of the form __RFQDN_, or the experimental prefix ``x-``.  If both
+    prefixes are present, the __RFDQN_ prefix goes first.
+
+    A valid name cannot start with ``q_``, which is reserved.
+
+    :param name: Name to check.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing what ``name`` belongs to.
+
+    :raise QAPISemError: When ``name`` fails validation.
+    :return: The stem of the valid name, with no prefixes.
+    """
     # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
     # and 'q_obj_*' implicit type names.
     match = valid_name.match(name)
@@ -64,6 +100,19 @@ def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
 
 
 def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
+    """
+    Ensure that ``name`` is a valid event name.
+
+    This means it must be a valid QAPI name as checked by
+    `check_name_str()`, but where the stem prohibits lowercase
+    characters and ``-``.
+
+    :param name: Name to check.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing what ``name`` belongs to.
+
+    :raise QAPISemError: When ``name`` fails validation.
+    """
     stem = check_name_str(name, info, source)
     if re.search(r'[a-z-]', stem):
         raise QAPISemError(
@@ -73,6 +122,21 @@ def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
 def check_name_lower(name: str, info: QAPISourceInfo, source: str,
                      permit_upper: bool = False,
                      permit_underscore: bool = False) -> None:
+    """
+    Ensure that ``name`` is a valid command or member name.
+
+    This means it must be a valid QAPI name as checked by
+    `check_name_str()`, but where the stem prohibits uppercase
+    characters and ``_``.
+
+    :param name: Name to check.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing what ``name`` belongs to.
+    :param permit_upper: Additionally permit uppercase.
+    :param permit_underscore: Additionally permit ``_``.
+
+    :raise QAPISemError: When ``name`` fails validation.
+    """
     stem = check_name_str(name, info, source)
     if ((not permit_upper and re.search(r'[A-Z]', stem))
             or (not permit_underscore and '_' in stem)):
@@ -81,12 +145,39 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
 
 
 def check_name_camel(name: str, info: QAPISourceInfo, source: str) -> None:
+    """
+    Ensure that ``name`` is a valid user-defined type name.
+
+    This means it must be a valid QAPI name as checked by
+    `check_name_str()`, but where the stem must be in CamelCase.
+
+    :param name: Name to check.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing what ``name`` belongs to.
+
+    :raise QAPISemError: When ``name`` fails validation.
+    """
     stem = check_name_str(name, info, source)
     if not re.match(r'[A-Z][A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):
         raise QAPISemError(info, "name of %s must use CamelCase" % source)
 
 
 def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
+    """
+    Ensure that ``name`` is a valid definition name.
+
+    Based on the value of ``meta``, this means that:
+      - 'event' names adhere to `check_name_upper()`.
+      - 'command' names adhere to `check_name_lower()`.
+      - Else, meta is a type, and must pass `check_name_camel()`.
+        These names must not end with ``Kind`` nor ``List``.
+
+    :param name: Name to check.
+    :param info: QAPI schema source file information.
+    :param meta: Meta-type name of the QAPI expression.
+
+    :raise QAPISemError: When ``name`` fails validation.
+    """
     if meta == 'event':
         check_name_upper(name, info, meta)
     elif meta == 'command':
@@ -105,6 +196,17 @@ def check_keys(value: _JSONObject,
                source: str,
                required: Collection[str],
                optional: Collection[str]) -> None:
+    """
+    Ensure that a dict has a specific set of keys.
+
+    :param value: The dict to check.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing this ``value``.
+    :param required: Keys that *must* be present.
+    :param optional: Keys that *may* be present.
+
+    :raise QAPISemError: When unknown keys are present.
+    """
 
     def pprint(elems: Iterable[str]) -> str:
         return ', '.join("'" + e + "'" for e in sorted(elems))
@@ -127,6 +229,16 @@ def pprint(elems: Iterable[str]) -> str:
 
 
 def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Ensure flag members (if present) have valid values.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError:
+        When certain flags have an invalid value, or when
+        incompatible flags are present.
+    """
     for key in ['gen', 'success-response']:
         if key in expr and expr[key] is not False:
             raise QAPISemError(
@@ -145,7 +257,25 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
+    """
+    Normalize and validate the ``if`` member of an object.
 
+    The ``if`` member may be either a ``str`` or a ``List[str]``.
+    A ``str`` value will be normalized to ``List[str]``.
+
+    :forms:
+      :sugared: ``Union[str, List[str]]``
+      :canonical: ``List[str]``
+
+    :param expr: The expression containing the ``if`` member to validate.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing ``expr``.
+
+    :raise QAPISemError:
+        When the "if" member fails validation, or when there are no
+        non-empty conditions.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     ifcond = expr.get('if')
     if ifcond is None:
         return
@@ -172,6 +302,21 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
 
 def normalize_members(members: object) -> None:
+    """
+    Normalize a "members" value.
+
+    If ``members`` is a dict, for every value in that dict, if that
+    value is not itself already a dict, normalize it to
+    ``{'type': value}``.
+
+    :forms:
+      :sugared: ``Dict[str, Union[str, TypeRef]]``
+      :canonical: ``Dict[str, TypeRef]``
+
+    :param members: The members value to normalize.
+
+    :return: None, ``members`` is normalized in-place as needed.
+    """
     if isinstance(members, dict):
         for key, arg in members.items():
             if isinstance(arg, dict):
@@ -184,6 +329,26 @@ def check_type(value: Optional[object],
                source: str,
                allow_array: bool = False,
                allow_dict: Union[bool, str] = False) -> None:
+    """
+    Normalize and validate the QAPI type of ``value``.
+
+    Python types of ``str`` or ``None`` are always allowed.
+
+    :param value: The value to check.
+    :param info: QAPI schema source file information.
+    :param source: Error string describing this ``value``.
+    :param allow_array:
+        Allow a ``List[str]`` of length 1, which indicates an array of
+        the type named by the list element.
+    :param allow_dict:
+        Allow a dict.  Its members can be struct type members or union
+        branches.  When the value of ``allow_dict`` is in pragma
+        ``member-name-exceptions``, the dict's keys may violate the
+        member naming rules.  The dict members are normalized in place.
+
+    :raise QAPISemError: When ``value`` fails validation.
+    :return: None, ``value`` is normalized in-place as needed.
+    """
     if value is None:
         return
 
@@ -232,6 +397,22 @@ def check_type(value: Optional[object],
 
 def check_features(features: Optional[object],
                    info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate the ``features`` member.
+
+    ``features`` may be a ``list`` of either ``str`` or ``dict``.
+    Any ``str`` element will be normalized to ``{'name': element}``.
+
+    :forms:
+      :sugared: ``List[Union[str, Feature]]``
+      :canonical: ``List[Feature]``
+
+    :param features: The features member value to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``features`` fails validation.
+    :return: None, ``features`` is normalized in-place as needed.
+    """
     if features is None:
         return
     if not isinstance(features, list):
@@ -249,6 +430,15 @@ def check_features(features: Optional[object],
 
 
 def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as an ``enum`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``expr`` is not a valid ``enum``.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     name = expr['enum']
     members = expr['data']
     prefix = expr.get('prefix')
@@ -278,6 +468,15 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as a ``struct`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``expr`` is not a valid ``struct``.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     name = cast(str, expr['struct'])  # Checked in check_exprs
     members = expr['data']
 
@@ -286,6 +485,15 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as a ``union`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: when ``expr`` is not a valid ``union``.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     name = cast(str, expr['union'])  # Checked in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
@@ -314,6 +522,15 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as an ``alternate`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``expr`` is not a valid ``alternate``.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     members = expr['data']
 
     if not members:
@@ -331,6 +548,15 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as a ``command`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``expr`` is not a valid ``command``.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     args = expr.get('data')
     rets = expr.get('returns')
     boxed = expr.get('boxed', False)
@@ -342,6 +568,15 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as an ``event`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``expr`` is not a valid ``event``.
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     args = expr.get('data')
     boxed = expr.get('boxed', False)
 
@@ -351,6 +586,17 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
+    """
+    Validate and normalize a list of parsed QAPI schema expressions.
+
+    This function accepts a list of expressions and metadata as returned
+    by the parser.  It destructively normalizes the expressions in-place.
+
+    :param exprs: The list of expressions to normalize and validate.
+
+    :raise QAPISemError: When any expression fails validation.
+    :return: The same list of expressions (now modified).
+    """
     for expr_elem in exprs:
         # Expression
         assert isinstance(expr_elem['expr'], dict)
-- 
2.26.3


