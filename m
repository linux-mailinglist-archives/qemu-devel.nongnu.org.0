Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0143E3DE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:35:56 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6VX-0001kE-Hg
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mg6OS-0003lS-7U
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:28:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mg6OQ-0005O0-FN
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:28:35 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m17so24538345edc.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6qfx6HM/Y3HMQHUhWaDf+0QWkNIBVJGDZ1UAk6w8sKI=;
 b=Xl4qoTGakpm4xqVOlmXAu71YLS/uJJwlp2XxH+XIvcWCFSjq1pwTJT49F1xhB/r/3k
 Pxc66KoDtO4Mi0N4Cim75w9DwXsSN8ECU1oXvaDVvs2eqFeSZrLjjYRfSrTUzMv08c3X
 vUulswErKuMv26iTHk4kkPHbE1/xv5AB83F20w+6q1iXlY7NPg52PVCL7+WOanopJ6zU
 3MhQT5yNNWor+eR8zn2h/kFISPvTutHscwy0uBcaUkLo0yZ/t+oZCDwmMvXMwwH1/qOn
 ++O3hWttvvDlWMcULKJfOED/GFRzkqNkUpqshg2uOKxkM7VD5tKwBgjMAoi4gIu5naGc
 LEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6qfx6HM/Y3HMQHUhWaDf+0QWkNIBVJGDZ1UAk6w8sKI=;
 b=k/U/+sAaZjD9V7SOKftgtsvL/LH743Ss+8x16yZ46K2tznZ0eg7RBy11pQuQYRP5jv
 6eUf1ybzDjlAlsSx7FaVUC6yArat29S8qhEyP16PKFVTTh5j0oI/V5D/dS1+pw7MmnBR
 7Jy+Pr2Cv61TRFDINExbTKtt1H99az7z6Q785MJ4wFtR8xQgTyCQ9InD3c6DtZBQIAHR
 v59MJO9Y99bkysQu7OrGdOqH6Y61W/F/yTBBFLGoPlnphqVJgubE/N0IOY1IT6qkf+bP
 /eYCY0VBfioU4sgxFEZZz3BVrcMkt1tOCtvBWqk9VJ3/j40tiofTWxxK67V6wl4MjNES
 LpUw==
X-Gm-Message-State: AOAM532xzoykmTj3xeW8xZGJDRFfLGbfvG7oJGAWA3RR/wLCmZe+fUlo
 wF3CpJiUdNGWgK6FiorDW5MHsBHPGzI=
X-Google-Smtp-Source: ABdhPJyF7jaqbLKIKrdJnPKoW5NHqyHRAZma9UOqpCZD12yOhv3zHxFov4tsU+Tv15rgreiUPXpgGg==
X-Received: by 2002:a50:f087:: with SMTP id v7mr6480031edl.126.1635431309414; 
 Thu, 28 Oct 2021 07:28:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q23sm1517201ejr.0.2021.10.28.07.28.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:28:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: bump submodule to 0.59.3
Date: Thu, 28 Oct 2021 16:28:25 +0200
Message-Id: <20211028142826.57327-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028142826.57327-1-pbonzini@redhat.com>
References: <20211028142826.57327-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gains some bugfixes, especially:

- it fixes the introspection of array options.  While technically we
still support Meson 0.58.2, this issue only appears when adding a new
option and not if the user is just building QEMU.  In the relatively
rare case of a contributor using --meson to point to a 0.58 version,
review can catch spurious changes to scripts/meson-buildoptions.sh
easily.

- it fixes "meson test" when it is not the process group leader.  Make is
the process group leader when "make check" invokes "meson test", so this
is a requirement for using it as a test harness.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     |  2 +-
 meson                         |  2 +-
 scripts/meson-buildoptions.py | 16 ----------------
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index c0018a304f..73af9a7b30 100755
--- a/configure
+++ b/configure
@@ -1500,7 +1500,7 @@ python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0]
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.59.2; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.59.3; then
         meson=meson
     elif test $git_submodules_action != 'ignore' ; then
         meson=git
diff --git a/meson b/meson
index b25d94e7c7..12f9f04ba0 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da
+Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 256523c09d..96969d89ee 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -150,23 +150,7 @@ def print_parse(options):
     print("}")
 
 
-def fixup_options(options):
-    # Meson <= 0.60 does not include the choices in array options, fix that up
-    for opt in options:
-        if opt["name"] == "trace_backends":
-            opt["choices"] = [
-                "dtrace",
-                "ftrace",
-                "log",
-                "nop",
-                "simple",
-                "syslog",
-                "ust",
-            ]
-
-
 options = load_options(json.load(sys.stdin))
-fixup_options(options)
 print("# This file is generated by meson-buildoptions.py, do not edit!")
 print_help(options)
 print_parse(options)
-- 
2.31.1



