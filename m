Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF473BC99A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:24:44 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iFv-0003GJ-S0
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hty-000165-RE
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htw-0002Nv-HR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id a13so25330166wrf.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHXNM04uxEiAbDswn208ExLFOlINybso2tUyXQRPesg=;
 b=alee1nSCNGW/u0vrPRRfiaOWa0qocXdtarL/+MvGhUHRL8kvhsK0Ap29V/iA0YxWdL
 q6UWEu3UezK1YPqohtULuK5dqstvrtkQh8BDjcBe0sXs1sIHqhrlqByFof+ZHUtH3kbA
 ToFdVnU+xBT8MXhucfPfITmt5RiYCVscZZtPsAnvjveRwgZ4Lo8pO9V0dab01fjIRyxq
 UmcYtSkFP+2ODYplujasTXoapA9201xx7BmBEvQzQU9k3oCVo0IvqsjJFNaJ0duQBj9Q
 IPcSK1ZJhttVGawBeZjSLJAsVmtU/yrrMDlje9/6X1+eP2vtOy0Zdhz2ycchc1OGglhJ
 WZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sHXNM04uxEiAbDswn208ExLFOlINybso2tUyXQRPesg=;
 b=kIOIlQGh5LwzkTcTWUvSMFPN1P601ZfF1eiyMeXFaOv4RZM+/1C4agIKc20Z9BEj3v
 AhnvxFoSMNgryms3K576um1ndB2lCQkQfW54jkT0fLgsffEKAViH//HWKY0TaQbMAUT4
 jHMFZM1/Q6NIt7c4oIlqBPSUM9AG6siX8FINGP2rwJWFpObQsgB5kSlO41OZ8BIUAEmD
 Td4a63SRiBmdx0db+rB0f2yKbL7H+fJ8K3PDvA5RyLdRxmHpVnsI1rh9PaKF9HT1xier
 9kYS8DPsMgHtjldSZnEGQwKVvq/mfT/cmULrDbOf5pwvnXTcFNUH+nL3POR0FChcXIU/
 ufng==
X-Gm-Message-State: AOAM533xG1wtCB50Rusq7bDS2Q2FJ4hrIa2nJA2Gi79Y3eHYHX3co10G
 oSI23bv53FHU2oD4CcLcBGNjB+GDhsM=
X-Google-Smtp-Source: ABdhPJw4Bb0zkwbbLqEA7aeJrms6U+RgpZNEpZm7CuQePQrmW9rOaAhKuLQIdrXDcs2K/deW5jkzYQ==
X-Received: by 2002:a05:6000:18ca:: with SMTP id
 w10mr20339037wrq.55.1625565719194; 
 Tue, 06 Jul 2021 03:01:59 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/40] configure, meson: move CONFIG_IVSHMEM to meson
Date: Tue,  6 Jul 2021 12:01:26 +0200
Message-Id: <20210706100141.303960-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a duplicate of CONFIG_EVENTFD, handle it directly in meson.build.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 8 --------
 docs/devel/kconfig.rst | 2 +-
 meson.build            | 5 +++--
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 341b74dd5e..a524104120 100755
--- a/configure
+++ b/configure
@@ -5037,11 +5037,6 @@ if test "$mingw32" = "yes" ; then
     done
 fi
 
-# We can only support ivshmem if we have eventfd
-if [ "$eventfd" = "yes" ]; then
-  ivshmem=yes
-fi
-
 # Probe for guest agent support/options
 
 if [ "$guest_agent" != "no" ]; then
@@ -5639,9 +5634,6 @@ fi
 if test "$have_getrandom" = "yes" ; then
   echo "CONFIG_GETRANDOM=y" >> $config_host_mak
 fi
-if test "$ivshmem" = "yes" ; then
-  echo "CONFIG_IVSHMEM=y" >> $config_host_mak
-fi
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index cb2d7ffac0..a1cdbec751 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -303,5 +303,5 @@ variable::
     host_kconfig = \
       ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
       ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
-      ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
+      (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
       ...
diff --git a/meson.build b/meson.build
index e288e4c21c..b5dcc3d70e 100644
--- a/meson.build
+++ b/meson.build
@@ -1335,10 +1335,11 @@ if link_language == 'cpp'
   }
 endif
 
+have_ivshmem = config_host.has_key('CONFIG_EVENTFD')
 host_kconfig = \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
-  ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
+  (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
@@ -2489,7 +2490,7 @@ if have_tools
                install: true)
   endif
 
-  if 'CONFIG_IVSHMEM' in config_host
+  if have_ivshmem
     subdir('contrib/ivshmem-client')
     subdir('contrib/ivshmem-server')
   endif
-- 
2.31.1



