Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D53D631F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 14:54:59 +0200 (CEST)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJzsI-00044V-A0
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 08:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hikarupsp@gmail.com>) id 1iJzrK-0003c9-5l
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hikarupsp@gmail.com>) id 1iJzrI-0002Ua-Vm
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:53:58 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hikarupsp@gmail.com>) id 1iJzrI-0002TX-QC
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:53:56 -0400
Received: by mail-pl1-x642.google.com with SMTP id w8so7982593plq.5
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vc2c5WMfkiOfguRP8cbAU26pLvXspd7bpIyEPOg1kuA=;
 b=jLUCMp7Un0LU+LEi5WeDxcreNafdeQZGSvqpQu791pksiqIgFY9cO+9eKY7+2o0PJJ
 3GZJz2hkehBwWizOnQJtlH+d+HEUe3QcZ8PLpNKtFLQMBwOjljqE03rFZyY4Ul35fRHj
 J72lscNJj/yOokJqVC2zRp/SaWCigNbHEv1srsVe05FA2YYc19HGnQdw2ZUdqGiNltHF
 4R1kScf+ZfDNhKKPrhEVfTz07LBPluh54qoAsCntvzAyTBJRGA39V6F0zUKp/2jlyzzx
 v13CiBghMIMZU+gXXJUQI+2NEELCoFbktcST4MLy6v3TyA8ZcDD3BUsEolnTK/yTtnFE
 w9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vc2c5WMfkiOfguRP8cbAU26pLvXspd7bpIyEPOg1kuA=;
 b=GjQ4GY8GGVAkjJONxS6M57JeRENlmyCU52VEWLaetvu1bkwWX9TqZXOQyMkHmggl9Y
 yfSzPRHlS9LeQI/5qI3U22hb9pEhby0v6XLWO+gP5klHHErWOG0DJdZR1+NU6LCasOn8
 eo26UFttgWfaBGnS03xT/BUKQqKZUfklK46JX6EmRwtbNdF3jyy1c3//AqY8ZFBdbM7q
 YAA016othpD4GNLU9S8448pIIOrS0Gs1K/OKHK63TdifXqGFWWNwNnvbBcKSVXqSihmC
 2KOeBDhSNHAyDY8MN6Xmxp4C41YbGC5R+uadoCbFjyBPRp+7XdxeAW1CvU5xT+ag1/Db
 lr3A==
X-Gm-Message-State: APjAAAWekqdNbR2tWUXF8XqumDg/1SuebAG/OWj1Gs7ectOyIrkyqB6S
 PBo9UWRGxvvhb3/18RP/0i7bghi9wd8=
X-Google-Smtp-Source: APXvYqzCNytAIfQ3RvIOwzMAqhJ1KLYwbZ1pgDVvp4X08gTswtoAxE5xvN6gxa4UxE8KGLMh9xjGzw==
X-Received: by 2002:a17:902:8bc4:: with SMTP id
 r4mr28750810plo.341.1571057634923; 
 Mon, 14 Oct 2019 05:53:54 -0700 (PDT)
Received: from t03.z01.hikalium.com.com (113x36x63x49.ap113.ftth.ucom.ne.jp.
 [113.36.63.49])
 by smtp.gmail.com with ESMTPSA id l184sm1208431pfl.76.2019.10.14.05.53.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 05:53:53 -0700 (PDT)
From: hikarupsp@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH] This patch fixes hanging up Cocoa display on macOS 10.15
 (Catalina)
Date: Mon, 14 Oct 2019 21:52:54 +0900
Message-Id: <20191014125254.74913-1-hikarupsp@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hikaru Nishida <hikarupsp@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hikaru Nishida <hikarupsp@gmail.com>

An NSEvent is fired before applicationDidFinishLaunching on macOS
Catalina. This causes deadlock of iothread_lock by calling
bool_with_iothread_lock in handleEvent while its already locked.
This patch prevents to call bool_with_iothread_lock until the
app_started_sem is released to prevent this deadlock.

Buglink: https://bugs.launchpad.net/qemu/+bug/1847906
Signed-off-by: Hikaru Nishida <hikarupsp@gmail.com>
---
 ui/cocoa.m | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f12e21df6e..f16d341a0a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -134,6 +134,7 @@
 
 static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
+volatile sig_atomic_t allow_events;
 
 // Utility functions to run specified code block with iothread lock held
 typedef void (^CodeBlock)(void);
@@ -729,6 +730,9 @@ - (void) handleMonitorInput:(NSEvent *)event
 
 - (bool) handleEvent:(NSEvent *)event
 {
+    if(!allow_events) {
+        return false;
+    }
     return bool_with_iothread_lock(^{
         return [self handleEventLocked:event];
     });
@@ -1897,6 +1901,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     /* Tell main thread to go ahead and create the app and enter the run loop */
     qemu_sem_post(&display_init_sem);
     qemu_sem_wait(&app_started_sem);
+    allow_events = true;
     COCOA_DEBUG("cocoa_display_init: app start completed\n");
 
     /* if fullscreen mode is to be used */
-- 
2.21.0 (Apple Git-122)


