Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544072F3C6F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:39:25 +0100 (CET)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzSJw-0000rU-EA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzSIC-0008KE-NG; Tue, 12 Jan 2021 17:37:36 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:43072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzSIA-0007uF-AS; Tue, 12 Jan 2021 17:37:36 -0500
Received: by mail-io1-f48.google.com with SMTP id o6so64118iob.10;
 Tue, 12 Jan 2021 14:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=noqk+Sb/UL06hI2S/nBFRZVTfeqTybCMHrKTrvk+RuE=;
 b=Ot3X21w/luAsGtA5QYFM50X1fJAnqPzOWKnVhCiJg1DLkTzmb/CYEAP4dOdqUDu8xR
 esqGc8DXmZ+q/FhW0UsrJnFr1G/yTycVHUwNB8WNDTgt63SYDlvZ3goQ3jhLcc9n9BWd
 PiweMALR5lXv43yqCWCECZYRNa+ukcvjAlKXH/tID2QF5JLwgJTWc6puWPZOgAu2HCD6
 6U1TBiK9Z6weFmb1NU0k59DDoxoNo/3e39CX9cQkUL0TgGWgeyDslD+gUiyK8DkmwTzy
 cslRqzEByB1PlLv5TnpTkS5eI/XIvLgQRfbz+w6X+HpEwWgoNOhIt6hCAHA3EkrCpIH7
 qkPw==
X-Gm-Message-State: AOAM530JJ59X4LHjr4Z6yThmJdqh+xh+4LQYGSBJXNxtOUDFz8+W7Iqp
 mO7oOJIJAcZ5txLLQTPFvx09KKSUZf0=
X-Google-Smtp-Source: ABdhPJzDWWGpI/9B3pEAKzShLYNW6RauW9fRaKEbyMhEij6LjaR9jv3s04FOeQ5AeG9UmvX4XVP9PA==
X-Received: by 2002:a92:da49:: with SMTP id p9mr1379546ilq.236.1610491052066; 
 Tue, 12 Jan 2021 14:37:32 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id l78sm115063ild.30.2021.01.12.14.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:37:31 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id y19so158609iov.2;
 Tue, 12 Jan 2021 14:37:31 -0800 (PST)
X-Received: by 2002:a05:6638:e81:: with SMTP id
 p1mr1651155jas.120.1610491051051; 
 Tue, 12 Jan 2021 14:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-4-j@getutm.app>
 <CAFEAcA9jvjN7hqxiOVY9vbN5=DdqGhCjCWipqBx7cWmTchxZXw@mail.gmail.com>
