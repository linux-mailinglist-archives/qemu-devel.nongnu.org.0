Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B879C3DAA95
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 19:59:53 +0200 (CEST)
Received: from localhost ([::1]:55884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9AK0-0006Ps-QI
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 13:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGM-0006Rv-25
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGH-0007rx-4V
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivaE5S9bKA3xHrbRd64RrA4HNkbsfH8TsdenqyMEYjU=;
 b=R1ura1P0ziCiQMCAuL17ZnLEmzlGplJqI9NPNcn0JHxtqVJXxbrbDQrDZJxiyO8i9J3wDs
 2H1a3h60apGSpULG7L76Yr0hDYrjyICja6UkeqrOY1qH/oYwB6B9xROKavGAc1aXKvZQih
 CvC9i38KOigQ35/h4O+Sc+UTPmvIxQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-3Xb9MFQ3P5mRnuvmFkl4nQ-1; Thu, 29 Jul 2021 13:55:57 -0400
X-MC-Unique: 3Xb9MFQ3P5mRnuvmFkl4nQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81CE8799E0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:55:56 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A16C45C1D1;
 Thu, 29 Jul 2021 17:55:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/10] docs: qom: Use Sphinx cross references more
 often
Date: Thu, 29 Jul 2021 13:55:46 -0400
Message-Id: <20210729175554.686474-3-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-1-ehabkost@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make the document easier to navigate, use `reference` syntax
more often when mentioning other types, functions, and macros.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 9c1be5d7fc2..3499a8ca3b6 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -48,7 +48,7 @@ In the above example, we create a simple type that is described by `TypeInfo`.
 from, the instance and class size, and constructor/destructor hooks.
 
 Alternatively several static types could be registered using helper macro
-DEFINE_TYPES()
+`DEFINE_TYPES()`:
 
 .. code-block:: c
 
@@ -72,10 +72,10 @@ are instantiated dynamically but there is only ever one instance for any
 given type.  The `ObjectClass` typically holds a table of function pointers
 for the virtual methods implemented by this type.
 
-Using object_new(), a new `Object` derivative will be instantiated.  You can
+Using `object_new()`, a new `Object` derivative will be instantiated.  You can
 cast an `Object` to a subclass (or base-class) type using
-object_dynamic_cast().  You typically want to define macro wrappers around
-OBJECT_CHECK() and OBJECT_CLASS_CHECK() to make it easier to convert to a
+`object_dynamic_cast()`.  You typically want to define macro wrappers around
+`OBJECT_CHECK()` and `OBJECT_CLASS_CHECK()` to make it easier to convert to a
 specific type:
 
 .. code-block:: c
@@ -195,7 +195,7 @@ except for trailing varargs.
 
 Methods are always *virtual*. Overriding a method in
 `TypeInfo`.class_init of a subclass leads to any user of the class obtained
-via OBJECT_GET_CLASS() accessing the overridden function.
+via `OBJECT_GET_CLASS()` accessing the overridden function.
 The original function is not automatically invoked. It is the responsibility
 of the overriding class to determine whether and when to invoke the method
 being overridden.
@@ -270,7 +270,7 @@ class, which someone might choose to change at some point.
        .class_init = derived_class_init,
    };
 
-Alternatively, object_class_by_name() can be used to obtain the class and
+Alternatively, `object_class_by_name()` can be used to obtain the class and
 its non-overridden methods for a specific type. This would correspond to
 ``MyClass::method(...)`` in C++.
 
@@ -285,9 +285,9 @@ convention. To reduce the amount of boilerplate code that needs to be
 written for a new type there are two sets of macros to generate the
 common parts in a standard format.
 
-A type is declared using the OBJECT_DECLARE macro family. In types
+A type is declared using the ``OBJECT_DECLARE`` macro family. In types
 which do not require any virtual functions in the class, the
-OBJECT_DECLARE_SIMPLE_TYPE macro is suitable, and is commonly placed
+`OBJECT_DECLARE_SIMPLE_TYPE` macro is suitable, and is commonly placed
 in the header file:
 
 .. code-block:: c
@@ -319,12 +319,12 @@ This is equivalent to the following:
 
 The 'struct MyDevice' needs to be declared separately.
 If the type requires virtual functions to be declared in the class
-struct, then the alternative OBJECT_DECLARE_TYPE() macro can be
-used. This does the same as OBJECT_DECLARE_SIMPLE_TYPE(), but without
+struct, then the alternative `OBJECT_DECLARE_TYPE()` macro can be
+used. This does the same as `OBJECT_DECLARE_SIMPLE_TYPE()`, but without
 the 'struct MyDeviceClass' definition.
 
-To implement the type, the OBJECT_DEFINE macro family is available.
-In the simple case the OBJECT_DEFINE_TYPE macro is suitable:
+To implement the type, the ``OBJECT_DEFINE`` macro family is available.
+In the simple case the `OBJECT_DEFINE_TYPE()` macro is suitable:
 
 .. code-block:: c
    :caption: Defining a simple type
@@ -362,7 +362,7 @@ system, and the three standard methods now need to be implemented
 along with any other logic required for the type.
 
 If the type needs to implement one or more interfaces, then the
-OBJECT_DEFINE_TYPE_WITH_INTERFACES() macro can be used instead.
+`OBJECT_DEFINE_TYPE_WITH_INTERFACES()` macro can be used instead.
 This accepts an array of interface type names.
 
 .. code-block:: c
@@ -374,7 +374,7 @@ This accepts an array of interface type names.
                                       { NULL })
 
 If the type is not intended to be instantiated, then then
-the OBJECT_DEFINE_ABSTRACT_TYPE() macro can be used instead:
+the `OBJECT_DEFINE_ABSTRACT_TYPE()` macro can be used instead:
 
 .. code-block:: c
    :caption: Defining a simple abstract type
-- 
2.31.1


