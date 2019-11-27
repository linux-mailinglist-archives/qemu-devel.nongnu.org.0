Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC710B6FC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 20:46:44 +0100 (CET)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia3Gt-00070m-1S
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 14:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia3Dd-0003wF-Fl
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:43:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia3Da-0003aR-No
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:43:20 -0500
Received: from relay.sw.ru ([185.231.240.75]:55274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia3DW-0003Vu-Ha
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:43:15 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia3DP-0004Z8-WE; Wed, 27 Nov 2019 22:43:08 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] include/qom/object.h: rename Error ** parameter to more
 common errp
Date: Wed, 27 Nov 2019 22:43:07 +0300
Message-Id: <20191127194307.23985-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: pbonzini@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

v6: add r-b by Philippe

 include/qom/object.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 128d00c77f..716f6f655d 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1635,9 +1635,9 @@ void object_class_property_add_uint32_ptr(ObjectClass *klass, const char *name,
  * property of type 'uint64'.
  */
 void object_property_add_uint64_ptr(Object *obj, const char *name,
-                                    const uint64_t *v, Error **Errp);
+                                    const uint64_t *v, Error **errp);
 void object_class_property_add_uint64_ptr(ObjectClass *klass, const char *name,
-                                          const uint64_t *v, Error **Errp);
+                                          const uint64_t *v, Error **errp);
 
 /**
  * object_property_add_alias:
-- 
2.21.0


