Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D022912CB40
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 23:53:07 +0100 (CET)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilhQo-00012q-TZ
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 17:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilhJJ-0002Y9-AA
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 17:45:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilhJI-0001uN-1H
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 17:45:21 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilhJH-0001s4-Qh
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 17:45:19 -0500
Received: by mail-wm1-x343.google.com with SMTP id m24so12697833wmc.3
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 14:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WbsYV4ckQ40btqTMEBkjwx7LsODZXE9rDBJDw8lKkHU=;
 b=ObGk/PUA+VRy1VWfG79MUOdLxzvHkvPqzvpEfLC/oJUBTBJPlbubicuQz6SXYrtKfj
 L+zVKeFQpgal0SNICSfm853cqP2XWea9NcMNJMyYxtcTItPP+EPxwuOe2c+A7qpDZxx9
 Iryq/J9ikj95s4MFxxpTyc2HS+Hh3Sut/WK6oT6Vhi+Q4eRIR3s3sSY2Iylr6kek5oR/
 K/KGGPmfN4Bp8Grxr5XOEwDakhigrTm3dHek+8GqQrxxKst415xwhDpWCoBTHRmsV6IL
 wXUJ3TP8Qxpc4vvIfgFg88x3mARl5Hl+va3m5dSO1uQ4YJbM++G2n93H/DBvRbx4EK32
 mxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WbsYV4ckQ40btqTMEBkjwx7LsODZXE9rDBJDw8lKkHU=;
 b=VjRVRCl9JDQT6wDvs1iUk/BV8fT//7xFy0WVNCSe/b19T/hgLqsjYtcqOYBpcRkgGb
 uFCS64SrbEfQnz9WtduMLfL0rtXDvlktly0JO/M5c07BIOkp4tCeUkfvftYUC8XYb0Ut
 uk06jvWlkiMSXg/ft/4pw6Ukkyx9kq35lDX5qoh2XQ03OyFvmjwujEYgLOAGZ+DD1xVh
 VqNliR3vC+ooLmlzsR6vuURB6zQ73VQOPWCit2TsaIYozXybr5ZqXA2CFCvEjYDQ/1Qt
 xtZe2T9SEabKaozXDfMOj68SaWsOorxHYr5E30dPwokhKoFHJSbxPSSQLyWqLgDgj3Kp
 TgwQ==
X-Gm-Message-State: APjAAAUn+RHIsGGCz1YIaqWNFoI9m0mIcRQYWQsbC6jG7CV1YLfyodth
 uu+7e7OjcoonpfsT+sXc0usXCn7gQ2E=
X-Google-Smtp-Source: APXvYqwbvTkpndl0rqG8FlDyQ7o8pOn0oQssSevxrqyy0cX6rNY/b14si84IrqlPYET7aT2w8EH2ow==
X-Received: by 2002:a1c:1fd0:: with SMTP id
 f199mr31249698wmf.113.1577659518666; 
 Sun, 29 Dec 2019 14:45:18 -0800 (PST)
Received: from x1w.home ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id x1sm42709188wru.50.2019.12.29.14.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 14:45:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] tests/acceptance: Keep multilines comment consistent
 with other tests
Date: Sun, 29 Dec 2019 23:45:04 +0100
Message-Id: <20191229224505.24466-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191229224505.24466-1-f4bug@amsat.org>
References: <20191229224505.24466-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
note to maintainer: squash before merge?
---
 tests/acceptance/machine_avr6.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/machine_avr6.py b/tests/acceptance/machine_avr6.py
index 394b3d4f8f..94a8004e94 100644
--- a/tests/acceptance/machine_avr6.py
+++ b/tests/acceptance/machine_avr6.py
@@ -37,11 +37,9 @@ class AVR6Machine(Test):
         https://github.com/seharris/qemu-avr-tests/raw/master/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf
         constantly prints out 'ABCDEFGHIJKLMNOPQRSTUVWXABCDEFGHIJKLMNOPQRSTUVWX'
         """
-        rom_url = 'https://github.com/seharris/qemu-avr-tests'
-        rom_sha1= '36c3e67b8755dcf37e06af6730ef5d477b8ed16d'
-        rom_url += '/raw/'
-        rom_url += rom_sha1
-        rom_url += '/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf'
+        rom_url = ('https://github.com/seharris/qemu-avr-tests'
+                   '/raw/36c3e67b8755dcf/free-rtos/Demo'
+                   '/AVR_ATMega2560_GCC/demo.elf')
         rom_hash = '7eb521f511ca8f2622e0a3c5e8dd686efbb911d4'
         rom_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
 
-- 
2.21.0


