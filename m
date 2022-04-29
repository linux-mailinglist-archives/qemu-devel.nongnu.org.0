Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5A515023
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:02:04 +0200 (CEST)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkT4D-0006Ed-WA
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSv-0002JA-S9
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:29 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSu-0006AG-7D
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:29 -0400
Received: by mail-ej1-x62f.google.com with SMTP id r13so16100819ejd.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F19SAoaTS/smwDU4AeRev/lxRTDzIZXIAnLP7Rv2lMI=;
 b=dLbF/7C43nP13dVnt1Lf/ufZqfeVdP/7yxvxlmA0roLIMQLTr6wwv/EqnHSI7ZXlZO
 J0WMs9lummGjj54k/BmTHzo928R3hy3LgFbVo2clUESMCUo1OCVuxUv7WIsX1mQIpQIm
 lk/H7W8B/C9QUA3G47/9lF19diY9tRgLMT7wPO7cNfKzJTaSeO+BkZ6qoYbGWjmfxtNJ
 62hpFeoTuNAMiqnS7XsEiNg4W6iVeYeMlenPHKHYavoyHfe7q0NbYg4zkDlv8JKS59kd
 +iocOzLfTR5M6OvN2cLXUreZUsEQM3xT5d0b3JGnpX3033nPgPnkntxv2o1qNcTFQNuE
 msNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F19SAoaTS/smwDU4AeRev/lxRTDzIZXIAnLP7Rv2lMI=;
 b=f+d8W8cBM/CJYtQoNVOTEBxDc7gWKhVn3iZHVR3/PtSUOtfMO8TTNPZcKjVgdjf+TB
 wrg/J4BT38BP1tG3Wex5I6t9+Yh03WdiWwiijlRM+P44siXLjt5jcXBid4aIU3LYe4fm
 PQP/h7FyUpFXbEZZV99Ss/calQOgLea1LoCGS+sbcWlnPGenNP5ZxB8VLCLO2cUBCnmi
 OtPv0xfKr6n937GF8oJmbSjmuM9V4uE+fKCh20bg0QwsZes92Q54U68z1NQlxpnwFqOK
 DGsk4fY8sksYZpkv7svIaj1CCeUxdcKe7qHijMTxbwSmWAOpVIGb247Qb7EmGWp+O/Ze
 Aa7Q==
X-Gm-Message-State: AOAM531hI2ROoVnP7u+26cNQv9Yu/bcqwwBXsVQ79hc3ndCV0VBRKkEO
 KDMwka3QAvCAEMGbRJSpFMehjn8sYdOCPA==
X-Google-Smtp-Source: ABdhPJxsglQVFQmbpaOLTzHYdh0bxH67nSPdISIbUtJx8XjMssLWQmmeCziEAUqnxnIaHfrJUmfZ5g==
X-Received: by 2002:a17:906:e87:b0:6df:8602:5801 with SMTP id
 p7-20020a1709060e8700b006df86025801mr37123760ejf.140.1651245806838; 
 Fri, 29 Apr 2022 08:23:26 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/25] configure: omit options with default values from meson
 command line
Date: Fri, 29 Apr 2022 17:23:03 +0200
Message-Id: <20220429152312.335715-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
index fc7868948b..1c88e697c5 100755
--- a/configure
+++ b/configure
@@ -2350,19 +2350,24 @@ if test "$skip_meson" = no; then
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
index 19966e0a5a..7c52ef135c 100644
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
index 15fe40c700..35f5a72507 100644
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



