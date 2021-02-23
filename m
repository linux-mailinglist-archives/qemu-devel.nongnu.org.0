Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C932233D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:43:03 +0100 (CET)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELn4-0001AW-2q
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELgf-0002K5-60
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELei-0005NH-PL
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpGsLWd4+Ca5Vnbh6wA32m5N5z4KyoiDXxdjHYcn5GM=;
 b=Xxutj/TJz3ALSQKi6C+IDlkrs5YHyCLPbIUMto4rQJ7gZjO0cbMSXk5yJFDpyARtuvf2vw
 ugSsCuuDB2NPXpClGuO8yzVzTAHuXsTzbz1z6TbkPi3fOzsCwywWm9je2pNcfOnIImRBCj
 WcDRGN/EL3my9D+cxZ7ahoggJLhDlOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-2I8sjkAHNVWTboktL0_OCg-1; Mon, 22 Feb 2021 19:34:21 -0500
X-MC-Unique: 2I8sjkAHNVWTboktL0_OCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B82D88030B7;
 Tue, 23 Feb 2021 00:34:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 016B25D6D5;
 Tue, 23 Feb 2021 00:34:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 12/16] qapi/expr.py: Add docstrings
Date: Mon, 22 Feb 2021 19:34:04 -0500
Message-Id: <20210223003408.964543-13-jsnow@redhat.com>
In-Reply-To: <20210223003408.964543-1-jsnow@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

In this patch, I begin to adopt the idea that some functions can be
marked as "Const" and others "RW" to distinguish between functions that
perform a check-only, and those that perform normilization work and
modify the structure under consideration.

It is not any kind of doc standard, it was for my own benefit.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 167 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 164 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 473ee4f7f7e..2b96bec722f 100644
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
     Iterable,
@@ -32,7 +49,7 @@
 
 # Arbitrary form for a JSON-like object.
 _JSObject = MutableMapping[str, object]
-# Expressions in their raw form are (just) JSON-like objects.
+#: Expressions in their unvalidated form are JSON-like objects.
 Expression = _JSObject
 
 
@@ -46,6 +63,7 @@
 def check_name_is_str(name: object,
                       info: QAPISourceInfo,
                       source: str) -> None:
+    """Ensures that ``name`` is a string. [Const]"""
     if not isinstance(name, str):
         raise QAPISemError(info, "%s requires a string name" % source)
 
@@ -56,6 +74,25 @@ def check_name_str(name: str,
                    allow_optional: bool = False,
                    enum_member: bool = False,
                    permit_upper: bool = False) -> None:
+    """
+    Ensures a string is a legal name. [Const]
+
+    A name is legal in the default case when:
+
+    - It matches ``(__[a-z0-9.-]+_)?[a-z][a-z0-9_-]*``
+    - It does not start with ``q_`` or ``q-``
+
+    :param name:           Name to check.
+    :param info:           QAPI source file information.
+    :param source:         Human-readable str describing "what" this name is.
+    :param allow_optional: Allow the very first character to be ``*``.
+                           (Cannot be used with ``enum_member``)
+    :param enum_member:    Allow the very first character to be a digit.
+                           (Cannot be used with ``allow_optional``)
+    :param permit_upper:   Allows upper-case characters wherever
+                           lower-case characters are allowed.
+    """
+    assert not (allow_optional and enum_member)
     membername = name
 
     if allow_optional and name.startswith('*'):
