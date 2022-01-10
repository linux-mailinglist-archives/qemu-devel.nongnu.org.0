Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675D4898F4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 13:58:39 +0100 (CET)
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uFx-0007mV-Ut
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 07:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6u4b-0002gz-F9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:46:53 -0500
Received: from [2a00:1450:4864:20::432] (port=45655
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6u4Z-0003tA-Cd
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:46:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id q8so26458896wra.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kz9QU/c5pA0TXpDHNqpxo+Z6SvPt5Tzvou8NGcIdovI=;
 b=OfH/bVvAywpdYdW2hDvxEpe4fmNleTb9f6cl6tTzhU3mA7Mn+64iZD9aItRzZxZIYg
 6+0n6AYbXK3vHaCzEn5rhkcuKbvEq7mKeKEmsWn+Xto0LVFzwD15txVaTMID2lf+0qEV
 QKBOJOXc8xHg1UtxrAtq8VlNKn3vkl9F59XthSKmdjTC5Z4gjP2kdVfSQGmGLktgE/io
 E6oRdUODrGSstgIlsxRUbiqcgGTRuMGYQnjBmELuLJWiSjHBBKtMl+lCHWDs9ofsdlPH
 FR2qUKcZhQ1tuyR4C1N9pNl7wXmKNBLw0Wf/tLCtbT6yE2TzMg8sq0/SX1rMnDMLJjtr
 2/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kz9QU/c5pA0TXpDHNqpxo+Z6SvPt5Tzvou8NGcIdovI=;
 b=6uXjl8edaJsocjIju/2g6xdOCFDFb/xztJjvpIDsRZA+eCDaQMP4OqI9Anavl1o5vV
 CJgvp0nGyOIvbRQqIpdfXd2kJsdjjiUjCEIE+2C8qiq1rFVaZEaMKf8MFnzPREk4QB8/
 BeqvUV5unIKSmIGYb+n/uRwD4K12uCRWbAuDoK0nivhADERq765/+V+bjYblqPpAQ3p7
 Bm3MAfxZw5Ac1X7lAzkmDKHy9ikPgJjO7DQG1DLErcYD5bLlZR7rml1ZIrksAaNLTAMH
 AXQh7c5UlPWZV4W/l9SRoPGqfCEpyymefCt36/oi2W2DBO8VbF+LZYXBVIhldibhk/sp
 76ow==
X-Gm-Message-State: AOAM530gF9T8MBOyXt7sWeUCcWFW1kAsvrHHZvtt3iJJlEk1nDD5CZ42
 fNfGoKPUdju0d9D16kugCG9z0RPVZz3x6g==
X-Google-Smtp-Source: ABdhPJwHjTAPtM3BFc3VHUnbGLbhDcgmHTWWlxCeobDCgBs4I35IxI+8tkAsm7eJHhAgvvq0rO5rXA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr65353845wrs.425.1641818809842; 
 Mon, 10 Jan 2022 04:46:49 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id c16sm2553658wrw.41.2022.01.10.04.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 04:46:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests: Refresh lcitool submodule
Date: Mon, 10 Jan 2022 13:46:38 +0100
Message-Id: <20220110124638.610145-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110124638.610145-1-f4bug@amsat.org>
References: <20220110124638.610145-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refresh lcitool submodule and the generated files by running:

  $ make lcitool-refresh

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/alpine.docker        | 3 ++-
 tests/docker/dockerfiles/centos8.docker       | 3 +--
 tests/docker/dockerfiles/fedora.docker        | 3 +--
 tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
 tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
 tests/lcitool/libvirt-ci                      | 2 +-
 7 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index eb2251c81c8..9d7f74fc51e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile alpine-edge qemu
+#  $ lcitool dockerfile --layers all alpine-edge qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -109,6 +109,7 @@ RUN apk update && \
         zlib-dev \
         zlib-static \
         zstd-dev && \
+    apk list | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index cbb909d02b3..fde6a036263 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile centos-8 qemu
+#  $ lcitool dockerfile --layers all centos-8 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -69,7 +69,6 @@ RUN dnf update -y && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
         libxml2-devel \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 60207f3da38..82f504e40d6 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile fedora-35 qemu
+#  $ lcitool dockerfile --layers all fedora-35 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -77,7 +77,6 @@ exec "$@"' > /usr/bin/nosync && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
         libxml2-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index f57d8cfb299..30e7038148a 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile opensuse-leap-152 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-152 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0ffa3c4d4b5..4ea272d143b 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-1804 qemu
+#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 4e562dfdcd3..90988b2bc53 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-2004 qemu
+#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 29cec2153b9..8f48e54238d 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
+Subproject commit 8f48e54238d28d7a427a541d6dbe56432e3c4660
-- 
2.33.1


