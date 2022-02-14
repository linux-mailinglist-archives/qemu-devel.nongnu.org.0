Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1730F4B5AA2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:45:06 +0100 (CET)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhHV-000754-4M
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:45:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYK-0003pI-71; Mon, 14 Feb 2022 13:58:24 -0500
Received: from [2607:f8b0:4864:20::42a] (port=41794
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYI-0006WN-In; Mon, 14 Feb 2022 13:58:23 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c10so5225323pfv.8;
 Mon, 14 Feb 2022 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfgedMbiWFKJInWYax42U3NQTRfZ8JrSl2dGV6VDciM=;
 b=MuNzoqYfhalHcR5PRZir58Z2BLNOJJB9MF6gfPqwO/VFFzcLdK3IdQmFLqn3rjTTlX
 jJp2M6Hks1k861YltWITDTHLOtNWN3gxyDlgz+aO+07oQAwq29EgJKuogxU1CvU6ngxg
 TGz4BnRVBqB+r3Kz5nzdj9udrde+Hm/D6uI0H7Ewqs/vL5vnvCVzmWCVn9TdbjyOthpd
 0ZjI/Bq265k8jnRmO88KkmMqO26QB9RqJthV3QLo9zpXqThwwMuGuTPr0HHdwbDC17PU
 FtgWvP9R0gyybafuUJRYu35PZ75u478w1tu6apMhHPtuHzRn30iEmM5GKcGVnBS4+NgP
 hF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jfgedMbiWFKJInWYax42U3NQTRfZ8JrSl2dGV6VDciM=;
 b=acm+R8VU+Ueq+EoOwK0dgz9KKEfdO/xrD7GpDc78KDECZX0e3rE93zydFRtN7Nsofk
 gH+HANDtdHnUXwADP99FbGJ/RL/Z0Ddn31CyEB4iJuoGW6VXbBNTBIcqMuOkDAaVm+jR
 h7/GWazMmOIc/SvKs3K5vre3sKbi5Oithuh+GyOK/1iRxcyVo5HYh/4u7pa/8jY8cr2q
 OV6k3fNNK0LbdRSZqD5h7umJo9t0d4QzS8jB7pDahGdtQV5XL/oJMbLCYOYY1XUQEqMJ
 i2svIiXqCRTth7hIbmGW6g5AP/co7Tc++RxhdJWAJgIuKf7n6lj/YDwLseUQ+OFb9O1T
 BbQQ==
X-Gm-Message-State: AOAM533958SPbOHwZoOMmSyFo5WlzRioZWTTcuO2dE29fd2v0y+IP8i8
 aeHbHA08OH5QmPgeb6o56aEpEZTHQwk=
X-Google-Smtp-Source: ABdhPJy0kFxO5lo+gwyMgeIpyvnx2G/d7nx/ZE0UqzMnj/gwJDD/0mZlVnT7n6eslQk7VjNZmUgl8Q==
X-Received: by 2002:a62:2581:: with SMTP id l123mr211606pfl.71.1644865100933; 
 Mon, 14 Feb 2022 10:58:20 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q9sm269406pgf.73.2022.02.14.10.58.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:58:20 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 13/16] ui/cocoa: Add Services menu
Date: Mon, 14 Feb 2022 19:56:02 +0100
Message-Id: <20220214185605.28087-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Services menu functionality of Cocoa is described at:
https://developer.apple.com/design/human-interface-guidelines/macos/extensions/services/

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214091320.51750-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 7a1ddd4075..becca58cb7 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1591,11 +1591,15 @@ static void create_initial_menus(void)
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
2.34.1


