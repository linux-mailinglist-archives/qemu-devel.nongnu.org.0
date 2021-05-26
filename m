Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4912F3919F7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:21:13 +0200 (CEST)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluPI-000455-9f
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluC5-0004IM-7e
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBy-0004KR-OR
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M48wh+UrpunSmFHYj/8wc+W2iAj2SmHwMMGaNrSBIMw=;
 b=T8R93mSoCYpoiEXsvlaQ44TqwO2iUB5T0gXQFH7tbGnaSM0mTuLwSuxBw9KX8h9XJOOZlI
 0EB3kRlFkEKQW6u01oGGH9cnQpQJfbnzFJSRe9JYNGyH/4rBTAbUDFVy6ScG2zPBtyk8Yx
 pQzecim29SLPsfASuQ7CtrzfF1a/EJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-lLJr7Nm5OOaGwVEaSxp3vg-1; Wed, 26 May 2021 10:07:21 -0400
X-MC-Unique: lLJr7Nm5OOaGwVEaSxp3vg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C9D690E64E;
 Wed, 26 May 2021 14:07:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C6C5D9C6;
 Wed, 26 May 2021 14:07:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 007251800938; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/14] pckbd: remove duplicated keyboard and mouse defines
Date: Wed, 26 May 2021 16:06:25 +0200
Message-Id: <20210526140627.381857-13-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

In 2005 the author of commit daa579632d "PS2 mouse and keyboard
separation (Paul Brook)" and 0e43e99c04 "PS2 mouse and keyboard
separation (Paul Brook)" separated the PS/2 controller code and
the PS/2 keyboard and mouse code. It seems he forgot to remove
a few defines. Remove them now.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210525181441.27768-11-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/pckbd.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index e73bc8181cff..de867abc06b7 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -62,21 +62,6 @@
 #define KBD_CCMD_RESET          0xFE    /* Pulse bit 0 of the output port P2 = CPU reset. */
 #define KBD_CCMD_NO_OP          0xFF    /* Pulse no bits of the output port P2. */
 
-/* Keyboard Commands */
-#define KBD_CMD_SET_LEDS	0xED	/* Set keyboard leds */
-#define KBD_CMD_ECHO     	0xEE
-#define KBD_CMD_GET_ID 	        0xF2	/* get keyboard ID */
-#define KBD_CMD_SET_RATE	0xF3	/* Set typematic rate */
-#define KBD_CMD_ENABLE		0xF4	/* Enable scanning */
-#define KBD_CMD_RESET_DISABLE	0xF5	/* reset and disable scanning */
-#define KBD_CMD_RESET_ENABLE   	0xF6    /* reset and enable scanning */
-#define KBD_CMD_RESET		0xFF	/* Reset */
-
-/* Keyboard Replies */
-#define KBD_REPLY_POR		0xAA	/* Power on reset */
-#define KBD_REPLY_ACK		0xFA	/* Command ACK */
-#define KBD_REPLY_RESEND	0xFE	/* Command NACK, send the cmd again */
-
 /* Status Register Bits */
 #define KBD_STAT_OBF 		0x01	/* Keyboard output buffer full */
 #define KBD_STAT_IBF 		0x02	/* Keyboard input buffer full */
@@ -109,28 +94,6 @@
  */
 #define KBD_OUT_ONES            0xcc
 
-/* Mouse Commands */
-#define AUX_SET_SCALE11		0xE6	/* Set 1:1 scaling */
-#define AUX_SET_SCALE21		0xE7	/* Set 2:1 scaling */
-#define AUX_SET_RES		0xE8	/* Set resolution */
-#define AUX_GET_SCALE		0xE9	/* Get scaling factor */
-#define AUX_SET_STREAM		0xEA	/* Set stream mode */
-#define AUX_POLL		0xEB	/* Poll */
-#define AUX_RESET_WRAP		0xEC	/* Reset wrap mode */
-#define AUX_SET_WRAP		0xEE	/* Set wrap mode */
-#define AUX_SET_REMOTE		0xF0	/* Set remote mode */
-#define AUX_GET_TYPE		0xF2	/* Get type */
-#define AUX_SET_SAMPLE		0xF3	/* Set sample rate */
-#define AUX_ENABLE_DEV		0xF4	/* Enable aux device */
-#define AUX_DISABLE_DEV		0xF5	/* Disable aux device */
-#define AUX_SET_DEFAULT		0xF6
-#define AUX_RESET		0xFF	/* Reset aux device */
-#define AUX_ACK			0xFA	/* Command byte ACK. */
-
-#define MOUSE_STATUS_REMOTE     0x40
-#define MOUSE_STATUS_ENABLED    0x20
-#define MOUSE_STATUS_SCALE21    0x10
-
 #define KBD_PENDING_KBD_COMPAT  0x01
 #define KBD_PENDING_AUX_COMPAT  0x02
 #define KBD_PENDING_CTRL_KBD    0x04
-- 
2.31.1


