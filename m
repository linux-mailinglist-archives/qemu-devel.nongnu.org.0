Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD90207240
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:39:03 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3k6-0002kx-FP
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3cJ-0004MU-Vy
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:31:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45876
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3cD-00085b-Lu
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=VrjkzeYjFVWx4CauFAh7J9oz+USZwYX0CXQbxUCKY7M=;
 b=CAMM/hV496o4rUpxCb8RKDNfyjA65owzNPTXy+HiqysU/APrfVao4wpJDLZYukT7AeiZfW
 YnMXMxPhjWK24BWTsrL5Y24xKO0eRjG86ktxqqXvpXZgOIwtL2PeigV68TBRLikvKI5n1T
 HCd5NpYN2uluBXYDD9/y5deIuJHeuoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-rvr6tsmFP7CYFKe9MUgPHQ-1; Wed, 24 Jun 2020 07:30:46 -0400
X-MC-Unique: rvr6tsmFP7CYFKe9MUgPHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBCD3800C64;
 Wed, 24 Jun 2020 11:30:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60D510027AA;
 Wed, 24 Jun 2020 11:30:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CAB396DE4; Wed, 24 Jun 2020 13:30:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/20] audio: deprecate -soundhw es1370
Date: Wed, 24 Jun 2020 13:30:11 +0200
Message-Id: <20200624113026.13343-6-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to deprecated_register_soundhw().  Remove the now obsolete init
function.  Add an alias so both es1370 and ES1370 are working with
-device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/es1370.c | 9 ++-------
 qdev-monitor.c    | 1 +
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 5f8a83ff5624..4255463a49ff 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -884,12 +884,6 @@ static void es1370_exit(PCIDevice *dev)
     AUD_remove_card(&s->card);
 }
 
-static int es1370_init (PCIBus *bus)
-{
-    pci_create_simple (bus, -1, TYPE_ES1370);
-    return 0;
-}
-
 static Property es1370_properties[] = {
     DEFINE_AUDIO_PROPERTIES(ES1370State, card),
     DEFINE_PROP_END_OF_LIST(),
@@ -928,7 +922,8 @@ static const TypeInfo es1370_info = {
 static void es1370_register_types (void)
 {
     type_register_static (&es1370_info);
-    pci_register_soundhw("es1370", "ENSONIQ AudioPCI ES1370", es1370_init);
+    deprecated_register_soundhw("es1370", "ENSONIQ AudioPCI ES1370",
+                                0, TYPE_ES1370);
 }
 
 type_init (es1370_register_types)
diff --git a/qdev-monitor.c b/qdev-monitor.c
index 105d9792ecdf..e3083fae394b 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -55,6 +55,7 @@ typedef struct QDevAlias
 static const QDevAlias qdev_alias_table[] = {
     { "AC97", "ac97" }, /* -soundhw name */
     { "e1000", "e1000-82540em" },
+    { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
     { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_S390X },
-- 
2.18.4


