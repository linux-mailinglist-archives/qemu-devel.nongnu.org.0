Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6469F6B9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:39:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqGM-0004Zg-Oo; Wed, 22 Feb 2023 09:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGI-0004Sm-Uz
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGH-0001I6-4A
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RY0ZpVcRRQsFXNlFXYjvJpNBlhuzbkZXMUYKbkzlWvw=;
 b=hwGDZzLZkoYa9Yq6kOGJuj+llYobmmG3PRrUx17Yu1OHCESHJ8Uadk5emyc6BBlv1FX7zF
 0X1CehIgCBQWSCxVc36Xgzj7TckikwFz+sBpZI/xCopgLpmWvh/Yvpj6IZ+eTwLhhdJRBq
 zMzDSV+/14lN0/uY3ji0q/CQazsU/mY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-LeCBqR_YPd6AF3lum9Waww-1; Wed, 22 Feb 2023 09:38:23 -0500
X-MC-Unique: LeCBqR_YPd6AF3lum9Waww-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg35-20020a05640228a300b004ad6e399b73so10179220edb.10
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RY0ZpVcRRQsFXNlFXYjvJpNBlhuzbkZXMUYKbkzlWvw=;
 b=MsZBXgUBAj6fhX6ag+0up9VyW1teuWJV9p0WUBF8SQVsH7/OKAIEGdGahmLWgBP6V0
 mBXHyXDJLpVMmkaKfMWrtT3pPt//uBA3diFK7/ZBsIur6jy7Z5POcKvKczue8bnLMyKV
 ioK/AnVTThuabcJ4e2RTQGm4DJgawAubtZn0MF3MzaMoWxRHZxGP+wjb1kGYWOIzHKp4
 ysekgEsbYZ62mzsPECv+M1lrXF5Q5dGHEd7OU1csJdsfYbBE+jQ0qFEdN5WUydOCnDj6
 TcqnZVe0EUX36xCx4igXVPOhA3SMIN3xx4xZ3FVw1n2yAKgHcTkCYdojs6uq9VFIQPxl
 PdGQ==
X-Gm-Message-State: AO0yUKWbRNel6dF6cRaPF+09NC2oSg7DqIjBOoxOuAvv7mTtsvf4U0IM
 3+JrMvtt5/E5A8Zo1OTDmN0ToCjGlKnQaCaMv3KN5zmUG8+o+wKBBzUkrdcJpYRITVfiMcJMNY2
 ADcelXnhjD12OltnDVPKIC7cqu5pkZL+rD8Cfn/fsUSrocFjQdDxOfuvh3uomio5fRtKBrWKQ
X-Received: by 2002:a05:6402:657:b0:4ab:4641:55fb with SMTP id
 u23-20020a056402065700b004ab464155fbmr7069716edx.42.1677076701615; 
 Wed, 22 Feb 2023 06:38:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9jZrN//lfihi+K+KdG3ZCJnUtagc75Yiq40zkVyNtvbkzikvxyeNBOjo7A2G1L+ShCVMeFkw==
X-Received: by 2002:a05:6402:657:b0:4ab:4641:55fb with SMTP id
 u23-20020a056402065700b004ab464155fbmr7069699edx.42.1677076701386; 
 Wed, 22 Feb 2023 06:38:21 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c30-20020a50f61e000000b004aee4e2a56esm3990256edn.0.2023.02.22.06.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:38:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
Subject: [PATCH 08/10] ci,
 docker: update CentOS and OpenSUSE Python to non-EOL versions
Date: Wed, 22 Feb 2023 15:37:50 +0100
Message-Id: <20230222143752.466090-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Python 3.6 is at end-of-life.  libvirt-ci now supports overrides for
targets and package mappings, therefore QEMU can use newer versions
provided by CentOS 8 (Python 3.8) and OpenSUSE 15.3 (Python 3.9).

Packages that the distro does not provide are included in the image
via PyPI; lcitool knows how to do that whenever the rpm mapping
is empty.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/testing.rst                        |  6 ++
 tests/docker/dockerfiles/centos8.docker       | 22 +++---
 tests/docker/dockerfiles/opensuse-leap.docker | 22 +++---
 tests/docker/dockerfiles/ubuntu2004.docker    |  2 +-
 tests/lcitool/mappings.yml                    | 77 +++++++++++++++++++
 tests/lcitool/targets/centos-stream-8.yml     |  3 +
 tests/lcitool/targets/opensuse-leap-153.yml   |  3 +
 7 files changed, 113 insertions(+), 22 deletions(-)
 create mode 100644 tests/lcitool/mappings.yml
 create mode 100644 tests/lcitool/targets/centos-stream-8.yml
 create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 648b7aa09137..67798dc63def 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -481,6 +481,12 @@ the mapping to the ``libvirt-ci`` project as well:
    contains the ``mappings.yml`` update.  Then add the prerequisite and
    run ``make lcitool-refresh``.
 
