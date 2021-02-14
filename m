Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74B31B208
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:37:33 +0100 (CET)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMGz-0004To-1O
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLid-0000pZ-6c
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:03 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiZ-0004ez-Tl
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:02 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so5842222wml.2
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0AWEhq001McQAH/89WIBVS1NfSah7AxRRJlHmFbgoT8=;
 b=PRa62vJbssrp3t/XYnAjmm+m9WM+b/JWW5S5ciaRMs4Vw5VI4I/eM/eHRBLXpOR4fa
 bVsmEbN8SxMqnKv2zLAPYqYffDhD14zaoYCbCaxtVsGHuneSsTYgDMuFzlu6dCfred42
 /SCIFc+MCXgH50tbQ3cXlCaunVjeuVYj4l2eGpGzKVDjDwlVQzbh/VosfYDrpAs17mgz
 BD2uY0UlpeOOB04EKC3Ev5pGNizPv0W+YOP8Kk/jAvrJAf/g6eUa5HOrEJ3kToYEKDjw
 AAA5D/F+Y36Y/X4+XDfv6UqNbpSwQPLM8wvPrvIHiitkyigqi1BXNfuImJnIGDFq8Rvh
 dZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0AWEhq001McQAH/89WIBVS1NfSah7AxRRJlHmFbgoT8=;
 b=r5BdNx6acUNC+5dc63tmP1UzilByHGpW4s5Me6dFoYkuHqViJGAIBah3THy86sovyf
 utQGY7rv1cK1ISDI3JuwDVFJSeHcW/TzTZOgkI2DDt+0qQpq6vRGZaV+3FE+Ht5lnoAl
 8OOo7TRFQR3iZD+DsilDmfqwlJs6GVUiUo0Xfmeb3lJKjfbNFyT30ntxoJUQa8x7oqmM
 KXlqHlQJq6GQNGtyuf7gLe6Q8wM94o4hqFyuzV1+U3zzaxxzIva09J6g1RQie4Fx9x/4
 YxNzmUJCXEFFmK5MwCGE35O/QuKpm4PViUjvBdC6oLp3Amcqqoj8D/PB3lHPbJa//R3c
 rgGg==
X-Gm-Message-State: AOAM5324FqQtYwy++YXs/jkTaB0o9Qgku8jnb2EvZPaUYbJGTROE/5dX
 OEx0quHEhrB19LeyU4e8XJrrbr9YGCg=
X-Google-Smtp-Source: ABdhPJxW1jlZvwa9CaxhVXwWI/9uEiydyU2itHORIgIsLFlWGYPim7sMBRr84NJPF32hf0Y81lrtPw==
X-Received: by 2002:a05:600c:4fcb:: with SMTP id
 o11mr10893805wmq.88.1613325715239; 
 Sun, 14 Feb 2021 10:01:55 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w3sm9097130wrr.62.2021.02.14.10.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
Date: Sun, 14 Feb 2021 18:59:02 +0100
Message-Id: <20210214175912.732946-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a Docker image providing cross toolchain for the MIPS R5900 CPU
(used on the Sony PS2).

This image is based on Gentoo and the toolchain is built using crossdev.

Recipe from:
  https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03944.html

Suggested-by: Fredrik Noring <noring@nocrew.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/Makefile.include                 |  3 ++
 .../gentoo-mipsr5900el-cross.docker           | 35 +++++++++++++++++++
 .../crossdev.conf                             |  5 +++
 3 files changed, 43 insertions(+)
 create mode 100644 tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker
 create mode 100644 tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 93b29ad823e..3d6306c7728 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -146,6 +146,9 @@ docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
+docker-image-gentoo-mipsr5900el-cross: EXTRA_FILES:=$(addprefix \
+			$(SRC_PATH)/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/,\
+				crossdev.conf)
 
 docker-image-travis: NOUSER=1
 
diff --git a/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker
new file mode 100644
index 00000000000..88ada20623d
--- /dev/null
+++ b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker
@@ -0,0 +1,35 @@
+#
+# Docker mipsel (r5900) cross-compiler target
+#
+# Using multi-stage builds, this image requires docker-17.05.0 or later.
+# (See: https://github.com/gentoo/gentoo-docker-images)
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# name the portage image
+FROM gentoo/portage:20201121 as portage
+
+# image is based on stage3-amd64
+FROM gentoo/stage3:latest
+
+# copy the entire portage volume in
+COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
+
+MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
+
+# set CROSSDEV_OVERLAY to /usr/local/portage-crossdev
+RUN mkdir -p /usr/local/portage-crossdev/{profiles,metadata} && \
+    echo 'crossdev' > /usr/local/portage-crossdev/profiles/repo_name && \
+    echo 'masters = gentoo' > /usr/local/portage-crossdev/metadata/layout.conf && \
+    chown -R portage:portage /usr/local/portage-crossdev && \
+    mkdir -p /etc/portage/repos.conf
+ADD crossdev.conf /etc/portage/repos.conf/crossdev.conf
+
+RUN emerge -qv \
+        dev-vcs/git ">=dev-libs/glib-2.0" \
+        sys-devel/crossdev \
+        sys-libs/zlib dev-lang/python
+
+RUN crossdev -s4 -t mipsr5900el-unknown-linux-gnu
+
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=mipsr5900el-unknown-linux-gnu-
diff --git a/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
new file mode 100644
index 00000000000..b8fa368c1c3
--- /dev/null
+++ b/tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
@@ -0,0 +1,5 @@
+[crossdev]
+location = /usr/local/portage-crossdev
+priority = 10
+masters = gentoo
+auto-sync = no
-- 
2.26.2


