Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7B380930
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:10:00 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWdj-0008IJ-PE
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWYd-0004wS-4C
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWYb-00068x-9V
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620993880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TH9TnKRuETbiJF5vf8an/izkft9YN7Yj8z+Fk/KpytQ=;
 b=EL1OOr2BH52enBWmCSyv+YDz9x2huo3L+waPo0qSdjQhqZ2szN6sv5I2AhkKVYQ1kDkfdg
 4O4yChsDcucArr3icm1tUzclxj8atyRWyUOtczCxb1iLEgNBVsCqHJbjfij641btvINGkj
 Bwutqgwclf/+OTv610n7QHzWrlr9WDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-C5jBiChbMoyVqqhuHTnXlA-1; Fri, 14 May 2021 08:04:37 -0400
X-MC-Unique: C5jBiChbMoyVqqhuHTnXlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8891854E2A;
 Fri, 14 May 2021 12:04:36 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E93E19C59;
 Fri, 14 May 2021 12:04:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] crypto: bump min nettle to 3.4,
 dropping RHEL-7 support
Date: Fri, 14 May 2021 13:04:06 +0100
Message-Id: <20210514120415.1368922-4-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-1-berrange@redhat.com>
References: <20210514120415.1368922-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
target. This lets us increment the minimum required nettle version and
drop a lot of backwards compatibility code for 2.x series of nettle.

Per repology, current shipping versions are:

             RHEL-8: 3.4.1
      Debian Buster: 3.4.1
 openSUSE Leap 15.2: 3.4.1
   Ubuntu LTS 18.04: 3.4
   Ubuntu LTS 20.04: 3.5.1
            FreeBSD: 3.7.2
          Fedora 33: 3.5.1
          Fedora 34: 3.7.2
            OpenBSD: 3.7.2
     macOS HomeBrew: 3.7.2

Ubuntu LTS 18.04 has the oldest version and so 3.4 is the new minimum.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml             | 10 ----------
 configure                  |  4 +---
 crypto/cipher-nettle.c.inc | 31 -------------------------------
 crypto/hash-nettle.c       |  4 ----
 crypto/hmac-nettle.c       |  4 ----
 5 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 726450a46d..f012b16b79 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -707,16 +707,6 @@ build-coroutine-sigaltstack:
 #
 # These jobs test old gcrypt and nettle from RHEL7
 # which had some API differences.
-crypto-old-nettle:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    TARGETS: x86_64-softmmu x86_64-linux-user
-    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
-    MAKE_CHECK_ARGS: check
-
 crypto-old-gcrypt:
   <<: *native_build_job_definition
   needs:
diff --git a/configure b/configure
index 6fea3210bd..050299290d 100755
--- a/configure
+++ b/configure
@@ -2860,10 +2860,9 @@ has_libgcrypt() {
 
 if test "$nettle" != "no"; then
     pass="no"
-    if $pkg_config --exists "nettle >= 2.7.1"; then
+    if $pkg_config --exists "nettle >= 3.4"; then
         nettle_cflags=$($pkg_config --cflags nettle)
         nettle_libs=$($pkg_config --libs nettle)
-        nettle_version=$($pkg_config --modversion nettle)
         # Link test to make sure the given libraries work (e.g for static).
         write_c_skeleton
         if compile_prog "" "$nettle_libs" ; then
@@ -5731,7 +5730,6 @@ if test "$gcrypt" = "yes" ; then
 fi
 if test "$nettle" = "yes" ; then
   echo "CONFIG_NETTLE=y" >> $config_host_mak
-  echo "CONFIG_NETTLE_VERSION_MAJOR=${nettle_version%%.*}" >> $config_host_mak
   echo "NETTLE_CFLAGS=$nettle_cflags" >> $config_host_mak
   echo "NETTLE_LIBS=$nettle_libs" >> $config_host_mak
 fi
diff --git a/crypto/cipher-nettle.c.inc b/crypto/cipher-nettle.c.inc
index cac771e4ff..490472656c 100644
--- a/crypto/cipher-nettle.c.inc
+++ b/crypto/cipher-nettle.c.inc
@@ -39,41 +39,10 @@ typedef void (*QCryptoCipherNettleFuncWrapper)(const void *ctx,
                                                uint8_t *dst,
                                                const uint8_t *src);
 
-#if CONFIG_NETTLE_VERSION_MAJOR < 3
-typedef nettle_crypt_func * QCryptoCipherNettleFuncNative;
-typedef void *       cipher_ctx_t;
-typedef unsigned     cipher_length_t;
-#define CONST_CTX
-
-#define cast5_set_key cast128_set_key
-
-#define aes128_ctx aes_ctx
-#define aes192_ctx aes_ctx
-#define aes256_ctx aes_ctx
-#define aes128_set_encrypt_key(c, k) \
-    aes_set_encrypt_key(c, 16, k)
-#define aes192_set_encrypt_key(c, k) \
-    aes_set_encrypt_key(c, 24, k)
-#define aes256_set_encrypt_key(c, k) \
-    aes_set_encrypt_key(c, 32, k)
-#define aes128_set_decrypt_key(c, k) \
-    aes_set_decrypt_key(c, 16, k)
-#define aes192_set_decrypt_key(c, k) \
-    aes_set_decrypt_key(c, 24, k)
-#define aes256_set_decrypt_key(c, k) \
-    aes_set_decrypt_key(c, 32, k)
-#define aes128_encrypt aes_encrypt
-#define aes192_encrypt aes_encrypt
-#define aes256_encrypt aes_encrypt
-#define aes128_decrypt aes_decrypt
-#define aes192_decrypt aes_decrypt
-#define aes256_decrypt aes_decrypt
-#else
 typedef nettle_cipher_func * QCryptoCipherNettleFuncNative;
 typedef const void * cipher_ctx_t;
 typedef size_t       cipher_length_t;
 #define CONST_CTX    const
-#endif
 
 static inline bool qcrypto_length_check(size_t len, size_t blocksize,
                                         Error **errp)
diff --git a/crypto/hash-nettle.c b/crypto/hash-nettle.c
index 2a6ee7c7d5..5c8977fb80 100644
--- a/crypto/hash-nettle.c
+++ b/crypto/hash-nettle.c
@@ -26,11 +26,7 @@
 #include <nettle/sha.h>
 #include <nettle/ripemd160.h>
 
-#if CONFIG_NETTLE_VERSION_MAJOR < 3
-typedef unsigned int     hash_length_t;
-#else
 typedef size_t       hash_length_t;
-#endif
 
 typedef void (*qcrypto_nettle_init)(void *ctx);
 typedef void (*qcrypto_nettle_write)(void *ctx,
diff --git a/crypto/hmac-nettle.c b/crypto/hmac-nettle.c
index 1152b741fd..da6b6fa014 100644
--- a/crypto/hmac-nettle.c
+++ b/crypto/hmac-nettle.c
@@ -18,11 +18,7 @@
 #include "hmacpriv.h"
 #include <nettle/hmac.h>
 
-#if CONFIG_NETTLE_VERSION_MAJOR < 3
-typedef unsigned int hmac_length_t;
-#else
 typedef size_t hmac_length_t;
-#endif
 
 typedef void (*qcrypto_nettle_hmac_setkey)(void *ctx,
                                            hmac_length_t key_length,
-- 
2.31.1


