Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3525B6ED
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 01:01:41 +0200 (CEST)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbl6-0003kr-B8
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 19:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbVM-00050u-Dq
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbVK-0000CL-ID
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LPvt2YxAC/aD8bzK1fAzTLbNHtbMlQjhfsCbmemzqxQ=;
 b=BgMHcAZA8qbT1DvPXIf8jr9vCYAQX9Of72HEVOGlRnPXsAvsr3zFmxgRXpqGjJyOMB6Est
 tHpcl3hCuoDojbqtXmRt0Gihcgnycf/S29J0FjERk/K9NpJfk+MqZtWBWl8h1oeNgqQcBU
 gPc8DdbLl/ntOwsjkisfB8yLTBBQQ9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-OsVO4KZiOh-7W4qgbUI4eg-1; Wed, 02 Sep 2020 18:45:18 -0400
X-MC-Unique: OsVO4KZiOh-7W4qgbUI4eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 197138030C7;
 Wed,  2 Sep 2020 22:45:17 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 875F01C4;
 Wed,  2 Sep 2020 22:45:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 45/63] renesas: Rename RSCI to RENESAS_SCI
Date: Wed,  2 Sep 2020 18:42:53 -0400
Message-Id: <20200902224311.1321159-46-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 17:54:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Magnus Damm <magnus.damm@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 berrange@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/char/renesas_sci.h |  2 +-
 hw/char/renesas_sci.c         | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
index a4764e3eee..1349d2d003 100644
--- a/include/hw/char/renesas_sci.h
+++ b/include/hw/char/renesas_sci.h
@@ -15,7 +15,7 @@
 
 #define TYPE_RENESAS_SCI "renesas-sci"
 typedef struct RSCIState RSCIState;
-DECLARE_INSTANCE_CHECKER(RSCIState, RSCI,
+DECLARE_INSTANCE_CHECKER(RSCIState, RENESAS_SCI,
                          TYPE_RENESAS_SCI)
 
 enum {
diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
index 5d7c6e6523..286fd28a39 100644
--- a/hw/char/renesas_sci.c
+++ b/hw/char/renesas_sci.c
@@ -70,7 +70,7 @@ REG8(SEMR, 7)
 
 static int can_receive(void *opaque)
 {
-    RSCIState *sci = RSCI(opaque);
+    RSCIState *sci = RENESAS_SCI(opaque);
     if (sci->rx_next > qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
         return 0;
     } else {
@@ -80,7 +80,7 @@ static int can_receive(void *opaque)
 
 static void receive(void *opaque, const uint8_t *buf, int size)
 {
-    RSCIState *sci = RSCI(opaque);
+    RSCIState *sci = RENESAS_SCI(opaque);
     sci->rx_next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime;
     if (FIELD_EX8(sci->ssr, SSR, RDRF) || size > 1) {
         sci->ssr = FIELD_DP8(sci->ssr, SSR, ORER, 1);
@@ -112,7 +112,7 @@ static void send_byte(RSCIState *sci)
 
 static void txend(void *opaque)
 {
-    RSCIState *sci = RSCI(opaque);
+    RSCIState *sci = RENESAS_SCI(opaque);
     if (!FIELD_EX8(sci->ssr, SSR, TDRE)) {
         send_byte(sci);
     } else {
@@ -143,7 +143,7 @@ static bool sci_is_tr_enabled(RSCIState *sci)
 
 static void sci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 {
-    RSCIState *sci = RSCI(opaque);
+    RSCIState *sci = RENESAS_SCI(opaque);
 
     switch (offset) {
     case A_SMR:
@@ -208,7 +208,7 @@ static void sci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
 static uint64_t sci_read(void *opaque, hwaddr offset, unsigned size)
 {
-    RSCIState *sci = RSCI(opaque);
+    RSCIState *sci = RENESAS_SCI(opaque);
 
     switch (offset) {
     case A_SMR:
@@ -246,7 +246,7 @@ static const MemoryRegionOps sci_ops = {
 
 static void rsci_reset(DeviceState *dev)
 {
-    RSCIState *sci = RSCI(dev);
+    RSCIState *sci = RENESAS_SCI(dev);
     sci->smr = sci->scr = 0x00;
     sci->brr = 0xff;
     sci->tdr = 0xff;
@@ -259,7 +259,7 @@ static void rsci_reset(DeviceState *dev)
 
 static void sci_event(void *opaque, QEMUChrEvent event)
 {
-    RSCIState *sci = RSCI(opaque);
+    RSCIState *sci = RENESAS_SCI(opaque);
     if (event == CHR_EVENT_BREAK) {
         sci->ssr = FIELD_DP8(sci->ssr, SSR, FER, 1);
         if (FIELD_EX8(sci->scr, SCR, RIE)) {
@@ -270,7 +270,7 @@ static void sci_event(void *opaque, QEMUChrEvent event)
 
 static void rsci_realize(DeviceState *dev, Error **errp)
 {
-    RSCIState *sci = RSCI(dev);
+    RSCIState *sci = RENESAS_SCI(dev);
 
     if (sci->input_freq == 0) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -284,7 +284,7 @@ static void rsci_realize(DeviceState *dev, Error **errp)
 static void rsci_init(Object *obj)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
-    RSCIState *sci = RSCI(obj);
+    RSCIState *sci = RENESAS_SCI(obj);
     int i;
 
     memory_region_init_io(&sci->memory, OBJECT(sci), &sci_ops,
-- 
2.26.2


