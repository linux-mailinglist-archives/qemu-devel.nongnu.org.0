Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190CA24413D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 00:28:19 +0200 (CEST)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Lhp-0006RF-Gx
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 18:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6LgC-0004tN-Fb
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6Lg9-0002oQ-Tk
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597357591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIQEde4+zs7Zyn3zWt9BzSDyOSwDPThp7DTuMD0yb4I=;
 b=bhnlTF9E7b/1NOlKJSjxUELY8hMr5GQVWEszoNiTTfsMgNJuVQZQ7BCU3d3SdU18iVzWLw
 xPVUF6vhUAHXBx9i0IT/Jo3k7xLqq6QdPQlLCBbmqKKTXLUoEfvDFWA3xU6M4x/kEvr3mq
 r27jQWAe9dhbmOhNzNTdm/1mGRpfjto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-Io1xjVPVNgOF4yPgaWvdxQ-1; Thu, 13 Aug 2020 18:26:29 -0400
X-MC-Unique: Io1xjVPVNgOF4yPgaWvdxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F51A100CA88
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 22:26:28 +0000 (UTC)
Received: from localhost (ovpn-117-153.rdu2.redhat.com [10.10.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69858708FF;
 Thu, 13 Aug 2020 22:26:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/41] pl1110: Rename PL1110 enum
Date: Thu, 13 Aug 2020 18:25:45 -0400
Message-Id: <20200813222625.243136-2-ehabkost@redhat.com>
In-Reply-To: <20200813222625.243136-1-ehabkost@redhat.com>
References: <20200813222625.243136-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 18:26:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PL1110 enum value name will conflict with the PL1110 type
cast checker, when we replace the existing macro with an inline
function.  Rename it to PL1110_STOCK.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/display/pl110.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index c2991a28d2..4664fde3f2 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -42,7 +42,7 @@ enum pl110_bppmode
 /* The Versatile/PB uses a slightly modified PL110 controller.  */
 enum pl110_version
 {
-    PL110,
+    PL110_STOCK,
     PL110_VERSATILE,
     PL111
 };
@@ -372,12 +372,12 @@ static uint64_t pl110_read(void *opaque, hwaddr offset,
     case 5: /* LCDLPBASE */
         return s->lpbase;
     case 6: /* LCDIMSC */
-        if (s->version != PL110) {
+        if (s->version != PL110_STOCK) {
             return s->cr;
         }
         return s->int_mask;
     case 7: /* LCDControl */
-        if (s->version != PL110) {
+        if (s->version != PL110_STOCK) {
             return s->int_mask;
         }
         return s->cr;
@@ -437,7 +437,7 @@ static void pl110_write(void *opaque, hwaddr offset,
         s->lpbase = val;
         break;
     case 6: /* LCDIMSC */
-        if (s->version != PL110) {
+        if (s->version != PL110_STOCK) {
             goto control;
         }
     imsc:
@@ -445,7 +445,7 @@ static void pl110_write(void *opaque, hwaddr offset,
         pl110_update(s);
         break;
     case 7: /* LCDControl */
-        if (s->version != PL110) {
+        if (s->version != PL110_STOCK) {
             goto imsc;
         }
     control:
@@ -513,7 +513,7 @@ static void pl110_init(Object *obj)
 {
     PL110State *s = PL110(obj);
 
-    s->version = PL110;
+    s->version = PL110_STOCK;
 }
 
 static void pl110_versatile_init(Object *obj)
-- 
2.26.2


