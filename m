Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE86D2134
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 15:13:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piEXq-0000Rs-6e; Fri, 31 Mar 2023 09:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1piEXo-0000Pg-Pm
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 09:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1piEXm-0002zz-SB
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 09:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680268307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x/ffmna1bd1HsxP6kN4T2wEbMD8VV4QFaOLuqp6zrF0=;
 b=frimXeF528kX2gCcIeiPYaqCX1kcHab9VcXju0CXM65HmFXPBfd2v6lThhSc+Nqdi1Hnw5
 GoG2czfqRmBCRDeujQ7ok5jWgE3lOkXLkA/nVaA8kbcUCQXhtMBxryXEPrk2l3NoWfWVnP
 VlrqQwdDgK4oIJ4VurM8XGf/vuKsz1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-kNTDZ71RN4SBkWWBeKytcg-1; Fri, 31 Mar 2023 09:11:44 -0400
X-MC-Unique: kNTDZ71RN4SBkWWBeKytcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE2151C05153;
 Fri, 31 Mar 2023 13:11:43 +0000 (UTC)
Received: from speedmetal.redhat.com (unknown [10.45.242.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7315A2166B33;
 Fri, 31 Mar 2023 13:11:42 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests: lcitool: Switch to OpenSUSE Leap 15.4
Date: Fri, 31 Mar 2023 15:11:41 +0200
Message-Id: <23259353a19a8da5277a18168bd911c777265e21.1680268168.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 tests/docker/dockerfiles/opensuse-leap.docker | 25 +++++++++----------
 tests/lcitool/refresh                         |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 8e9500e443..91a67bfd0d 100644
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
@@ -81,6 +81,7 @@ RUN zypper update -y && \
            lttng-ust-devel \
            lzo-devel \
            make \
+           meson \
            mkisofs \
            ncat \
            ncurses-devel \
@@ -89,9 +90,14 @@ RUN zypper update -y && \
            pam-devel \
            pcre-devel-static \
            pkgconfig \
-           python39-base \
-           python39-pip \
-           python39-setuptools \
+           python3-Pillow \
+           python3-PyYAML \
+           python3-Sphinx \
+           python3-base \
+           python3-numpy \
+           python3-opencv \
+           python3-pip \
+           python3-sphinx_rtd_theme \
            rdma-core-devel \
            rpm \
            sed \
@@ -124,18 +130,11 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

-RUN /usr/bin/pip3.9 install \
-                    PyYAML \
-                    meson==0.63.2 \
-                    pillow \
-                    sphinx \
-                    sphinx-rtd-theme
-
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3.9"
+ENV PYTHON "/usr/bin/python3"
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
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

-- 
2.39.2