+For enterprise distros that default to old, end-of-life versions of the
+Python runtime, QEMU uses a separate set of mappings that work with more
+recent versions.  These can be found in ``tests/lcitool/mappings.yml``.
+These should not be a problem unless the dependencies you are adding
+is a Python library.
+
 
 Adding new OS distros
 ^^^^^^^^^^^^^^^^^^^^^
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index fbc953c6dccc..3c74be09a693 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -82,7 +82,6 @@ RUN dnf distro-sync -y && \
         lzo-devel \
         make \
         mesa-libgbm-devel \
-        meson \
         ncurses-devel \
         nettle-devel \
         ninja-build \
@@ -94,13 +93,12 @@ RUN dnf distro-sync -y && \
         pixman-devel \
         pkgconfig \
         pulseaudio-libs-devel \
-        python3 \
-        python3-PyYAML \
-        python3-numpy \
-        python3-pillow \
-        python3-pip \
-        python3-sphinx \
-        python3-sphinx_rtd_theme \
+        python38 \
+        python38-PyYAML \
+        python38-numpy \
+        python38-pip \
+        python38-setuptools \
+        python38-wheel \
         rdma-core-devel \
         rpm \
         sed \
@@ -128,8 +126,14 @@ RUN dnf distro-sync -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+RUN /usr/bin/pip3.8 install \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
+ENV PYTHON "/usr/bin/python3.8"
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 4b2c02d6abfb..5b8dbf2b83dd 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -89,16 +89,9 @@ RUN zypper update -y && \
            pam-devel \
            pcre-devel-static \
            pkgconfig \
-           python3-Pillow \
-           python3-PyYAML \
-           python3-Sphinx \
-           python3-base \
-           python3-numpy \
-           python3-opencv \
-           python3-pip \
-           python3-setuptools \
-           python3-sphinx_rtd_theme \
-           python3-wheel \
+           python39-base \
+           python39-pip \
+           python39-setuptools \
            rdma-core-devel \
            rpm \
            sed \
@@ -129,10 +122,15 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
+RUN /usr/bin/pip3.9 install \
+                    PyYAML \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
 
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
+ENV PYTHON "/usr/bin/python3.9"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 13ab0b688726..5b27b89f1c72 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -138,7 +138,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
+RUN /usr/bin/pip3 install meson==0.63.2
 
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
new file mode 100644
index 000000000000..e4719e45516c
--- /dev/null
+++ b/tests/lcitool/mappings.yml
@@ -0,0 +1,77 @@
+mappings:
+  flake8:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  meson:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3:
+    CentOSStream8: python38
+    OpenSUSELeap153: python39-base
+
+  python3-PyYAML:
+    CentOSStream8: python38-PyYAML
+    OpenSUSELeap153:
+
+  python3-devel:
+    CentOSStream8: python38-devel
+    OpenSUSELeap153: python39-devel
+
+  python3-docutils:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-numpy:
+    CentOSStream8: python38-numpy
+    OpenSUSELeap153:
+
+  python3-opencv:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-pillow:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-pip:
+    CentOSStream8: python38-pip
+    OpenSUSELeap153: python39-pip
+
+  python3-pillow:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-selinux:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-setuptools:
+    CentOSStream8: python38-setuptools
+    OpenSUSELeap153: python39-setuptools
+
+  python3-sphinx:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-sphinx-rtd-theme:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-venv:
+    CentOSStream8: python38
+    OpenSUSELeap153: python39-base
+
+  python3-wheel:
+    CentOSStream8: python38-wheel
+    OpenSUSELeap153: python39-pip
+
+pypi_mappings:
+  # Request more recent version
+  meson:
+    default: meson==0.63.2
+
+  # Drop packages that need devel headers
+  python3-numpy:
+    OpenSUSELeap153:
diff --git a/tests/lcitool/targets/centos-stream-8.yml b/tests/lcitool/targets/centos-stream-8.yml
new file mode 100644
index 000000000000..6b11160fd1dc
--- /dev/null
+++ b/tests/lcitool/targets/centos-stream-8.yml
@@ -0,0 +1,3 @@
+paths:
+  pip3: /usr/bin/pip3.8
+  python: /usr/bin/python3.8
diff --git a/tests/lcitool/targets/opensuse-leap-153.yml b/tests/lcitool/targets/opensuse-leap-153.yml
new file mode 100644
index 000000000000..683016e0077a
--- /dev/null
+++ b/tests/lcitool/targets/opensuse-leap-153.yml
@@ -0,0 +1,3 @@
+paths:
+  pip3: /usr/bin/pip3.9
+  python: /usr/bin/python3.9
-- 
2.39.1