@@ -76,6 +113,17 @@ def check_name_str(name: str,
 
 
 def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
+    """
+    Ensures a name is a legal definition name. [Const]
+
+    A legal definition name:
+     - Adheres to the criteria in `check_name_str`, with uppercase permitted
+     - Does not end with ``Kind`` or ``List``.
+
+    :param name: Name to check.
+    :param info: QAPI source file information.
+    :param meta: Type name of the QAPI expression.
+    """
     check_name_str(name, info, meta, permit_upper=True)
     if name.endswith('Kind') or name.endswith('List'):
         raise QAPISemError(
@@ -87,6 +135,15 @@ def check_keys(value: _JSObject,
                source: str,
                required: List[str],
                optional: List[str]) -> None:
+    """
+    Ensures an object has a specific set of keys. [Const]
+
+    :param value:    The object to check.
+    :param info:     QAPI source file information.
+    :param source:   Human-readable str describing "what" this object is.
+    :param required: Keys that *must* be present.
+    :param optional: Keys that *may* be present.
+    """
 
     def pprint(elems: Iterable[str]) -> str:
         return ', '.join("'" + e + "'" for e in sorted(elems))
@@ -109,6 +166,12 @@ def pprint(elems: Iterable[str]) -> str:
 
 
 def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
+    """
+    Ensures common fields in an Expression are correct. [Const]
+
+    :param expr: Expression to validate.
+    :param info: QAPI source file information.
+    """
     for key in ['gen', 'success-response']:
         if key in expr and expr[key] is not False:
             raise QAPISemError(
@@ -127,6 +190,19 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
 
 
 def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
+    """
+    Syntactically validate and normalize the ``if`` field of an object. [RW]
+
+    The ``if`` field may be either a ``str`` or a ``List[str]``.
+    A ``str`` element will be normalized to ``List[str]``.
+
+    :param expr: A ``dict``; the ``if`` field, if present, will be validated.
+    :param info: QAPI source file information.
+
+    :forms:
+      :sugared: ``Union[str, List[str]]``
+      :canonical: ``List[str]``
+    """
 
     ifcond = expr.get('if')
     if ifcond is None:
@@ -151,6 +227,17 @@ def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
 
 
 def normalize_members(members: object) -> None:
+    """
+    Normalize a "members" value. [RW]
+
+    If ``members`` is an object, for every value in that object, if that
+    value is not itself already an object, normalize it to
+    ``{'type': value}``.
+
+    :forms:
+      :sugared: ``Dict[str, Union[str, TypeRef]]``
+      :canonical: ``Dict[str, TypeRef]``
+    """
     if isinstance(members, dict):
         for key, arg in members.items():
             if isinstance(arg, dict):
@@ -163,6 +250,21 @@ def check_type(value: Optional[object],
                source: str,
                allow_array: bool = False,
                allow_dict: Union[bool, str] = False) -> None:
+    """
+    Check the QAPI type of ``value``. [RW]
+
+    Python types of ``str`` or ``None`` are always allowed.
+
+    :param value:       The value to check.
+    :param info:        QAPI Source file information.
+    :param source:      Human readable string describing "what" the value is.
+    :param allow_array: Allow a ``List[str]`` of length 1,
+                        which indicates an Array<T> type.
+    :param allow_dict:  Allow a dict, treated as an anonymous type.
+                        When given a string, check if that name is allowed to
+                        have keys that use uppercase letters, and modify
+                        validation accordingly.
+    """
     if value is None:
         return
 
@@ -208,6 +310,16 @@ def check_type(value: Optional[object],
 
 def check_features(features: Optional[object],
                    info: QAPISourceInfo) -> None:
+    """
+    Syntactically validate and normalize the ``features`` field. [RW]
+
+    ``features`` may be a ``list`` of either ``str`` or ``dict``.
+    Any ``str`` element will be normalized to ``{'name': element}``.
+
+    :forms:
+      :sugared: ``List[Union[str, Feature]]``
+      :canonical: ``List[Feature]``
+    """
     if features is None:
         return
     if not isinstance(features, list):
@@ -225,6 +337,12 @@ def check_features(features: Optional[object],
 
 
 def check_enum(expr: Expression, info: QAPISourceInfo) -> None:
+    """
+    Validate this `Expression` as an ``enum`` expression. [RW]
+
+    :param expr: `Expression` to validate.
+    :param info: QAPI source file information.
+    """
     name = expr['enum']
     members = expr['data']
     prefix = expr.get('prefix')
@@ -249,6 +367,12 @@ def check_enum(expr: Expression, info: QAPISourceInfo) -> None:
 
 
 def check_struct(expr: Expression, info: QAPISourceInfo) -> None:
+    """
+    Validate this `Expression` as a ``struct`` expression. [RW]
+
+    :param expr: `Expression` to validate.
+    :param info: QAPI source file information.
+    """
     name = cast(str, expr['struct'])  # Asserted in check_exprs
     members = expr['data']
 
@@ -257,6 +381,12 @@ def check_struct(expr: Expression, info: QAPISourceInfo) -> None:
 
 
 def check_union(expr: Expression, info: QAPISourceInfo) -> None:
+    """
+    Validate this `Expression` as a ``union`` expression. [RW]
+
+    :param expr: `Expression` to validate.
+    :param info: QAPI source file information.
+    """
     name = cast(str, expr['union'])  # Asserted in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
@@ -283,6 +413,12 @@ def check_union(expr: Expression, info: QAPISourceInfo) -> None:
 
 
 def check_alternate(expr: Expression, info: QAPISourceInfo) -> None:
+    """
+    Validate this `Expression` as an ``alternate`` expression. [RW]
+
+    :param expr: Expression to validate.
+    :param info: QAPI source file information.
+    """
     members = expr['data']
 
     if not members:
@@ -300,6 +436,12 @@ def check_alternate(expr: Expression, info: QAPISourceInfo) -> None:
 
 
 def check_command(expr: Expression, info: QAPISourceInfo) -> None:
+    """
+    Validate this `Expression` as a ``command`` expression. [RW]
+
+    :param expr: `Expression` to validate.
+    :param info: QAPI source file information.
+    """
     args = expr.get('data')
     rets = expr.get('returns')
     boxed = expr.get('boxed', False)
@@ -311,6 +453,16 @@ def check_command(expr: Expression, info: QAPISourceInfo) -> None:
 
 
 def check_event(expr: Expression, info: QAPISourceInfo) -> None:
+    """
+    Normalize and syntactically validate the ``event`` expression. [RW]
+
+    :Event:
+      :event: ``str``
+      :data: ``Optional[Dict[str, Member]]``
+      :boxed: ``Optional[bool]``
+      :if: ``Optional[Ifcond]`` (see: `check_if`)
+      :features: ``Optional[Features]`` (see: `check_features`)
+    """
     args = expr.get('data')
     boxed = expr.get('boxed', False)
 
@@ -320,6 +472,15 @@ def check_event(expr: Expression, info: QAPISourceInfo) -> None:
 
 
 def check_exprs(exprs: List[_JSObject]) -> List[_JSObject]:
+    """
+    Validate and normalize a list of parsed QAPI schema expressions. [RW]
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
2.29.2


