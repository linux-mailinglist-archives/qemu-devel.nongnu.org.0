Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539E148F7B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 21:42:20 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv5mV-0001SN-8h
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 15:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iv5kx-00089u-4I
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 15:40:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iv5kw-000687-4M
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 15:40:43 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51273)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iv5kv-000679-UV
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 15:40:42 -0500
Received: by mail-wm1-x341.google.com with SMTP id t23so728860wmi.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 12:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkv4M+AkP1pQlh1PhGkDNRhpNbkYFJfPzkZzb2OKC/o=;
 b=si5GAm+TB98zvWp8qmGJvQuncs4iDqEeqOzJ/1JfRfUlKrKUtvdyGhXvWHnVlFZMfW
 UxEADr5++DP9koHT8HHn514XfGO7Xcd7rmNiqKekoGteTyC7SInkAloek+K66+TkNCzJ
 ZINuTtLIAZbV12Mi0OQ9IaaY3duroufG4qWQyB8HdvUZxqRRNE0CoaeoSveN4QXQV+kR
 tyqg8l18Ylt8+30LwUUA1JmxhvXWvYuczRbqnz293ljA33ZH1bdwWcg88phsQlEgBaqa
 cnrGmSWIHMw5ud9wVlJ2JVFeczjjFg7bbIrxNoLGA4a5t24VRJHNk1SIMvifiZXJEyW5
 OSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkv4M+AkP1pQlh1PhGkDNRhpNbkYFJfPzkZzb2OKC/o=;
 b=NZbmflNIEIKeBw22ptNRnXCRk7JXIf2B0Kb655ZiRXGk0BlJ/6+ZyHH3oBWRsJ4IG3
 XsrFIuL9ORIuz2Q1sjIdHwHGJ9GOayxy4Rlv23rOYzOkinyh2jO8mXkwQxVLLHZA10W1
 mVwEge1me2U0/ufC9H/+2P38aPc6F6Bpwbu4J99vXbI514Z8fQ0f+LvuOoTkDB2F6JIj
 ppJtTrPXxcshoIx2PyXc/o0esQI3QqgEUq6AUrlQRyuUjqzor6Wp1J0R6BiEy2hHgWf8
 usTR0js048it9aND9JYXTuHqPy3tUn4qFyCfvmBo99s/c7R25kq6zbfKVjNxid7e4leM
 Yhwg==
X-Gm-Message-State: APjAAAW6ZlEULfmToDhvCY9VhlIVFaRyj4FguXBWof2xYamETpVTG6Uf
 mpQJ/saBkM8Ex48iXDxu/MCa4w==
X-Google-Smtp-Source: APXvYqzfWKuZ318cl96r3j+FNaiYAffBWFCgex7eV9gLysY/loHTzPqUazmLHD7ybeMVLEclLNrsow==
X-Received: by 2002:a1c:451:: with SMTP id 78mr827656wme.125.1579898440997;
 Fri, 24 Jan 2020 12:40:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a1sm8725970wrr.80.2020.01.24.12.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 12:40:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 473991FF9A;
 Fri, 24 Jan 2020 20:40:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/13] tests/docker: add debian10-native-qemu-build
Date: Fri, 24 Jan 2020 20:40:23 +0000
Message-Id: <20200124204026.2107-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124204026.2107-1-alex.bennee@linaro.org>
References: <20200124204026.2107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a new dockerfile which can build the native architecture QEMU
on a Debian 10 based image whatever architecture that may be.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../dockerfiles/debian10-native-qemu-build.docker | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 tests/docker/dockerfiles/debian10-native-qemu-build.docker

diff --git a/tests/docker/dockerfiles/debian10-native-qemu-build.docker b/tests/docker/dockerfiles/debian10-native-qemu-build.docker
new file mode 100644
index 0000000000..71bd2b1d83
--- /dev/null
+++ b/tests/docker/dockerfiles/debian10-native-qemu-build.docker
@@ -0,0 +1,15 @@
+#
+# Debain Native Build
+#
+# This docker target builds on the Debian Buster base image. It is
+# deliberatly architecture agnostic as it can build on any Debian
+# supported architecture.
+#
+FROM qemu:debian10
+MAINTAINER Alex Bennée <alex.bennee@linaro.org>
+
+# We use --arch-only as not all hosts have what's needed to build all
+# the binpkg's that come with QEMU (roms etc).
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep --arch-only -yy qemu
-- 
2.20.1


