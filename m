Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678D267CAF
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 00:48:40 +0200 (CEST)
Received: from localhost ([::1]:38584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHEJz-0007wO-3H
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 18:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEGl-0003Ko-2E; Sat, 12 Sep 2020 18:45:19 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEGj-0004Gv-Ct; Sat, 12 Sep 2020 18:45:18 -0400
Received: by mail-pl1-x641.google.com with SMTP id e4so2650278pln.10;
 Sat, 12 Sep 2020 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fONA64XSdMINk4Pb3HJvl02BkTmqUfaoSQk6W/tx2aE=;
 b=bJuubO2xrm/C9siIXHjDP3vRF+5d0cv8+AvzsMzEDyybJAaGbATG/XYjf7vGqVzJ57
 DOkvNF2KhXtGDsPP5A2U5pHlXkRoe542EF54tq14mt71wK6CW2j6GG8Y352kQzlkFwFk
 SUN7BYbg3+JD/OLXF8OPB4Ac1jX+s1hKlJwB/X3q/NO6ha4LK+coaZXtI+PTZixZU4Jl
 NE+mLM8OeZYYWb6yHRrvX8QvlO0Xc4OW8gfIw/oe3aF011E2b3omxsnhuGE+YGpCcZYv
 +h3BLvDqNqxYwEYUehXzHHwyvlf9ztnlc9utiR9Ujhc7J4rfO1jcUdBraYC0DffqvpSf
 rI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fONA64XSdMINk4Pb3HJvl02BkTmqUfaoSQk6W/tx2aE=;
 b=BOwbB2ctfp0O8FrtMy0RlLTwn6TQkrW5pFEyLmgxQGsqzfLUt/0xcgSdHKET0jlGlD
 9RpFq4LJPktlFynntB2VRZjew7LfiIhJxbWMTvLOPQG37kfY9Yj6IFqJ06LL7Si8y9uW
 RI14c8IckjWVQ8Zyk2JVYZ/W7OPvY2yAf/x2HeJowRVfyosC+LdjDNj1FaLugi7F1iGM
 9bWeeZGrzStIVZkH/xoksbrVrFl5/m5iHLc2mzmVd0Lha5WdQsYYW+EJ3329rLQrVAb6
 gN5AS/KiRX76DfmOmp34kESq3JNM9D+fak0nLLS41FtR8EuBRc66iLv7h7kWluIuGTd6
 D7mg==
X-Gm-Message-State: AOAM531vVUKON+rNXaXLMXAqhUskBiIgPiBNLaU6ip4utySl1FQgDGw/
 UBKFItixSIdgEpNhC9olsHm/q8uGCWZIFqZNVtE=
X-Google-Smtp-Source: ABdhPJwHn7qTof05O3b8ed9rQni1lfpk4hOB+CnTs6FEpjXqOwL7v3C5u39Q5OnYvuaYCROHGg5TYA==
X-Received: by 2002:a17:902:564:: with SMTP id
 91mr7684596plf.141.1599950715478; 
 Sat, 12 Sep 2020 15:45:15 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t10sm4639266pgp.15.2020.09.12.15.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 15:45:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/27] curses: Fixes curses compiling errors.
Date: Sun, 13 Sep 2020 06:44:10 +0800
Message-Id: <20200912224431.1428-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
References: <20200912224431.1428-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x641.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
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


