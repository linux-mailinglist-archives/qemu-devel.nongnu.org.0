Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4737283BE3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:02:49 +0200 (CEST)
Received: from localhost ([::1]:52148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPSwq-0002Ug-Qc
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPSqB-00046g-NF; Mon, 05 Oct 2020 11:55:56 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPSqA-0001WN-5C; Mon, 05 Oct 2020 11:55:55 -0400
Received: by mail-pg1-x542.google.com with SMTP id 22so2311888pgv.6;
 Mon, 05 Oct 2020 08:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fONA64XSdMINk4Pb3HJvl02BkTmqUfaoSQk6W/tx2aE=;
 b=uypJZ1trGOSLsslGxqmD6P8w1q7GbCpafx/NUHxKpmX5uzLV0ysM2NDXXfFjFXneeY
 9DJwWImcSyiGPSFdhJZjkEoCyPFyWsUhcgmovGgE/DniX2hLQ9sHr4MRfoqVWG69Qjls
 tQqP4NNWa9kZKMZ0uq4hYQ5ldIUX5O1miiaaxP5lx1kskE/gjcfsNnGZeIPo8V6lGbSJ
 TT9eIi9yW5TzgZ5Oltgp4M1x11DkTnCTBgUXzZCeIkkEeaWarj+sXSDW4KnpI+Epu37Q
 xmaLu83l41AefoZtRJXqw4XskdHOpqQ1FWPtYwomb+ij91+CDGhoABVTtO1TtpbmJbmR
 l3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fONA64XSdMINk4Pb3HJvl02BkTmqUfaoSQk6W/tx2aE=;
 b=j8io3S2C4JrBsvT/fhWVA9dIPtTEa8mCfPQMDAMoTBhoMZefyMeB1Zyr7yJZyWIdAN
 dSnsYrA53qK8J+LvXYVfN6iH9NL6rfBm4q2oSxKCDMR0xAFNUTgSXzRknWNvzWKil4K7
 RvjKurFXUnwUSExMdrbKCC8zVie/vK2eRs+E3YofBdtmtAvZamLCf4VfXMbQFLWz0LJu
 KN/KPZQftiekKx7K80mSP+AshRuyjJdJ/eWRYTidx50hzs9KLtCKxkLdfJs7gDK/cJW4
 E68LX/yuoToQ97tiRohL7FCmOu8RJvjkQwtLFtPe+eiMkSMAx95HrpoNwZ2cBzPwOjFo
 GgEg==
X-Gm-Message-State: AOAM530hrTQ3wzHbYDsH4PQ8Ez9bXe/FxQKPaE+AEG6mObjYjJC/kLSf
 ymvGe5rbLmXVYUT1culhLBb20g+myvPLHQ==
X-Google-Smtp-Source: ABdhPJyIn0sYszzDjP87Ki3otLpJRbPhrTrjcdW6/CLfYEPKc03WVlt9iZwtq9qYMp7xNMmbRv2V1w==
X-Received: by 2002:aa7:870c:0:b029:142:2501:34d1 with SMTP id
 b12-20020aa7870c0000b0290142250134d1mr409803pfo.42.1601913351047; 
 Mon, 05 Oct 2020 08:55:51 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id u22sm34803pgi.85.2020.10.05.08.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 08:55:50 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v8 3/4] curses: Fixes curses compiling errors.
Date: Mon,  5 Oct 2020 23:55:23 +0800
Message-Id: <20201005155524.442-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201005155524.442-1-luoyonggang@gmail.com>
References: <20201005155524.442-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the compiling error:
../ui/curses.c: In function 'curses_refresh':
../ui/curses.c:256:5: error: 'next_maybe_keycode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  256 |     curses2foo(_curses2keycode, _curseskey2keycode, chr, maybe_keycode)
      |     ^~~~~~~~~~
../ui/curses.c:302:32: note: 'next_maybe_keycode' was declared here
  302 |             enum maybe_keycode next_maybe_keycode;
      |                                ^~~~~~~~~~~~~~~~~~
../ui/curses.c:256:5: error: 'maybe_keycode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  256 |     curses2foo(_curses2keycode, _curseskey2keycode, chr, maybe_keycode)
      |     ^~~~~~~~~~
../ui/curses.c:265:24: note: 'maybe_keycode' was declared here
  265 |     enum maybe_keycode maybe_keycode;
      |                        ^~~~~~~~~~~~~
cc1.exe: all warnings being treated as errors

gcc version 10.2.0 (Rev1, Built by MSYS2 project)

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/curses.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/curses.c b/ui/curses.c
index 12bc682cf9..e4f9588c3e 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -262,7 +262,7 @@ static int curses2foo(const int _curses2foo[], const int _curseskey2foo[],
 static void curses_refresh(DisplayChangeListener *dcl)
 {
     int chr, keysym, keycode, keycode_alt;
-    enum maybe_keycode maybe_keycode;
+    enum maybe_keycode maybe_keycode = CURSES_KEYCODE;
 
     curses_winch_check();
 
@@ -299,7 +299,7 @@ static void curses_refresh(DisplayChangeListener *dcl)
 
         /* alt or esc key */
         if (keycode == 1) {
-            enum maybe_keycode next_maybe_keycode;
+            enum maybe_keycode next_maybe_keycode = CURSES_KEYCODE;
             int nextchr = console_getch(&next_maybe_keycode);
 
             if (nextchr != -1) {
-- 
2.28.0.windows.1


