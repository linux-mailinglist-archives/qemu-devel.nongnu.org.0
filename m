Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF767157D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fb-0001wE-TB; Wed, 18 Jan 2023 02:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FY-0001tu-Pc; Wed, 18 Jan 2023 02:52:48 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FX-00023w-4d; Wed, 18 Jan 2023 02:52:48 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MVNJ3-1p7MGS0eBT-00SS8u; Wed, 18
 Jan 2023 08:52:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/15] ccid-card-emulated: fix cast warning/error
Date: Wed, 18 Jan 2023 08:52:30 +0100
Message-Id: <20230118075234.2322131-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J7tTA/l8mOTAgK9vXFIO7KZ3YwptmGer1KuWDAKCqAjMsxI4bmt
 Qs++Gu4J3rLU2sOsouklo473EM7XUtM07jNTfjr18wKuOE57SYoFzB9omRyAy+kP96GEYPY
 aqzNn/olt+x0I2aY0qQtkudQRQCN3NnR/tgn9KOFsgQSnkThrWp+yxYoAajc5cc8p6Vq3ZC
 GrNS6vJseUaYWlXbSP7TA==
UI-OutboundReport: notjunk:1;M01:P0:qeBzdlQ8CSU=;+58mGJxI1VuQ7LS5rEUy4AW9wXc
 DmItn5V74b8naTZAvSy/y9qa1DLkqC2qx05bAOn6w6D9Kg+s75I28BfouROhkTXkwPGmQ6foZ
 XBjy2tEdMeXtl8Mz6A+9qFISx4mTUX1VC0YSjdTTwU7KYGJHw/kC6chq+PO9BuBxIBUk8OiOb
 k5BzgY/G4ZfFYRdsqea3rsho1HD1F2sGO18jdf6ixrD/yUuVkzA7MqnjXaaRv92yXsc/OZHv+
 MpVcHqEecoq1MKbTpKZ+P2fRcRxHsPvapGxaL8SV3PEQcSNLo2wmhcV7v4sxzjkEkvChmYupO
 WgMCI1n2QPckXmWkJeqzfKxiLLEmsp4kk/2HRvvv17vN8HES4Hjb2ydgNhnTKPtQA5cFS1Aw7
 YJ7DgQucvglVOUaOJ+PR3+OG59HEKy0UmcxE+oikcF6DIpA7B+8ZvesahzBbvEb6GsggWuCBd
 9H/eWridGd5BhUpWPX0fvBO88qbYmHj5BAncMKuBK/g+a7wda9gRb3afhG/MZs5l96pJrSd+F
 KGXQLdgDyIyaOl3QJGlhpqRpry81eSK4/Gk31Hhhcyl+YGgHbHqQYoc7P8W5mZnsB20Dq2b/M
 pdWPRz/Z1oBTxj114K6XpMIZxVZD7J0bolCPEgNYSRjApZzufm9LLpcvcj1E3RYlc6gSFjtJB
 r2VeanSXp+IV2WPdunysYv/xDzu5bxWCsGivow5pmA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../hw/usb/ccid-card-emulated.c: In function 'handle_apdu_thread':
../hw/usb/ccid-card-emulated.c:251:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  251 |                 assert((unsigned long)event > 1000);

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230103110814.3726795-2-marcandre.lureau@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/usb/ccid-card-emulated.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index ee41a818014b..c32866007549 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -248,7 +248,7 @@ static void *handle_apdu_thread(void* arg)
         WITH_QEMU_LOCK_GUARD(&card->vreader_mutex) {
             while (!QSIMPLEQ_EMPTY(&card->guest_apdu_list)) {
                 event = QSIMPLEQ_FIRST(&card->guest_apdu_list);
-                assert((unsigned long)event > 1000);
+                assert(event != NULL);
                 QSIMPLEQ_REMOVE_HEAD(&card->guest_apdu_list, entry);
                 if (event->p.data.type != EMUL_GUEST_APDU) {
                     DPRINTF(card, 1, "unexpected message in handle_apdu_thread\n");
-- 
2.38.1


