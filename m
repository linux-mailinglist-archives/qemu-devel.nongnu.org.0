Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BA1BDA63
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 13:11:32 +0200 (CEST)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTkcm-0008N7-0B
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 07:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTkUv-0005BS-8r
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:03:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTkTw-0003sG-KO
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:03:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32584
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jTkTw-0003nc-5X
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588158143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWhEbL+FaYUiHQWlH6+AXjDfQ3NVOtqgxWbSXhQ9H2Q=;
 b=fDh1FjvZ1/DJgElvLF96BJTaykzoyYPDYq/c6bJAZV3lz0D8Zv5nQ7xT5U7eOKI4TtOAVe
 sIGq9p00xgmpo/Ar2cb64jTcB89z7pENnqw9xJ8hsFC+HwO6rvN0OPZHlhekMG9zTCGqJp
 vz77iJCFcPZzThcHA+NvLoVSZfE9QGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-XTPl2tNWMRqR99-ulFeJIA-1; Wed, 29 Apr 2020 07:02:20 -0400
X-MC-Unique: XTPl2tNWMRqR99-ulFeJIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF858015CF
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 11:02:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B88ED27CC4;
 Wed, 29 Apr 2020 11:02:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F09E9DA1; Wed, 29 Apr 2020 13:02:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] audio: deprecate -soundhw gus
Date: Wed, 29 Apr 2020 13:02:10 +0200
Message-Id: <20200429110214.29037-9-kraxel@redhat.com>
In-Reply-To: <20200429110214.29037-1-kraxel@redhat.com>
References: <20200429110214.29037-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 hw/audio/gus.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index eb4a803fb53b..61d16fad9ffb 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -292,12 +292,6 @@ static void gus_realizefn (DeviceState *dev, Error **e=
rrp)
     AUD_set_active_out (s->voice, 1);
 }
=20
-static int GUS_init (ISABus *bus)
-{
-    isa_create_simple (bus, TYPE_GUS);
-    return 0;
-}
-
 static Property gus_properties[] =3D {
     DEFINE_AUDIO_PROPERTIES(GUSState, card),
     DEFINE_PROP_UINT32 ("freq",    GUSState, freq,        44100),
@@ -328,7 +322,7 @@ static const TypeInfo gus_info =3D {
 static void gus_register_types (void)
 {
     type_register_static (&gus_info);
-    isa_register_soundhw("gus", "Gravis Ultrasound GF1", GUS_init);
+    deprecated_register_soundhw("gus", "Gravis Ultrasound GF1", 1, TYPE_GU=
S);
 }
=20
 type_init (gus_register_types)
--=20
2.18.2


