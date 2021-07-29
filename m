Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF72D3DAAA2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:03:17 +0200 (CEST)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ANI-0005IZ-U3
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGV-0006s7-CH
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGT-00081V-Kn
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9T+GXXBUzKf6Acq+ENzctJe/hvCuPWDINxzhQcrxDE=;
 b=FOVeBK/p4nWZiWQJH6yVkcazhjpmmcCiGmV1ch1ZSaQ+KwDxu9F3TiRJT1SrNT0V3v+vtq
 8CJroRv5UV7SnIfxPrdTUfSjG77U1xDeOw05M3DAFy7yu32poZIYzwBkvHTJ4XVjxpdrML
 VrcWVB4+ayeLuyxRA2JMol5xMJecMRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-OTiRZR-aOTOt36v367JFwg-1; Thu, 29 Jul 2021 13:56:09 -0400
X-MC-Unique: OTiRZR-aOTOt36v367JFwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8541A1006C81
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:56:08 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 535845C1D1;
 Thu, 29 Jul 2021 17:56:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/10] docs: qom: Show actual typecast functions in
 examples
Date: Thu, 29 Jul 2021 13:55:52 -0400
Message-Id: <20210729175554.686474-9-ehabkost@redhat.com>
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

For clarity and to avoid encouraging people to copy the examples,
show the actual typecast functions being defined by
OBJECT_DECLARE* macros in the examples.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index aa1f672efbe..3ae6f75a1a2 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -303,8 +303,10 @@ This is equivalent to the following:
 
    typedef struct MyDevice MyDevice;
    G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDevice, object_unref)
-   #define MY_DEVICE(void *obj)
-           OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
+   static inline MyDevice *MY_DEVICE(void *obj)
+   {
+       return OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE);
+   }
 
 The 'struct MyDevice' needs to be declared separately.
 
@@ -327,12 +329,18 @@ This is equivalent to the following:
 
    G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDevice, object_unref)
 
-   #define MY_DEVICE_GET_CLASS(void *obj) \
-           OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE)
-   #define MY_DEVICE_CLASS(void *klass) \
-           OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE)
-   #define MY_DEVICE(void *obj)
-           OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
+   static inline MyDeviceClass *MY_DEVICE_GET_CLASS(void *obj)
+   {
+       return OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE);
+   }
+   static inline MyDeviceClass *MY_DEVICE_CLASS(void *klass)
+   {
+       return OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE);
+   }
+   static inline MyDevice *MY_DEVICE(void *obj)
+   {
+       return OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE);
+   }
 
 Type definition macros
 ----------------------
-- 
2.31.1


