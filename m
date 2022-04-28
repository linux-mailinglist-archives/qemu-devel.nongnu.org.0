Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F2512D10
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:36:51 +0200 (CEST)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyhm-0005hK-CZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2A-0000QC-CA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:51 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy28-00056l-KX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id kq17so7616120ejb.4
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPQYNiftf2Z/JiZej30s+Ptwf5BUJp63ZugvmeNyfg4=;
 b=M79tzIR70tUAxZUcsR3JHT7kul3bv6XsVa8zZ5DpQOWyEqgtc3DYuosZbcLZUz9VVV
 TAH4/xxMwx3OGlpjWgikcBJjG1U7m19+zAiBzI6/kZr17BsRMx+b3EgY8XR8JQUeNXyh
 kGrTMhQ3o+lGYhsNKJ9KxfFVeWvWtB63SLJHchnduYZjShcSU8asRRDrW3LDceT1uRwp
 xrgeVuQoiHR9z3axwweUa8xRennZ9FCTwo2EUf3xJK/SMKioGTWxPuPFj2Cgq/CK9R2u
 KGMo0znmvdtN2fkTeUMZf6hho1mkSIOwFZU1wT2QTXFR5oVJFYSyi5fgmEBPYz4dN8Sb
 AyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zPQYNiftf2Z/JiZej30s+Ptwf5BUJp63ZugvmeNyfg4=;
 b=qxp+vz4NyYncLt8cMdguliLJgBOhVYPjStd3S77GeKYq9wAKJRYSBBNa4t+SwXh+2i
 WXS+vvqHYN0pdXGwNhX8Qt/9d3Q+tBAmXu6eNw6ctcaBg7+kha1+JBrLZvXLkjgqSvXK
 m9Qm4Ep/9f7/XF5BEdtXd/EQ6NzTI/TKxWmkUcXFjjoJ3Tj/wsMHHZLBMgBaLiiEoiM8
 txt1l+lmg6NR160uLKcqZOxx9sglwXI4gULsd0P7au3+G6SEU2oSdNHh91VfU/TJBPeO
 NtWj6imlP+gtdpDV0BWxpccz83ddfdSUyuCaemt2YDWIw4SbY4d5koGGmhXC2zU2dH6U
 16bA==
X-Gm-Message-State: AOAM531qjRGC/lAdF303Yif66UfLjfubqt5kHKhuws812PBJRN+V+Eop
 tXReZU7yNy3tNNVrLiKLgvAwAfWwhrPwtw==
X-Google-Smtp-Source: ABdhPJyCvzUHmWEjb+K1WUKJ4LiSCSZMa5NRf+gPgjYmfzMate1uN9VUfWxVWdRUhcElOxFpXH584g==
X-Received: by 2002:a17:907:c02:b0:6df:fb64:2770 with SMTP id
 ga2-20020a1709070c0200b006dffb642770mr31638325ejc.221.1651128827262; 
 Wed, 27 Apr 2022 23:53:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] meson, configure: move keyctl test to meson
Date: Thu, 28 Apr 2022 08:53:30 +0200
Message-Id: <20220428065335.189795-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 44 -----------------------------------
 crypto/meson.build            |  4 +++-
 meson.build                   | 15 +++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/configure b/configure
index 4deca94235..313579019d 100755
--- a/configure
+++ b/configure
@@ -322,7 +322,6 @@ trace_file="trace"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
-secret_keyring="$default_feature"
 meson=""
 meson_args=""
 ninja=""
@@ -1009,10 +1008,6 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
-  --enable-keyring) secret_keyring="yes"
-  ;;
-  --disable-keyring) secret_keyring="no"
-  ;;
   --enable-gio) gio=yes
   ;;
   --disable-gio) gio=no
@@ -2440,41 +2435,6 @@ case "$slirp" in
     ;;
 esac
 
