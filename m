Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4BB44155C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:34:34 +0100 (CET)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSm1-0007xE-DS
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfn-0006QE-Mu; Mon, 01 Nov 2021 04:28:07 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfl-00087c-GO; Mon, 01 Nov 2021 04:28:07 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MSZDt-1mEd9d1f3J-00SvGL; Mon, 01
 Nov 2021 09:27:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] hw/input/lasips2: Fix typos in function names
Date: Mon,  1 Nov 2021 09:27:45 +0100
Message-Id: <20211101082747.2524909-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101082747.2524909-1-laurent@vivier.eu>
References: <20211101082747.2524909-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RTBLZN1a9AZ2r5kyMXL2h38D7xJOMNpSaK6duuP4E8uIQuhf46G
 mMOLgXZLj+U46ZmJov7oTbxKSrhcEaNkxZyExjsyV6hEeEI9+unKGhny5mZkhhGN468HcBv
 yhzN3h6zfzWxjntRaM7ZE+7JYy/MXi6W9552BTSS97+hFdTDfrIK8h1mZD5XnoNhyQfMgvW
 /c74CPzOseH7Pd1sF+/eg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NTaAXgdASzU=:wvLIUtgg275ku4gWlXT4rP
 HgPhIw+T6LHz7qKxqZfoHNQquFWX6v+FzKMt9tezLkKMVDT4a9EQ5h+wZgfc1sjTNPYgUY6Bq
 B7x+4ZZMZkPVsj+00lKwePfENMIYyY4eghVgy0KsPRHfEyhbW9qDLxiJsBzEGLIb/PEZg3dEg
 xeuokhNOgt3xDLKiepXdFQB9OgOpODf9j876Tre/XaYZtUKJ65mHgHrQ16vpKOyoOGREfs6A6
 BHrZeofYKbUd+uiI1t0vaDRCXd2/ZE3py9xBMSuSdkl3946/AvK9SKgA1AAIZGXtkFtBJYzJQ
 mH66VaFyKhmk0FZxefVLWvvpt/Apu457w3z5pDcH9VnyIFPGrEQZyrFE9u7D93qagBsQI0BP8
 vU3HWHFmJUn/F0HPMKYdK5HnxaLh2ZHyXP6/zUWVqP9vIK+JmFMnGIfWT3nqNhLJNAk1GKuJJ
 q8kBWIROrNzSpXYbqRd8A4e2VwMerW/d0WKfG81qGHLQ2724evQFezMA5OFf3jc6UsEV6MeDz
 B9yZBWWWIc8F1VRTYjqD/uT+zhgC0KsvWO/s2ZY4NfySqpIZsPB4V/VgCdoC8hoBQRi01iUjP
 6lu3XnsKt2PzkTHopUqu5ou97ExdGTqbdyHNWJvU8rc5idarPgifBFkzQxvympWUw9vus8msv
 JTtH72y46Uhz5x4BS+lwVlHkDxWrpwaTXOijpMQBF3Jcs1QAyjwHyF6dIo2xJKUfIxyo=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Artist is another device, this one is the Lasi PS/2.
Rename the functions accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20210920064048.2729397-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/lasips2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index e7faf24058b4..68d741d34215 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -96,7 +96,7 @@ typedef enum {
     LASIPS2_STATUS_CLKSHD = 0x80,
 } lasips2_status_reg_t;
 
-static const char *artist_read_reg_name(uint64_t addr)
+static const char *lasips2_read_reg_name(uint64_t addr)
 {
     switch (addr & 0xc) {
     case REG_PS2_ID:
@@ -116,7 +116,7 @@ static const char *artist_read_reg_name(uint64_t addr)
     }
 }
 
-static const char *artist_write_reg_name(uint64_t addr)
+static const char *lasips2_write_reg_name(uint64_t addr)
 {
     switch (addr & 0x0c) {
     case REG_PS2_RESET:
@@ -145,7 +145,7 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
     LASIPS2Port *port = opaque;
 
     trace_lasips2_reg_write(size, port->id, addr,
-                            artist_write_reg_name(addr), val);
+                            lasips2_write_reg_name(addr), val);
 
     switch (addr & 0xc) {
     case REG_PS2_CONTROL:
@@ -239,7 +239,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
     trace_lasips2_reg_read(size, port->id, addr,
-                           artist_read_reg_name(addr), ret);
+                           lasips2_read_reg_name(addr), ret);
 
     return ret;
 }
-- 
2.31.1


