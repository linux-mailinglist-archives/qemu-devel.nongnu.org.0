Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F72124C5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 15:34:10 +0200 (CEST)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqzLt-0002E9-4P
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 09:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqzDy-00051U-7a
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:25:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32056
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqzDo-0007E4-54
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593696347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=d/a9Ntks1qykABzxoA+2KUfIStVfCwWOvIGdJEEdgOA=;
 b=VqdUIo/ZuHixO5PIvF9D+bNT/KVoe0lAprfMTVZmSnt85x4jgzDhafgGzL57GeWVm+K3vn
 nCsMYTQ8DkTFhTazBvtmNN+4IIhpw2jxOsiAkdx/o9yhvffgKDjL0H59/hswF6eHNwnciS
 rp1CMyGOgFn+zWRsXdDSBOyXDJAJK4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-IdcmyS39MFODuj-Jt1FUNQ-1; Thu, 02 Jul 2020 09:25:45 -0400
X-MC-Unique: IdcmyS39MFODuj-Jt1FUNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC9C805EEF;
 Thu,  2 Jul 2020 13:25:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C486660BE1;
 Thu,  2 Jul 2020 13:25:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6A5BD31EBE; Thu,  2 Jul 2020 15:25:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/20] audio: deprecate -soundhw sb16
Date: Thu,  2 Jul 2020 15:25:14 +0200
Message-Id: <20200702132525.6849-10-kraxel@redhat.com>
In-Reply-To: <20200702132525.6849-1-kraxel@redhat.com>
References: <20200702132525.6849-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to deprecated_register_soundhw().
Remove the now obsolete init function.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/sb16.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index df6f755a37f8..2d9e50f99b5d 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1415,12 +1415,6 @@ static void sb16_realizefn (DeviceState *dev, Error **errp)
     AUD_register_card ("sb16", &s->card);
 }
 
-static int SB16_init (ISABus *bus)
-{
-    isa_create_simple (bus, TYPE_SB16);
-    return 0;
-}
-
 static Property sb16_properties[] = {
     DEFINE_AUDIO_PROPERTIES(SB16State, card),
     DEFINE_PROP_UINT32 ("version", SB16State, ver,  0x0405), /* 4.5 */
@@ -1453,7 +1447,8 @@ static const TypeInfo sb16_info = {
 static void sb16_register_types (void)
 {
     type_register_static (&sb16_info);
-    isa_register_soundhw("sb16", "Creative Sound Blaster 16", SB16_init);
+    deprecated_register_soundhw("sb16", "Creative Sound Blaster 16",
+                                1, TYPE_SB16);
 }
 
 type_init (sb16_register_types)
-- 
2.18.4


