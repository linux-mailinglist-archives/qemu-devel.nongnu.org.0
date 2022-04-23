Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CBC50CA6F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:14:44 +0200 (CEST)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFb1-0005by-NC
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFs-0007Tq-VQ
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:53 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFr-0005Cy-4q
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:52 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l7so21214118ejn.2
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BQ2Lcj+YdqXRcpRrMmrKaUG1RtsECttdprGaQ+wveUk=;
 b=DKdskAqaTM7zBiaLnKG81oWsAOpb06YBU0LHMCn433MyhylKTsytjaPvELW+D1kF/1
 mqANjaaMU2EPVtB1D3F60b/3BxAyN0MGQAHqtZiLJE/5eOQ/1IxTJ0cpw9fJVZRFY/id
 /GZY6Ab/bz5fQt5Lx3A5oi3dTfwTLpmbza/StU+MqCQuD5/mj3nrfQZAyPjeBcbx/iJL
 f368aX8VedW5MlZr8Dw5Qyt3shQSxdYrC5gpu6hbitKy3NtCilzMbbTK2uu8+sv63hB8
 m0itMgOhJuzchrxy5+WO2WbgtXgt85lnDr02hbABDmEfc0ve977gXEeNmQrN32HTkrh5
 r7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BQ2Lcj+YdqXRcpRrMmrKaUG1RtsECttdprGaQ+wveUk=;
 b=IbTnTap++ELEuLr3/UwP+IR/Bq2Bv2iT2P4qZW8JTNDtgqcL9Fg5T4oF56ElMVC6mL
 fyR7yfD57YIeoX1xT9wlCFJUA7HXEWWsMHLKf7EjyqVv2XLia4nggJCN1zHowLC8ZC4F
 NPfbXtKdF6+1XRflUXM6SWtI2VmxzMBGwX6pOcpkK33Vez9TMWprwGwqvbVijY2B4g0H
 Ek1GLv176sIlbqOavwVTjoFJ63phuzPKwBVpylGNOIlNsag4qhUsywYVq/uDeR5GuFpc
 53GWe36yM08K7tN+yso6qFxJC8zdRfm+hrm8IKME5iacUwUgZ7r2WAHMlYMmdmrs6OXe
 py4A==
X-Gm-Message-State: AOAM531LlmVlQrLAApI4Kq0cNv19+oUDBdIudl7EZA8yYg4LuRr6bEi6
 q5WpZPxc9lGLgLo34cShZQ2hUmSsXexQGQ==
X-Google-Smtp-Source: ABdhPJzm9wVsddM8CBzcy93SqZ+DSUevG7sqtS40Nn34jtd3nveXpDwuYpl7jDggNT9ExvOy9HnZ0g==
X-Received: by 2002:a17:906:9c84:b0:6e0:7c75:6f01 with SMTP id
 fj4-20020a1709069c8400b006e07c756f01mr8194406ejc.103.1650718369931; 
 Sat, 23 Apr 2022 05:52:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/34] configure: omit options with default values from
 meson command line
Date: Sat, 23 Apr 2022 14:51:43 +0200
Message-Id: <20220423125151.27821-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has no functional change, it only makes the command line shorter
and nicer.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 29 +++++++++++++++++------------
 meson.build       |  2 +-
 meson_options.txt |  2 +-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/configure b/configure
index c6edbceff0..19947d8d6c 100755
--- a/configure
+++ b/configure
@@ -2348,19 +2348,24 @@ if test "$skip_meson" = no; then
   mv $cross config-meson.cross
 
   rm -rf meson-private meson-info meson-logs
+
+  # Built-in options
+  test "$bindir" != "bin" && meson_option_add "-Dbindir=$bindir"
+  test "$default_feature" = no && meson_option_add -Dauto_features=disabled
+  test "$pie" = no && meson_option_add -Db_pie=false
+  test "$werror" = yes && meson_option_add -Dwerror=true
+
+  # QEMU options
+  test "$capstone" != auto && meson_option_add "-Dcapstone=$capstone"
+  test "$cfi" != false && meson_option_add "-Dcfi=$cfi"
+  test "$fdt" != auto && meson_option_add "-Dfdt=$fdt"
+  test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
+  test "$qemu_suffix" != qemu && meson_option_add "-Dqemu_suffix=$qemu_suffix"
+  test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
+  test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
+  test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
   run_meson() {
-    NINJA=$ninja $meson setup \
-        --prefix "$prefix" \
-        --bindir "$bindir" \
-        -Dqemu_suffix="$qemu_suffix" \
-        -Dsmbd="$smbd" \
-        -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
-        -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
-        -Dcfi=$cfi -Dtcg=$tcg \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
-        $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
-        $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
-        "$@" $cross_arg "$PWD" "$source_path"
+    NINJA=$ninja $meson setup --prefix "$prefix" "$@" $cross_arg "$PWD" "$source_path"
   }
   eval run_meson $meson_options
   if test "$?" -ne 0 ; then
diff --git a/meson.build b/meson.build
index 1fa4cc255e..6913ab0251 100644
--- a/meson.build
+++ b/meson.build
@@ -1,6 +1,6 @@
 project('qemu', ['c'], meson_version: '>=0.59.3',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
-                          'b_staticpic=false', 'stdsplit=false', 'optimization=2'],
+                          'b_staticpic=false', 'stdsplit=false', 'optimization=2', 'b_pie=true'],
         version: files('VERSION'))
 
 add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
diff --git a/meson_options.txt b/meson_options.txt
index a76fadbd7d..8efd5f520c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -78,7 +78,7 @@ option('xen', type: 'feature', value: 'auto',
        description: 'Xen backend support')
 option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
-option('tcg', type: 'feature', value: 'auto',
+option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
-- 
2.35.1



