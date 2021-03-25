Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6033348914
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:27:35 +0100 (CET)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJSw-0001Eb-MX
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6X-0002OO-H4
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6T-0008VZ-FI
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJKIJ7AXKxuI3sRTJyCpBd3E+6nNoM2l+w/8vBuVWJg=;
 b=YxXfy1SIOCDR3y7DOPYPP+yA0HNoUuYeC+0SbUt2OOZBzicQVFmMb8i2FWPJ3W6/aBDQdA
 A7ZUiqM8E7RH/sr4CXXQh/UyO0c+Igx1H2amKcrg9MaOC+SGxSv2Xv4x0zWLOkfr9MlcQu
 eleoSIO8JSDVX1qRYPgvCUHkvVOPsUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-nNtAw6OPMDuwzYWz7Raiyg-1; Thu, 25 Mar 2021 02:04:18 -0400
X-MC-Unique: nNtAw6OPMDuwzYWz7Raiyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA0E801817;
 Thu, 25 Mar 2021 06:04:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44168866C7;
 Thu, 25 Mar 2021 06:04:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 16/19] qapi/expr.py: Add docstrings
Date: Thu, 25 Mar 2021 02:03:53 -0400
Message-Id: <20210325060356.4040114-17-jsnow@redhat.com>
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

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 213 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 208 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 1869ddf815..adc5b903bc 100644
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
@@ -14,6 +12,25 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+"""
+Normalize and validate (context-free) QAPI schema expression structures.
+
+After QAPI expressions are parsed from disk, they are stored in
+recursively nested Python data structures using Dict, List, str, bool,
+and int. This module ensures that those nested structures have the
+correct type(s) and key(s) where appropriate for the QAPI context-free
+grammar.
+
+The QAPI schema expression language allows for syntactic sugar; this
+module also handles the normalization process of these nested
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
@@ -31,9 +48,10 @@
 from .source import QAPISourceInfo
 
 
-# Deserialized JSON objects as returned by the parser;
-# The values of this mapping are not necessary to exhaustively type
-# here, because the purpose of this module is to interrogate that type.
+#: Deserialized JSON objects as returned by the parser.
+#:
+#: The values of this mapping are not necessary to exhaustively type
+#: here, because the purpose of this module is to interrogate that type.
 _JSONObject = Dict[str, object]
 
 
@@ -48,11 +66,29 @@
 def check_name_is_str(name: object,
                       info: QAPISourceInfo,
                       source: str) -> None:
+    """Ensures that ``name`` is a string."""
     if not isinstance(name, str):
         raise QAPISemError(info, "%s requires a string name" % source)
 
 
 def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
+    """
+    Ensures a string is a legal name.
+
+    A legal name consists of ascii letters, digits, ``-``, and ``_``,
+    starting with a letter. The names of downstream extensions are
+    prefixed with an __com.example_ style prefix, allowing ``.`` and
+    ``-``.  An experimental name is prefixed with ``x-``, following the
+    RFQDN if present.
+
+    A legal name cannot start with ``q_``, which is reserved.
+
+    :param name:   Name to check.
+    :param info:   QAPI source file information.
+    :param source: Human-readable str describing "what" this name is.
+
+    :return: The stem of the valid name, with no prefixes.
+    """
     # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
     # and 'q_obj_*' implicit type names.
     match = valid_name.match(name)
@@ -62,6 +98,12 @@ def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
 
 
 def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
+    """
+    Ensures a string is a legal event name.
+
+    Checks the same criteria as `check_name_str`, but requires uppercase
+    and prohibits ``-``.
+    """
     stem = check_name_str(name, info, source)
     if re.search(r'[a-z-]', stem):
         raise QAPISemError(
@@ -71,6 +113,15 @@ def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
 def check_name_lower(name: str, info: QAPISourceInfo, source: str,
                      permit_upper: bool = False,
                      permit_underscore: bool = False) -> None:
+    """
+    Ensures a string is a legal user defined type name.
+
+    Checks the same criteria as `check_name_str`, but may impose
+    additional constraints.
+
+    :param permit_upper: Prohibits uppercase when false.
+    :param permit_underscore: Prohibits underscores when false.
+    """
     stem = check_name_str(name, info, source)
     if ((not permit_upper and re.search(r'[A-Z]', stem))
             or (not permit_underscore and '_' in stem)):
@@ -79,12 +130,31 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
 
 
 def check_name_camel(name: str, info: QAPISourceInfo, source: str) -> None:
+    """
+    Ensures a string is a legal CamelCase name.
+
+    Checks the same criteria as `check_name_str`,
+    but additionally imposes a CamelCase constraint.
+    """
     stem = check_name_str(name, info, source)
     if not re.match(r'[A-Z][A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):
         raise QAPISemError(info, "name of %s must use CamelCase" % source)
 
 
 def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
+    """
+    Ensures a name is a legal definition name.
+
+    - 'event' names adhere to `check_name_upper`.
+    - 'command' names adhere to `check_name_lower`.
+    - All other names adhere to `check_name_camel`.
+
+    All name types must not end with ``Kind`` nor ``List``.
+
+    :param name: Name to check.
+    :param info: QAPI source file information.
+    :param meta: Type name of the QAPI expression.
+    """
     if meta == 'event':
         check_name_upper(name, info, meta)
     elif meta == 'command':
@@ -103,6 +173,15 @@ def check_keys(value: _JSONObject,
                source: str,
                required: Collection[str],
                optional: Collection[str]) -> None:
+    """
+    Ensures an object has a specific set of keys.
+
+    :param value:    The object to check.
+    :param info:     QAPI source file information.
+    :param source:   Human-readable str describing this value.
+    :param required: Keys that *must* be present.
+    :param optional: Keys that *may* be present.
+    """
 
     def pprint(elems: Iterable[str]) -> str:
         return ', '.join("'" + e + "'" for e in sorted(elems))
@@ -125,6 +204,12 @@ def pprint(elems: Iterable[str]) -> str:
 
 
 def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Ensures common fields in an expression are correct.
+
+    :param expr: Expression to validate.
+    :param info: QAPI source file information.
+    """
     for key in ['gen', 'success-response']:
         if key in expr and expr[key] is not False:
             raise QAPISemError(
@@ -143,7 +228,22 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
+    """
+    Syntactically validate and normalize the ``if`` field of an object.
 
+    The ``if`` field may be either a ``str`` or a ``List[str]``.
+    A ``str`` element will be normalized to ``List[str]``.
+
+    :forms:
+      :sugared: ``Union[str, List[str]]``
+      :canonical: ``List[str]``
+
+    :param expr: A ``dict``.
+                 The ``if`` field, if present, will be validated.
+    :param info: QAPI source file information.
+
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     ifcond = expr.get('if')
     if ifcond is None:
         return
@@ -167,6 +267,20 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
 
 def normalize_members(members: object) -> None:
+    """
+    Normalize a "members" value.
+
+    If ``members`` is an object, for every value in that object, if that
+    value is not itself already an object, normalize it to
+    ``{'type': value}``.
+
+    :forms:
+      :sugared: ``Dict[str, Union[str, TypeRef]]``
+      :canonical: ``Dict[str, TypeRef]``
+
+    :param members: The members object to normalize.
+    :return: None, ``members`` is normalized in-place as needed.
+    """
     if isinstance(members, dict):
         for key, arg in members.items():
             if isinstance(arg, dict):
@@ -179,6 +293,23 @@ def check_type(value: Optional[object],
                source: str,
                allow_array: bool = False,
                allow_dict: Union[bool, str] = False) -> None:
+    """
+    Check the QAPI type of ``value``.
+
+    Python types of ``str`` or ``None`` are always allowed.
+
+    :param value:       The value to check.
+    :param info:        QAPI Source file information.
+    :param source:      Human-readable str describing this value.
+    :param allow_array: Allow a ``List[str]`` of length 1,
+                        which indicates an Array<T> type.
+    :param allow_dict:  Allow a dict, treated as an anonymous type.
+                        When given a string, check if that name is
+                        allowed to have keys that use uppercase letters,
+                        and modify validation accordingly.
+
+    :return: None, ``value`` is normalized in-place as needed.
+    """
     if value is None:
         return
 
@@ -227,6 +358,21 @@ def check_type(value: Optional[object],
 
 def check_features(features: Optional[object],
                    info: QAPISourceInfo) -> None:
+    """
+    Syntactically validate and normalize the ``features`` field.
+
+    ``features`` may be a ``list`` of either ``str`` or ``dict``.
+    Any ``str`` element will be normalized to ``{'name': element}``.
+
+    :forms:
+      :sugared: ``List[Union[str, Feature]]``
+      :canonical: ``List[Feature]``
+
+    :param features: an optional list of either str or dict.
+    :param info: QAPI Source file information.
+
+    :return: None, ``features`` is normalized in-place as needed.
+    """
     if features is None:
         return
     if not isinstance(features, list):
@@ -244,6 +390,14 @@ def check_features(features: Optional[object],
 
 
 def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Validate this expression as an ``enum`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI source file information.
+
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     name = expr['enum']
     members = expr['data']
     prefix = expr.get('prefix')
@@ -273,6 +427,14 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Validate this expression as a ``struct`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI source file information.
+
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     name = cast(str, expr['struct'])  # Asserted in check_exprs
     members = expr['data']
 
@@ -281,6 +443,14 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Validate this expression as a ``union`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI source file information.
+
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     name = cast(str, expr['union'])  # Asserted in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
@@ -309,6 +479,14 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Validate this expression as an ``alternate`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI source file information.
+
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     members = expr['data']
 
     if not members:
@@ -326,6 +504,14 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Validate this expression as a ``command`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI source file information.
+
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     args = expr.get('data')
     rets = expr.get('returns')
     boxed = expr.get('boxed', False)
@@ -337,6 +523,14 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate this expression as an ``event`` definition.
+
+    :param expr: The expression to validate.
+    :param info: QAPI source file information.
+
+    :return: None, ``expr`` is normalized in-place as needed.
+    """
     args = expr.get('data')
     boxed = expr.get('boxed', False)
 
@@ -346,6 +540,15 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 
 def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
+    """
+    Validate and normalize a list of parsed QAPI schema expressions.
+
+    This function accepts a list of expressions + metadta as returned by
+    the parser. It destructively normalizes the expressions in-place.
+
+    :param exprs: The list of expressions to normalize/validate.
+    :return: The same list of expressions (now modified).
+    """
     for expr_elem in exprs:
         # Expression
         assert isinstance(expr_elem['expr'], dict)
-- 
2.30.2


