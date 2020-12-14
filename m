Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D122D9BD1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:08:24 +0100 (CET)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqOe-0003YU-0L
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEd-0007vs-D7; Mon, 14 Dec 2020 10:58:03 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:60839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEV-0001RJ-5E; Mon, 14 Dec 2020 10:58:03 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MTiLj-1kgxqV14Yf-00Tz8M; Mon, 14 Dec 2020 16:57:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] configure / meson: Move check for drm.h to meson.build
Date: Mon, 14 Dec 2020 16:57:30 +0100
Message-Id: <20201214155733.207430-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UvWVOTuKr20VfvZJVASlkISSmLvGBtnXcwPv3Dlyxw9oWILiQxZ
 rCDz1ICJgU2IyJzQATYqcynDP3wD2Bk9nBd7K7lh5wZ6VpAFhYwKCiQDxkXI58q22qgz0Xj
 MbzWj8xWE6s4Mf3zKxgelsVSQF4ZL/y6rZ1HFsfvMdcQVR00XwsxJ15pa3ae5muw+putUSV
 xMTg9uTXZ6Hqh4nMX7A9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wPZGeL3OaBc=:u/US9yroeaHwdgIarmQ9Gy
 u/WuDnnHNSDBQjYuJz4N7Vaxmdlo/KM6IS8wOCJbCykSg/kJWFuvlIWsCxt/Tu4p+2teiLkfR
 obBeWrJwcZ6K60PfAnI/8yaUy7AepJc8X6ndSvSpxbadZUCjVUzMQ/ONLrS/KyGUEtSu8uBOm
 1epEGibAM6DDK4tY9QS/nH/+resIDrYelgnQu4D4pYP4zms6Tt69l9kGx/w7e7s08mR5rbbNq
 GsMeAv77/aq2rEN7Ne9gjxH3i1bcbu2nFt1twsMImYZuQC7mKZ5SN9OXHxC2sBS4Yb65Y/C1F
 91cP+sMPBm97UmMKUdp6h9IukoS3yD0DvcQIETyrLI6Ux3VhOtwXtwTB+Qm0ffoNBOO8UHhF7
 MQL9phDBtrqae/KbmZbb3tcR2050zvtUTR+SYzNPKlyh+glkn3/+yoSBF6tZIFvizwK4/baJk
 5TipyMw30g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This check can be done in a much shorter way in meson.build

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201118171052.308191-4-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure   | 10 ----------
 meson.build |  1 +
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/configure b/configure
index 39e61b275806..ec2fae9e09c0 100755
--- a/configure
+++ b/configure
@@ -3101,13 +3101,6 @@ EOF
     fi
 fi
 
-#########################################
-# libdrm check
-have_drm_h=no
-if check_include "libdrm/drm.h" ; then
-    have_drm_h=yes
-fi
-
 #########################################
 # sys/signal.h check
 have_sys_signal_h=no
@@ -6205,9 +6198,6 @@ fi
 if test "$auth_pam" = "yes" ; then
     echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
 fi
-if test "$have_drm_h" = "yes" ; then
-  echo "HAVE_DRM_H=y" >> $config_host_mak
-fi
 if test "$have_broken_size_max" = "yes" ; then
     echo "HAVE_BROKEN_SIZE_MAX=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index ef053c98376d..fc7ae6f86826 100644
--- a/meson.build
+++ b/meson.build
@@ -836,6 +836,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 
-- 
2.29.2


