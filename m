Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDBF8C7C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 11:08:31 +0100 (CET)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUT66-0006HI-90
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 05:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iUT2h-00028d-RZ
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iUT2c-0002OU-TL
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:04:59 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:43395)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iUT2T-0002JA-VE; Tue, 12 Nov 2019 05:04:47 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxVbb-1hg6Kw39aL-00xuCv; Tue, 12 Nov 2019 11:04:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] qom: Fix error message in object_class_property_add()
Date: Tue, 12 Nov 2019 11:04:26 +0100
Message-Id: <20191112100429.11957-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191112100429.11957-1-laurent@vivier.eu>
References: <20191112100429.11957-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hX1f7s63XHJxMWSr5PchMTIHafeabkAwtI4hoBiSZ5QXMyKtAer
 X2UKJqRWIo6NXVLXwz/h8uweUuWlWu33WSp1rUDSFn8ijibTl0lFCnAfCJs8N8tqSpJ8eWy
 NkEb0TWaz8ATXYNLm+D11KKn7PJRmcETbyNpN6It4xJC3xDA/fQ+cWbW81CBLRQJhixS+K8
 g532jwT1jCvo+odXhVbWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:64ac703U+FM=:2YlQaI0vSx53LtyOdP59kL
 haq7UVuVseDBBO36Rqv3mqiLyV31y/5VWewA0z++vBGRD80XYYnrbr+vL8zyHxGr122NmjvQf
 hDDTLf/e6SO6ylLUSdGw8ngkjvVVFpi1123DltrTc0MpNojfECNz0V7DXf2U/OB+tyWPPEM2g
 WbIBUQH1YQTC1ruOnDgzDmitqn8/ut+LmU1bCf+6a3B+GiqgfdQY4JuotcvDduTGceF5KSUfC
 l2sfSKQhmptvZXcPOLl4tEXd66yVvRaZ9BjFkzqvkGfT5vkUhIGQTEPXMT2zE/xERwZoYtY5u
 4pd+Epox79AxTqDprTcwpM4b2IksOjfGBjGj5T3fZ8tdapWAeO03VCFY0UpGyLQtdCqKV9upe
 JRbcCU3ef7kfHjTuvnSuN11GOCmy4xjca09rKc8ywXwRgAVgW8K4WsxMmEYsci15EFXPg2awG
 vnoLppBo7PyehOnGR47IVgzZ6lgc1dE/UUfpUPzkPJLcdrytotr/fY/4RGPtyB3DK42Kpzamu
 5RoAY28vUmryHjxsJvNoJvXjiGj9MWafqwqSsqQxjT0HerDUq7CJSTmR+T7Fdp190Fk65rz4u
 zXLiREeQB8tQPtwUahMAeVf2Ee95zHFQgQ/MmAbexBdcGsth+UlucbwRBZUHVS+kafV+79l1J
 uBZLkdUBSlPQBUNC2q88fnzKe77Yv3xJ111rpLd1iCjEs2ojLd9jbNeeyNcqQPFXdKPTT+zNL
 G3P5jGdiLOlOK6mhcA9RTAzcD4jy3v3B2T77BGNic50fMPYKHV/sBpcdp0NNNRl3nZSWVD1v2
 tFkv3NHJJml6ZcD3LxxmWYWcXsC1cCwp6FSKm72+H4PKgmiCzzTtIlNrREdV/oagzWF5ZMUTA
 OrtNXN6vxRmu3/ob1uNQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.24
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The error message in object_class_property_add() was copied from
object_property_add() in commit 16bf7f522a2ff. Clarify that it is
about a class, not an object.

While here, have the format string in both functions to fit in a
single line for better grep-ability, despite the checkpatch warning.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <157287383591.234942.311840593519058490.stgit@bahia.tlslab.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qom/object.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 6fa9c619fac4..d51b57fba11e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1106,9 +1106,8 @@ object_property_add(Object *obj, const char *name, const char *type,
     }
 
     if (object_property_find(obj, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_get_typename(obj));
+        error_setg(errp, "attempt to add duplicate property '%s' to object (type '%s')",
+                   name, object_get_typename(obj));
         return NULL;
     }
 
@@ -1139,9 +1138,8 @@ object_class_property_add(ObjectClass *klass,
     ObjectProperty *prop;
 
     if (object_class_property_find(klass, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_class_get_name(klass));
+        error_setg(errp, "attempt to add duplicate property '%s' to class (type '%s')",
+                   name, object_class_get_name(klass));
         return NULL;
     }
 
-- 
2.21.0


