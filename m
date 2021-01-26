Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A7303159
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:38:19 +0100 (CET)
Received: from localhost ([::1]:58856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DJC-0006Lv-I2
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6Z-0005gQ-90
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:22 -0500
Received: from mail-pg1-f182.google.com ([209.85.215.182]:33951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6X-0006BI-0h
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:14 -0500
Received: by mail-pg1-f182.google.com with SMTP id o7so143915pgl.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=glvJaTkRow5yPoqo300OxC089acIdJu9cw0YZy+8mg0=;
 b=RuZd/iTyadShvr99Q3pq4nMEKKaOm+WD6BAXr8SLdCskzDdpBB+pIFoa0dxuiYo45Q
 6sV9hXTAXLoA7D5B7kL/cVufMVfKvpIlLBS6+EvD+MixW5iGE1A7NjZsOChuQMw5FDSl
 lm6T09uPbrxngQca4qcYsPyDqTOE/ORwc50Ss+VhjIxipWTUyzqtT/Fzc9ciMEw380MH
 fy2H2kJE70TG0LmrwN9xwxYCk0YE4CIXMu9UMhaAGH9eggxxDIQGMl+Sz2vI2Scgj1bq
 muIYb3nyLoQP1KtKv5u1fxf3lGwegl7r70L+++dGQ4LaBndXfWapD6dy44HIeta169Ks
 0uhQ==
X-Gm-Message-State: AOAM53115SUazTbyEfVWOXZAq1C9kQWK/bzHlodoAv0XIk1J2UAAVbPd
 Kn3t274EbFUWWL7AbqKxgFE8tTpTku0=
X-Google-Smtp-Source: ABdhPJw//at56Hmf+LgqIeNvwDYamL98vCqblhYxOLfHKEfjDb3jEQLuB/yeBMK4YVbCtQMAKeeU8w==
X-Received: by 2002:a62:52cc:0:b029:1bd:e13a:fc1b with SMTP id
 g195-20020a6252cc0000b02901bde13afc1bmr2976095pfb.46.1611624310615; 
 Mon, 25 Jan 2021 17:25:10 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:10 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 11/11] darwin: remove 64-bit build detection on 32-bit OS
Date: Mon, 25 Jan 2021 17:24:57 -0800
Message-Id: <20210126012457.39046-12-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.182;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 89836f8692..537ed111d8 100755
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


