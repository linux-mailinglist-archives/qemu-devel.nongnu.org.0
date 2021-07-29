Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D893DAAA1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:03:17 +0200 (CEST)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ANI-0005Ij-Lf
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGS-0006eh-1B
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGQ-0007yw-B9
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrwOXZjoMlSOSd1gS8VgEIBNr3crQj9rqLjxxiRwGag=;
 b=Hut+FUtsu+Mc0UfzTtnSHwJvcnjOC8qevqZtQ8kUdghY9a3McwDZDlPfACopp2cb63W/h7
 WDBp4pYjGJd7F17kj2fLb5vG9DvPzoMx3+nHGp0E+fSFRqjVscnKrybCPFUGquKB+qGcsb
 BV+LQ09X8YkOnEtNSWxEeduPR3I7UR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-HvwbxB85MPKwoNEBqTzuUw-1; Thu, 29 Jul 2021 13:56:08 -0400
X-MC-Unique: HvwbxB85MPKwoNEBqTzuUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF4E8799EB
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:56:07 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7462810016F5;
 Thu, 29 Jul 2021 17:56:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/10] docs: qom: Fix OBJECT_DECLARE_SIMPLE_TYPE
 documentation
Date: Thu, 29 Jul 2021 13:55:51 -0400
Message-Id: <20210729175554.686474-8-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-1-ehabkost@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

The OBJECT_DECLARE_SIMPLE_TYPE documentation was inaccurate: it
doesn't define a class struct or class type checking helpers.

OBJECT_DECLARE_TYPE expansion looks very similar to the existing
example, though.  Rewrite that section to show both both
OBJECT_DECLARE_SIMPLE_TYPE and OBJECT_DECLARE_TYPE.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index dee60a64c0a..aa1f672efbe 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -301,6 +301,27 @@ This is equivalent to the following:
 .. code-block:: c
    :caption: Expansion from declaring a simple type
 
+   typedef struct MyDevice MyDevice;
+   G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDevice, object_unref)
+   #define MY_DEVICE(void *obj)
+           OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
+
+The 'struct MyDevice' needs to be declared separately.
+
+If the type requires virtual functions to be declared in a class
+struct, then the alternative `OBJECT_DECLARE_TYPE()` macro can be
+used:
+
+.. code-block:: c
+   :caption: Declaring a type with custom class struct
+
+   OBJECT_DECLARE_TYPE(MyDevice, my_device, MY_DEVICE, DEVICE)
+
+This is equivalent to the following:
+
+.. code-block:: c
+   :caption: Expansion from declaring a type with custom class struct
+
    typedef struct MyDevice MyDevice;
    typedef struct MyDeviceClass MyDeviceClass;
 
@@ -313,16 +334,6 @@ This is equivalent to the following:
    #define MY_DEVICE(void *obj)
            OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
 
-   struct MyDeviceClass {
-       DeviceClass parent_class;
-   };
-
-The 'struct MyDevice' needs to be declared separately.
-If the type requires virtual functions to be declared in the class
-struct, then the alternative `OBJECT_DECLARE_TYPE()` macro can be
-used. This does the same as `OBJECT_DECLARE_SIMPLE_TYPE()`, but without
-the 'struct MyDeviceClass' definition.
-
 Type definition macros
 ----------------------
 
-- 
2.31.1