In-Reply-To: <CAFEAcA9jvjN7hqxiOVY9vbN5=DdqGhCjCWipqBx7cWmTchxZXw@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 12 Jan 2021 14:37:00 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCkk8XoFCgr1jV4KLCZP=PHTkECLdRGogpYbiN5bwEREw@mail.gmail.com>
Message-ID: <CA+E+eSCkk8XoFCgr1jV4KLCZP=PHTkECLdRGogpYbiN5bwEREw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] qemu: add support for iOS host
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.48; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 7:03 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 5 Jan 2021 at 02:25, Joelle van Dyne <j@getutm.app> wrote:
> >
> > This introduces support for building for iOS hosts. When the correct Xcode
> > toolchain is used, iOS host will be detected automatically.
> >
> > * block: disable features not supported by iOS sandbox
> > * slirp: disable SMB features for iOS
> > * osdep: disable system() calls for iOS
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  docs/devel/index.rst    |  1 +
> >  docs/devel/ios.rst      | 28 +++++++++++++++++++++++++++
> >  configure               | 43 ++++++++++++++++++++++++++++++++++++++++-
> >  meson.build             |  2 +-
> >  include/qemu/osdep.h    | 11 +++++++++++
> >  block.c                 |  2 +-
> >  block/file-posix.c      | 31 +++++++++++++++++------------
> >  net/slirp.c             | 16 +++++++--------
> >  qga/commands-posix.c    |  6 ++++++
> >  MAINTAINERS             |  7 +++++++
> >  tests/qtest/meson.build |  7 +++----
> >  11 files changed, 127 insertions(+), 27 deletions(-)
> >  create mode 100644 docs/devel/ios.rst
> >
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> > index f10ed77e4c..2cc8a13ebe 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -35,3 +35,4 @@ Contents:
> >     clocks
> >     qom
> >     block-coroutine-wrapper
> > +   ios
> > diff --git a/docs/devel/ios.rst b/docs/devel/ios.rst
> > new file mode 100644
> > index 0000000000..b4ab11bec1
> > --- /dev/null
> > +++ b/docs/devel/ios.rst
> > @@ -0,0 +1,28 @@
> > +===========
> > +iOS Support
> > +===========
> > +
> > +To run qemu on the iOS platform, some modifications were required. Most of the
>
> QEMU is upper-cased.
>
> > +modifications are conditioned on the ``CONFIG_IOS`` and configuration variable.
> > +
> > +Build support
> > +-------------
> > +
> > +For the code to compile, certain changes in the block driver and the slirp
> > +driver had to be made. There is no ``system()`` call, so it has been replaced
> > +with an assertion error. There should be no code path that call system() from
>
> "calls"
>
> > +iOS.
> > +
> > +``ucontext`` support is broken on iOS. The implementation from ``libucontext``
> > +is used instead.
> > +
> > +JIT support
> > +-----------
> > +
> > +On iOS, allocating RWX pages require special entitlements not usually granted to
>
> "requires"
>
> > +apps. However, it is possible to use `bulletproof JIT`_ with a development
> > +certificate. This means that we need to allocate one chunk of memory with RX
> > +permissions and then mirror map the same memory with RW permissions. We generate
> > +code to the mirror mapping and execute the original mapping.
> > +
> > +.. _bulletproof JIT: https://www.blackhat.com/docs/us-16/materials/us-16-Krstic.pdf
> > diff --git a/configure b/configure
> > index 744d1990be..c1a08f0171 100755
> > --- a/configure
> > +++ b/configure
> > @@ -560,6 +560,19 @@ EOF
> >    compile_object
> >  }
> >
> > +check_ios() {
> > +  cat > $TMPC <<EOF
> > +#ifdef __APPLE__
> > +#import "TargetConditionals.h"
> > +#if !TARGET_OS_IPHONE
> > +#error TARGET_OS_IPHONE not true
> > +#endif
> > +#endif
> > +int main(void) { return 0; }
> > +EOF
> > +  compile_object
> > +}
> > +
> >  check_include() {
> >  cat > $TMPC <<EOF
> >  #include <$1>
> > @@ -602,7 +615,11 @@ elif check_define __DragonFly__ ; then
> >  elif check_define __NetBSD__; then
> >    targetos='NetBSD'
> >  elif check_define __APPLE__; then
> > -  targetos='Darwin'
> > +  if check_ios ; then
> > +    targetos='iOS'
> > +  else
> > +    targetos='Darwin'
> > +  fi
> >  else
> >    # This is a fatal error, but don't report it yet, because we
> >    # might be going to just print the --help text, or it might
>
> So here targetos=iOS and targetos=Darwin are separate things...
>
> > @@ -6974,6 +7012,9 @@ if test "$cross_compile" = "yes"; then
> >      if test "$linux" = "yes" ; then
> >          echo "system = 'linux'" >> $cross
> >      fi
> > +    if test "$darwin" = "yes" ; then
> > +        echo "system = 'darwin'" >> $cross
> > +    fi
>
> ...so why is this needed if we're not "darwin", but "iOS"...
iOS and macOS being treated the same works in 99% of the cases which
is why this patch is relatively small. For the 1% of time the two
systems behave differently, I added CONFIG_IOS. It's a bit of a hack,
but the alternative is to include <TargetConditionals.h> and check for
"TARGET_OS_IPHONE" (which is how it's usually done).

>
> >      case "$ARCH" in
> >          i386|x86_64)
> >              echo "cpu_family = 'x86'" >> $cross
> > diff --git a/meson.build b/meson.build
> > index 9a640d3407..ee333b7a94 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -181,7 +181,7 @@ if targetos == 'windows'
> >                                        include_directories: include_directories('.'))
> >  elif targetos == 'darwin'
> >    coref = dependency('appleframeworks', modules: 'CoreFoundation')
> > -  iokit = dependency('appleframeworks', modules: 'IOKit')
> > +  iokit = dependency('appleframeworks', modules: 'IOKit', required: 'CONFIG_IOS' not in config_host)
> >    cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
> >  elif targetos == 'sunos'
> >    socket = [cc.find_library('socket'),
>
> ...and here ios seems to be a subtype of darwin, not a different
> kind of targetos. That's a bit confusing. Maybe this is Meson's fault ?
Meson recognizes 'darwin' only for both macOS and iOS.

>
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index f9ec8c84e9..eb8d06cbf5 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -686,4 +686,15 @@ char *qemu_get_host_name(Error **errp);
> >   */
> >  size_t qemu_get_host_physmem(void);
> >
> > +/**
> > + * iOS does not support system() so we replace it with an assertion failure.
> > + */
> > +#ifdef CONFIG_IOS
> > +#define system ios_does_not_support_system
> > +static inline int ios_does_not_support_system(const char *command)
> > +{
> > +    assert(0);
> > +}
> > +#endif /* CONFIG_IOS */
> > +
> >  #endif
> > diff --git a/block.c b/block.c
> > index 8f177504d4..984a73a82c 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -54,7 +54,7 @@
> >  #ifdef CONFIG_BSD
> >  #include <sys/ioctl.h>
> >  #include <sys/queue.h>
> > -#ifndef __DragonFly__
> > +#if !defined(__DragonFly__) && !defined(CONFIG_IOS)
> >  #include <sys/disk.h>
> >  #endif
>
> Instead of extending this ifdef of OSes, can we add a meson.build
> test for "does sys/disk.h exist" and then use #ifdef HAVE_SYS_DISK_H ?
> (HAVE_PTY_H is probably a good example to crib from.)
Can be done.

>
> This is part of a general preference we have for not testing
> "are we building for host OS Foo" if we can test the specific
> property we care about instead.
>
> >  #endif
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index c34bb9fac1..9f556322e6 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -181,7 +181,17 @@ typedef struct BDRVRawReopenState {
> >      bool check_cache_dropped;
> >  } BDRVRawReopenState;
> >
> > -static int fd_open(BlockDriverState *bs);
> > +static int fd_open(BlockDriverState *bs)
> > +{
> > +    BDRVRawState *s = bs->opaque;
> > +
> > +    /* this is just to ensure s->fd is sane (its called by io ops) */
> > +    if (s->fd >= 0) {
> > +        return 0;
> > +    }
> > +    return -EIO;
> > +}
> > +
> >  static int64_t raw_getlength(BlockDriverState *bs);
> >
> >  typedef struct RawPosixAIOData {
> > @@ -252,6 +262,12 @@ static int raw_normalize_devicepath(const char **filename, Error **errp)
> >  }
> >  #endif
> >
> > +#if defined(CONFIG_IOS)
> > +static int probe_logical_blocksize(int fd, unsigned int *sector_size_p)
> > +{
> > +    return -ENOTSUP; /* not supported on iOS */
> > +}
> > +#else /* CONFIG_IOS */
> >  /*
> >   * Get logical block size via ioctl. On success store it in @sector_size_p.
> >   */
> > @@ -284,6 +300,7 @@ static int probe_logical_blocksize(int fd, unsigned int *sector_size_p)
> >
> >      return success ? 0 : -errno;
> >  }
> > +#endif /* !CONFIG_IOS */
> >
> >  /**
> >   * Get physical block size of @fd.
> > @@ -2307,7 +2324,7 @@ again:
> >          }
> >          if (size == 0)
> >  #endif
> > -#if defined(__APPLE__) && defined(__MACH__)
> > +#if !defined(CONFIG_IOS) && defined(__APPLE__) && defined(__MACH__)
> >          {
> >              uint64_t sectors = 0;
> >              uint32_t sector_size = 0;
> > @@ -3543,16 +3560,6 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
> >  }
> >  #endif /* linux */
> >
> > -static int fd_open(BlockDriverState *bs)
> > -{
> > -    BDRVRawState *s = bs->opaque;
> > -
> > -    /* this is just to ensure s->fd is sane (its called by io ops) */
> > -    if (s->fd >= 0)
> > -        return 0;
> > -    return -EIO;
> > -}
> > -
> >  static coroutine_fn int
> >  hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
> >  {
> > diff --git a/net/slirp.c b/net/slirp.c
> > index 77042e6df7..8413042c09 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -27,7 +27,7 @@
> >  #include "net/slirp.h"
> >
> >
> > -#ifndef _WIN32
> > +#if !defined(_WIN32) && !defined(CONFIG_IOS)
> >  #include <pwd.h>
> >  #include <sys/wait.h>
> >  #endif
> > @@ -90,7 +90,7 @@ typedef struct SlirpState {
> >      Slirp *slirp;
> >      Notifier poll_notifier;
> >      Notifier exit_notifier;
> > -#ifndef _WIN32
> > +#if !defined(_WIN32) && !defined(CONFIG_IOS)
> >      gchar *smb_dir;
> >  #endif
> >      GSList *fwd;
>
> This sort of ifdeffery should probably also be changed to test
> what it really cares about rather than just adding another host OS
> type to the list.
I can refactor to test for SMB support and replace the host OS checks.

>
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index c089e38120..81e40ac14a 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
>
> Does it even make sense to build the guest agent for iOS ?
> It's not like you can run iOS inside QEMU...
Not currently no, but do we preclude the option?

>
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 6a67c538be..42b46a7ca4 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -46,12 +46,11 @@ qtests_i386 = \
> >    (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
> >    (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
> >    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
> > +  (not config_host.has_key('CONFIG_IOS') ? ['bios-tables-test', 'hd-geo-test'] : []) +      \
> >    qtests_pci +                                                                              \
> >    ['fdc-test',
> >     'ide-test',
> > -   'hd-geo-test',
> >     'boot-order-test',
> > -   'bios-tables-test',
> >     'rtc-test',
> >     'i440fx-test',
> >     'fuzz-test',
> > @@ -148,9 +147,9 @@ qtests_arm = \
> >     'boot-serial-test',
> >     'hexloader-test']
> >
> > -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
> > +# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional (except on iOS)
>
> So, why is bios-tables-test not something to run if we're building for iOS?
> If there's a good reason for the exclusion the comment should say what it is.
Actually this was left over from a previous version of the patch where
I excluded all tests that use system(). Now calling system() will just
fail the test so there's no reason to exclude these anymore.

-j

>
> >  qtests_aarch64 = \
> > -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
> > +  (cpu != 'arm' and not config_host.has_key('CONFIG_IOS') ? ['bios-tables-test'] : []) +        \
> >    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
> >    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
> >    ['arm-cpu-features',
> > --
> > 2.28.0
>
> thanks
> -- PMM

