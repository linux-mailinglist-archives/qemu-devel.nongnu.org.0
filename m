Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64016FEF63
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:53:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wq-0000OD-TK; Thu, 11 May 2023 05:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wo-0000N9-58
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wl-0006gv-H8
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRxqlh7veZhjD+LcxNz+3eeOOmv3DMsoV3pY3RZBxLY=;
 b=FQ9ZZcfpHqL/cKp9GdCQp2w8LcDSqq5HK4Xgu2GBdV/Wo/j+2KgfC10ASjLycVZXXXS22c
 VnfglJi6TVgOc8suKRVthH5juFoLjAB6LtQDnJi984ERZvvf+xBlFldvVR/soC524Azc8W
 yUHQswkT16HY2GVVX2H06qa7YR6HD+0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-vf3YQ71BMHydCLGesUhXXQ-1; Thu, 11 May 2023 05:50:48 -0400
X-MC-Unique: vf3YQ71BMHydCLGesUhXXQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bc456a94dso7852679a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798646; x=1686390646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRxqlh7veZhjD+LcxNz+3eeOOmv3DMsoV3pY3RZBxLY=;
 b=U7YIvGAAfoGvmyetYzb8t38/TKRMfDVr2b/RiDzB0EDXJbGcsPm/LZkEp81qOzkuKV
 BHce3CkuJOvKGc76OAYXf4qKDJpK1xx1F6m2nlHKBBglqFQs05K/xn6XCEZtFd+1A9Rj
 k1RElxkp6TLzPuvCa+bERwk8MkJF9Vluxuiz4XOzW8S4N6I3+t4kOKphXlNRPBxlT7S5
 Dc5+i/tYd5KM4ozwBLnqh/OT/ACm0b1L7jwbk9+dMlhn2cJxuNpcMsPp+Rmj7ZDSqlrR
 Y2HETv6dLfcQonB6AApaIXq1ircJ9wT6YEgkY9F5XGk9LeqPtrZcGL6iUJwz5HdkfdRH
 4wiQ==
X-Gm-Message-State: AC+VfDzgqEIBueKl1l3a4LXYnu6SqE0a5A7YcwfEqo9bmqK+kWjG/WV/
 AtgP3ihO4Gn9VZJSsZY5pWv2YsA16bst7L11IfIPurDcJXKLI6ce8Lyc2uX9875ejIYCGPUJqDa
 jStHbrbr1RolJZNJL7SWo2DhwR9kvxL6GfiGM9JXLeMsBYEICmb1KpMuQ1Flkf6OBLbiJ8vTn0H
 Q=
X-Received: by 2002:a05:6402:b13:b0:50c:a8ca:3240 with SMTP id
 bm19-20020a0564020b1300b0050ca8ca3240mr16607241edb.24.1683798646034; 
 Thu, 11 May 2023 02:50:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75tQZWxdao/Iwx0rqrW65S5MHChniEiWg4oFgTKMlNypslWL3NTdQX9xndBirQ1K+8q1LJ4Q==
X-Received: by 2002:a05:6402:b13:b0:50c:a8ca:3240 with SMTP id
 bm19-20020a0564020b1300b0050ca8ca3240mr16607229edb.24.1683798645607; 
 Thu, 11 May 2023 02:50:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05640203c500b0050d82f96860sm2795508edw.59.2023.05.11.02.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 08/24] configure: remove pkg-config functions
Date: Thu, 11 May 2023 11:50:05 +0200
Message-Id: <20230511095021.1397802-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

All uses of pkg-config have been moved to Meson.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                   | 21 ++++-----------------
 docs/devel/build-system.rst |  4 ----
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index fe15efa9ebe1..838d35bfa2f3 100755
--- a/configure
+++ b/configure
@@ -390,11 +390,7 @@ strip="${STRIP-${cross_prefix}strip}"
 widl="${WIDL-${cross_prefix}widl}"
 windres="${WINDRES-${cross_prefix}windres}"
 windmc="${WINDMC-${cross_prefix}windmc}"
-pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
-query_pkg_config() {
-    "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
-}
-pkg_config=query_pkg_config
+pkg_config="${PKG_CONFIG-${cross_prefix}pkg-config}"
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 
 # default flags for all hosts
@@ -792,9 +788,7 @@ for opt do
   ;;
   --without-default-features) # processed above
   ;;
-  --static)
-    static="yes"
-    QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
+  --static) static="yes"
   ;;
   --bindir=*) bindir="$optarg"
   ;;
@@ -1501,13 +1495,6 @@ EOF
   fi
 fi
 
-##########################################
-# pkg-config probe
-
-if ! has "$pkg_config_exe"; then
-  error_exit "pkg-config binary '$pkg_config_exe' not found"
-fi
-
 ##########################################
 # fdt probe
 
@@ -2364,7 +2351,7 @@ echo "PYTHON=$python" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
-echo "PKG_CONFIG=${pkg_config_exe}" >> $config_host_mak
+echo "PKG_CONFIG=${pkg_config}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
@@ -2514,7 +2501,7 @@ if test "$skip_meson" = no; then
   test -n "$objcc" && echo "objc = [$(meson_quote $objcc $CPU_CFLAGS)]" >> $cross
   echo "ar = [$(meson_quote $ar)]" >> $cross
   echo "nm = [$(meson_quote $nm)]" >> $cross
-  echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
+  echo "pkgconfig = [$(meson_quote $pkg_config)]" >> $cross
   echo "ranlib = [$(meson_quote $ranlib)]" >> $cross
   if has $sdl2_config; then
     echo "sdl2-config = [$(meson_quote $sdl2_config)]" >> $cross
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 9db18aff159e..66cfe7b8bdc8 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -103,10 +103,6 @@ developers in checking for system features:
    Print $MESSAGE to stderr, followed by $MORE... and then exit from the
    configure script with non-zero status
 
-``query_pkg_config $ARGS...``
-   Run pkg-config passing it $ARGS. If QEMU is doing a static build,
-   then --static will be automatically added to $ARGS
-
 
 Stage 2: Meson
 ==============
-- 
2.40.1


