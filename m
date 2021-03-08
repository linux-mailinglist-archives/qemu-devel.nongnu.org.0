Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21213316DB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:59:52 +0100 (CET)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJL6d-0006bQ-P4
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJKUl-0002k0-9J
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:20:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJKUi-0002Tr-GR
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:20:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lJKUg-0004ex-Dw
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 18:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3D23B2E815D
 for <qemu-devel@nongnu.org>; Mon,  8 Mar 2021 18:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Mar 2021 18:13:49 -0000
From: Eddy Hahn <1918084@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eddyh th-huth
X-Launchpad-Bug-Reporter: Eddy Hahn (eddyh)
X-Launchpad-Bug-Modifier: Eddy Hahn (eddyh)
References: <161517335801.3660.13243926426355834161.malonedeb@soybean.canonical.com>
Message-Id: <161522722942.27422.17763281625745124346.malone@gac.canonical.com>
Subject: [Bug 1918084] Re: Build fails on macOS 11.2.2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f41ce4c616a9df6b2066606b5a16a036a6d2f6bb"; Instance="production"
X-Launchpad-Hash: 9beea999ac8d42173add4b73dcc7b34f627c7699
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1918084 <1918084@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[87/5089] Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o =

c++ -Ilibcommon.fa.p -I. -I.. -I../capstone/include/capstone -I../slirp -I.=
./slirp/src -I../dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader -I/opt/serverpl=
us/dependencies/glib/include/glib-2.0 -I/opt/serverplus/dependencies/glib/l=
ib/glib-2.0/include -I/opt/serverplus/dependencies/glib/include/gio-unix-2.=
0/ -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/D=
eveloper/SDKs/MacOSX11.1.sdk/usr/include -I/opt/serverplus/dependencies/pix=
man/include/pixman-1 -Xclang -fcolor-diagnostics -pipe -Wall -Winvalid-pch =
-Wnon-virtual-dtor -std=3Dgnu++11 -O2 -g -iquote . -iquote /opt/build/build=
/stage/qemu -iquote /opt/build/build/stage/qemu/include -iquote /opt/build/=
build/stage/qemu/disas/libvixl -iquote /opt/build/build/stage/qemu/tcg/i386=
 -iquote /opt/build/build/stage/qemu/accel/tcg -Wno-unused-function -D__STD=
C_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -m64 -mcx16 =
-DOS_OBJECT_USE_OBJC=3D0 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFIL=
E_SOURCE -Wundef -Wwrite-strings -fno-strict-aliasing -fno-common -fwrapv -=
Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifier=
s -Wempty-body -Wendif-labels -Wexpansion-to-defined -Wno-initializer-overr=
ides -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-i=
nt -Wno-typedef-redefinition -Wno-tautological-type-limit-compare -fstack-p=
rotector-strong -DSTRUCT_IOVEC_DEFINED -D_REENTRANT -MD -MQ libcommon.fa.p/=
disas_libvixl_vixl_utils.cc.o -MF libcommon.fa.p/disas_libvixl_vixl_utils.c=
c.o.d -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disas/libvixl/v=
ixl/utils.cc
In file included from ../disas/libvixl/vixl/utils.cc:27:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/utils.=
h:30:
In file included from /Applications/Xcode.app/Contents/Developer/Platforms/=
MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk/usr/include/string.h:61:
In file included from /Applications/Xcode.app/Contents/Developer/Platforms/=
MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk/usr/include/_types.h:27:
In file included from /Applications/Xcode.app/Contents/Developer/Platforms/=
MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk/usr/include/sys/_types.h:32:
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/sys/cdefs.h:236:5: warning: '__STDC_VER=
SION__' is not defined, evaluates to 0 [-Wundef]
#if __STDC_VERSION__ < 199901
    ^
In file included from ../disas/libvixl/vixl/utils.cc:27:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/utils.=
h:31:
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:317:9: error: no member named 'signbit'=
 in the global namespace
using ::signbit;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:318:9: error: no member named 'fpclassi=
fy' in the global namespace
using ::fpclassify;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:319:9: error: no member named 'isfinite=
' in the global namespace; did you mean 'finite'?
using ::isfinite;
      ~~^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/math.h:752:12: note: 'finite' declared =
