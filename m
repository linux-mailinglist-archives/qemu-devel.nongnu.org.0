Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067635716EC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:13:34 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCtZ-0005l6-0s
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfh-000671-4t
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:13 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfe-0001HN-JJ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a15so7027340pfv.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rJ+VyvcSydqu+4FCbS9hByiPkxhrQVr0Qvk9HN6Gx1E=;
 b=nPaqjf0f6pqR2Ge5Xj1ct/KdpT2WusjSoNFXHYsgLnd2ltGC5waFQ/BSe+/yw1kwHL
 1NRxN5SkjDhTcJpl0moiJKZXWPTYQQqXP1NJuj4QLx5qtpNpZk+tdgkV00XK9aVsKx3I
 udOQzQdLGm9m0xWoEh/s+MKl/+gmVFcnh48BgK0bCw8SgYYdGAQ7anUeA7P+wgS2+ZN1
 WNBqMeS56YUwf1tZKUl6I46jr0erLnD6Qqzjzewt05YZu7m5la061y660rfxt2p/k54+
 O3COpe53oDB9b+cgVgQwPRXyy7XTfw2EmpqhYwhEYoA0awRonFI4VU/7cW1yA1uxjEsS
 joYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJ+VyvcSydqu+4FCbS9hByiPkxhrQVr0Qvk9HN6Gx1E=;
 b=QkdrbBdU8Lm0SHt/ai8A5S3Dq3E1RhzPJy6V77liqfvLSePmAuLA1zEmEyKvGNzoM1
 +Pc3n8Bi2DnaVApivvo8FZW1FK8KCgTVu7q83wk/rq+NrR45UggmU6EjgBmSMhehzh2q
 yND6KoO6xJt8sOY+lVeulaSYIcmQMt57f2DAgoo+Im/l0GIf6s7XUyPNaTDJw/fnTh2h
 Ox+4g2ob8huYTKpxlWIGKmQZmvQYAPk1FKnW7T1sqbR7DQG4g7uGUWOmyL79xpEM4Luq
 6fiLpSEz/rsBocxOSaklXZsA4FmetQCEzebxiKjCZ2rYjsJSOdSwMOtcJxFRtYjJzSe8
 6TkQ==
X-Gm-Message-State: AJIora9sNcJ+vAhuqbNxuRd3UuxxwYFvHMk3tA9l6gpjZhgu+HGqkWwi
 bBZ9Va3N/WCYxmW1VLcNByIqzrblPgTjpdq6
X-Google-Smtp-Source: AGRyM1vZRaQvkxLxUlvYFSbAaHdKDQYft+4gMypOmQpCtMPvS1vhpgLUmrQBMfw5Y6X157ftVXl6Cw==
X-Received: by 2002:a63:9b0a:0:b0:406:8c31:47e6 with SMTP id
 r10-20020a639b0a000000b004068c3147e6mr19609759pgd.329.1657619949163; 
 Tue, 12 Jul 2022 02:59:09 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 s18-20020a170902ea1200b0016bdb5a3e37sm6348990plg.250.2022.07.12.02.59.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 02:59:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [COMMITTED 1/3] gitlab-ci/cirrus: Update freebsd to python 3.9
 packages
Date: Tue, 12 Jul 2022 15:28:59 +0530
Message-Id: <20220712095901.212353-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712095901.212353-1-richard.henderson@linaro.org>
References: <20220712095901.212353-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD has stopped shipping python 3.8, causing our cirrus
builds to fail immediately.  Upstream lcitool has an update
to address this, but has also reorganized its source tree so
additional changes are required for 'make lcitool-update'.

In the meantime, fix the build.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars | 3 ++-
 .gitlab-ci.d/cirrus/freebsd-13.vars | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index b4842271b2..f59263731f 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -1,4 +1,5 @@
 # THIS FILE WAS AUTO-GENERATED
+# ... and then edited to fix py39, pending proper lcitool update.
 #
 #  $ lcitool variables freebsd-12 qemu
 #
@@ -11,6 +12,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-virtualenv py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 546a82dd75..40fc961398 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -1,4 +1,5 @@
 # THIS FILE WAS AUTO-GENERATED
+# ... and then edited to fix py39, pending proper lcitool update.
 #
 #  $ lcitool variables freebsd-13 qemu
 #
@@ -11,6 +12,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-virtualenv py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
-- 
2.34.1


