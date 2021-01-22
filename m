Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAEE300D83
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:16:16 +0100 (CET)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32qt-00028n-5b
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mI-00053s-1s
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:30 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:45876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mG-0004eM-B7
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:29 -0500
Received: by mail-pf1-f177.google.com with SMTP id j12so4537555pfj.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bH12qTm3+UAqqzcs6td+zXs9uTHKta6X9jVQRa8WiS8=;
 b=Db84YV5NdlHGTao1Gi1WzhDBGRcbroezfYJe/iF7r7PugpfKF35D3u3/HwceVaBY0/
 SaF1A71P7smxX1XPAGmSuhghSBQ8jZBlE5p7YbwrGwlX3EdTcmRacpSmguiAgy9C2crT
 i97KWMd9p0jjLXFYHQlriZZkVxyve8HJDn4dCUFxIxDzQWrqbI5tVIO+8i+5iUz8i7Mk
 eQB2U33rGdTMKtUkFvkyUTspuT9QijgHlmJNrMjs3JqG2wggrU37YL+ZmJ2MSY0rZcwy
 MsSNaB02BKQ6QvyxWGYFgYFSxCaPUTsvlczKv87WABk1SLmc2/sPcG16cOMMambnJZ69
 sJVw==
X-Gm-Message-State: AOAM531FXuCSPQGJrUc+YOjcpf5i3xUOAp3BTX/JinY1qIHphBPUzZgI
 fLekwZVFK9cMwrIePKfH7iiByZRgArE=
X-Google-Smtp-Source: ABdhPJzlJ8++8mqDEgPOYVefa8aKiKgiZ3y4NXp9ujXvGcMr3Wpb/4qx2RN2HRRheadfc3b531Sr8Q==
X-Received: by 2002:a65:47c7:: with SMTP id f7mr6188459pgs.305.1611346286803; 
 Fri, 22 Jan 2021 12:11:26 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:26 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/11] darwin: remove 64-bit build detection on 32-bit OS
Date: Fri, 22 Jan 2021 12:11:13 -0800
Message-Id: <20210122201113.63788-12-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.177;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f177.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A workaround added in early days of 64-bit OSX forced x86_64 if the
host machine had 64-bit support. This creates issues when cross-
compiling for ARM64. Additionally, the user can always use --cpu=* to
manually set the host CPU and therefore this workaround should be
removed.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure b/configure
index fb671258e6..c7fbda22b9 100755
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


