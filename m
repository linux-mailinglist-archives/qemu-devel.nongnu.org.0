Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA74E332C6D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:43:11 +0100 (CET)
Received: from localhost ([::1]:44872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfRu-0001ny-Sd
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJekQ-00025s-VU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:58:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJekO-0003Cv-TH
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gEZOVEV48qXHptgFZbCe1jj6186jCJKc+b16CHmiWY8=;
 b=WDaN4hG5l5qHSpv1anpa2ir0DDRJ8R5pZJ7zH3UpM0RGnOlgM4dl22/Aky6jg9ZET+jxLg
 MlCMn0K67gF9YWsQuV0yTzGF4uopbGFAglS2kdNRV6otQjBI8txcGv3KuYF+EFW8LRpAYd
 6BZ2hpdV9Kda6cnWISKnfzbgEDO95+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-Fk9whXR6MT63tA5uFuu4vg-1; Tue, 09 Mar 2021 10:58:10 -0500
X-MC-Unique: Fk9whXR6MT63tA5uFuu4vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826842F7A0
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 15:58:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18A7D19C46;
 Tue,  9 Mar 2021 15:58:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/input: expand trace info reported for ps2 device
Date: Tue,  9 Mar 2021 15:58:04 +0000
Message-Id: <20210309155804.306051-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is interesting to know if the PS2 keyboard is in translated mode, and
which of the three scancode sets are in use.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/input/ps2.c        | 3 ++-
 hw/input/trace-events | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 72cdb80ae1..5352e417a4 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -293,7 +293,8 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
     qcode = qemu_input_key_value_to_qcode(key->key);
 
     mod = ps2_modifier_bit(qcode);
-    trace_ps2_keyboard_event(s, qcode, key->down, mod, s->modifiers);
+    trace_ps2_keyboard_event(s, qcode, key->down, mod,
+                             s->modifiers, s->scancode_set, s->translate);
     if (key->down) {
         s->modifiers |= mod;
     } else {
diff --git a/hw/input/trace-events b/hw/input/trace-events
index 1dd8ad6018..49c70d544e 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -30,7 +30,7 @@ pckbd_kbd_write_data(uint64_t val) "0x%02"PRIx64
 
 # ps2.c
 ps2_put_keycode(void *opaque, int keycode) "%p keycode 0x%02x"
-ps2_keyboard_event(void *opaque, int qcode, int down, unsigned int modifier, unsigned int modifiers) "%p qcode %d down %d modifier 0x%x modifiers 0x%x"
+ps2_keyboard_event(void *opaque, int qcode, int down, unsigned int modifier, unsigned int modifiers, int set, int xlate) "%p qcode %d down %d modifier 0x%x modifiers 0x%x set %d xlate %d"
 ps2_read_data(void *opaque) "%p"
 ps2_set_ledstate(void *s, int ledstate) "%p ledstate %d"
 ps2_reset_keyboard(void *s) "%p"
-- 
2.29.2


