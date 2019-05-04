Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30D139B1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 14:13:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMtXi-0004iG-RA
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 08:13:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1hMtQI-0007F6-1k
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1hMtQE-0001FN-CA
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:05:44 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1hMtQB-0001DH-OW; Sat, 04 May 2019 08:05:40 -0400
Received: by mail-oi1-x22a.google.com with SMTP id t70so6408403oif.5;
	Sat, 04 May 2019 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VaIf1nGi8yWSPl2rVwrgq2u8YFPcN84q7VRUDJ67mPk=;
	b=uZUhqVube9FIn/nOqLtisPPWqnKsG0hJL9gKJ+FWYKov5drEyE8qxOXnq8OTRuafhL
	eF2TCobdu7eed8CQgKTlL2MQIf9pVT9iJpxiSm7Gmo4GlgKTIhkyatotrXPgZvSknzap
	qRo2NPbITtDnu2uP4Sl2VQD224fAcQygt5t6Hm3yEBd599ftegboqbzx10ttg2jN+9j+
	z8Me5s4YuPf2YQI1ez2tCWvaht162CGFmkkehOf5GO9c1GsZ5E6T6wA6x4JUoiSN5HsJ
	D5/khL+01XVBq3v098Tn2UGpGgzXHdBAmh5b9d9ekUKo5eCHWq/Q+4fFVo+jDt4jgT4m
	1Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VaIf1nGi8yWSPl2rVwrgq2u8YFPcN84q7VRUDJ67mPk=;
	b=fKEecHZfQ1I6Eg/OAXBXO/mXh5E+ag/Kyo1HulOlJv0S83tNH1YcXtx5iI04kIdQfu
	ida4x1bb3TKVhMO20gHLc+COAz70Cc67outGiHCn784OxPfpJ0Q3LDfZJYpCETzUpRyU
	30Ct0O78hxYd+mDxRBGY1hZYILgmNhXYSxZ+LudvhI3De8XlscdR4muabHASjmGsbOHE
	vUqfQkgu4rEE6Fw5XPZcawfx+OugXAAU+YPDThR9H9d1GYdQpQpnYifjGrkxjKmTvdvG
	nbb4MxVl1J/9OydCBlQdkR8D5QWbK73T00k2u6OaReTW6xXUk97HNDCYiqLKB18ZA1ol
	mHmw==
X-Gm-Message-State: APjAAAWaqKOt3ozcfeMVeTfNUJXVqraV4B5imDtX71+topg94P78Iq9B
	j+CfWtxoCwr+usO7Z2oorKjSuF53
X-Google-Smtp-Source: APXvYqziEws3+tuF9GmFg7kuJtEzbHA562UxtgtWzmYTms1kV7h+SzuIzxxqKAsCS/jAseQwM5WRqw==
X-Received: by 2002:aca:4482:: with SMTP id r124mr2442181oia.39.1556971536857; 
	Sat, 04 May 2019 05:05:36 -0700 (PDT)
Received: from localhost.localdomain ([198.59.53.9])
	by smtp.gmail.com with ESMTPSA id
	s26sm1844978otk.24.2019.05.04.05.05.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 May 2019 05:05:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 May 2019 06:05:24 -0600
Message-Id: <20190504120528.6389-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504120528.6389-1-pbonzini@redhat.com>
References: <20190504120528.6389-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22a
Subject: [Qemu-devel] [PATCH 6/9] configure: add control-flow protection
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, cohuck@redhat.com, richard.henderson@linaro.org,
	qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Control-flow protection requires object files to note which features
are supported.  The linker will merge them to the set of features that
are supported by all object files.  The compiler creates these notes
when the -fcf-protection option is passed, but we have to blacklist
some object files that only support a subset of the full control-flow
protection feature set.

Even without any further host-specific patches, user-mode emulation
binaries can already use shadow stacks, because they don't need
coroutines and don't include the problematic util/coroutine-*.o
object files.  Likewise, system-mode emulation binaries will enable
indirect branch tracking if built without TCG support.

