Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5B3DAA94
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 19:59:52 +0200 (CEST)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9AJz-0006LJ-IO
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 13:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGN-0006T5-PY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGI-0007t4-2k
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85ErR7+WiEu/O4u03QCNLmaS5ihB7R0FWBSKyVW3dKQ=;
 b=PbRJk+XJ9idFTWNeoa5Zx2SKG/3e+DZJL23XQ2nDAzQlpToQ1VuxoLIXA+ex55lCtfHdrY
 PACXImiVKZRd4nNbku242thRMEOPi2rRhoPo4OHb4zY1h9JfgJ0i/Uf0qqHruxSOMTAZNi
 UTUsWlK9g+0/B3T4gmqENX/Q2jAVM+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-33NwiUv_Ml2fRdJ6cSSfyQ-1; Thu, 29 Jul 2021 13:55:56 -0400
X-MC-Unique: 33NwiUv_Ml2fRdJ6cSSfyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E51AEC73A1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:55:55 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE1CD5D6B1;
 Thu, 29 Jul 2021 17:55:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 01/10] docs: qom: Replace old GTK-Doc #symbol syntax
 with `symbol`
Date: Thu, 29 Jul 2021 13:55:45 -0400
Message-Id: <20210729175554.686474-2-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-1-ehabkost@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace leftover of GTK-Doc #name syntax with `name`, and use
default-role:: any, so we can add references to other functions,
types, and macros.

There are 3 cases that required extra care:
- #TypeInfo.class_init: kernel-doc doesn't generate c:member::
  directives, so references to C struct members are not possible
  yet.  This was replaced with `TypeInfo`.class_init.
- #CPUClass.reset and #DeviceClass.realize: cpu.h and qdev docs are not
  rendered using Sphinx yet, so use ``code`` syntax for those.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index e5fe3597cd8..9c1be5d7fc2 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -3,6 +3,7 @@ The QEMU Object Model (QOM)
 ===========================
 
 .. highlight:: c
+.. default-role:: any
 
 The QEMU Object Model provides a framework for registering user creatable
 types and instantiating objects from those types.  QOM provides the following
@@ -42,8 +43,8 @@ features:
 
    type_init(my_device_register_types)
 
-In the above example, we create a simple type that is described by #TypeInfo.
-#TypeInfo describes information about the type including what it inherits
+In the above example, we create a simple type that is described by `TypeInfo`.
+`TypeInfo` describes information about the type including what it inherits
 from, the instance and class size, and constructor/destructor hooks.
 
 Alternatively several static types could be registered using helper macro
@@ -66,13 +67,13 @@ DEFINE_TYPES()
 
    DEFINE_TYPES(device_types_info)
 
-Every type has an #ObjectClass associated with it.  #ObjectClass derivatives
+Every type has an `ObjectClass` associated with it.  `ObjectClass` derivatives
 are instantiated dynamically but there is only ever one instance for any
-given type.  The #ObjectClass typically holds a table of function pointers
+given type.  The `ObjectClass` typically holds a table of function pointers
 for the virtual methods implemented by this type.
 
-Using object_new(), a new #Object derivative will be instantiated.  You can
-cast an #Object to a subclass (or base-class) type using
+Using object_new(), a new `Object` derivative will be instantiated.  You can
+cast an `Object` to a subclass (or base-class) type using
 object_dynamic_cast().  You typically want to define macro wrappers around
 OBJECT_CHECK() and OBJECT_CLASS_CHECK() to make it easier to convert to a
 specific type:
@@ -111,7 +112,7 @@ The effect of this is that classes automatically inherit any virtual
 function pointers that the parent class has already initialized.  All
 other fields will be zero filled.
 
-Once all of the parent classes have been initialized, #TypeInfo::class_init
+Once all of the parent classes have been initialized, `TypeInfo`::class_init
 is called to let the class being instantiated provide default initialize for
 its virtual functions.  Here is how the above example might be modified
 to introduce an overridden virtual function:
@@ -135,7 +136,7 @@ to introduce an overridden virtual function:
    };
 
 Introducing new virtual methods requires a class to define its own
-struct and to add a .class_size member to the #TypeInfo.  Each method
+struct and to add a .class_size member to the `TypeInfo`.  Each method
 will also have a wrapper function to call it easily:
 
 .. code-block:: c
@@ -188,12 +189,12 @@ strongly-typed first argument.
 If it does not operate on an object instance, it is dubbed
 *class method*.
 
-Methods cannot be overloaded. That is, the #ObjectClass and method name
+Methods cannot be overloaded. That is, the `ObjectClass` and method name
 uniquely identity the function to be called; the signature does not vary
 except for trailing varargs.
 
 Methods are always *virtual*. Overriding a method in
-#TypeInfo.class_init of a subclass leads to any user of the class obtained
+`TypeInfo`.class_init of a subclass leads to any user of the class obtained
 via OBJECT_GET_CLASS() accessing the overridden function.
 The original function is not automatically invoked. It is the responsibility
 of the overriding class to determine whether and when to invoke the method
@@ -273,8 +274,8 @@ Alternatively, object_class_by_name() can be used to obtain the class and
 its non-overridden methods for a specific type. This would correspond to
 ``MyClass::method(...)`` in C++.
 
-The first example of such a QOM method was #CPUClass.reset,
-another example is #DeviceClass.realize.
+The first example of such a QOM method was ``CPUClass.reset``,
+another example is ``DeviceClass.realize``.
 
 Standard type declaration and definition macros
 ===============================================
-- 
2.31.1


