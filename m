Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B343DAAB5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:05:36 +0200 (CEST)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9APX-0008CG-3x
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGU-0006nu-3l
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGS-00080j-B3
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFauT1gi4Um7HvJ1OXpmVPNsZptBn73opwaZb9cI1hE=;
 b=NGG1+kDbmM23L1UEH7lPIKI1zp81X5VKT/p+AIDhkDcYdDjnqPLpJUyIGvZccVhXB58DLI
 pnSR5Ux+S/KWSm0ELVAh6HUBectlYyftabJvfiQuLabGBwT2GUQojryCb45tS2WRC1q83g
 sEcvYhg/QtGde/okSJtI1xLlu22V/KA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-sOrFrnvOOZS8gpLSfk_KoQ-1; Thu, 29 Jul 2021 13:56:10 -0400
X-MC-Unique: sOrFrnvOOZS8gpLSfk_KoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 730861006C85
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:56:09 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F65D60BF1;
 Thu, 29 Jul 2021 17:56:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/10] docs: qom: Remove OBJECT_CHECK macro examples
Date: Thu, 29 Jul 2021 13:55:53 -0400
Message-Id: <20210729175554.686474-10-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-1-ehabkost@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

We shouldn't encourage people to keep defining typecast macros
manually, when we have the OBJECT_DECLARE* macros.  Remove the
section showing how to define them, and replace with a section
explaining how typecasting works.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 46 +++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 3ae6f75a1a2..0f222555019 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -69,21 +69,10 @@ are instantiated dynamically but there is only ever one instance for any
 given type.  The `ObjectClass` typically holds a table of function pointers
 for the virtual methods implemented by this type.
 
-Using `object_new()`, a new `Object` derivative will be instantiated.  You can
-cast an `Object` to a subclass (or base-class) type using
-`object_dynamic_cast()`.  You typically want to define macro wrappers around
-`OBJECT_CHECK()` and `OBJECT_CLASS_CHECK()` to make it easier to convert to a
-specific type:
-
-.. code-block:: c
-   :caption: Typecasting macros
-
-   #define MY_DEVICE_GET_CLASS(obj) \
-      OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE)
-   #define MY_DEVICE_CLASS(klass) \
-      OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE)
-   #define MY_DEVICE(obj) \
-      OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
+Using `object_new()`, a new `Object` derivative will be
+instantiated.  You can cast an `Object` to a subclass (or
+base-class) type using `object_dynamic_cast()` or :ref:`typecast
+wrappers <typecasting>`.
 
 In case the ObjectClass implementation can be built as module a
 module_obj() line must be added to make sure qemu loads the module
@@ -93,6 +82,31 @@ when the object is needed.
 
    module_obj(TYPE_MY_DEVICE);
 
+.. _typecasting:
+
+Typecasting
+===========
+
+The `OBJECT_DECLARE macros <OBJECT_DECLARE>` automatically define
+typecasting functions having signatures like these:
+
+.. code-block:: c
+
+   static inline MyDevice *MY_DEVICE(const void *obj);
+   static inline MyDeviceClass *MY_DEVICE_GET_CLASS(const void *obj);
+   static inline MyDeviceClass *MY_DEVICE_CLASS(const void *klass);
+
+These typecasting functions are wrappers around `OBJECT_CHECK`,
+`OBJECT_GET_CLASS`, and `OBJECT_CLASS_CHECK`.  Example usage:
+
+.. code-block:: c
+
+    Object *obj = object_new("my-device");
+    MyDevice *my_dev = MY_DEVICE(obj);
+    DeviceState *dev = DEVICE(my_dev);
+    MyDeviceClass *mdc = MY_DEVICE_GET_CLASS(my_dev);
+    DeviceClass *dc = DEVICE_CLASS(mdc);
+
 Class Initialization
 ====================
 
@@ -282,6 +296,8 @@ convention. To reduce the amount of boilerplate code that needs to be
 written for a new type there are two sets of macros to generate the
 common parts in a standard format.
 
+.. _OBJECT_DECLARE:
+
 Type declaration macros
 -----------------------
 
-- 
2.31.1


