Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9712035EB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 13:41:09 +0200 (CEST)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnKp2-00020O-2i
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 07:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnKe3-0003LH-GP
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 07:29:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36170
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnKdw-0008VM-VH
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 07:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592825379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=xNpDDsbbHHbzoy9YLA4tgd22/EHd97ILJm3ZhW/keJM=;
 b=cESWjE+ai/Ny7rig8TQRBgrQmFpW0KMNQtVimjJ3W7WWjn0me5Fo2xHoF5vmnbNHpv17SE
 MX2YW59ZTmCPZrKX/8oHSb71xLB0L+BaA2/l/Rl33yq6OnNyQDYoNOS7AH4uA9n/NYkDsR
 vfvnGpB+maWbmXd7Mm5vQxvFsqbkO8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-leeRvsJAN46-mb2tqJKaoQ-1; Mon, 22 Jun 2020 07:29:36 -0400
X-MC-Unique: leeRvsJAN46-mb2tqJKaoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143D5100CCC1;
 Mon, 22 Jun 2020 11:29:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC45A7C1FC;
 Mon, 22 Jun 2020 11:29:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 502B89D95; Mon, 22 Jun 2020 13:29:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/19] audio: deprecate -soundhw cs4231a
Date: Mon, 22 Jun 2020 13:29:02 +0200
Message-Id: <20200622112914.30454-8-kraxel@redhat.com>
In-Reply-To: <20200622112914.30454-1-kraxel@redhat.com>
References: <20200622112914.30454-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to deprecated_register_soundhw().
Remove the now obsolete init function.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/cs4231a.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index ffdbb58d6a11..59705a8d4701 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -683,12 +683,6 @@ static void cs4231a_realizefn (DeviceState *dev, Error **errp)
     AUD_register_card ("cs4231a", &s->card);
 }
 
-static int cs4231a_init (ISABus *bus)
-{
-    isa_create_simple (bus, TYPE_CS4231A);
-    return 0;
-}
-
 static Property cs4231a_properties[] = {
     DEFINE_AUDIO_PROPERTIES(CSState, card),
     DEFINE_PROP_UINT32 ("iobase",  CSState, port, 0x534),
@@ -720,7 +714,7 @@ static const TypeInfo cs4231a_info = {
 static void cs4231a_register_types (void)
 {
     type_register_static (&cs4231a_info);
-    isa_register_soundhw("cs4231a", "CS4231A", cs4231a_init);
+    deprecated_register_soundhw("cs4231a", "CS4231A", 1, TYPE_CS4231A);
 }
 
 type_init (cs4231a_register_types)
-- 
2.18.4


