Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21786A6D0E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMZ0-00028S-UY; Wed, 01 Mar 2023 08:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pXMYl-00020n-WF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pXMYg-0004cY-PR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677677509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nC69pigVc9e/BUhGQDukrEJzPKjpoGjkSCexA4b152M=;
 b=F/WhS3RrIK2BoL7u+F2CAjvJa54NMJhrTqmb52h5W1NCo2WWDQo7XFlOB5k0EngTCBSbkU
 H6kZhKc4EsN8LLqYlZCkyyVFuBjRDMJnJ5+xcS/r4aBJ5ivzx94aOh2kMaz/MgSgXcpRsz
 ApizsmXQbB9No/PGj7K1baspWmfRklY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-vdYTECXDNB-AY2Sr9lzr1Q-1; Wed, 01 Mar 2023 08:31:48 -0500
X-MC-Unique: vdYTECXDNB-AY2Sr9lzr1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACCF185A78B;
 Wed,  1 Mar 2023 13:31:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8B92026D76;
 Wed,  1 Mar 2023 13:31:46 +0000 (UTC)
Date: Wed, 1 Mar 2023 14:31:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] configure: Disable thread-safety warnings on macOS
Message-ID: <Y/9TwfYFEsVeZKTr@redhat.com>
References: <20230301113425.286946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301113425.286946-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 01.03.2023 um 12:34 hat Thomas Huth geschrieben:
> The enablement of -Wthread-safety broke compilation on macOS (if
> -Werror is enabled, like in our CI). Disable it there by default
> until the problems are resolved.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

This is simpler than what I attempted (test compiling something using
the same TSA features as the failing code), but didn't actually work.
Since I don't have access to macOS, it's hard for me to improve the
configure test. So I'm fine with just doing this instead.

Acked-by: Kevin Wolf <kwolf@redhat.com>

For reference, below my failed alternative attempt at a configure patch,
which somehow still enabled TSA on macOS and therefore still fails to
build.

Kevin


diff --git a/configure b/configure
index 2a8a9be8a1..970ee31889 100755
--- a/configure
+++ b/configure
@@ -228,6 +228,7 @@ cross_prefix=""
 host_cc="cc"
 stack_protector=""
 safe_stack=""
+tsa=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")

@@ -854,6 +855,10 @@ for opt do
   ;;
   --disable-safe-stack) safe_stack="no"
   ;;
+  --enable-tsa) tsa="yes"
+  ;;
+  --disable-tsa) tsa="no"
+  ;;
   --enable-cfi)
       cfi="true";
       meson_option_add -Db_lto=true
@@ -1023,6 +1028,7 @@ Advanced options (experts only):
   --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
+  --enable-tsa             enable TSA (Thread Safety Analysis)
   --enable-tsan            enable thread sanitizer
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
@@ -1230,7 +1236,6 @@ add_to warn_flags -Wendif-labels
 add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
 add_to warn_flags -Wmissing-format-attribute
-add_to warn_flags -Wthread-safety

 nowarn_flags=
 add_to nowarn_flags -Wno-initializer-overrides
@@ -1308,6 +1313,28 @@ EOF
   fi
 fi

+if test "$tsa" != "no"; then
+  cat > $TMPC << EOF
+typedef int __attribute__((capability("mutex"))) Lock;
+Lock lock;
+static void __attribute__((assert_capability(lock))) assert_lock(void) {}
+static void __attribute__((requires_capability(lock))) require_lock(void) {}
+int main(void)
+{
+    assert_lock();
+    require_lock();
+    return 0;
+}
+EOF
+  flag="-Wthread-safety"
+  if compile_object "-Werror $flag"; then
+    QEMU_CFLAGS="$QEMU_CFLAGS $flag"
+    tsa="yes"
+  elif test "$tsa" = yes; then
+    error_exit "Thread Safety Analysis not supported"
+  fi
+fi
+
 # Our module code doesn't support Windows
 if test "$modules" = "yes" && test "$mingw32" = "yes" ; then
   error_exit "Modules are not available for Windows"
@@ -2378,6 +2405,9 @@ if test "$have_asan_iface_fiber" = "yes" ; then
     echo "CONFIG_ASAN_IFACE_FIBER=y" >> $config_host_mak
 fi

+if test "$tsa" = "yes"; then
+    echo "CONFIG_TSA=y" >> $config_host_mak
+fi
 if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
     echo "CONFIG_TSAN=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 77d2ae87e4..a793eaacc5 100644
--- a/meson.build
+++ b/meson.build
@@ -3842,6 +3842,7 @@ else
 endif
 summary_info += {'gprof':             gprof_info}
 summary_info += {'gcov':              get_option('b_coverage')}
+summary_info += {'thread safety analysis (TSA)': config_host.has_key('CONFIG_TSA')}
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'CFI support':       get_option('cfi')}
 if get_option('cfi')


