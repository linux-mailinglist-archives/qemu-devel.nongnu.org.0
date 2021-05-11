Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4337A799
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:30:44 +0200 (CEST)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSTD-0002Iy-Jj
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQr-0007tr-Cu
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQp-00011O-Ix
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620739694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKCoOKvp/V4b9LWXPqSP6TUaKrKrR2QI86JsE378fZg=;
 b=GO0MujUKbiDfCoj2BkZWBKtG/ey8vGeuObBukM/52DbkSs7I+/Z7xlrN3nIIpr//avrQEH
 Sl1m46PmGJNyRztNX3Yg35zoH80bybDVfpxEcKsuNFT634M+voDBez0g2+VitKOiE2gaZu
 AJe47g+zijWHmalI0C+e4mrldNVdwV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-k9bjZnQEMi6hzrPw60MGbg-1; Tue, 11 May 2021 09:28:11 -0400
X-MC-Unique: k9bjZnQEMi6hzrPw60MGbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C4F8049D6;
 Tue, 11 May 2021 13:28:09 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0655B9CA0;
 Tue, 11 May 2021 13:28:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] crypto: bump min gcrypt to 1.7.6,
 dropping RHEL-7 support
Date: Tue, 11 May 2021 14:26:34 +0100
Message-Id: <20210511132641.1022161-6-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target. This lets us increment the minimum required gcrypt version and
assume that HMAC is always supported

Per repology, current shipping versions are:

             RHEL-8: 1.8.5
     Debian Stretch: 1.7.6
      Debian Buster: 1.8.4
 openSUSE Leap 15.2: 1.8.2
   Ubuntu LTS 18.04: 1.8.1
   Ubuntu LTS 20.04: 1.8.5
            FreeBSD: 1.9.2
          Fedora 33: 1.8.6
          Fedora 34: 1.9.3
            OpenBSD: 1.9.3
     macOS HomeBrew: 1.9.3

Debian Stretch has the oldest version and so 1.7.6 is the new minimum.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml     | 10 ----------
 configure          | 18 +-----------------
 crypto/meson.build |  6 +-----
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index aef16515d3..0fefda2674 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -716,16 +716,6 @@ build-coroutine-sigaltstack:
 #
 # These jobs test old gcrypt and nettle from RHEL7
 # which had some API differences.
-crypto-old-gcrypt:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    TARGETS: x86_64-softmmu x86_64-linux-user
-    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
-    MAKE_CHECK_ARGS: check
-
 crypto-only-gnutls:
   <<: *native_build_job_definition
   needs:
diff --git a/configure b/configure
index 53902d9c02..d5569f9252 100755
--- a/configure
+++ b/configure
@@ -426,7 +426,6 @@ gnutls="$default_feature"
 nettle="$default_feature"
 nettle_xts="no"
 gcrypt="$default_feature"
-gcrypt_hmac="no"
 gcrypt_xts="no"
 qemu_private_xts="yes"
 auth_pam="$default_feature"
@@ -2849,7 +2848,7 @@ has_libgcrypt() {
     maj=`libgcrypt-config --version | awk -F . '{print $1}'`
     min=`libgcrypt-config --version | awk -F . '{print $2}'`
 
-    if test $maj != 1 || test $min -lt 5
+    if test $maj != 1 || test $min -lt 7
     then
        return 1
     fi
@@ -2915,18 +2914,6 @@ if test "$gcrypt" != "no"; then
         gcrypt="yes"
         cat > $TMPC << EOF
 #include <gcrypt.h>
-int main(void) {
-  gcry_mac_hd_t handle;
-  gcry_mac_open(&handle, GCRY_MAC_HMAC_MD5,
-                GCRY_MAC_FLAG_SECURE, NULL);
-  return 0;
-}
-EOF
-        if compile_prog "$gcrypt_cflags" "$gcrypt_libs" ; then
-            gcrypt_hmac=yes
-        fi
-        cat > $TMPC << EOF
-#include <gcrypt.h>
 int main(void) {
   gcry_cipher_hd_t handle;
   gcry_cipher_open(&handle, GCRY_CIPHER_AES, GCRY_CIPHER_MODE_XTS, 0);
@@ -5713,9 +5700,6 @@ if test "$gnutls" = "yes" ; then
 fi
 if test "$gcrypt" = "yes" ; then
   echo "CONFIG_GCRYPT=y" >> $config_host_mak
-  if test "$gcrypt_hmac" = "yes" ; then
-    echo "CONFIG_GCRYPT_HMAC=y" >> $config_host_mak
-  fi
   echo "GCRYPT_CFLAGS=$gcrypt_cflags" >> $config_host_mak
   echo "GCRYPT_LIBS=$gcrypt_libs" >> $config_host_mak
 fi
diff --git a/crypto/meson.build b/crypto/meson.build
index 7f37b5d335..af7e80c6f6 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -26,11 +26,7 @@ if 'CONFIG_NETTLE' in config_host
   crypto_ss.add(files('hash-nettle.c', 'hmac-nettle.c', 'pbkdf-nettle.c'))
 elif 'CONFIG_GCRYPT' in config_host
   crypto_ss.add(files('hash-gcrypt.c', 'pbkdf-gcrypt.c'))
-  if 'CONFIG_GCRYPT_HMAC' in config_host
-    crypto_ss.add(files('hmac-gcrypt.c'))
-  else
-    crypto_ss.add(files('hmac-glib.c'))
-  endif
+  crypto_ss.add(files('hmac-gcrypt.c'))
 else
   crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
 endif
-- 
2.31.1