The next patches will improve the situation so that QEMU can be built
with full protection on x86 hosts.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.target    |  3 +++
 configure          | 29 +++++++++++++++++++++++++++++
 util/Makefile.objs |  5 +++++
 3 files changed, 37 insertions(+)

diff --git a/Makefile.target b/Makefile.target
index ae02495951..667682779b 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -111,6 +111,9 @@ obj-y += exec.o
 obj-y += accel/
 obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
 obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
+ifeq ($(CONFIG_CF_PROTECTION),y)
+tcg/tcg.o-cflags := -fcf-protection=return
+endif
 obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
 obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
 obj-$(CONFIG_TCG) += fpu/softfloat.o
diff --git a/configure b/configure
index 26e62a4ab1..946ff7825a 100755
--- a/configure
+++ b/configure
@@ -449,6 +449,7 @@ win_sdk="no"
 want_tools="yes"
 libiscsi=""
 libnfs=""
+cf_protection="no"      # leave it disabled until we can test performance
 coroutine=""
 coroutine_pool=""
 debug_stack_usage="no"
@@ -1267,6 +1268,10 @@ for opt do
   ;;
   --with-pkgversion=*) pkgversion="$optarg"
   ;;
+  --enable-cf-protection) cf_protection="yes"
+  ;;
+  --disable-cf-protection) cf_protection="no"
+  ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
   --disable-coroutine-pool) coroutine_pool="no"
@@ -1796,6 +1801,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   lzfse           support of lzfse compression library
                   (for reading lzfse-compressed dmg images)
   seccomp         seccomp support
+  cf-protection   Control-flow protection
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
   tpm             TPM support
@@ -5176,6 +5182,25 @@ if have_backend "dtrace"; then
   fi
 fi
 
+##########################################
+# detect Control-flow protection support in the toolchain
+
+if test "$cf_protection" != no; then
+  write_c_skeleton;
+  if ! compile_prog "-fcf-protection" "" ; then
+    if test "$cf_protection" = yes; then
+      feature_not_found "cf_protection" 'Control-flow protection is not supported by your toolchain'
+    fi
+    cf_protection=no
+  fi
+fi
+if test "$cf_protection" = ""; then
+  cf_protection=yes
+fi
+if test "$cf_protection" = "yes"; then
+  QEMU_CFLAGS="-fcf-protection $QEMU_CFLAGS"
+fi
+
 ##########################################
 # check and set a backend for coroutine
 
@@ -6361,6 +6386,7 @@ echo "netmap support    $netmap"
 echo "Linux AIO support $linux_aio"
 echo "ATTR/XATTR support $attr"
 echo "Install blobs     $blobs"
+echo "CF protection     $cf_protection"
 echo "KVM support       $kvm"
 echo "HAX support       $hax"
 echo "HVF support       $hvf"
@@ -6571,6 +6597,9 @@ fi
 if test "$profiler" = "yes" ; then
   echo "CONFIG_PROFILER=y" >> $config_host_mak
 fi
+if test "$cf_protection" = "yes" ; then
+  echo "CONFIG_CF_PROTECTION=y" >> $config_host_mak
+fi
 if test "$slirp" != "no"; then
   echo "CONFIG_SLIRP=y" >> $config_host_mak
   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
diff --git a/util/Makefile.objs b/util/Makefile.objs
index 2167ffc862..d7add70b63 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -42,6 +42,11 @@ util-obj-y += coroutine-$(CONFIG_COROUTINE_BACKEND).o
 ifeq ($(ARCH),x86_64)
 coroutine-asm.o-cflags := -mno-red-zone
 endif
+ifeq ($(CONFIG_CF_PROTECTION),y)
+coroutine-sigaltstack.o-cflags := -fcf-protection=branch
+coroutine-ucontext.o-cflags := -fcf-protection=branch
+coroutine-asm.o-cflags += -fcf-protection=branch
+endif
 util-obj-y += buffer.o
 util-obj-y += timed-average.o
 util-obj-y += base64.o
-- 
2.21.0



