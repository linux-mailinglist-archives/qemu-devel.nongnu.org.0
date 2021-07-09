Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C6C3C260F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:37:01 +0200 (CEST)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rci-0001qw-FJ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWU-0004rJ-Ju
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWJ-0005ZT-P4
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f9so6747620wrq.11
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bTttEc+oJXhPYrt7q5iIhClUXDghFeYtwNO1q7NtVDA=;
 b=gcyAkf6g4SeY88YSeAeuTlh4eeySnlmgNSUMlkuB4B78An52sxxGx0HLXymvZEPQMQ
 SBNL4gFd/ulwpeciABOMnLlmY/YBOmw4ef2r/Hxk6+NONcYKqjRa4gSqRcdFx6dmqAQR
 MD/lrOMrH5ZdUxxOus0Ld1QGXeXeiUWSssAcIX8J/mOL3wl8fCvcLq2PRfRdK+LUURbl
 yQztkWKQ11KAmA97ATT66CuDRJJuxPiChcLeF5lkXl8MlnHynCv1MBFDdWNkjWrWNIme
 jzBez3+HrhtdrGJVKIA7F1L8SX9/1lSJXfGq9/zxTvmjbw/ei2TQtnJcNgU+E4fwZl4h
 9x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bTttEc+oJXhPYrt7q5iIhClUXDghFeYtwNO1q7NtVDA=;
 b=XlA2Qnyyq5OJ6XVI/qqlYaDhIcL0qA3bIqZoAzJAA28q+p/KNu1WPaLmM3EAKp3oJG
 3tX5K68T65zfyg9OXJ7frCaD1lVeQRl7o7IHLrN9HjoLHtFoav4vBzYJWXLWLH6kkO6V
 Z2OCwNSLS9oWGTzP3LkpxNUicR8zm2eDKujD7s+4XhmuuB/RF/sBZhlDKMaQoLvbm6OS
 KA/KoRgGEiQXvXaWFOthP+j6kupDhMNlQfD0MuUHTPXWez7zwvBw8nk8AhTkQ3pasFaY
 W7g7miL7AVpOq7rx++gdfcQbQ9UaBc3+5UWWUL6AL1zxJt+w2lpInicUh3rpYBv5iGzB
 KFXA==
X-Gm-Message-State: AOAM5331IscsmtTGQmxaJiTpzL8gUhss5JN7H9eo+uxwOAtV2OvaGPda
 0A0A4BfsybZ5qxhna1M7tXYpfA==
X-Google-Smtp-Source: ABdhPJwJ+qyCtWJAu96FJzNI00Z/z0DIV7enycPMzp9njtXz8nEwbWCmGbw1ig9ny7JPIinxDblizw==
X-Received: by 2002:a5d:40c7:: with SMTP id b7mr41351543wrq.169.1625841022405; 
 Fri, 09 Jul 2021 07:30:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x4sm12303005wmi.22.2021.07.09.07.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8ACAF1FF7E;
 Fri,  9 Jul 2021 15:30:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 08/40] cirrus: delete FreeBSD and macOS jobs
Date: Fri,  9 Jul 2021 15:29:33 +0100
Message-Id: <20210709143005.1554-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Ed Maste <emaste@freebsd.org>,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, aurelien@aurel32.net,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The builds for these two platforms can now be performed from GitLab CI
using cirrus-run.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210625172211.451010-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 55 -----------------------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f4bf49b704..02c43a074a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,61 +1,6 @@
 env:
   CIRRUS_CLONE_DEPTH: 1
 
-freebsd_12_task:
-  freebsd_instance:
-    image_family: freebsd-12-2
-    cpu: 8
-    memory: 8G
-  install_script:
-    - ASSUME_ALWAYS_YES=yes pkg bootstrap -f ;
-    - pkg install -y bash curl cyrus-sasl git glib gmake gnutls gsed
-          nettle perl5 pixman pkgconf png usbredir ninja
-  script:
-    - mkdir build
-    - cd build
-    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
-    - ../configure --enable-werror --disable-gnutls
-      || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake -j$(sysctl -n hw.ncpu) check V=1
-
-macos_task:
-  osx_instance:
-    image: catalina-base
-  install_script:
-    - brew install pkg-config python gnu-sed glib pixman make sdl2 bash ninja
-  script:
-    - mkdir build
-    - cd build
-    - ../configure --python=/usr/local/bin/python3 --enable-werror
-                   --extra-cflags='-Wno-error=deprecated-declarations'
-                   || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
-    - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
-
-macos_xcode_task:
-  osx_instance:
-    # this is an alias for the latest Xcode
-    image: catalina-xcode
-  install_script:
-    - brew install pkg-config gnu-sed glib pixman make sdl2 bash ninja
-  script:
-    - mkdir build
-    - cd build
-    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
-                   --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
-    - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
-
 windows_msys2_task:
   timeout_in: 90m
   windows_container:
-- 
2.20.1


