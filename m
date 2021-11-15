Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99944FD27
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 03:30:16 +0100 (CET)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmRl8-0006gb-Nj
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 21:30:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yshxxsjt715@gmail.com>)
 id 1mmRk3-0005u2-0R
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 21:29:07 -0500
Received: from [2607:f8b0:4864:20::236] (port=39901
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yshxxsjt715@gmail.com>)
 id 1mmRk1-0008ED-CK
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 21:29:06 -0500
Received: by mail-oi1-x236.google.com with SMTP id bf8so31747023oib.6
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 18:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYTNJvnSHfpAIlmL04JXulLwaGC7QmnUC1FUuAhqGgA=;
 b=JocidsiRGe3L/S2e+o3fIvZ5gB3uFAxotAYnMfxJXECoQXNkgbG+UrRyEh4vlfDuIi
 0apcE4LAZ9x9DJMwzC9eJ/z1wFDnZ8f81cIDOxDwwkqvqzu6waiu8++T1+ksnq1UP0yn
 KIZ45UMWuUjk8duliW+SihNpovkEDN0LbhZy9SMNGADnNe+Z1uQjvfwBNwfas0qhr5GL
 ugN08ACRgyyBS6qk2YV0gguieRI59ZQgG7qLx7/HQ7wnTJuqu6WfLjMxZvZi4/5Lq7zG
 PfmgW8EAHis3/RtOHXUbGsGCw2hq4dOaksAytbPpOZXr6APhLNyxZQ/klI3IV3YVp9Vv
 KXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYTNJvnSHfpAIlmL04JXulLwaGC7QmnUC1FUuAhqGgA=;
 b=MhmYZprxwIZxYzE8IYAF1VZd/7NEAFIko7pqY+0bkq0x0t77XuDT5ioL78GwjEmeUP
 mY7ik5fQs7L1fQ0d8ynm/sXHruriZ3v2/l82v5WCVSYg+cW4rj4potN4A22/AHbSBzrR
 Kn/Dbn6pKu1AaS+cSMYOCeKIQ1JbNcolX8JHfzFiuLxyogu+oZCIMNWKhPukhIZqrgwZ
 Y009tATou4c5rYDj7do8rQ4dCKKWqzNVyVde6Z8IP3pGl/+7GAhKtNpEl4OLRAFTe1+N
 QDcSyrWFU+UAsmQlsjsL8zbVnPIktBgVKY36NOTGtltpsbOiiD7yALmBsL6+h7CXiFRg
 23kw==
X-Gm-Message-State: AOAM532txiLPGR3BEuxlrC2V6vJHwr2mCgM6gl2BFBoKsAayHurWYeBV
 /0HIUgCImDrHqlh/cDOgSQy9bsQPr+6I41llB+k=
X-Google-Smtp-Source: ABdhPJwpQPFmAagqudViF4trpyHqWJrf2qnMhWiFt0ZuGUH7+y9iHAf2Kv3ck9fUy9ijoERTCh/uBg==
X-Received: by 2002:a17:90a:a083:: with SMTP id
 r3mr59218554pjp.55.1636942891658; 
 Sun, 14 Nov 2021 18:21:31 -0800 (PST)
Received: from localhost.localdomain ([113.128.82.80])
 by smtp.gmail.com with ESMTPSA id m18sm4981546pff.138.2021.11.14.18.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 18:21:31 -0800 (PST)
From: yshxxsjt715@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH] Add service recovery options for QGA on windows
Date: Mon, 15 Nov 2021 10:21:22 +0800
Message-Id: <20211115022122.2303184-1-yshxxsjt715@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=yshxxsjt715@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: shenjiatong <yshxxsjt715@gmail.com>, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: shenjiatong <yshxxsjt715@gmail.com>

Add default recovery options for QGA on windows. Previously, QGA
on windows will not try to restart service if it is down. This PS
add some default options for the first, second and other failures,
with an interval of 1min. Failure counter will reset after 1 day.

Signed-off-by: shenjiatong <yshxxsjt715@gmail.com>
---
 qga/service-win32.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/qga/service-win32.c b/qga/service-win32.c
index fd434e3f49..0fc93d38c3 100644
--- a/qga/service-win32.c
+++ b/qga/service-win32.c
@@ -105,6 +105,18 @@ int ga_install_service(const char *path, const char *logfile,
     GString *esc;
     GString *cmdline;
     SERVICE_DESCRIPTION desc = { (char *)QGA_SERVICE_DESCRIPTION };
+    SC_ACTION sa[] = {
+        { SC_ACTION_RESTART, 60000},
+        { SC_ACTION_RESTART, 60000},
+        { SC_ACTION_RESTART, 60000}
+    };
+    SERVICE_FAILURE_ACTIONS sfa = {
+        864000, // in seconds,
+        NULL,
+        NULL,
+        sizeof(sa) / sizeof(*sa),
+        sa
+    };
 
     if (GetModuleFileName(NULL, module_fname, MAX_PATH) == 0) {
         printf_win_error("No full path to service's executable");
@@ -146,6 +158,7 @@ int ga_install_service(const char *path, const char *logfile,
     }
 
     ChangeServiceConfig2(service, SERVICE_CONFIG_DESCRIPTION, &desc);
+    ChangeServiceConfig2(service, SERVICE_CONFIG_FAILURE_ACTIONS, &sfa);
     fprintf(stderr, "Service was installed successfully.\n");
     ret = EXIT_SUCCESS;
     CloseServiceHandle(service);
-- 
2.25.1


