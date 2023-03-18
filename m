Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272556BFC36
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 20:01:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdbmL-0003SC-7p; Sat, 18 Mar 2023 14:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pdbmJ-0003RU-Pm
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 14:59:43 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pdbmH-0003Gi-Sg
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 14:59:43 -0400
Received: by mail-ed1-x532.google.com with SMTP id w9so32474162edc.3
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 11:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679165979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AvDObqajYMLVke1+6o7AO8CeVOhoT1kOGwUbTCe5ys8=;
 b=pcfUTJ8jFpNfOjCXXdQbMbkcwyTQ0nwn4wQHXY4JsR37YFxKt0Pe+lXgmv/Cm/mpld
 Ap/ppZnheMwQD3w0zBBnUS5LJLxvVRj/CsnbhJmwj2sQwIqxEKmyynX1MKN51HvI7XYr
 VJt5Qg4hiU3AZT9/ROmFrDhUl0fjIGdDxktdBQLuog9mSUickCKvraVBXHKPm3NwkNth
 Mr8HhsdixqBmnxynKEu+jN9xpijtgmxhwidVy3OYL9eXj1GiF6jR/ciMenOAR53CFiKI
 4hEI3nN+ZBNWaNVgLK2voGtJ2SwdqnlL77HR8w91h7h4C6RatX3r7ZS2J0gY08HPcpJt
 WFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679165979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AvDObqajYMLVke1+6o7AO8CeVOhoT1kOGwUbTCe5ys8=;
 b=Dht/ibAMrtUPFzDALES23/qxTUa4Ba/eh47hwXff4PnqnkLTVJEXM+01h2xcHXHS+9
 7Mg9Xuj4T2VP7ZB9z0syHwoqWfHkH4+0O1iSv3lvKNf0Y1mwGTriUv4Skm3Ry+AfFQza
 m3EIsB5i8Th2CIA5yR9DGeVy00PDE2ERGvfkWgVCbWn0OvBG6uFQHVU+WkGiJJis9EDV
 Sp54a0NAtKPIu5GyOMmEphgANi1535JCjvOIV9g9HAggjGbM7DkUhPOgS56HbmNvr9Uc
 pjMLJGT9hMPLFnDdUKDSLs7iIq9xqEvTFKqcvi2/0C1W1PcTggAIxNxkjthduqyTsAXq
 5njw==
X-Gm-Message-State: AO0yUKXe607+O6jxeuOIK57EqF2kxkvZLXYZ+AHeIpljXsSn5Rbvn5VU
 4X56R438sInQEmD2Ul+J0MwdLjrFMjA=
X-Google-Smtp-Source: AK7set/k9BmB/pRXsa2nV2M56g2rmuC1TAQkvYivIUQvBVhhGjsWf0pfQpZGSlyYvfU44zEzRt/kAg==
X-Received: by 2002:a17:906:33ce:b0:92e:3b80:9841 with SMTP id
 w14-20020a17090633ce00b0092e3b809841mr3510368eja.42.1679165979246; 
 Sat, 18 Mar 2023 11:59:39 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-011-121-187.77.11.pool.telefonica.de. [77.11.121.187])
 by smtp.gmail.com with ESMTPSA id
 ha18-20020a170906a89200b0092be4b381b7sm2423358ejb.81.2023.03.18.11.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 11:59:38 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH for 8.0] qemu/osdep: Switch position of "extern" and
 "G_NORETURN"
Date: Sat, 18 Mar 2023 19:59:31 +0100
Message-Id: <20230318185931.181659-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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
2.40.0


