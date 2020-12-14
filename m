Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074B2D9BB2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:05:49 +0100 (CET)
Received: from localhost ([::1]:54428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqM8-0006eO-IP
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEb-0007tZ-5m; Mon, 14 Dec 2020 10:58:01 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:35923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEV-0001R5-5a; Mon, 14 Dec 2020 10:58:00 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MA7Om-1kzJXq3txS-00Bd4P; Mon, 14 Dec 2020 16:57:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/19] configure: Remove the obsolete check for ifaddrs.h
Date: Mon, 14 Dec 2020 16:57:28 +0100
Message-Id: <20201214155733.207430-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VDIPxspJMjUdPxEUny6PSSgzD8QmGgFfhzoxQzMGVlDMH7Z7ci/
 RyJIZ7jAakG3u7+LIBp/b++k0CMIkui9FmdCfN5Mw9BiiJY7o8AspAhSxEU92COPE3uBueM
 5inLU88TFKIoHYFWmi1T1zTDBKgLq9k6lBen1T+s7jW2XKbF5aD5RgmlDJxRx6buNzX1I5J
 akMzdaKQixG1Y0x1TglBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:orRhYCUt9kc=:aoOp9bHKtb4xgNO1pK9uvs
 Bpwuk8bYU1WM7Xt4sTP9ItRvqvy8qjzosAAuhOVm0K9v4gmN1+aH8QJ7ewPErhiPzo0u0zypT
 XhiToJQYyvYu1sC1FmsW4SDmwm7OjcqpzRGQUN5H23hAcvJp7dYA8N2VzfVXMbctiNYxWqJtH
 ZNlCOAoOv7iVQcg4CElEsYQdSsV9yFjS8szh/w64tbS3Y7HHCPUopC5X2Fs1X81RcEH3awpm4
 D5LfzYgVka294kGaEJHs30hO1A8Mr0J69TuxE8ZAY2htcDul1ui7BT1u1Cu7Z3B1bnXZz05hp
 Ijn2ohYofwS8Ce7zzXsnasG2YJ93R8VBhKzHVnve/bDT2EriWpHyXNMgLvQzlhi7zIQBIcwR1
 ttYzRPqLWyoIHb6d9NRZXAp4l6mkWRbS5PKIGSjTkrFsJSz3dqOMahFI3DWQ/0mxqPj5dw5ND
 HcTZSNcK3w==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The code that used HAVE_IFADDRS_H has been removed in commit
0a27af918b ("io: use bind() to check for IPv4/6 availability"),
so we don't need this check in the configure script anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201118171052.308191-2-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure b/configure
index c20ed86ff35b..1df5c848110e 100755
--- a/configure
+++ b/configure
@@ -3107,14 +3107,6 @@ EOF
     fi
 fi
 
-##########################################
-# getifaddrs (for tests/test-io-channel-socket )
-
-have_ifaddrs_h=yes
-if ! check_include "ifaddrs.h" ; then
-  have_ifaddrs_h=no
-fi
-
 #########################################
 # libdrm check
 have_drm_h=no
@@ -6219,9 +6211,6 @@ fi
 if test "$auth_pam" = "yes" ; then
     echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
 fi
-if test "$have_ifaddrs_h" = "yes" ; then
-    echo "HAVE_IFADDRS_H=y" >> $config_host_mak
-fi
 if test "$have_drm_h" = "yes" ; then
   echo "HAVE_DRM_H=y" >> $config_host_mak
 fi
-- 
2.29.2


