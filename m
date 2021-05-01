Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A73706A0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:33:08 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lclzn-0002Ep-42
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxS-0000YW-2I
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:42 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxQ-0005Xp-CF
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:41 -0400
Received: by mail-ej1-x636.google.com with SMTP id y7so702721ejj.9
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pZPA3Fo5/U12JHJo/A7HGQPM2TFAL/3tsSdQo2FPQjQ=;
 b=ALhBFyKqGh0IMjL/qD6rSUXiQt2zme5pfQsCSNEXbK5eZq7cVhLyA8LwZ22phryPvi
 01Tdu/1lgVI6vjauU8F60jdunsT4yXu0DsFT+y6c5f7G/zovWMq8IYGGVE9U8llp68k6
 aEcCPKRfbDmIp7Wyzxr3EsWEN2tlKSB7iFcekbxlsHgOPzkJPHVe6XfPJSALI/KNRR1X
 d/QUK/mX2TjG8GhvKfDx5dLPLfXegXvSs9DW8iYSlxiJIBfJRG5XUnZIGm218k8lRO0S
 NrgReC/FF9RrTn24d42BgYOwnka954BEd4beLOmcRzOaGXMghTLkUScWsbcMYLwJa1Tz
 5yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pZPA3Fo5/U12JHJo/A7HGQPM2TFAL/3tsSdQo2FPQjQ=;
 b=AMkUBojg7pXnv/R1smt36Vhy1zeTeTNyN20HPSRE92IAzr2Zvy1y6BeRKMP+e6i9Lh
 K19ZcBP4sTdpuryva5AAkrCgkmE16gZD4aN6f37+PBsIW85wB8AN9h37aBax3+OvS8n9
 r9fZhwuQiyOoeDCwObFmS/dXeKiforc4FHgo/Kgxnait3n2ab9BF5UjG2ZpmGrqswy4+
 MltTmk99xOabqexZxPdP85tAAn6l+XIsI3Eb0+dCZDRwau46QT8CKDFE3Mw+bhnTDVG1
 QlpFqz6BS06jy+nbsCagu8vVQZC4lvrxP4AFPqqDVPyBRbgmoxtaaXhrHDNLX7ew/+hh
 wXaw==
X-Gm-Message-State: AOAM532K65u6iMeGK2v7Se4B3LOGXBKxt8HE/AHvlspIVDq+PqzhtSID
 ObtNzcg+0oFB1xEtZnAsThUsjWJbmC0=
X-Google-Smtp-Source: ABdhPJzeZI7mGyHYXqeUsvmTm6lDuXaXOLhk8NM0l2A9CzQO75Q4WOGZW2ZkF379VqGYU0ZQtSCOtw==
X-Received: by 2002:a17:906:f8cf:: with SMTP id
 lh15mr8236259ejb.121.1619861436623; 
 Sat, 01 May 2021 02:30:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] configure: reindent meson invocation
Date: Sat,  1 May 2021 11:30:24 +0200
Message-Id: <20210501093026.189429-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 76 +++++++++++++++++++++++++++----------------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/configure b/configure
index ccc58ccc46..0b8283c95c 100755
--- a/configure
+++ b/configure
@@ -6345,33 +6345,33 @@ for rom in seabios; do
 done
 
 if test "$skip_meson" = no; then
-cross="config-meson.cross.new"
-meson_quote() {
+  cross="config-meson.cross.new"
+  meson_quote() {
     echo "'$(echo $* | sed "s/ /','/g")'"
-}
-
-echo "# Automatically generated by configure - do not modify" > $cross
-echo "[properties]" >> $cross
-test -z "$cxx" && echo "link_language = 'c'" >> $cross
-echo "[built-in options]" >> $cross
-echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
-echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
-echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
-echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
-echo "[binaries]" >> $cross
-echo "c = [$(meson_quote $cc)]" >> $cross
-test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
-test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
-echo "ar = [$(meson_quote $ar)]" >> $cross
-echo "nm = [$(meson_quote $nm)]" >> $cross
-echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
-echo "ranlib = [$(meson_quote $ranlib)]" >> $cross
-if has $sdl2_config; then
-  echo "sdl2-config = [$(meson_quote $sdl2_config)]" >> $cross
-fi
-echo "strip = [$(meson_quote $strip)]" >> $cross
-echo "windres = [$(meson_quote $windres)]" >> $cross
-if test "$cross_compile" = "yes"; then
+  }
+
+  echo "# Automatically generated by configure - do not modify" > $cross
+  echo "[properties]" >> $cross
+  test -z "$cxx" && echo "link_language = 'c'" >> $cross
+  echo "[built-in options]" >> $cross
+  echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
+  echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
+  echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
+  echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
+  echo "[binaries]" >> $cross
+  echo "c = [$(meson_quote $cc)]" >> $cross
+  test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
+  test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
+  echo "ar = [$(meson_quote $ar)]" >> $cross
+  echo "nm = [$(meson_quote $nm)]" >> $cross
+  echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
+  echo "ranlib = [$(meson_quote $ranlib)]" >> $cross
+  if has $sdl2_config; then
+    echo "sdl2-config = [$(meson_quote $sdl2_config)]" >> $cross
+  fi
+  echo "strip = [$(meson_quote $strip)]" >> $cross
+  echo "windres = [$(meson_quote $windres)]" >> $cross
+  if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
     if test "$mingw32" = "yes" ; then
@@ -6403,17 +6403,17 @@ if test "$cross_compile" = "yes"; then
     else
         echo "endian = 'little'" >> $cross
     fi
-else
+  else
     cross_arg="--native-file config-meson.cross"
-fi
-mv $cross config-meson.cross
+  fi
+  mv $cross config-meson.cross
 
-rm -rf meson-private meson-info meson-logs
-unset staticpic
-if ! version_ge "$($meson --version)" 0.56.0; then
-  staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi)
-fi
-NINJA=$ninja $meson setup \
+  rm -rf meson-private meson-info meson-logs
+  unset staticpic
+  if ! version_ge "$($meson --version)" 0.56.0; then
+    staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi)
+  fi
+  NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
         --libexecdir "$libexecdir" \
@@ -6455,9 +6455,9 @@ NINJA=$ninja $meson setup \
         $cross_arg \
         "$PWD" "$source_path"
 
-if test "$?" -ne 0 ; then
-    error_exit "meson setup failed"
-fi
+  if test "$?" -ne 0 ; then
+      error_exit "meson setup failed"
+  fi
 fi
 
 if test -n "${deprecated_features}"; then
-- 
2.31.1



