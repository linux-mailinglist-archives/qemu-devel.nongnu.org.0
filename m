Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B03712B6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:54:11 +0200 (CEST)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldULC-0002GV-6b
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4f-0003Vp-57; Mon, 03 May 2021 04:37:07 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:47383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4J-0000l9-P0; Mon, 03 May 2021 04:37:01 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLRDv-1luKGJ3c7H-00IQqI; Mon, 03
 May 2021 10:36:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] hw/usb: Constify VMStateDescription
Date: Mon,  3 May 2021 10:36:09 +0200
Message-Id: <20210503083623.139700-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Qe6mKLxyZmJid49+QJ4W5Vp7KrgM1+M2fbjFyt2c2M2/VqqJc3B
 3bzOXIMYgSVQ+5j6l+4ZcQ/RxA3+g8Ke3BCGbz9YzhHa9I9Ef3x+Kc4h7ymL3SvgW9iZhIO
 ly6pp738jedYqauZYqPockRbt+Jr08sidtJVDDN8UrGv3R7hN7P3WrORBl6/MGfIJOQbQK9
 +gFZNEsOH95eR79uvVQUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ihz6sBSf2mQ=:inu45iwHoq8cIkYdA8q5ba
 zzLX5/WAO9zbq9t4FwvpkZk7THAdExi+ZdkcEuXOjhvnx5MQ5VQoO+qEqXA4HiYb8r8nKxex4
 sAv8OUC0G2oodgeI6UCY/F3MJOqUTNgi0I6rqu7W7mOhY0FMTdF0j2lYWZ6Ox2IaqjFuNoOGX
 P8T4JqDG39B1lZOBfFlxg0dhCxMocnqSZdbzYytr6d9aNVEkA+m6zZxgncHl2DLPCPfijANJ4
 juCk5M9aMt3FtPm0EsCR2EMnX7R2wCQxzAHqyiltIJCBd10ZEx3qcmyjiAwnqSp+2KUtoN1y0
 6wVvf9JNtHjstFt8yFh/6jI74UFKdLXZ/sinTDc3IwR9pIeYkVPyCmcVLp/cCefZhQ2/m/Cx4
 luKSC8buatZFt05pjAvQj1VMucem03Xm03ZnZ3R5sZLjlXG9sTQiOULx0aV+PtNfxh2PgtYcd
 IrXl4YSZQCxllWiMgi+mhuKrOGZgrZpBrxG1VDcDHheJIrU476wcprpSnQus4jzyGTAQdlqwt
 878TnQ6xY1Nw7MWpl3UxJU=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210313171150.2122409-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/usb/ccid-card-passthru.c   | 2 +-
 hw/usb/dev-smartcard-reader.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index c1a90fcc7a52..7212d0d7fb5e 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -374,7 +374,7 @@ static void passthru_realize(CCIDCardState *base, Error **errp)
     card->atr_length = sizeof(DEFAULT_ATR);
 }
 
-static VMStateDescription passthru_vmstate = {
+static const VMStateDescription passthru_vmstate = {
     .name = "ccid-card-passthru",
     .version_id = 1,
     .minimum_version_id = 1,
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index bc3d94092a23..f7043075be58 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1365,7 +1365,7 @@ static int ccid_pre_save(void *opaque)
     return 0;
 }
 
-static VMStateDescription bulk_in_vmstate = {
+static const VMStateDescription bulk_in_vmstate = {
     .name = "CCID BulkIn state",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1377,7 +1377,7 @@ static VMStateDescription bulk_in_vmstate = {
     }
 };
 
-static VMStateDescription answer_vmstate = {
+static const VMStateDescription answer_vmstate = {
     .name = "CCID Answer state",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1388,7 +1388,7 @@ static VMStateDescription answer_vmstate = {
     }
 };
 
-static VMStateDescription usb_device_vmstate = {
+static const VMStateDescription usb_device_vmstate = {
     .name = "usb_device",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1400,7 +1400,7 @@ static VMStateDescription usb_device_vmstate = {
     }
 };
 
-static VMStateDescription ccid_vmstate = {
+static const VMStateDescription ccid_vmstate = {
     .name = "usb-ccid",
     .version_id = 1,
     .minimum_version_id = 1,
-- 
2.31.1


