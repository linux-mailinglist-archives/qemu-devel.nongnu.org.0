Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5EA6A481A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:35:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhOZ-0005Go-0g; Mon, 27 Feb 2023 12:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=415647c1b=ross.lagerwall@citrix.com>)
 id 1pWhOT-0005FL-Bc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:34:34 -0500
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=415647c1b=ross.lagerwall@citrix.com>)
 id 1pWhOP-00007s-UR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1677519269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d9ejNqtFgoaEqKVkMqF3XU05wULjlE9wwsdoD0kzOgs=;
 b=ECrvKltTKxP+slbD2dB/SkreJmxSp1bWtFhNNyFgHFK2Lo9eZe232wYz
 E3rjYvLwgNVmvQZ+PrTjvy7Se7eHHk4ig1Fnwbfb3bI1c+EJZMmCYijYV
 F0KrgDU5hlgXVV/AHJ/CfoN2YsoqQ9I26K6ZpWEeYRvwPsEjlu+88adT8 M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97547628
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:DhOls62SPVz/UP9gu/bD5alxkn2cJEfYwER7XKvMYLTBsI5bpzMHn
 TYfCGDSM/6ONGX9eNF/bIrl9xgDuZDVy4MwHAM5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gZkOqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfH3sR7
 fBAJBU3YSu7nbO5wJ2dGrlyr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tP2vnWK5dzRXpUiKrK4zy2PS0BZwwP7mN9+9ltmiFJoIwhnG/
 DKuE2LRWSgbL9KAxBy+/lmVvL7Bgzz/AtxNG+jtnhJtqALKnTFCYPEMbnOirPykz0KzRd9bA
 0oT/CUosO417kPDZtPwRQexpnGJlgQRV9pZD6sx7wTl90bPy1/HXC5eFGcHMYF48pZsHlTGy
 2Nlgfv3H2N3vOWZbEiSzY+O/DyyFg5FfXErMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclRu7BCxWtame0bbtT834JplyQF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPd3uV590kfawRIq7PhwxUjapSsIsHDJrAQk0PRLAt4wTuBREfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhnrV4/savTlkz9uZLHPS79dFvwGAfWBgzPxP/e8Vq9H
 hc2H5fi9iizp8WkOHWMrdBOdgBSRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:cGQ1vaCnwoG8RqnlHelq55DYdb4zR+YMi2TDt3oddfU1SL39qy
 nKpp4mPHDP5wr5NEtPpTniAtjkfZq/z+8X3WB5B97LMDUO3lHIEGgL1+DfKlbbak/DH4BmtZ
 uJc8JFeaDNJGk/t+nWyk2TKfFI+qjhzEir792us0uEm2tRGt5dBwQSMHfkLqVvLjM2Y6bQjP
 Cnl7B6TzzLQwVvUizqbkN1J9Qqvrfw5enbXSI=
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; d="scan'208";a="97547628"
To: <qemu-devel@nongnu.org>
CC: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>
Subject: [PATCH] ps2: Don't send key release event for Lang1, Lang2 keys
Date: Mon, 27 Feb 2023 17:33:08 +0000
Message-ID: <20230227173308.3944546-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=415647c1b=ross.lagerwall@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Ross Lagerwall <ross.lagerwall@citrix.com>
From:  Ross Lagerwall via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The scancodes for the Lang1 and Lang2 keys (i.e. Hangeul, Hanja) are
special since they already have the 0x80 bit set which is commonly used
to indicate a key release in AT set 1. Reportedly, real hardware does
not send a key release scancode. So, skip sending a release for these
keys. This ensures that Windows behaves correctly and interprets it as a
single keypress rather than two consecutive keypresses.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 hw/input/ps2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 3253ab6a92..45af76a837 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -402,6 +402,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
                     ps2_put_keycode(s, 0xaa);
                 }
             }
+        } else if ((qcode == Q_KEY_CODE_LANG1 || qcode == Q_KEY_CODE_LANG2)
+                   && !key->down) {
+            /* Ignore release for these keys */
         } else {
             if (qcode < qemu_input_map_qcode_to_atset1_len) {
                 keycode = qemu_input_map_qcode_to_atset1[qcode];
@@ -497,6 +500,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
                     ps2_put_keycode(s, 0x12);
                 }
             }
+        } else if ((qcode == Q_KEY_CODE_LANG1 || qcode == Q_KEY_CODE_LANG2) &&
+                   !key->down) {
+            /* Ignore release for these keys */
         } else {
             if (qcode < qemu_input_map_qcode_to_atset2_len) {
                 keycode = qemu_input_map_qcode_to_atset2[qcode];
-- 
2.31.1


