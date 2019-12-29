Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1912CB3E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 23:51:52 +0100 (CET)
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilhPb-0000AW-HK
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 17:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilhJH-0002Vz-Mv
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 17:45:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilhJG-0001qY-Jc
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 17:45:19 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35581)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilhJG-0001o6-C3
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 17:45:18 -0500
Received: by mail-wr1-x442.google.com with SMTP id g17so31251346wro.2
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 14:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNUQ1Y4cRjYakwD1/VEaESjAd4g6LoxnSk/siZZWkF8=;
 b=JAJ8PzXXWpO62b4831RSYRlaM+ak9XN415dl5aK392zsAZ/9Mv98Mk+pdmAavvSO8B
 JzB8/5OuHFDKFfKcf4kCsarhdstJRyYFrRFjEtK9Vab1aBKsMGg5RiS+wHKDg+TCrh/v
 eHrCHCCqTHidH7SPiQvDlvdwI+xcFoNu+pr+n18eMMCZgTXyM+a8RWQifYCXswfj3tqR
 YwurjcUdSUdO/th+VRL07EQMiJvtFxbP1UnyKKeIoWRHY+ZqkzVS2zozQpK0wnYlZgCn
 8fwgXezeD6eVrfXug2RrhEdiCLjLDivbVmfMFexNfgJYzXRyUSjKfxH2lSmu0prxESLl
 RJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nNUQ1Y4cRjYakwD1/VEaESjAd4g6LoxnSk/siZZWkF8=;
 b=CsyXsxfmmOta3WKpcIX6DqUzdafIdyq+tUje3DJWGZtJXh7telV2VfCCRZ/a8+3htY
 2grmSrUlupb/JJHSnSM+W0blrixfBhpszZPhdga1UcIyXaKZVf+9gpSu2eXK1QhMuWbD
 HYbtAs8mRShDDAfmqnuyUPybyJQzdniQQTwGuZiSsbPzb6YefEdoGaJFYGG3oPWePx8O
 bJbpLTPyB7zwgMDSGwV4DJO+5/O/xK/yi5u5jZcxh1tjzOSECRSZVuPm0B/PpKmWYZAG
 5Nt5W3UZ0mG2g6zufsDonfgJcQtX/p3YsqWHsw+1Ww4FH4Xojmwkmqc3Z05G9pA2HUiC
 Bmjg==
X-Gm-Message-State: APjAAAVkLvhoiPwHhwT3jwW7dtlPygo9ErMad/+L8l7pcuIFqldi1Gbl
 hDUei6ONFAdSbfPtf5+6BpmL2P4A9VM=
X-Google-Smtp-Source: APXvYqwutN/qET0FEb4RlXg9GlGnrbvTfAh7/ZZztDam/R0582bPxBCKWZiJfK01Fjhfr3t1wf5Z7Q==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr61142286wra.8.1577659517340;
 Sun, 29 Dec 2019 14:45:17 -0800 (PST)
Received: from x1w.home ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id x1sm42709188wru.50.2019.12.29.14.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 14:45:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] tests/acceptance: Do not set the machine type manually
Date: Sun, 29 Dec 2019 23:45:03 +0100
Message-Id: <20191229224505.24466-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191229224505.24466-1-f4bug@amsat.org>
References: <20191229224505.24466-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 Cleber Rosa <crosa@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit ba21bde93 we don't need to set the machine type
manually, the one set by the ":avocado: tags=machine" will be used.

Suggested-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/machine_avr6.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/acceptance/machine_avr6.py b/tests/acceptance/machine_avr6.py
index 7a7d8afc29..394b3d4f8f 100644
--- a/tests/acceptance/machine_avr6.py
+++ b/tests/acceptance/machine_avr6.py
@@ -45,7 +45,6 @@ class AVR6Machine(Test):
         rom_hash = '7eb521f511ca8f2622e0a3c5e8dd686efbb911d4'
         rom_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
 
-        self.vm.set_machine('sample')
         self.vm.add_args('-bios', rom_path)
         self.vm.add_args('-nographic')
         self.vm.launch()
-- 
2.21.0


