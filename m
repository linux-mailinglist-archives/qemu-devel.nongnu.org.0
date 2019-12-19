Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC727125FFF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 11:53:58 +0100 (CET)
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihtRN-0003of-Hs
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 05:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ihtNF-0006Xo-Di
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:49:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ihtND-0007x3-0K
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:49:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ihtNC-0007pp-Mk
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:49:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id q9so4939770wmj.5
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 02:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+Pda+ZdRPcyYkSjIEt1t/uTnpjt9VwcL/O1cE3PJHI=;
 b=tQ/bknCAq+PpnYB7kbXeP4NjPYiW/CwVoYYMVxVjktHTyxk0BNO3JulfdMxU3Z7FzN
 Ku1HRRzJgACzIJp2ZOF/3TJczpsDEtdepaYFhDOWW8OQBcA3NWC2QZdUQF6mLyAZrQp9
 PtG3Ecu1/g/fjG+RdnZkkiFuTa4JyoAr6o+1YBnxZdTSx0DidcsEEfiAgtqGIyJHIvni
 FTV3BBrqkVieItxjsLW+2rEPA1APj3/LyYRNZuItNSV+VFJp4fhuoHYkRq08W3P1mW8J
 KTXov3IxcHV89oQ6NNkz73vFdbTvXnHSZ1s2FvvZ/xQnpoCKvepxaAtYqLTrsX8rkW1B
 EizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+Pda+ZdRPcyYkSjIEt1t/uTnpjt9VwcL/O1cE3PJHI=;
 b=hULz8Qf4jqx0xShhE4BKr/xC+0TLo7n5EHTkA7/74xIHs8nY6adlBQrpAkrHsRa1m3
 PLKEJmT3tWXhxF89QtlBihW+at4BJeeqv8p0myL7+vUTRvN30vzu9/AnaOpRHCFKYyzS
 D5N3NWyA27j6bSyyU0Ph3uxWNRe5RReApwEzFL0NV4ykY0ZJ1wXLTGrnaabmvKxNyVQl
 Z0K3h+JKkW99+XRbcNb1uMsdAvoacT1M46En8H8+dK6HvLFNDiwKzjd4vSjE4qJ4p1Tz
 KbtP2qxGbMuUnJEypPxWw83vsXykN9Ds+3nTvjwLzAmLxjiofYhSwLwRNa/z1U3HaSOR
 0ZdQ==
X-Gm-Message-State: APjAAAV561rtH0s1QOjpZsLOxQifu/Jaos+OrPRb+ORYtX3htocG1AUn
 lYaOwC92aUHrPCeS8tMhNhvbVg==
X-Google-Smtp-Source: APXvYqyOlbiRHcRcTOggup4wtytu9l0sKcr+3hm0NTgofQxfNTj20OGold+p3sE0xOJipq3j8NoDzw==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr8990781wmj.140.1576752576877; 
 Thu, 19 Dec 2019 02:49:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f1sm5938897wru.6.2019.12.19.02.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:49:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F9001FF8C;
 Thu, 19 Dec 2019 10:49:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/25] configure: allow disable of cross compilation containers
Date: Thu, 19 Dec 2019 10:49:10 +0000
Message-Id: <20191219104934.866-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219104934.866-1-alex.bennee@linaro.org>
References: <20191219104934.866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our docker infrastructure isn't quite as multiarch as we would wish so
lets allow the user to disable it if they want. This will allow us to
use still run check-tcg on non-x86 CI setups.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/configure b/configure
index 84b413dbfcf..e0c66ee9b68 100755
--- a/configure
+++ b/configure
@@ -302,6 +302,7 @@ audio_win_int=""
 libs_qga=""
 debug_info="yes"
 stack_protector=""
+use_containers="yes"
 
 if test -e "$source_path/.git"
 then
@@ -1534,6 +1535,10 @@ for opt do
   ;;
   --disable-plugins) plugins="no"
   ;;
+  --enable-containers) use_containers="yes"
+  ;;
+  --disable-containers) use_containers="no"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1717,6 +1722,7 @@ Advanced options (experts only):
                            track the maximum stack usage of stacks created by qemu_alloc_stack
   --enable-plugins
                            enable plugins via shared library loading
+  --disable-containers     don't use containers for cross-building
 
 Optional features, enabled with --enable-FEATURE and
 disabled with --disable-FEATURE, default is enabled if available:
@@ -7992,7 +7998,7 @@ done
 (for i in $cross_cc_vars; do
   export $i
 done
-export target_list source_path
+export target_list source_path use_containers
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 6c4a471aeae..210e68396f2 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -36,8 +36,10 @@ TMPC="${TMPDIR1}/qemu-conf.c"
 TMPE="${TMPDIR1}/qemu-conf.exe"
 
 container="no"
-if has "docker" || has "podman"; then
-  container=$($python $source_path/tests/docker/docker.py probe)
+if test $use_containers = "yes"; then
+    if has "docker" || has "podman"; then
+        container=$($python $source_path/tests/docker/docker.py probe)
+    fi
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
-- 
2.20.1


