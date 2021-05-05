Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5583748B0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:25:49 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leN9Y-0003ny-Cd
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN6b-0001wD-JX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:22:47 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN6Z-0007cG-5c
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:22:45 -0400
Received: from fwd14.aul.t-online.de (fwd14.aul.t-online.de [172.20.26.242])
 by mailout07.t-online.de (Postfix) with SMTP id 8A54833284;
 Wed,  5 May 2021 21:21:59 +0200 (CEST)
Received: from linpower.localnet
 (VTNkdiZVohmbh6wtKnyvM-kqUCA4zG8xcbZMq3Zwz04Ojof9sw5bphhl-sWtNwewVi@[46.86.52.8])
 by fwd14.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1leN5q-3RhkYK0; Wed, 5 May 2021 21:21:58 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 06F5D2006FB; Wed,  5 May 2021 21:21:34 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 10/10] pckbd: remove duplicated keyboard and mouse defines
Date: Wed,  5 May 2021 21:21:33 +0200
Message-Id: <20210505192133.7480-10-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: VTNkdiZVohmbh6wtKnyvM-kqUCA4zG8xcbZMq3Zwz04Ojof9sw5bphhl-sWtNwewVi
X-TOI-EXPURGATEID: 150726::1620242518-0001611E-72F183E0/0/0 CLEAN NORMAL
X-TOI-MSGID: 53036e5b-a569-4d0e-9bd3-c5ffe67e8919
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In 2005 the author of commit daa579632d "PS2 mouse and keyboard
separation (Paul Brook)" and 0e43e99c04 "PS2 mouse and keyboard
separation (Paul Brook)" separated the PS/2 controller code and
the PS/2 keyboard and mouse code. It seems he forgot to remove
a few defines. Remove them now.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 7c476f7a3e..a386457187 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -61,21 +61,6 @@
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
@@ -108,28 +93,6 @@
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
 #define KBD_PENDING_KBD_V3      0x01
 #define KBD_PENDING_AUX_V3      0x02
 #define KBD_PENDING_CTRL_KBD    0x04
-- 
2.26.2


