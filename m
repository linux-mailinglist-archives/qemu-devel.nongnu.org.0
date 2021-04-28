Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379BE36E007
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 22:00:25 +0200 (CEST)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqMC-0007HM-8z
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 16:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lbqI0-0003Td-9W
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:56:04 -0400
Received: from mail-pj1-f48.google.com ([209.85.216.48]:54845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lbqHy-0007nI-QV
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:56:04 -0400
Received: by mail-pj1-f48.google.com with SMTP id t13so7315994pji.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GyYruQ9F1fuzvgK1SvJWGn6hG3fNm1wXXod9Z5WCQAY=;
 b=gInSiH+snaIAh6i7TVQ5mTC7eRoZwbKQy1wmRhZuxJTwSNbBzp1HCg9bwsfJcH9x8o
 47odEDizBP3mmR22zgTSRNMpTtxM0SKzdxpWJndWohTrR4sRyCoO+1HucrmYDVW4/K0X
 ANobwrrgQ/UbwRw4eG1d08J8wsdsXEoc5JFYdIBH9uF4c+LZeB2ntj1EyU1E3gAIW19R
 6s8zYMWvIGKwyaH1Q0yNJqWzCSXsPwxOCJW/XpWrpnqgypKm1dCkZuqPV5cAY95LeWwa
 1YPgg8JDkA4sgAirRaDBaVqHKXRaMgs96yOsq2sMdaHPkLhkBUPASnc06/1B2R66U3Y3
 kMxA==
X-Gm-Message-State: AOAM531yrQogwoW23loXpYfxScFD5ppKfAni7JG3QzQrc6BZXQMiqe7K
 HrdyvAK9FXhGskJ98LNGk2NXMV+eV0I=
X-Google-Smtp-Source: ABdhPJwFgAht3n8VHJPG3HlZv75e0o5DSRMvgSju1mUygfiLwgbviV6VV8x+KM321xzynaJTSamN+w==
X-Received: by 2002:a17:90b:3754:: with SMTP id
 ne20mr17101562pjb.39.1619639760285; 
 Wed, 28 Apr 2021 12:56:00 -0700 (PDT)
Received: from localhost.localdomain ([73.93.154.1])
 by smtp.gmail.com with ESMTPSA id m206sm447399pfd.87.2021.04.28.12.55.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:55:59 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: change buildtype when debug_info=no
Date: Wed, 28 Apr 2021 12:55:58 -0700
Message-Id: <20210428195558.16960-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.48; envelope-from=osy86dev@gmail.com;
 helo=mail-pj1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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

Meson defaults builds to 'debugoptimized' which adds '-g -O2'
to CFLAGS. If the user specifies '--disable-debug-info' we
should instead build with 'release' which does not emit any
debug info.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 4f374b4889..5c3568cbc3 100755
--- a/configure
+++ b/configure
@@ -6398,6 +6398,7 @@ NINJA=$ninja $meson setup \
         --sysconfdir "$sysconfdir" \
         --localedir "$localedir" \
         --localstatedir "$local_statedir" \
+        --buildtype $(if test "$debug_info" = yes; then echo "debugoptimized"; else echo "release"; fi) \
         -Ddocdir="$docdir" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
-- 
2.28.0


