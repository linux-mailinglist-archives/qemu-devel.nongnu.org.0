Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1E4B457D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:18:48 +0100 (CET)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJXVO-0001ex-Nq
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:18:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJXQJ-0008QC-M9
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:13:33 -0500
Received: from [2607:f8b0:4864:20::42f] (port=35732
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJXQH-00038e-3b
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:13:30 -0500
Received: by mail-pf1-x42f.google.com with SMTP id l19so22343537pfu.2
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 01:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F1aZKX8/l6mLlavqidr4NSuFQuqkM7tNglpy+nUX+xQ=;
 b=eCAuhKKO1b9oQss4sANwKSgV6eq+AdIbcmVIbya9xzDLkNpGX4lEaP85Ze4Ka6a/RN
 GdXIIyev8By6I645p/gVDhRM2ErGepEX2UdVKdPVmhFtnYI3QE9SMq6jWFwtTimp2bcl
 hlEHPzrqAiyF3XgbfjLYgIBUR3bo3VT2hrSifSiKTBWYciGHOM22+rwXYFP5hjBD2/Hm
 wl+jY+S4nwmomL1/xMpo0z5DtvgogFbXrI3KE1MDQsUUX2rNRHQPFaTx9IbJwsZjYUPm
 JSJMadGb9VieVsjHEdEf35uZCw0X6FLWkzfDmdLti+rNJW9+0tDJwWm9sr7knyKS5l8P
 yvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F1aZKX8/l6mLlavqidr4NSuFQuqkM7tNglpy+nUX+xQ=;
 b=s43okhC3qZNpz+pEjcVw4pA/J9lf2lkUrsgFkfJWKatQnH/HMoEbj0kQeBnyP8gFEB
 NB2Yo3pnkTwRMFt7SXLFdRJirRJanrPXbucsqe0hMRypjyMKYLRdxTxCVQ4/rNG1hpr6
 6sEVcoV5HNguVeiFAFNDfj+1E6F9YThJ6bgthZAx2kfWe5BGEX+ia7UDRjfUJYnp3SAy
 GaGO8XFD2Za6ALR2BzC3hpz1jzpieQhbphuGE50iWwfvgIAGBvhDUphCpDqgN+PIou5h
 K5tJigovVIQQrdEd48A5QkFvsFlE5pYtRY9kGyCaGUZEAEWaaMk8+9e7l2NJumiIL3Wr
 WzEw==
X-Gm-Message-State: AOAM533R57oBbftpM17e+pOjm07Zc9eRlWobt2YysOjxmOidQx1YpJtD
 UYveJFjt4F9p5WdmuIDyHRwjMMbMaJI=
X-Google-Smtp-Source: ABdhPJy8tcqObMYQ/hhobhlsopJ6I5ncSPc8TkRPPEm7cZRnKJLiyCxKXwEfYumVht9A4COCoomImw==
X-Received: by 2002:a05:6a00:1382:: with SMTP id
 t2mr13470725pfg.31.1644830007295; 
 Mon, 14 Feb 2022 01:13:27 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:494b:e640:fb90:19e6])
 by smtp.gmail.com with ESMTPSA id w11sm35624640pfu.50.2022.02.14.01.13.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 01:13:26 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Add Services menu
Date: Mon, 14 Feb 2022 18:13:20 +0900
Message-Id: <20220214091320.51750-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Services menu functionality of Cocoa is described at:
https://developer.apple.com/design/human-interface-guidelines/macos/extensions/services/

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce01..e0882fd48e2 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1597,11 +1597,15 @@ static void create_initial_menus(void)
     NSMenuItem  *menuItem;
 
     [NSApp setMainMenu:[[NSMenu alloc] init]];
+    [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
 
     // Application menu
     menu = [[NSMenu alloc] initWithTitle:@""];
     [menu addItemWithTitle:@"About QEMU" action:@selector(do_about_menu_item:) keyEquivalent:@""]; // About QEMU
     [menu addItem:[NSMenuItem separatorItem]]; //Separator
+    menuItem = [menu addItemWithTitle:@"Services" action:nil keyEquivalent:@""];
+    [menuItem setSubmenu:[NSApp servicesMenu]];
+    [menu addItem:[NSMenuItem separatorItem]];
     [menu addItemWithTitle:@"Hide QEMU" action:@selector(hide:) keyEquivalent:@"h"]; //Hide QEMU
     menuItem = (NSMenuItem *)[menu addItemWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"]; // Hide Others
     [menuItem setKeyEquivalentModifierMask:(NSEventModifierFlagOption|NSEventModifierFlagCommand)];
-- 
2.32.0 (Apple Git-132)


