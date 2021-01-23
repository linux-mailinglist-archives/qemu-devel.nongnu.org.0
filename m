Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03E30132C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:04:44 +0100 (CET)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B6J-0000mv-0j
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayj-000707-10
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:54 -0500
Received: from mail-pg1-f177.google.com ([209.85.215.177]:39478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayg-0005tZ-U4
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:52 -0500
Received: by mail-pg1-f177.google.com with SMTP id 30so5232183pgr.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNEuNZPYpq9HLfo3nTTNg6MewMBOzTowV7vrFo97HmQ=;
 b=ncyriNY7ybrqDj2uyitXoi8JBqSCiykKqI2h9IUTqwQ2Zi0BITLhYHA5WV14qzfsLh
 VBMCnUrcYHZq0GpZiMWTCK7TGn88RibWGzsWSsXnq5QtkuYreN3zVT6Cggp74OkzIHge
 jMBf7GJCQPpZCxuaHMQWVxaWO4UfGZsQ/MmYN117kNoKL0p1TPJhBRI8rvC829r7skcy
 NImVefNcs9gaoIaTISSOZY/vO/obfdF4WgVEHY06bNSpujY7w6MJkaHs5jc2s6J/yJk0
 +yyU6GCJ+y/zqLy1D+L9HL9TncaxrbTZ9Q3hBRnVkrAHkxtDoLWgKDA12oOk8Xi9BNiD
 8Rsg==
X-Gm-Message-State: AOAM533BwcTGWn3Bkgtcbw0BcYi9sqIZCWdwUSTLwkhRcN5SF2/l6yao
 3H2q/uR7gbsu/1U80CqiTe4Ealu5ZLw=
X-Google-Smtp-Source: ABdhPJw+JEz15A9wpa23SpRpq3aOftGAJwUx04xb1Ejx7RXnLSCaigMVG/Bep3LAdc4CQo8Q0jcMhg==
X-Received: by 2002:a63:4966:: with SMTP id y38mr7967178pgk.428.1611377809370; 
 Fri, 22 Jan 2021 20:56:49 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:49 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/11] darwin: remove 64-bit build detection on 32-bit OS
Date: Fri, 22 Jan 2021 20:56:32 -0800
Message-Id: <20210123045632.18482-12-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.177;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A workaround added in early days of 64-bit OSX forced x86_64 if the
host machine had 64-bit support. This creates issues when cross-
compiling for ARM64. Additionally, the user can always use --cpu=* to
manually set the host CPU and therefore this workaround should be
removed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure b/configure
index 70061e195d..5f23f5b907 100755
--- a/configure
+++ b/configure
@@ -626,13 +626,6 @@ fi
 # the correct CPU with the --cpu option.
 case $targetos in
 Darwin)
-  # on Leopard most of the system is 32-bit, so we have to ask the kernel if we can
-  # run 64-bit userspace code.
-  # If the user didn't specify a CPU explicitly and the kernel says this is
-  # 64 bit hw, then assume x86_64. Otherwise fall through to the usual detection code.
-  if test -z "$cpu" && test "$(sysctl -n hw.optional.x86_64)" = "1"; then
-    cpu="x86_64"
-  fi
   HOST_DSOSUF=".dylib"
   ;;
 SunOS)
@@ -776,10 +769,6 @@ OpenBSD)
 Darwin)
   bsd="yes"
   darwin="yes"
-  if [ "$cpu" = "x86_64" ] ; then
-    QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
-    QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
-  fi
   audio_drv_list="try-coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
   # Disable attempts to use ObjectiveC features in os/object.h since they
-- 
2.28.0


