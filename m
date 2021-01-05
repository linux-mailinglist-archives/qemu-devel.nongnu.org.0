Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91F2EA7BA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:39:08 +0100 (CET)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwinz-0000d7-JQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwilz-0007vr-Je
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:37:03 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwilw-0005yH-Ud
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:37:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 3so2381481wmg.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 01:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9zD3UNLCXzf5pM47yCuk+waibP/ZZZjF9pirF7eE1CI=;
 b=Yds5QoO6dkO1I9wgdyxXXN29ZmgyyjA8k12qPwiryz9G9dx01mXNRhVQ/NjdPd4X1N
 f42sjQD54gfoJRKv3Yl7BI+CDxa9aLyTP7C/TF35xATHybR+u9uHkwmTwbtBT1JQfXm8
 DTHmh5PJ/9wkieKwgyFXlE8CDf4C3THZFES+sxUY9bdelNBmCP1lb7QVtDWNLCRVwOgl
 uSOhfUoVf1S8Ga5uwyk3LLQTjO5Unezl1Wj3dcDfCrszrrz/S+dIYrpsn616KrLJWgb2
 JTF4fJB7AqwQnK2g3df2xjkzUFXZKqkgH4pzv1WTLPShGLD20xT1yoe3KOKU3lcohX2T
 eI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9zD3UNLCXzf5pM47yCuk+waibP/ZZZjF9pirF7eE1CI=;
 b=TC4PpaIeJhGg1Roe/3m53jWc1CFwR45aIxSGD3Iq9GhVEiP0ZkNNs0g5jfeIWizK8+
 BDFA9DiqppKmUJDwxb2FzLx5Oz+TtlNkQyLPGwxVdgcVGyVMF3VV7KLAavPhUYr61NxP
 BFlZqI8XINVAZ63V6tddc7Yinwu33AX1m7REzd7Vtk4qEayyOweCbQbQPaJEh1DJFqng
 WzXiyz5WC91i7A21rXxZ6p9j0rf7rw/KhZ+tZkT/lWdZZjcWBffnbdoN0HcCNc4TFt5x
 FHc5QBCZ67L0XHWoVmV2VnQgkYjFBoWefMwz5/epklMj1UPNlANRWODi3V1V9Xp0LaRD
 Ad8A==
X-Gm-Message-State: AOAM531OnM4fAof8Xb0Es2D589U2eEyznroQFyfvHeYfQaEwd6u2xTKC
 ME6XX1thbuPEG1FkKvnLAQQ=
X-Google-Smtp-Source: ABdhPJxBmgF8UsbyLZ8Gr6tysSqOVf0Dc4HTiigfRRsppa9ZtiqAae/5L/AEtIO39CTq4WkVEn09mw==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr2674307wma.9.1609839419045;
 Tue, 05 Jan 2021 01:36:59 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id n189sm3313586wmf.20.2021.01.05.01.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 01:36:58 -0800 (PST)
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
 <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
 <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
Message-ID: <07a865e0-d535-9a19-cf29-f90984bcd510@amsat.org>
Date: Tue, 5 Jan 2021 10:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 6:39 PM, Philippe Mathieu-Daudé wrote:
> On 1/4/21 4:01 PM, Peter Maydell wrote:
>> On Mon, 4 Jan 2021 at 13:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> I don't have access to OSX host. I'll see to install an aarch32 chroot and
>>> keep testing (not sure what can differ from an i386 guest).
>>> If I can't find anything I'll resend the same series without the Loongson-3
>>> machine, which is the single part adding QOM objects.
>>
>> You might also try using valgrind/address-sanitizer/etc, which can
>> sometimes flag up this kind of bug on x86-64 even if by default
>> it happens to work.
> 
> On 32-bit I hit https://github.com/google/sanitizers/issues/954:
> 
> $ qemu-system-mips64el
> AddressSanitizer:DEADLYSIGNAL
> =================================================================
> ==18063==ERROR: AddressSanitizer: SEGV on unknown address 0xb7f20e40 (pc
> 0xb7f20e54 bp 0xbf86556c sp 0xbf86552c T16777215)
> ==18063==The signal is caused by a WRITE memory access.
>     #0 0xb7f20e53  (/lib/ld-linux.so.2+0x11e53)
>     #1 0xeb9b59  (/tmp/build/qemu-system-mips64el+0xa86b59)
>     #2 0xe9c1c2  (/tmp/build/qemu-system-mips64el+0xa691c2)
>     #3 0xb7f1e8ea  (/lib/ld-linux.so.2+0xf8ea)
>     #4 0xb7f0fcb9  (/lib/ld-linux.so.2+0xcb9)
> 
> AddressSanitizer can not provide additional info.
> SUMMARY: AddressSanitizer: SEGV (/lib/ld-linux.so.2+0x11e53)
> ==18063==ABORTING

