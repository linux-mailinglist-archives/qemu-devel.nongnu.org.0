Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA34341DE7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:13:34 +0100 (CET)
Received: from localhost ([::1]:38398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNEwX-0001DE-9k
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNEvL-0000Pl-90
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNEvD-0003lo-6F
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616159528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/UdEDOOLBeFrUxaAQ6n/LxdtVg3brfAtIj6VfaN8HNE=;
 b=Gx9GDEH3akFAtzgd2qr6/XL5cGn8uwehHkoTnU03jM8yFjgg4bckb0yHOL3H92Ft0O1KR5
 AfbCpklHWVw6bp/KvL47XcsOpamSkrOvAm5rcoOZt3MLWdduksjzjF+kcRRWixwvFzeeAG
 RRsw70R8EKgegZ9KQWKSJiuDVcHZCJM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-nq58U5u0NqeCz2t-ceyocA-1; Fri, 19 Mar 2021 09:12:06 -0400
X-MC-Unique: nq58U5u0NqeCz2t-ceyocA-1
Received: by mail-wm1-f72.google.com with SMTP id k132so2835472wma.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=/UdEDOOLBeFrUxaAQ6n/LxdtVg3brfAtIj6VfaN8HNE=;
 b=giSc6xJf8+fkAgkOJkPFsdDx1FVlCxU7dwoOqiyeHA1W/rWX2jzGOpNdrlPRPc+BqY
 h4vhmpzHbOvANv4W6D9apyBBen8a76KW1VkDJHI7IBD7Kt9AS+3ZpXCBZwNRYpECRfiy
 wQW1I2E5EbBTWhO3FztXMCgo9W5rnh6h0+xjDbNqsy5Plg9Hf+XtDlTb7FJejWxUd1XT
 +0Buf1TP4Y0t+6GTv3BwU6fR/lET/juVnT+ac9W89voCW7P4D+K7vetTMu7445q6GLu0
 vRbWOQUDOKoecsFqeibSLnEDL9jA3hfTNKXQfsCm0WeKhgqnapzFUBpELuMxc4fCW1QQ
 oUww==
X-Gm-Message-State: AOAM531uTiAKMzz1gOqPC5Y+HF5v/kBquTQITvIH06cUGWas8u8A6/rL
 tiHITjcFYFYA/3e2b8s37hYiNzRFEWeYdE8EH3ameMjyY+NE3Xhgys7QskyzX9Ctz8kfCtkrC5A
 Er1IMh8gdUtw0wAwM//vkfHGEjPZv/FTkRH68CNXBsHDyVreT75exDknI5RGXEZsO
X-Received: by 2002:a5d:5906:: with SMTP id v6mr4536543wrd.137.1616159524783; 
 Fri, 19 Mar 2021 06:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE0h91yyQ5zeQ8ahDKMpzGaaurb02gMUvmOZDZZHZoM6tytBdnEEJBAgcoxN0BNZqaeyCa8A==
X-Received: by 2002:a5d:5906:: with SMTP id v6mr4536500wrd.137.1616159524471; 
 Fri, 19 Mar 2021 06:12:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s9sm6597286wmh.31.2021.03.19.06.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:12:03 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: check-unit: GLib-ERROR **: 20:40:27.-147: GLib requires working
 CLOCK_MONOTONIC
Message-ID: <1428497d-5ee4-50c0-9f06-d490458338b4@redhat.com>
Date: Fri, 19 Mar 2021 14:12:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm seeing an odd "GLib-FATAL-ERROR: GLib requires working
CLOCK_MONOTONIC" error in the cross-i386-user job...

The runner console output is:

Running with gitlab-runner 13.9.0 (2ebc4dc4)
Using Docker executor with image
registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross:latest ...
Authenticating with credentials from job payload (GitLab Registry)
Pulling docker image
registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross:latest ...
Using docker image
sha256:b835431485e9c7a1522d04a653f4ca068fcc53af73f997d6aab9b9bfaf4a252a
for registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross:latest with
digest
registry.gitlab.com/philmd/qemu2/qemu/fedora-i386-cross@sha256:9e5c3c5c352bb83d89858991855115542d47fa091f9895755471ea7d122b2555
...
$ mkdir build
$ cd build
$ PKG_CONFIG_PATH=$PKG_CONFIG_PATH ../configure --enable-werror
$QEMU_CONFIGURE_OPTS --disable-system
No C++ compiler available; disabling C++ specific optional code
The Meson build system
Version: 0.55.3
Source dir: /builds/philmd/qemu2
Build dir: /builds/philmd/qemu2/build
Build type: native build
Using 'PKG_CONFIG_PATH' from environment with value: '/usr/lib/pkgconfig'
Using 'PKG_CONFIG_PATH' from environment with value: '/usr/lib/pkgconfig'
Project name: qemu
Project version: 5.2.50
C compiler for the host machine: cc (gcc 10.2.1 "cc (GCC) 10.2.1
20201125 (Red Hat 10.2.1-9)")
C linker for the host machine: cc ld.bfd 2.35-18
Host machine cpu family: x86_64
Host machine cpu: x86_64
../meson.build:10: WARNING: Module unstable-keyval has no backwards or
forwards compatibility and might not exist in future releases.
Program sh found: YES
Program python3 found: YES (/usr/bin/python3)
Program bzip2 found: YES
Program cgcc found: NO
Library m found: YES
Library util found: YES
Run-time dependency appleframeworks found: NO (tried framework)
Library aio found: NO
Found pkg-config: /usr/bin/pkg-config (1.7.3)
Using 'PKG_CONFIG_PATH' from environment with value: '/usr/lib/pkgconfig'
Run-time dependency zlib found: YES 1.2.11
Run-time dependency appleframeworks found: NO (tried framework)
Library rt found: YES
Run-time dependency libpng found: NO (tried pkgconfig)
Run-time dependency libjpeg found: NO (tried pkgconfig)
Has header "sasl/sasl.h" : NO
Run-time dependency libkeyutils found: NO (tried pkgconfig)
Checking for function "gettid" : YES
Run-time dependency fuse3 found: NO (tried pkgconfig)
Has header "linux/btrfs.h" : YES
Has header "libdrm/drm.h" : NO
Has header "pty.h" : YES
Has header "sys/ioccom.h" : NO
Has header "sys/kcov.h" : NO
Checking for function "system" : YES
Checking for function "preadv" : YES
Program scripts/minikconf.py found: YES
Configuring aarch64-linux-user-config-target.h using configuration
Configuring aarch64_be-linux-user-config-target.h using configuration
Configuring alpha-linux-user-config-target.h using configuration
Configuring arm-linux-user-config-target.h using configuration
Configuring armeb-linux-user-config-target.h using configuration
Configuring cris-linux-user-config-target.h using configuration
Configuring hexagon-linux-user-config-target.h using configuration
Configuring hppa-linux-user-config-target.h using configuration
Configuring i386-linux-user-config-target.h using configuration
Configuring m68k-linux-user-config-target.h using configuration
Configuring microblaze-linux-user-config-target.h using configuration
Configuring microblazeel-linux-user-config-target.h using configuration
Configuring mips-linux-user-config-target.h using configuration
Configuring mips64-linux-user-config-target.h using configuration
Configuring mips64el-linux-user-config-target.h using configuration
Configuring mipsel-linux-user-config-target.h using configuration
Configuring mipsn32-linux-user-config-target.h using configuration
Configuring mipsn32el-linux-user-config-target.h using configuration
Configuring nios2-linux-user-config-target.h using configuration
Configuring or1k-linux-user-config-target.h using configuration
Configuring ppc-linux-user-config-target.h using configuration
Configuring ppc64-linux-user-config-target.h using configuration
Configuring ppc64le-linux-user-config-target.h using configuration
Configuring riscv32-linux-user-config-target.h using configuration
Configuring riscv64-linux-user-config-target.h using configuration
Configuring s390x-linux-user-config-target.h using configuration
Configuring sh4-linux-user-config-target.h using configuration
Configuring sh4eb-linux-user-config-target.h using configuration
Configuring sparc-linux-user-config-target.h using configuration
Configuring sparc32plus-linux-user-config-target.h using configuration
Configuring sparc64-linux-user-config-target.h using configuration
Configuring x86_64-linux-user-config-target.h using configuration
Configuring xtensa-linux-user-config-target.h using configuration
Configuring xtensaeb-linux-user-config-target.h using configuration
Run-time dependency capstone found: NO (tried pkgconfig)
Configuring capstone-defs.h using configuration
Configuring config-host.h using configuration
Program scripts/hxtool found: YES
Program scripts/shaderinclude.pl found: YES
Program scripts/qapi-gen.py found: YES
Program scripts/qemu-version.sh found: YES
Run-time dependency threads found: YES
Program keycodemapdb/tools/keymap-gen found: YES
Program scripts/decodetree.py found: YES
Program nm found: YES
Program scripts/undefsym.py found: YES
Program scripts/feature_to_c.sh found: YES
Program qemu-keymap found: NO
Program sphinx-build-3 sphinx-build found: NO
Program python3 found: YES (/usr/bin/python3)
Program diff found: YES
Program dbus-daemon found: NO
Program initrd-stress.sh found: YES
Build targets in project: 246
qemu 5.2.50
  Directories
                   Install prefix: /usr/local
                   BIOS directory: share/qemu
                    firmware path: /usr/local/share/qemu-firmware
                 binary directory: bin
                library directory: lib
                 module directory: lib/qemu
                libexec directory: libexec
                include directory: include
                 config directory: /usr/local/etc
            local state directory: /usr/local/var
                 Manual directory: share/man
                    Doc directory: /usr/local/share/doc
                  Build directory: /builds/philmd/qemu2/build
                      Source path: /builds/philmd/qemu2
                   GIT submodules: ui/keycodemapdb
tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone
slirp
  Host binaries
                              git: git
                             make: make
                           python: /usr/bin/python3 (version: 3.9)
                     sphinx-build: NO
                      genisoimage:
  Configurable features
                    Documentation: NO
            system-mode emulation: NO
              user-mode emulation: YES
                      block layer: NO
                    Install blobs: YES
                   module support: NO
                   plugin support: NO
                  fuzzing support: NO
                   Trace backends: log
                    QOM debugging: YES
             vhost-kernel support: YES
                vhost-net support: YES
             vhost-crypto support: NO
               vhost-scsi support: YES
              vhost-vsock support: YES
               vhost-user support: NO
    vhost-user-blk server support: NO
            vhost-user-fs support: NO
               vhost-vdpa support: YES
                build guest agent: NO
  Compilation
                         host CPU: x86_64
                  host endianness: little
                       C compiler: cc
                  Host C compiler: cc
                     C++ compiler: NO
                          ARFLAGS: rv
                           CFLAGS: -O2 -g
                      QEMU_CFLAGS: -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv  -m32
-Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
                     QEMU_LDFLAGS: -Wl,--warn-common -Wl,-z,relro
-Wl,-z,now -m32  -m32 -fstack-protector-strong
                         profiler: NO
     link-time optimization (LTO): NO
                              PIE: YES
                     static build: NO
              malloc trim support: YES
                       membarrier: NO
                   preadv support: YES
                        fdatasync: YES
                          madvise: YES
                    posix_madvise: YES
                   posix_memalign: YES
                debug stack usage: NO
                  mutex debugging: NO
                 memory allocator: system
                avx2 optimization: YES
             avx512f optimization: NO
                    gprof enabled: NO
                             gcov: NO
                 thread sanitizer: NO
                      CFI support: NO
                   strip binaries: YES
                           sparse: NO
                  mingw32 support: NO
                       i386 tests: cc
                     x86_64 tests: cc
  Targets and accelerators
                      TCG support: YES
                      TCG backend: native (x86_64)
                TCG debug enabled: NO
                      target list: aarch64-linux-user
aarch64_be-linux-user alpha-linux-user arm-linux-user armeb-linux-user
cris-linux-user hexagon-linux-user hppa-linux-user i386-linux-user
m68k-linux-user microblaze-linux-user microblazeel-linux-user
mips-linux-user mips64-linux-user mips64el-linux-user mipsel-linux-user
mipsn32-linux-user mipsn32el-linux-user nios2-linux-user or1k-linux-user
ppc-linux-user ppc64-linux-user ppc64le-linux-user riscv32-linux-user
riscv64-linux-user s390x-linux-user sh4-linux-user sh4eb-linux-user
sparc-linux-user sparc32plus-linux-user sparc64-linux-user
x86_64-linux-user xtensa-linux-user xtensaeb-linux-user
  Block layer support
                coroutine backend: ucontext
                   coroutine pool: YES
  Crypto
                     TLS priority: "NORMAL"
                   GNUTLS support: YES
                        libgcrypt: NO
                           nettle: YES
                              XTS: YES
                     crypto afalg: NO
                         rng-none: NO
                    Linux keyring: YES
  Dependencies
                      SDL support: NO
                SDL image support: NO
                      GTK support: NO
                           pixman: NO
                      VTE support: NO
                    slirp support: NO
                         libtasn1: YES
                              PAM: NO
                    iconv support: NO
                   curses support: NO
                    virgl support: NO
                     curl support: NO
                Multipath support: NO
                      VNC support: YES
                 VNC SASL support: NO
                 VNC JPEG support: NO
                  VNC PNG support: NO
                   brlapi support: NO
                      vde support: NO
                   netmap support: NO
                Linux AIO support: NO
           Linux io_uring support: NO
               ATTR/XATTR support: YES
                     RDMA support: NO
                   PVRDMA support: NO
                      fdt support: auto
                libcap-ng support: NO
                    spice support: NO
                      rbd support: NO
                   xfsctl support: NO
                smartcard support: NO
                      U2F support: NO
                           libusb: NO
                    usb net redir: NO
                   OpenGL support: NO
                              GBM: NO
                 libiscsi support: NO
                   libnfs support: NO
                  seccomp support: NO
                GlusterFS support: NO
                      TPM support: YES
                   libssh support: NO
                      lzo support: NO
                   snappy support: NO
                    bzip2 support: NO
                    lzfse support: NO
                     zstd support: NO
                NUMA host support: NO
                          libxml2: NO
                         capstone: internal
                  libpmem support: NO
                libdaxctl support: NO
                          libudev: NO
                       FUSE lseek: NO
Found ninja-1.10.2 at /usr/bin/ninja
$ make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
/usr/bin/ninja  build.ninja && touch build.ninja.stamp
ninja: no work to do.
/usr/bin/meson introspect --targets --tests --benchmarks |
/usr/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
[1/2962] Compiling C object libcapstone.a.p/capstone_MCInstrDesc.c.o
[2/2962] Compiling C object libcapstone.a.p/capstone_MCRegisterInfo.c.o
[3/2962] Compiling C object libcapstone.a.p/capstone_MCInst.c.o
[4/2962] Compiling C object libcapstone.a.p/capstone_SStream.c.o
[5/2962] Compiling C object libcapstone.a.p/capstone_utils.c.o
...
[2959/2962] Compiling C object
tests/unit/ptimer-test.p/_builds_philmd_qemu2_hw_core_ptimer.c.o
[2960/2962] Linking target tests/fp/fp-bench
[2961/2962] Linking target tests/unit/ptimer-test
[2962/2962] Linking target tests/fp/fp-test
make: Nothing to be done for 'check-build'.
Running test check-block-qdict
(tests/unit/check-block-qdict:12531): GLib-ERROR **: 08:30:50.-401: GLib
requires working CLOCK_MONOTONIC
Running test check-qdict
Running test check-qnum
Running test check-qstring
(tests/unit/check-qnum:12536): GLib-ERROR **: 20:40:27.-147: GLib
requires working CLOCK_MONOTONIC
Running test check-qlist
(tests/unit/check-qstring:12540): GLib-ERROR **: 16:56:28.-902: GLib
requires working CLOCK_MONOTONIC
(tests/unit/check-qdict:12542): GLib-ERROR **: 02:28:11.-213: GLib
requires working CLOCK_MONOTONIC
(tests/unit/check-qlist:12544): GLib-ERROR **: 13:31:40.-914: GLib
requires working CLOCK_MONOTONIC
ERROR check-block-qdict - Bail out! GLib-FATAL-ERROR: GLib requires
working CLOCK_MONOTONIC
make: *** [Makefile.mtest:24: run-test-1] Error 1
make: *** Waiting for unfinished jobs....
ERROR check-qlist - Bail out! GLib-FATAL-ERROR: GLib requires working
CLOCK_MONOTONIC
ERROR check-qstring - Bail out! GLib-FATAL-ERROR: GLib requires working
CLOCK_MONOTONIC
make: *** [Makefile.mtest:48: run-test-4] Error 1
make: *** [Makefile.mtest:56: run-test-5] Error 1
ERROR check-qdict - Bail out! GLib-FATAL-ERROR: GLib requires working
CLOCK_MONOTONIC
make: *** [Makefile.mtest:32: run-test-2] Error 1
ERROR check-qnum - Bail out! GLib-FATAL-ERROR: GLib requires working
CLOCK_MONOTONIC
make: *** [Makefile.mtest:40: run-test-3] Error 1
ERROR: Job failed: exit code 1


