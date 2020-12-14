Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599942D9BD0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:08:15 +0100 (CET)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqOU-0003Lq-50
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEh-00080x-8z; Mon, 14 Dec 2020 10:58:07 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:50781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEX-0001Rp-4q; Mon, 14 Dec 2020 10:58:07 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MjSDU-1kPynE3hs2-00kxt7; Mon, 14 Dec 2020 16:57:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/19] configure / meson: Move check for sys/signal.h to
 meson.build
Date: Mon, 14 Dec 2020 16:57:31 +0100
Message-Id: <20201214155733.207430-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U+sLFcYb/yAKwqzvYeU0betj4us0/md4m36iyOZmM02GhP7r+oR
 pkFf+88GHVvpRsYLOBes7/LFwr7LntVE4WIHxhNtt3vZJb5zOWDSYDRs0NbOabunNxY+aDc
 SLmfj47hh18E/x5T2/a2fQe9nIBWHO+yrSA+v+I3oH3rfI01U1vR0REZLii5gFgY4emWH8b
 aYkAH1tB7JwvrlXMl3Ytg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gVEz/gI4gcg=:Z5iptEpOJN1HMNMi25bLz6
 GtjUr7iPSsZeWGrGeG9JqTICuz7QlQCmSnjMSf8gZrcou3+59h4aPZLmqFfO6BjDw9cbqDM3Y
 F0apfGrAZAf+SwCQ+ojFIwYKhmtgjVYEeyxt9FZPIMsi4nHzmXjVVKGGFFHuNn/dX1gqulxsh
 GPbSjmlOX0NZMXU3vGfmnOYiOKuDivPjvY0S0wS55mzUKfexRvz20aG8O6NhLfyyqoRLt+enz
 3p45kmTOrLIyl08Qw9nsCSz8cnCdxX8LVW/CsIZoUwLgmdLKl18WZsOpCefL7WcZyZGvLHAb+
 5fue/hRU6qILWOMsOrP5jLLYjfMizMItgk64kKRs0lcz8sv6mE1AVPyQMP1k38XAbGF36YF6C
 CZed3sI8knPV+/j1BfVXLGI/gXI8mlbJvKxfdTyGUMTA1wkSHEp7b2rjHCWcLWc0oTY8/cgDb
 8tPApq4isw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Message-Id: <20201118171052.308191-5-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure   | 10 ----------
 meson.build |  1 +
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/configure b/configure
index ec2fae9e09c0..4f0f9c99d3d2 100755
--- a/configure
+++ b/configure
@@ -3101,13 +3101,6 @@ EOF
     fi
 fi
 
-#########################################
-# sys/signal.h check
-have_sys_signal_h=no
-if check_include "sys/signal.h" ; then
-  have_sys_signal_h=yes
-fi
-
 ##########################################
 # VTE probe
 
@@ -6204,9 +6197,6 @@ fi
 if test "$have_openpty" = "yes" ; then
     echo "HAVE_OPENPTY=y" >> $config_host_mak
 fi
-if test "$have_sys_signal_h" = "yes" ; then
-    echo "HAVE_SYS_SIGNAL_H=y" >> $config_host_mak
-fi
 
 # Work around a system header bug with some kernel/XFS header
 # versions where they both try to define 'struct fsxattr':
diff --git a/meson.build b/meson.build
index fc7ae6f86826..a790cc527cf9 100644
--- a/meson.build
+++ b/meson.build
@@ -839,6 +839,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
+config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-- 
2.29.2