Let's resume what I learned here before I forget.
I'll send corresponding patches later.


1/ glibc bug

Ubuntu 18.04 released on 20191114 (the one used in tests/vm/) is
affected. Release from 20201211.1 is fixed.

-- >8 --
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 47681b6f87d..608514b2d3e 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -24,9 +24,9 @@ DEFAULT_CONFIG = {
 class UbuntuX86VM(ubuntuvm.UbuntuVM):
     name = "ubuntu.i386"
     arch = "i386"
-    image_link="https://cloud-images.ubuntu.com/releases/bionic/"\
-               "release-20191114/ubuntu-18.04-server-cloudimg-i386.img"
-
image_sha256="28969840626d1ea80bb249c08eef1a4533e8904aa51a327b40f37ac4b4ff04ef"
+    image_link="https://cloud-images.ubuntu.com/releases/bionic/" \
+               "release-20201211.1/ubuntu-18.04-server-cloudimg-i386.img"
+
image_sha256="94b83507f1a963779b01310f56f7e9df3c04628afead878c9555bb61f17aafc1"
     BUILD_SCRIPT = """
         set -e;
         cd $(mktemp -d);
---


2/ Avoid rebuilding VM everytime

Brainless kludge:

-- >8 --
diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index e94d95ec541..224ed4c0d57 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -5,12 +5,12 @@
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)

 IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
-ifneq ($(GENISOIMAGE),)
+#ifneq ($(GENISOIMAGE),)
 IMAGES += ubuntu.i386 centos
 ifneq ($(EFI_AARCH64),)
 IMAGES += ubuntu.aarch64 centos.aarch64
 endif
-endif
+#endif

 IMAGES_DIR := $(HOME)/.cache/qemu-vm/images
 IMAGE_FILES := $(patsubst %, $(IMAGES_DIR)/%.img, $(IMAGES))
---

This is because if GENISOIMAGE is set by Meson, but the 'make
vm-build' rules don't use Meson... So the ubuntu/centos images
are trashed after each use because they are not marked .PRECIOUS.


3/ -Watomic-alignment on some 32-bit host (i386 at least)

There are plenty of atomic-alignment warnings on i386:

[139/675] Compiling C object softmmu.fa.p/softmmu_icount.c.o
In file included from ../softmmu/icount.c:31:
In file included from include/exec/exec-all.h:23:
In file included from ../target/mips/cpu.h:4:
In file included from ../target/mips/cpu-qom.h:23:
In file included from include/hw/core/cpu.h:23:
In file included from include/hw/qdev-core.h:5:
In file included from include/qemu/bitmap.h:16:
In file included from include/qemu/bitops.h:17:
include/qemu/atomic.h:463:12: warning: misaligned atomic operation may
incur significant performance penalty [-Watomic-alignment]
    return qatomic_read__nocheck(ptr);
           ^
include/qemu/atomic.h:129:5: note: expanded from macro
'qatomic_read__nocheck'
    __atomic_load_n(ptr, __ATOMIC_RELAXED)
    ^
include/qemu/atomic.h:473:5: warning: misaligned atomic operation may
incur significant performance penalty [-Watomic-alignment]
    qatomic_set__nocheck(ptr, val);
    ^
include/qemu/atomic.h:138:5: note: expanded from macro
'qatomic_set__nocheck'
    __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
    ^
2 warnings generated.
[...]

If I use '--extra-cflags=-Wno-atomic-alignment' I get:

ERROR: Your compiler does not support the __thread specifier for
       Thread-Local Storage (TLS). Please upgrade to a version
       that does.

So ignoring these warnings for now.


4/ libatomic on 32-bit hosts (i386, riscv32? arm?)

While compiling succeed, linking fails:

[850/2216] Linking target tests/test-hbitmap
FAILED: tests/test-hbitmap
clang  -o tests/test-hbitmap tests/test-hbitmap.p/test-hbitmap.c.o
tests/test-hbitmap.p/iothread.c.o -Wl,--as-needed -Wl,--no-undefined
-pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa
libio.fa -Wl,--no-whole-archive -Wl,--warn-common -fsanitize=undefined
-fsanitize=address -Wl,-z,relro -Wl,-z,now -m32 -ggdb
-fstack-protector-strong -Wl,--start-group libqemuutil.a
subprojects/libvhost-user/libvhost-user-glib.a
subprojects/libvhost-user/libvhost-user.a libblock.fa libcrypto.fa
libauthz.fa libqom.fa libio.fa @block.syms -lgio-2.0 -lgobject-2.0
-lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -pthread -lutil -lgnutls
-lm -lgthread-2.0 -lglib-2.0 /usr/lib/i386-linux-gnu/libglib-2.0.so
-liscsi -lgthread-2.0 -lglib-2.0 -laio -lcurl
/usr/lib/i386-linux-gnu/libz.so -lrbd -lrados -lnettle -lgnutls
-Wl,--end-group
libblock.fa(block_io.c.o): In function `stat64_max':
include/qemu/stats64.h:58: undefined reference to `__atomic_load_8'
include/qemu/stats64.h:60: undefined reference to
`__atomic_compare_exchange_8'
libblock.fa(block_qapi.c.o): In function `stat64_get':
include/qemu/stats64.h:40: undefined reference to `__atomic_load_8'
libqemuutil.a(util_qsp.c.o): In function `qatomic_set_u64':
include/qemu/atomic.h:478: undefined reference to `__atomic_store_8'
libqemuutil.a(util_qsp.c.o): In function `qatomic_read_u64':
include/qemu/atomic.h:468: undefined reference to `__atomic_load_8'
clang: error: linker command failed with exit code 1 (use -v to see
invocation)

Googling I found similar references on riscv32 and arm (not i386).
Without understanding much, I tried that snippet which made linking
succeed:

-- >8 --
diff --git a/meson.build b/meson.build
index 372576f82c5..1a5da5ee56b 100644
--- a/meson.build
+++ b/meson.build
@@ -161,6 +161,9 @@
   error('Multipath is supported only on Linux')
 endif

+if 'CONFIG_ATOMIC64' in config_host
+  atomic = cc.find_library('atomic', required: config_host['ARCH'] in
['i386', 'arm', 'riscv32'])
+endif
 m = cc.find_library('m', required: false)
 util = cc.find_library('util', required: false)
 winmm = []
@@ -1534,7 +1537,7 @@
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() +
stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m,
glib, socket, malloc])
+                             dependencies: [util_ss.dependencies(),
atomic, m, glib, socket, malloc])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
---


5/ DEADLYSIGNAL with Clang 6

Running test check-qstring
AddressSanitizer:DEADLYSIGNAL
=================================================================
==10041==ERROR: AddressSanitizer: SEGV on unknown address 0xb7f6be40 (pc
0xb7f6be54 bp 0xbff08ebc sp 0xbff08e7c T16777215)
==10041==The signal is caused by a WRITE memory access.
    #0 0xb7f6be53  (/lib/ld-linux.so.2+0x11e53)
    #1 0x5e26c9  (/build/tests/check-qstring+0x1156c9)
    #2 0x5c4d32  (/build/tests/check-qstring+0xf7d32)
    #3 0xb7f698ea  (/lib/ld-linux.so.2+0xf8ea)
    #4 0xb7f5acb9  (/lib/ld-linux.so.2+0xcb9)

$ clang -v
clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)

Using clang-10 works:

-- >8 --
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -18,7 +18,7 @@ import ubuntuvm
 DEFAULT_CONFIG = {
     'install_cmds' : "apt-get update,"\
                      "apt-get build-dep -y qemu,"\
-                     "apt-get install -y libfdt-dev language-pack-en
ninja-build",
+                     "apt-get install -y clang-10 libfdt-dev
language-pack-en ninja-build",
 }

 class UbuntuX86VM(ubuntuvm.UbuntuVM):
---


6/ LeakSanitizer: detected memory leaks

Apparently LeakSanitizer is only enabled by default on Linux
hosts, which is why Peter's OSX succeed:

Running test qtest-mips64el/display-vga-test
==9541==WARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!

=================================================================
==9541==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 4 byte(s) in 1 object(s) allocated from:
    #0 0xe82f75 in malloc
(/tmp/tmp.rYOegFC8Gl/build/qemu-system-mips64el+0xa0ef75)
    #1 0xb7adf4a8 in g_malloc
(/usr/lib/i386-linux-gnu/libglib-2.0.so.0+0x4e4a8)
    #2 0x3a870c0 in qemu_allocate_irqs hw/core/irq.c:66:12
    #3 0x1e5fafa in piix4_realize hw/isa/piix4.c:171:21
    #4 0xee0d52 in pci_qdev_realize hw/pci/pci.c:2125:9
    #5 0x3a79c69 in device_set_realized hw/core/qdev.c:761:13
    #6 0x33838ea in property_set_bool qom/object.c:2254:5
    #7 0x337b093 in object_property_set qom/object.c:1399:5
    #8 0x3392272 in object_property_set_qobject qom/qom-qobject.c:28:10
    #9 0x337c040 in object_property_set_bool qom/object.c:1469:15
    #10 0x3a6d628 in qdev_realize hw/core/qdev.c:389:12
    #11 0x3a6d685 in qdev_realize_and_unref hw/core/qdev.c:396:11
    #12 0xec73c2 in pci_realize_and_unref hw/pci/pci.c:2192:12
    #13 0xec7bc4 in pci_create_simple_multifunction hw/pci/pci.c:2200:5
    #14 0x1e5ecad in piix4_create hw/isa/piix4.c:245:11
    #15 0x2414e9d in mips_malta_init hw/mips/malta.c:1407:11
    #16 0x1ec1c82 in machine_run_board_init hw/core/machine.c:1169:5
    #17 0x310a8ab in qemu_init_board softmmu/vl.c:2455:5
    #18 0x3109eca in qmp_x_exit_preconfig softmmu/vl.c:2526:5
    #19 0x31150c9 in qemu_init softmmu/vl.c:3534:9
    #20 0xeb6bcc in main softmmu/main.c:49:5
    #21 0xb6c16f20 in __libc_start_main
(/lib/i386-linux-gnu/libc.so.6+0x18f20)

SUMMARY: AddressSanitizer: 4 byte(s) leaked in 1 allocation(s).
../tests/qtest/libqtest.c:172: kill_qemu() tried to terminate QEMU
process but encountered exit status 1 (expected 0)
ERROR qtest-mips64el/display-vga-test - too few tests run (expected 4,
got 0)
Makefile.mtest:897: recipe for target 'run-test-110' failed

We can ignore by passing ASAN_OPTIONS=detect_leaks=0 to the environment:

-- >8 ---
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 00f1d5ca8da..12ba39fcf2b 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -71,6 +71,7 @@ class BaseVM(object):
         "http_proxy",
         "ftp_proxy",
         "no_proxy",
+        "ASAN_OPTIONS",
     ]

     # The script to run in the guest that builds QEMU
---


7/ Reproducer, finally!

I could finally reproduce Peter's report with this command (and all
the previous snippet applied):

$ make vm-build-ubuntu.i386 EXTRA_CONFIGURE_OPTS='--extra-cflags=-ggdb
--disable-docs --disable-tools --enable-debug --cc=clang-10
--cxx=clang++-10 --enable-sanitizers' TARGET_LIST=mips64el-softmmu
DEBUG=1 ASAN_OPTIONS=detect_leaks=0
[...]
/mips64el/qom/loongson3-virt: ==9671==WARNING: ASan doesn't fully
support makecontext/swapcontext functions and may produce false
positives in some cases!
=================================================================
==9671==ERROR: AddressSanitizer: heap-buffer-overflow on address
0xacc001c8 at pc 0x023f47e2 bp 0xbfcdfad8 sp 0xbfcdfad0
WRITE of size 4 at 0xacc001c8 thread T0
    #0 0x23f47e1 in loongson3_virt_devices_init
hw/mips/loongson3_virt.c:420:19
    #1 0x23f1a75 in mips_loongson3_virt_init hw/mips/loongson3_virt.c:612:5
    #2 0x1e84c82 in machine_run_board_init hw/core/machine.c:1169:5
    #3 0x30cd8ab in qemu_init_board softmmu/vl.c:2455:5
    #4 0x30cceca in qmp_x_exit_preconfig softmmu/vl.c:2526:5
    #5 0x30d80c9 in qemu_init softmmu/vl.c:3534:9
    #6 0xe79bcc in main softmmu/main.c:49:5
    #7 0xb6c5af20 in __libc_start_main
(/lib/i386-linux-gnu/libc.so.6+0x18f20)
    #8 0xdce738 in _start (qemu-system-mips64el+0x997738)

0xacc001c8 is located 8 bytes to the right of 160-byte region
[0xacc00120,0xacc001c0)
allocated by thread T0 here:
    #0 0xe45f75 in malloc (qemu-system-mips64el+0xa0ef75)
    #1 0xb7b234a8 in g_malloc
(/usr/lib/i386-linux-gnu/libglib-2.0.so.0+0x4e4a8)
    #2 0x3332137 in object_new_with_class qom/object.c:737:12
    #3 0x30e3fbe in qemu_create_machine softmmu/vl.c:2008:31
    #4 0x30d7714 in qemu_init softmmu/vl.c:3469:5
    #5 0xe79bcc in main softmmu/main.c:49:5
    #6 0xb6c5af20 in __libc_start_main
(/lib/i386-linux-gnu/libc.so.6+0x18f20)

SUMMARY: AddressSanitizer: heap-buffer-overflow
hw/mips/loongson3_virt.c:420:19 in loongson3_virt_devices_init
Shadow bytes around the buggy address:
  0x3597ffe0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x3597fff0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x35980000: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
  0x35980010: 00 00 00 00 00 00 00 00 00 00 04 fa fa fa fa fa
  0x35980020: fa fa fa fa 00 00 00 00 00 00 00 00 00 00 00 00
=>0x35980030: 00 00 00 00 00 00 00 00 fa[fa]fa fa fa fa fa fa
  0x35980040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x35980050: 00 00 00 fa fa fa fa fa fa fa fa fa 00 00 00 00
  0x35980060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
  0x35980070: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
  0x35980080: 00 00 00 00 00 00 00 00 00 00 00 fa fa fa fa fa
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
  Shadow gap:              cc
==9671==ABORTING
Broken pipe
../tests/qtest/libqtest.c:172: kill_qemu() tried to terminate QEMU
process but encountered exit status 1 (expected 0)
Aborted (core dumped)

Regards,

Phil.

