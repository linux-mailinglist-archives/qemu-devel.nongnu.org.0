Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2B6C12A6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBb-0001ct-Gi; Mon, 20 Mar 2023 09:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBY-0001ZQ-FX
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBV-0006Oc-N9
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1OoV/rGNe4w3wlqtB/VnYjM9vJQlvFlogv99Skz87w=;
 b=YrfLdowlc8xwg6PXIorO5G6ZUOvMj7WCHgloXQ6UcjfTETlriN0W9t9ihqqusX4qyUutN2
 u15rCJ3IT1H11kabuJ7AZUTzgUUZRkJycImAUdpzAVbfoZCpy4cyHuOQjhwk7ule1qn8H8
 mHJZjCzh9mJFYrAycs8IRrQm5/3y2k4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-lUVqd_IaOkK13Bh23sr5Gg-1; Mon, 20 Mar 2023 09:04:16 -0400
X-MC-Unique: lUVqd_IaOkK13Bh23sr5Gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83CA0810BDB;
 Mon, 20 Mar 2023 13:04:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFC16C15BA0;
 Mon, 20 Mar 2023 13:04:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 23/24] qemu/osdep: Switch position of "extern" and "G_NORETURN"
Date: Mon, 20 Mar 2023 14:03:29 +0100
Message-Id: <20230320130330.406378-24-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Bernhard Beschow <shentey@gmail.com>

Fixes the Windows build under msys2 using GCC 12 which fails with the follo=
wing
error:

  [184/579] Compiling C++ object qga/vss-win32/qga-vss.dll.p/install.cpp.obj
  FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
  "c++" "-m64" "-mcx16" "-Iqga/vss-win32/qga-vss.dll.p" "-Iqga/vss-win32" "=
-I../src/qga/vss-win32" "-I." "-Iqapi" "-Itrace" "-Iui" "-Iui/shader" "-IC:=
/msys64/mingw64/include/glib-2.0" "-IC:/msys64/mingw64/lib/glib-2.0/include=
" "-fdiagnostics-color=3Dauto" "-Wall" "-Winvalid-pch" "-Wnon-virtual-dtor"=
 "-Werror" "-std=3Dgnu++11" "-g" "-iquote" "." "-iquote" "C:/msys64/home/sh=
entey/Projects/qemu/src" "-iquote" "C:/msys64/home/shentey/Projects/qemu/sr=
c/include" "-iquote" "C:/msys64/home/shentey/Projects/qemu/src/tcg/i386" "-=
D__STDC_LIMIT_MACROS" "-D__STDC_CONSTANT_MACROS" "-D__STDC_FORMAT_MACROS" "=
-fno-pie" "-no-pie" "-D_GNU_SOURCE" "-D_FILE_OFFSET_BITS=3D64" "-D_LARGEFIL=
E_SOURCE" "-fno-strict-aliasing" "-fno-common" "-fwrapv" "-Wundef" "-Wwrite=
-strings" "-Wtype-limits" "-Wformat-security" "-Wformat-y2k" "-Winit-self" =
"-Wignored-qualifiers" "-Wempty-body" "-Wendif-labels" "-Wexpansion-to-defi=
ned" "-Wimplicit-fallthrough=3D2" "-Wmissing-format-attribute" "-Wno-missin=
g-include-dirs" "-Wno-shift-negative-value" "-Wno-psabi" "-fstack-protector=
-strong" "-Wno-unknown-pragmas" "-Wno-delete-non-virtual-dtor" "-Wno-non-vi=
rtual-dtor" -MD -MQ qga/vss-win32/qga-vss.dll.p/install.cpp.obj -MF "qga/vs=
s-win32/qga-vss.dll.p/install.cpp.obj.d" -o qga/vss-win32/qga-vss.dll.p/ins=
tall.cpp.obj "-c" ../src/qga/vss-win32/install.cpp
  In file included from C:/msys64/mingw64/lib/glib-2.0/include/glibconfig.h=
:9,
              from C:/msys64/mingw64/include/glib-2.0/glib/gtypes.h:34,
              from C:/msys64/mingw64/include/glib-2.0/glib/galloca.h:34,
              from C:/msys64/mingw64/include/glib-2.0/glib.h:32,
              from C:/msys64/home/shentey/Projects/qemu/src/include/glib-co=
mpat.h:32,
              from C:/msys64/home/shentey/Projects/qemu/src/include/qemu/os=
dep.h:144,
              from ../src/qga/vss-win32/install.cpp:13:
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: standar=
d attributes in middle of decl-specifiers
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: note: standard=
 attributes must precede the decl-specifiers to apply to the declaration, o=
r follow them to apply to the type
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: attribu=
te ignored [-Werror=3Dattributes]
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: note: an attri=
bute that appertains to a type-specifier is ignored
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  cc1plus.exe: all warnings being treated as errors

Apparently it also fixes the compilation with Clang 15 (see
https://gitlab.com/qemu-project/qemu/-/issues/1541 ).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230318185931.181659-1-shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f68b5d8708..9eff0be95b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -237,7 +237,7 @@ extern "C" {
  * supports QEMU_ERROR, this will be reported at compile time; otherwise
  * this will be reported at link time due to the missing symbol.
  */
-extern G_NORETURN
+G_NORETURN extern
 void QEMU_ERROR("code path is reachable")
     qemu_build_not_reached_always(void);
 #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
--=20
2.31.1


