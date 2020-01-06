Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D8130F8B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 10:34:37 +0100 (CET)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioOmS-0004zp-Dg
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 04:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <th.huth@gmail.com>) id 1ioOlc-0004Yz-LE
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 04:33:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@gmail.com>) id 1ioOlb-0002Vt-E8
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 04:33:44 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:40090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <th.huth@gmail.com>) id 1ioOlb-0002VD-8e
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 04:33:43 -0500
Received: by mail-wm1-f49.google.com with SMTP id t14so14556099wmi.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 01:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LpgQUj0OMjYJ+KO28b/FVZFuJDEF0D9hD3aM03MEbj8=;
 b=MpnlCjeQ3Q0tJV+ZcFCwr0QrRhoQ/YB4JgeiplJPqWZWapQguOP+F/3684id37I7Q/
 KM06hcxIzsND6kTHN8WcfLQZ5w1DsCQ553/KS8cW01Bkqp6gLBjASGLk+4Yr0OHuuz2E
 dkC922EY6MR/FUJC30fO0Z6JHYMiscG/6Fwa7c3rA9AA/sPVy2TH9ptzyS7mETqgwv4w
 t9edy7S9MCQfpK5rDdH4QPvSoOYSPH/u61DT46LIguGzOJa1ce51KT3vS++vDLaxjGVJ
 JJFxLNPQErRyn5WI6Rd7FlnCIFs8NWAtJ6RrA4KnI6xxyysltbHxgbcCfq1rmptL1ZdM
 MCIA==
X-Gm-Message-State: APjAAAVE3J/29GmozKJGBFSdNJ2pg3aYW41lfCgd0EBnwVHN5DVQcfrU
 5GoyblD9jTarubqNi0ZpEqvGIF87
X-Google-Smtp-Source: APXvYqxh7N5/9Rg68fUb/KqNVQK49vkblLI9SeB3mTW+7X2BxY5MnCOUF9cODKsCZoxfZ6t9ApJWqQ==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr32412099wma.84.1578303221746; 
 Mon, 06 Jan 2020 01:33:41 -0800 (PST)
Received: from thl530.multi.box (pD95751C4.dip0.t-ipconnect.de.
 [217.87.81.196])
 by smtp.gmail.com with ESMTPSA id a5sm22395980wmb.37.2020.01.06.01.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 01:33:41 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] ui: Print available display backends with '-display help'
Date: Mon,  6 Jan 2020 10:33:13 +0100
Message-Id: <20200106093313.17081-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.49
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already print availabled devices with "-device help", or available
backends with "-netdev help" or "-chardev help". Let's provide a way
for the users to query the available display backends, too.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 v2: Now it should work with modules, too

 include/ui/console.h |  1 +
 ui/console.c         | 15 +++++++++++++++
 vl.c                 |  5 +++++
 3 files changed, 21 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index f981696848..b7e1a8e6c0 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -440,6 +440,7 @@ void qemu_display_register(QemuDisplay *ui);
 bool qemu_display_find_default(DisplayOptions *opts);
 void qemu_display_early_init(DisplayOptions *opts);
 void qemu_display_init(DisplayState *ds, DisplayOptions *opts);
+void qemu_display_help(void);
 
 /* vnc.c */
 void vnc_display_init(const char *id, Error **errp);
diff --git a/ui/console.c b/ui/console.c
index 82d1ddac9c..9556b5d8dd 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2330,6 +2330,21 @@ void qemu_display_init(DisplayState *ds, DisplayOptions *opts)
     dpys[opts->type]->init(ds, opts);
 }
 
+void qemu_display_help(void)
+{
+    int idx;
+
+    printf("Available display backend types:\n");
+    for (idx = DISPLAY_TYPE_NONE; idx < DISPLAY_TYPE__MAX; idx++) {
+        if (!dpys[idx]) {
+            ui_module_load_one(DisplayType_str(idx));
+        }
+        if (dpys[idx]) {
+            printf("%s\n",  DisplayType_str(dpys[idx]->type));
+        }
+    }
+}
+
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp)
 {
     int val;
diff --git a/vl.c b/vl.c
index 86474a55c9..ee15055ba2 100644
--- a/vl.c
+++ b/vl.c
@@ -1869,6 +1869,11 @@ static void parse_display(const char *p)
 {
     const char *opts;
 
+    if (is_help_option(p)) {
+        qemu_display_help();
+        exit(0);
+    }
+
     if (strstart(p, "sdl", &opts)) {
         /*
          * sdl DisplayType needs hand-crafted parser instead of
-- 
2.21.0


