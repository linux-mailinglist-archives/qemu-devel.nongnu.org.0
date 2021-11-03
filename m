Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D32444490
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:21:11 +0100 (CET)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI4c-0002lE-5k
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpG-0003a7-Fl
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp8-0000vj-Dn
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id s13so4084994wrb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pcrwji9vHuaWvaq0ZOMUVH0lNQxgrqXr28rTnWc4hQ=;
 b=ebziOCvwT93i71xxcLY+BozqlAIXTeAnZa2EYjJGOq2KqLnswnX6xZJtsNaYF9PfyA
 O+Yc1fu5ITlB8v0IntEMqLIvrolvoPHl3RCjgbX6kWMXeQB7jO3u3AzmSBpFzxcJl9fc
 32ak37SHefYb4u+mjI9BQn7Wcy7iUvRC2EivaUlFZ0PJXr8MvPk+X1FfSb5sDkkyGSwV
 agmJDowaX4jmZq9z6nsyn7hDU7FjMZKfeLtvCpkvKHTyvp9OZNZB8g5yH/KVu0r11jcC
 bJVResNxlcWk6H+Stg7eMHbDPzwF+yKGJ9VOewock3SAO/ginXukVgMe/TJxpUYWQp33
 u/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9pcrwji9vHuaWvaq0ZOMUVH0lNQxgrqXr28rTnWc4hQ=;
 b=ifJh8cirWlMWQVc2tbaCFsqu3bUVh0ySBqWWdgZnWyNtYn9/MdISAhJvfhGK0f1wa5
 uTKJXupK+uwi1WZyVnNE4icjPYQAc/WNntJvip7goYXAay70zzBdKwU6lxmlhMeFLzWD
 eEI4fz1zOZ+hGpyGuHCljFZLH6NoRcyqkmmrjpQnEwIWWRTd1dHq9us5L+1n4ZQ7aXNW
 f9AdUABkQrzGpo3jBe8VNF/GKndhLiuONg3iy7NJQkG4lk1RlymR0W2NI1tnN/KphcGe
 gUIbfROcy0z1+0hG/+qRbf0H+yYPIotH8ollTCkD7iaLOQCtIwJUfQsenACLydNje0gf
 RQIA==
X-Gm-Message-State: AOAM532kJx2Zsz2vx25Hi9freU1xBMhR1hK1syuqz/MIg45X0XsHhc7v
 h68IBZ1p9aXYghkUHRUT+JH96eJ1LZY=
X-Google-Smtp-Source: ABdhPJzMBa5D7KExL+QeWVhgMCw+U/p8GZpPXrSBXDR/6+xx3Y9LSDE2HdAviN0WhorQrjNkhLMgkg==
X-Received: by 2002:adf:a389:: with SMTP id l9mr45792112wrb.121.1635951907387; 
 Wed, 03 Nov 2021 08:05:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/27] meson: bump submodule to 0.59.3
Date: Wed,  3 Nov 2021 16:04:36 +0100
Message-Id: <20211103150442.387121-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
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

Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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



