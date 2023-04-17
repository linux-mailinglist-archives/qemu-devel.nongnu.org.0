Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8466E4836
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:48:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOGV-0005Mw-LX; Mon, 17 Apr 2023 08:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1poOGD-0005LA-9q
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1poOGB-0001Xr-9a
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681735625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErBcm5SdxmCwOa4NHYwrC69Ad9xUiKlm4pE+Kag6III=;
 b=eTXORQzpmJyemTtdNDR3qqJox/bYOjBxwx1AezcJBLkHTPwsfdwp6XJUOt00u03iF53dGU
 PpUeM4L6+LcJNf+l42YBuTVe2ry3Nw6knzWIDYlScsSFj8EZ11Svbizp/szj5jQTHgpsgT
 VwRkajXbgp26pbkCTNufPIbG4BdO/Bw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-EHJJBD-wMJ2kB-ctqoW1ww-1; Mon, 17 Apr 2023 08:47:01 -0400
X-MC-Unique: EHJJBD-wMJ2kB-ctqoW1ww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89D6D8996E0;
 Mon, 17 Apr 2023 12:47:01 +0000 (UTC)
Received: from speedmetal.redhat.com (unknown [10.45.242.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D319B492B0F;
 Mon, 17 Apr 2023 12:46:59 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Date: Mon, 17 Apr 2023 14:46:54 +0200
Message-Id: <a408b7f241ac59e5944db6ae2360a792305c36e0.1681735482.git.pkrempa@redhat.com>
In-Reply-To: <cover.1681735482.git.pkrempa@redhat.com>
References: <cover.1681735482.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 15.3 version is EOL now:

https://get.opensuse.org/leap/15.3

Switch the dockerfile to 15.4.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/opensuse-leap.docker |  8 ++---
 tests/lcitool/mappings.yml                    | 36 +++++++++----------
 tests/lcitool/refresh                         |  2 +-
 ...use-leap-153.yml => opensuse-leap-154.yml} |  0
 4 files changed, 23 insertions(+), 23 deletions(-)
 rename tests/lcitool/targets/{opensuse-leap-153.yml => opensuse-leap-154.yml} (100%)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index a0d802ab83..af32c2a42d 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-154 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci

-FROM registry.opensuse.org/opensuse/leap:15.3
+FROM registry.opensuse.org/opensuse/leap:15.4

 RUN zypper update -y && \
     zypper install -y \
@@ -137,11 +137,11 @@ ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3.9"
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-154 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci

-FROM registry.opensuse.org/opensuse/leap:15.3
+FROM registry.opensuse.org/opensuse/leap:15.4

 RUN zypper update -y && \
     zypper install -y \
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index e4719e4551..2ef78bd788 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -1,71 +1,71 @@
 mappings:
   flake8:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   meson:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3:
     CentOSStream8: python38
-    OpenSUSELeap153: python39-base
+    OpenSUSELeap154: python39-base

   python3-PyYAML:
     CentOSStream8: python38-PyYAML
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-devel:
     CentOSStream8: python38-devel
-    OpenSUSELeap153: python39-devel
+    OpenSUSELeap154: python39-devel

   python3-docutils:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-numpy:
     CentOSStream8: python38-numpy
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-opencv:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-pillow:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-pip:
     CentOSStream8: python38-pip
-    OpenSUSELeap153: python39-pip
+    OpenSUSELeap154: python39-pip

   python3-pillow:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-selinux:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-setuptools:
     CentOSStream8: python38-setuptools
-    OpenSUSELeap153: python39-setuptools
+    OpenSUSELeap154: python39-setuptools

   python3-sphinx:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-sphinx-rtd-theme:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap154:

   python3-venv:
     CentOSStream8: python38
-    OpenSUSELeap153: python39-base
+    OpenSUSELeap154: python39-base

   python3-wheel:
     CentOSStream8: python38-wheel
-    OpenSUSELeap153: python39-pip
+    OpenSUSELeap154: python39-pip

 pypi_mappings:
   # Request more recent version
@@ -74,4 +74,4 @@ pypi_mappings:

   # Drop packages that need devel headers
   python3-numpy:
-    OpenSUSELeap153:
+    OpenSUSELeap154:
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index c0d7ad5516..b3acd9d6b0 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -120,7 +120,7 @@ try:
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-37")
-    generate_dockerfile("opensuse-leap", "opensuse-leap-153")
+    generate_dockerfile("opensuse-leap", "opensuse-leap-154")
     generate_dockerfile("ubuntu2004", "ubuntu-2004")
     generate_dockerfile("ubuntu2204", "ubuntu-2204")

diff --git a/tests/lcitool/targets/opensuse-leap-153.yml b/tests/lcitool/targets/opensuse-leap-154.yml
similarity index 100%
rename from tests/lcitool/targets/opensuse-leap-153.yml
rename to tests/lcitool/targets/opensuse-leap-154.yml
-- 
2.39.2


