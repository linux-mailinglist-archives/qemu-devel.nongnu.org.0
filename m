Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84F3483C3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 22:32:24 +0100 (CET)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPB6z-0005wP-PC
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 17:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPB5j-0005Rw-UK
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 17:31:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:59764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPB5h-0005Al-0Y
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 17:31:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lPB5e-00069w-Qp
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 21:30:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B17552E8165
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 21:30:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 21:23:15 -0000
From: Eddy Hahn <1918084@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Triaged; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eddyh th-huth
X-Launchpad-Bug-Reporter: Eddy Hahn (eddyh)
X-Launchpad-Bug-Modifier: Eddy Hahn (eddyh)
References: <161517335801.3660.13243926426355834161.malonedeb@soybean.canonical.com>
Message-Id: <161662099565.24097.13360867032226252458.malone@chaenomeles.canonical.com>
Subject: [Bug 1918084] Re: Build fails on macOS 11.2.2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 580e3c8dd6536bda0fc2b41d29a29329ed202d81
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

I pulled the latest it got a bit further :-)

In file included from ../disas/arm-a64.cc:21:
In file included from /opt/build/build/stage/qemu/include/qemu/osdep.h:126:
In file included from /opt/build/build/stage/qemu/include/glib-compat.h:32:
In file included from /opt/serverplus/dependencies/glib/include/glib-2.0/gl=
ib.h:107:
In file included from /opt/serverplus/dependencies/glib/include/glib-2.0/gl=
ib/deprecated/gthread.h:128:
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:328:6: warning: macro expansi=
on producing 'defined' has undefined behavior [-Wexpansion-to-defined]
#if !_PTHREAD_SWIFT_IMPORTER_NULLABILITY_COMPAT
     ^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:197:2: note: expanded from ma=
cro '_PTHREAD_SWIFT_IMPORTER_NULLABILITY_COMPAT'
        defined(SWIFT_CLASS_EXTRA) && (!defined(SWIFT_SDK_OVERLAY_PTHREAD_E=
POCH) || (SWIFT_SDK_OVERLAY_PTHREAD_EPOCH < 1))
        ^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:328:6: warning: macro expansi=
on producing 'defined' has undefined behavior [-Wexpansion-to-defined]
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:197:34: note: expanded from m=
acro '_PTHREAD_SWIFT_IMPORTER_NULLABILITY_COMPAT'
        defined(SWIFT_CLASS_EXTRA) && (!defined(SWIFT_SDK_OVERLAY_PTHREAD_E=
POCH) || (SWIFT_SDK_OVERLAY_PTHREAD_EPOCH < 1))
                                        ^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:537:6: warning: macro expansi=
on producing 'defined' has undefined behavior [-Wexpansion-to-defined]
#if !_PTHREAD_SWIFT_IMPORTER_NULLABILITY_COMPAT
     ^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:197:2: note: expanded from ma=
cro '_PTHREAD_SWIFT_IMPORTER_NULLABILITY_COMPAT'
        defined(SWIFT_CLASS_EXTRA) && (!defined(SWIFT_SDK_OVERLAY_PTHREAD_E=
POCH) || (SWIFT_SDK_OVERLAY_PTHREAD_EPOCH < 1))
        ^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:537:6: warning: macro expansi=
on producing 'defined' has undefined behavior [-Wexpansion-to-defined]
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/pthread.h:197:34: note: expanded from m=
acro '_PTHREAD_SWIFT_IMPORTER_NULLABILITY_COMPAT'
        defined(SWIFT_CLASS_EXTRA) && (!defined(SWIFT_SDK_OVERLAY_PTHREAD_E=
POCH) || (SWIFT_SDK_OVERLAY_PTHREAD_EPOCH < 1))
                                        ^
In file included from ../disas/arm-a64.cc:25:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/a64/di=
sasm-a64.h:31:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/utils.=
h:31:
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:317:9: error: no member named 'signbit'=
 in the global namespace; did you mean 'sigwait'?
using ::signbit;
      ~~^
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develo=
per/SDKs/MacOSX11.1.sdk/usr/include/signal.h:101:5: note: 'sigwait' declare=
d here
int     sigwait(const sigset_t * __restrict, int * __restrict) __DARWIN_ALI=
AS_C(sigwait);
        ^
In file included from ../disas/arm-a64.cc:25:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/a64/di=
sasm-a64.h:31:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/utils.=
h:31:
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
In file included from ../disas/arm-a64.cc:25:
In file included from /opt/build/build/stage/qemu/disas/libvixl/vixl/a64/di=
sasm-a64.h:31:
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
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolch=
ain/usr/bin/../include/c++/v1/cmath:649:25: error: no template named 'numer=
ic_limits'
  return _FloatBigger ? numeric_limits<_IntT>::max() :  (numeric_limits<_In=
tT>::max() >> _Bits << _Bits);
                        ^
fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
230 warnings and 20 errors generated.
ninja: build stopped: subcommand failed.
make[1]: *** [run-ninja] Error 1
make: *** [all] Error 2


Let me down if I can provide something more useful!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918084

Title:
  Build fails on macOS 11.2.2

Status in QEMU:
  Triaged

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

