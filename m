Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B441BDA5F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 13:10:01 +0200 (CEST)
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTkbI-0005e9-7y
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 07:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTkUz-0005CG-E5
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:03:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTkU1-000474-7j
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:03:29 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37338
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jTkU0-00042d-Ol
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588158147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7koQvZy8UosvfF1UQbYBUZT0Za8I46Ydf0Ny1mGVqxk=;
 b=b3UfEOMZnL9RVCL3kwQKEZuMeK9PiIoTey168x6txtv9yPH64UlDQK/JZBGB3pCUzJgTyQ
 TvH2R91TXRt3k3dHiQZ1MLGt/zhudEWkJGysQhRWsyPW7T2GZJxdYeOluGFh9XjlLsn3aK
 WdDRuQFASzEFQlzkHQ436P+4kcyxmG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-SfcXf38HMwmQZn5uNhcxbA-1; Wed, 29 Apr 2020 07:02:23 -0400
X-MC-Unique: SfcXf38HMwmQZn5uNhcxbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCBE1EC1A3
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 11:02:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE384579A9;
 Wed, 29 Apr 2020 11:02:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3DF519D9F; Wed, 29 Apr 2020 13:02:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] audio: deprecate -soundhw adlib
Date: Wed, 29 Apr 2020 13:02:08 +0200
Message-Id: <20200429110214.29037-7-kraxel@redhat.com>
In-Reply-To: <20200429110214.29037-1-kraxel@redhat.com>
References: <20200429110214.29037-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 00:53:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to deprecated_register_soundhw().
Remove the now obsolete init function.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/adlib.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index d6c1fb0586c6..f62fbd413169 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -322,16 +322,10 @@ static const TypeInfo adlib_info =3D {
     .class_init    =3D adlib_class_initfn,
 };
=20
-static int Adlib_init (ISABus *bus)
-{
-    isa_create_simple (bus, TYPE_ADLIB);
-    return 0;
-}
-
 static void adlib_register_types (void)
 {
     type_register_static (&adlib_info);
-    isa_register_soundhw("adlib", ADLIB_DESC, Adlib_init);
+    deprecated_register_soundhw("adlib", ADLIB_DESC, 1, TYPE_ADLIB);
 }
=20
 type_init (adlib_register_types)
--=20
2.18.2