-##########################################
-# check for usable __NR_keyctl syscall
-
-if test "$linux" = "yes" ; then
-
-    have_keyring=no
-    cat > $TMPC << EOF
-#include <errno.h>
-#include <asm/unistd.h>
-#include <linux/keyctl.h>
-#include <unistd.h>
-int main(void) {
-    return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
-}
-EOF
-    if compile_prog "" "" ; then
-        have_keyring=yes
-    fi
-fi
-if test "$secret_keyring" != "no"
-then
-    if test "$have_keyring" = "yes"
-    then
-	secret_keyring=yes
-    else
-	if test "$secret_keyring" = "yes"
-	then
-	    error_exit "syscall __NR_keyctl requested, \
-but not implemented on your system"
-	else
-	    secret_keyring=no
-	fi
-    fi
-fi
-
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2760,10 +2720,6 @@ if test -n "$gdb_bin"; then
     fi
 fi
 
-if test "$secret_keyring" = "yes" ; then
-  echo "CONFIG_SECRET_KEYRING=y" >> $config_host_mak
-fi
-
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/crypto/meson.build b/crypto/meson.build
index 19c44bea89..f065f2f277 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -34,7 +34,9 @@ else
   crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
 endif
 
-crypto_ss.add(when: 'CONFIG_SECRET_KEYRING', if_true: files('secret_keyring.c'))
+if have_keyring
+  crypto_ss.add(files('secret_keyring.c'))
+endif
 if have_afalg
   crypto_ss.add(if_true: files('afalg.c', 'cipher-afalg.c', 'hash-afalg.c'))
 endif
diff --git a/meson.build b/meson.build
index 9c03436756..64161dffe7 100644
--- a/meson.build
+++ b/meson.build
@@ -1940,6 +1940,19 @@ config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
     return getauxval(AT_HWCAP) == 0;
   }'''))
 
+have_keyring = get_option('keyring') \
+  .require(targetos == 'linux', error_message: 'keyring is only available on Linux') \
+  .require(cc.compiles('''
+    #include <errno.h>
+    #include <asm/unistd.h>
+    #include <linux/keyctl.h>
+    #include <sys/syscall.h>
+    #include <unistd.h>
+    int main(void) {
+        return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
+    }'''), error_message: 'keyctl syscall not available on this system').allowed()
+config_host_data.set('CONFIG_SECRET_KEYRING', have_keyring)
+
 have_cpuid_h = cc.links('''
   #include <cpuid.h>
   int main(void) {
@@ -3698,7 +3711,7 @@ if nettle.found()
 endif
 summary_info += {'AF_ALG support':    have_afalg}
 summary_info += {'rng-none':          get_option('rng_none')}
-summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
+summary_info += {'Linux keyring':     have_keyring}
 summary(summary_info, bool_yn: true, section: 'Crypto')
 
 # Libraries
diff --git a/meson_options.txt b/meson_options.txt
index 3bdf409497..8efdd0193a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -90,6 +90,8 @@ option('avx2', type: 'feature', value: 'auto',
        description: 'AVX2 optimizations')
 option('avx512f', type: 'feature', value: 'disabled',
        description: 'AVX512F optimizations')
+option('keyring', type: 'feature', value: 'auto',
+       description: 'Linux keyring support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 838aa38df9..3ba4aaf132 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -68,6 +68,7 @@ meson_options_help() {
   printf "%s\n" '  hvf             HVF acceleration support'
   printf "%s\n" '  iconv           Font glyph conversion support'
   printf "%s\n" '  jack            JACK sound support'
+  printf "%s\n" '  keyring         Linux keyring support'
   printf "%s\n" '  kvm             KVM acceleration support'
   printf "%s\n" '  l2tpv3          l2tpv3 network backend support'
   printf "%s\n" '  libdaxctl       libdaxctl support'
@@ -229,6 +230,8 @@ _meson_option_parse() {
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
     --enable-jack) printf "%s" -Djack=enabled ;;
     --disable-jack) printf "%s" -Djack=disabled ;;
+    --enable-keyring) printf "%s" -Dkeyring=enabled ;;
+    --disable-keyring) printf "%s" -Dkeyring=disabled ;;
     --enable-kvm) printf "%s" -Dkvm=enabled ;;
     --disable-kvm) printf "%s" -Dkvm=disabled ;;
     --enable-l2tpv3) printf "%s" -Dl2tpv3=enabled ;;
-- 
2.35.1



