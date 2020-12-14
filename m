Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA02D9BAF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:04:33 +0100 (CET)
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqKv-0005uV-2N
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEc-0007vg-Bh; Mon, 14 Dec 2020 10:58:02 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:43647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEV-0001RE-68; Mon, 14 Dec 2020 10:58:02 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MkHIV-1kQFuO2XXt-00kgdi; Mon, 14 Dec 2020 16:57:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] configure / meson: Move check for pty.h to meson.build
Date: Mon, 14 Dec 2020 16:57:29 +0100
Message-Id: <20201214155733.207430-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z7y1afgEAePsEXgHdGk4OgPZ/fUlYM1E1J6zgKXB7HE0RpjQb6z
 UdGMV2EHLvbuN4DZjpYbF62K7XDRucJMewH0AkKuno4DmfaaWbQa7H9JO6DyukxsjX8mO9d
 +EGCTanChivGOM+XLBGJWf95g7OzQ+SZGopXxykffxKCt1lWxEnmhK7WF51+GX7pMhdyqKd
 KCuUYXs426JHLBJCtld5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gKf0OaDty2A=:mwFre4kswu0Dkl7ZS1wL+g
 WtWTlnIb4SHusORQfISvl9COCLicd7iY3fu2NuHw9y3CQHEaUgzbuOMplsaEl+cQlpfoyyUNC
 qiHQBFWKmvbDcsf3HbmAccNuWxYA77rZSgO9eNjjr9Epyqfljp7wZbm0qQhtfVQ40TgrG7G+Y
 KhBN4xHTecUR5RicniS6QPiNrURjXZ/gSRLgIb/SxDiznnRzvbCdZfZMO8aE6uvOAPTEUgZNI
 kEwD9aw1Brw9zw3Jv62r0skjTQlo69DNYq7Sh+aeAfu97Xn4wPxw9rcX+HjaSh3oIo3KNWnB5
 2m/QFI+AYtntJDenXgSC40+JgGXEWLKBpV4Y9VZ8LNMcPsXAiApctGil16uqyV1NShxSHdkC3
 n/eL8n6dvbv+84ao6ANiPJGniuX+0jxHnv/BNdqrw4+DbP2uOG87ZbTPnCBegB3L+c/rgudbT
 l4lPJ8yhVA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Message-Id: <20201118171052.308191-3-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure   | 9 ---------
 meson.build | 1 +
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/configure b/configure
index 1df5c848110e..39e61b275806 100755
--- a/configure
+++ b/configure
@@ -2332,12 +2332,6 @@ else
   l2tpv3=no
 fi
 
-if check_include "pty.h" ; then
-  pty_h=yes
-else
-  pty_h=no
-fi
-
 cat > $TMPC <<EOF
 #include <sys/mman.h>
 int main(int argc, char *argv[]) {
@@ -6687,9 +6681,6 @@ if test "$sheepdog" = "yes" ; then
   add_to deprecated_features "sheepdog"
   echo "CONFIG_SHEEPDOG=y" >> $config_host_mak
 fi
-if test "$pty_h" = "yes" ; then
-  echo "HAVE_PTY_H=y" >> $config_host_mak
-fi
 if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index f344b25955f9..ef053c98376d 100644
--- a/meson.build
+++ b/meson.build
@@ -836,6 +836,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
-- 
2.29.2


