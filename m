Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A744207241
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:39:13 +0200 (CEST)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3kF-0002wt-4s
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c8-0004Ai-Rp
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37573
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c2-0007xq-A4
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=UXFSsQuaVtXhn+4w6xUfiV8YMH0MsMlHnZf2WuTzOAw=;
 b=Qc3wb2LUEI384+Qn5wfB3zDo2smWkm+d3mpmxJjLZJV9k26iT8T3kSqKyN2ZdTnS9VCNqm
 sWYU1hk2jrQhVwz8v1uKNilX7/QsvtqQmawCEdugQWeElxNEqG/2SBEdalWkcsxamGiuTB
 1IZ/iBV+wUffjF76Elfk2Rj2d+3xGRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-plWjsNjCMiCgllT9LRLWiA-1; Wed, 24 Jun 2020 07:30:39 -0400
X-MC-Unique: plWjsNjCMiCgllT9LRLWiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3781C18A822A;
 Wed, 24 Jun 2020 11:30:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D51A9512FE;
 Wed, 24 Jun 2020 11:30:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56E7B31E59; Wed, 24 Jun 2020 13:30:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/20] audio: deprecate -soundhw pcspk
Date: Wed, 24 Jun 2020 13:30:23 +0200
Message-Id: <20200624113026.13343-18-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
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

Add deprecation message to the audio init function.

Factor out audio initialization and call that from
both audio init and realize, so setting the audiodev
property is enough to properly initialize pcspk.

Add a property alias to the machine type to set the
audio device, so pcspk can be initialized using:
"-machine pcspk-audiodev=<name>"

Using "-global isa-pcspk.audiodev=<name>" works too but
is not recommended.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/pcspk.c | 24 +++++++++++++++++++++---
 hw/i386/pc.c     |  2 ++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index c37a3878612e..4c7e339ac2b5 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -28,6 +28,7 @@
 #include "audio/audio.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "qemu/error-report.h"
 #include "hw/timer/i8254.h"
 #include "migration/vmstate.h"
 #include "hw/audio/pcspk.h"
@@ -112,11 +113,15 @@ static void pcspk_callback(void *opaque, int free)
     }
 }
 
-static int pcspk_audio_init(ISABus *bus)
+static int pcspk_audio_init(PCSpkState *s)
 {
-    PCSpkState *s = pcspk_state;
     struct audsettings as = {PCSPK_SAMPLE_RATE, 1, AUDIO_FORMAT_U8, 0};
 
+    if (s->voice) {
+        /* already initialized */
+        return 0;
+    }
+
     AUD_register_card(s_spk, &s->card);
 
     s->voice = AUD_open_out(&s->card, s->voice, s_spk, s, pcspk_callback, &as);
@@ -185,6 +190,10 @@ static void pcspk_realizefn(DeviceState *dev, Error **errp)
 
     isa_register_ioport(isadev, &s->ioport, s->iobase);
 
+    if (s->card.state) {
+        pcspk_audio_init(s);
+    }
+
     pcspk_state = s;
 }
 
@@ -236,9 +245,18 @@ static const TypeInfo pcspk_info = {
     .class_init     = pcspk_class_initfn,
 };
 
+static int pcspk_audio_init_soundhw(ISABus *bus)
+{
+    PCSpkState *s = pcspk_state;
+
+    warn_report("'-soundhw pcspk' is deprecated, "
+                "please set a backend using '-machine pcspk-audiodev=<name>' instead");
+    return pcspk_audio_init(s);
+}
+
 static void pcspk_register(void)
 {
     type_register_static(&pcspk_info);
-    isa_register_soundhw("pcspk", "PC speaker", pcspk_audio_init);
+    isa_register_soundhw("pcspk", "PC speaker", pcspk_audio_init_soundhw);
 }
 type_init(pcspk_register)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f7ca8d981afa..bd393f82377f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1913,6 +1913,8 @@ static void pc_machine_initfn(Object *obj)
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
+    object_property_add_alias(OBJECT(pcms), "pcspk-audiodev",
+                              OBJECT(pcms->pcspk), "audiodev");
 }
 
 static void pc_machine_reset(MachineState *machine)
-- 
2.18.4


