Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6E254EC9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:38:28 +0200 (CEST)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNj9-0004Wb-Rn
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNSz-0006F4-EW
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:21:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46274
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNSx-0000MT-Qd
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598556103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16ROf7HSKknAmLIGZmXlrYE3iR7OO+JG34+R2pn1wxE=;
 b=UxFQ9FbVFLrI/LuWsmTOSiT7Z1gDhuWQBUIO7Jb91W8KdQHvqAVaX0nz9SbHuapv77dNik
 ChLB0dEK8fAmAx35Ig4es+XkxHs1po/PpcAh4q0duA4Ip/AwH9wwO4vmA37D8aqyv6gWdL
 68Ol7MjPEs8BKQTDl5Rm4EMnMD5Ac4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-eDn5tIS6NxS8s8gGIueK9g-1; Thu, 27 Aug 2020 15:21:40 -0400
X-MC-Unique: eDn5tIS6NxS8s8gGIueK9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B0268018A4;
 Thu, 27 Aug 2020 19:21:38 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 575F2747BD;
 Thu, 27 Aug 2020 19:21:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/53] pl110: Rename pl110_version enum values
Date: Thu, 27 Aug 2020 15:20:34 -0400
Message-Id: <20200827192122.658035-6-ehabkost@redhat.com>
In-Reply-To: <20200827192122.658035-1-ehabkost@redhat.com>
References: <20200827192122.658035-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 07:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PL110 enum value name will conflict with the PL110 type cast
checker, when we replace the existing macro with an inline
function.  Add a VERSION_ prefix to all pl110_version enum
values, to avoid conflicts.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Tested-By: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200825192110.3528606-5-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/display/pl110.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index c2991a28d2..61fefbffb3 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -42,9 +42,9 @@ enum pl110_bppmode
 /* The Versatile/PB uses a slightly modified PL110 controller.  */
 enum pl110_version
 {
-    PL110,
-    PL110_VERSATILE,
-    PL111
+    VERSION_PL110,
+    VERSION_PL110_VERSATILE,
+    VERSION_PL111
 };
 
 #define TYPE_PL110 "pl110"
@@ -189,7 +189,7 @@ static void pl110_update_display(void *opaque)
     else
         bpp_offset = 24;
 
-    if ((s->version != PL111) && (s->bpp == BPP_16)) {
+    if ((s->version != VERSION_PL111) && (s->bpp == BPP_16)) {
         /* The PL110's native 16 bit mode is 5551; however
          * most boards with a PL110 implement an external
          * mux which allows bits to be reshuffled to give
@@ -372,12 +372,12 @@ static uint64_t pl110_read(void *opaque, hwaddr offset,
     case 5: /* LCDLPBASE */
         return s->lpbase;
     case 6: /* LCDIMSC */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             return s->cr;
         }
         return s->int_mask;
     case 7: /* LCDControl */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             return s->int_mask;
         }
         return s->cr;
@@ -437,7 +437,7 @@ static void pl110_write(void *opaque, hwaddr offset,
         s->lpbase = val;
         break;
     case 6: /* LCDIMSC */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             goto control;
         }
     imsc:
@@ -445,7 +445,7 @@ static void pl110_write(void *opaque, hwaddr offset,
         pl110_update(s);
         break;
     case 7: /* LCDControl */
-        if (s->version != PL110) {
+        if (s->version != VERSION_PL110) {
             goto imsc;
         }
     control:
@@ -513,21 +513,21 @@ static void pl110_init(Object *obj)
 {
     PL110State *s = PL110(obj);
 
-    s->version = PL110;
+    s->version = VERSION_PL110;
 }
 
 static void pl110_versatile_init(Object *obj)
 {
     PL110State *s = PL110(obj);
 
-    s->version = PL110_VERSATILE;
+    s->version = VERSION_PL110_VERSATILE;
 }
 
 static void pl111_init(Object *obj)
 {
     PL110State *s = PL110(obj);
 
-    s->version = PL111;
+    s->version = VERSION_PL111;
 }
 
 static void pl110_class_init(ObjectClass *klass, void *data)
-- 
2.26.2