here
extern int finite(double)
           ^
In file included from ../disas/libvixl/vixl/utils.cc:27:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/utils.=
h:31:
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:320:9: error: no member named 'isinf' i=
n the global namespace
using ::isinf;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:321:9: error: no member named 'isnan' i=
n the global namespace
using ::isnan;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:322:9: error: no member named 'isnormal=
' in the global namespace
using ::isnormal;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:323:9: error: no member named 'isgreate=
r' in the global namespace
using ::isgreater;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:324:9: error: no member named 'isgreate=
requal' in the global namespace
using ::isgreaterequal;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:325:9: error: no member named 'isless' =
in the global namespace
using ::isless;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:326:9: error: no member named 'islesseq=
ual' in the global namespace
using ::islessequal;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:327:9: error: no member named 'islessgr=
eater' in the global namespace
using ::islessgreater;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:328:9: error: no member named 'isunorde=
red' in the global namespace
using ::isunordered;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:329:9: error: no member named 'isunorde=
red' in the global namespace
using ::isunordered;
      ~~^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:335:9: error: no member named 'abs' in =
the global namespace; did you mean 'fabs'?
using ::abs;
      ~~^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/math.h:417:15: note: 'fabs' declared he=
re
extern double fabs(double);
              ^
In file included from ../disas/libvixl/vixl/utils.cc:27:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/utils.=
h:31:
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:640:26: error: no template named 'numer=
ic_limits'
    bool _FloatBigger =3D (numeric_limits<_FloatT>::digits > numeric_limits=
<_IntT>::digits),
                         ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:640:60: error: no template named 'numer=
ic_limits'
    bool _FloatBigger =3D (numeric_limits<_FloatT>::digits > numeric_limits=
<_IntT>::digits),
                                                           ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:641:18: error: no template named 'numer=
ic_limits'
    int _Bits =3D (numeric_limits<_IntT>::digits - numeric_limits<_FloatT>:=
:digits)>
                 ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:641:50: error: no template named 'numer=
ic_limits'
    int _Bits =3D (numeric_limits<_IntT>::digits - numeric_limits<_FloatT>:=
:digits)>
                                                 ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:646:17: error: no template named 'numer=
ic_limits'
  static_assert(numeric_limits<_FloatT>::radix =3D=3D 2, "FloatT has incorr=
ect radix");
                ^
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
1 warning and 20 errors generated.
ninja: build stopped: subcommand failed.
make[1]: *** [run-ninja] Error 1
make: *** [all] Error 2

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918084

Title:
  Build fails on macOS 11.2.2

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  I got the latest version from git. I have pre-compiled the dependency
  libraries. All good. configure creates the necessary files. When I
  build I got the following error:

  [1368/6454] Compiling C object libcapstone.a.p/capstone_arch_AArch64_AArc=
h64InstPrinter.c.o
  ninja: build stopped: subcommand failed.
  make[1]: *** [run-ninja] Error 1
  make: *** [all] Error 2

  I've ran make as make -j 8

  original config:

  PKG_CONFIG_PATH=3D"$SERVERPLUS_DIR/dependencies/glib/lib/pkgconfig:$SERVE=
RPLUS_DIR/dependencies/pixman/lib/pkgconfig:$SERVERPLUS_DIR/dependencies
  /cyrus-sasl/lib/pkgconfig" ./configure --prefix=3D"$SERVERPLUS_DIR"
  --enable-hvf --enable-cocoa --enable-vnc-sasl --enable-auth-pam
  --ninja=3D/opt/build/build/stage/tools/ninja/ninja
  --python=3D"$SERVERPLUS_DIR/dependencies/python/bin/python3" --enable-
  bsd-user

  if I build with --target-list=3Dx86_64-softmmu then it will build but I
  will get only the x86_64 QEMU built. With 5.0 I could build all
  emulators.

  $SERVERPLUS_DIR is my target dir.

  Thanks,

  Eddy

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918084/+subscriptions

