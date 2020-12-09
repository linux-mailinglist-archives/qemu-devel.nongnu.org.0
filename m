Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9592D4447
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:29:13 +0100 (CET)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0Su-0006UO-9K
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn0Gm-00008q-Gz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:16:45 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn0Gj-0007oO-3N
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:16:40 -0500
Received: by mail-ed1-x52f.google.com with SMTP id cw27so1723248edb.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovVi1hhNrCT56RZxcftqbuFzsMv61859obz5NhFJ3TE=;
 b=eWV7jtSn0yAjTdk537AuLqm9j1xwrOTIBkOPTwY1xFl2OWWIzJ3n2rY7GyooAWHCeB
 cKB9Zatf5CMrgnsYWp77V8PTOfdhhgnmGsQdmbu8U9tw9npbxDrWB07QbGqhDFAx/+Iw
 z0Fp1HEFyOHwKEY9nfEmD4MCoqFNyCJ9hiMczMqsgPeDMMkIBmauhgjNF2MMQE6DPzbW
 wOL0MbVKO2GdeIMttKbOFemdQ9eMbvAkcNDIcJ/2KMGeDelCWoFLh6AQfS4eKNqIGWOQ
 FkVP8sQR2QMc7gMQ91j48XTnmKtcOZWiXQhBXaFPHLdXlxsHrboiFijbmlgqCfCf4aNW
 PO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovVi1hhNrCT56RZxcftqbuFzsMv61859obz5NhFJ3TE=;
 b=cXyHm+gdKJFPDvHvo8zSi9ZPaFaak4Sx+6anBYGkdvGyTz7uLFDzxvMt1xd2kSDW0I
 H8s5TZ0bLax397oKL8FGevTqI19LCWRya98GPVeEY2bev5h5Pao7b8avoswNnH9drOVp
 iF3H+/ndVODmR0sEddCqw6YZ++4QVyQgqv8UoI1aHtl8I/SXenvmjZDjG4H2qapBI5wA
 gNV4HbU+420pcwbwfdj3GDskeIO+T0cHH1jIgF3RDGH739H7sVzA5cvs7SZHvtYNbgr+
 ZWWl0+OJAS6oBFUxm8Aq7/uveN6ooAWM2HkFdKy8Hkw3JyQeZPOvjv4ciQW9/Z7kvuYN
 lkVw==
X-Gm-Message-State: AOAM531ehK0dQSbqfoJyc27FOU6G8YiVC8QKZrvB7UkKV1D4VdE11QXx
 Sb96Naple8yozKsACBpESjrfJzdWLjWsbvraP/EPxA==
X-Google-Smtp-Source: ABdhPJwF+XZQOgKgA1wCU88cxr84Bg2G/VqbT1FfX78odTJfu4e7lP97LOumGm2Ye0V1G+eyItmX0NemQmrOhWXRdO0=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2206364edr.204.1607523395242; 
 Wed, 09 Dec 2020 06:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20201202080849.4125477-1-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2020 14:16:24 +0000
Message-ID: <CAFEAcA_YLhua76h0SJN4EgVdtWonpd19GFVGLiLVto3S45miJQ@mail.gmail.com>
Subject: Re: [PULL 000/113] First batch of misc (i386, kernel-doc, memory,
 vl.c) changes for QEMU 6.0
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Dec 2020 at 08:17, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 944fdc5e27a5b5adbb765891e8e70e88ba9a00ec:
>
>   Merge remote-tracking branch 'remotes/elmarco/tags/libslirp-pull-request' into staging (2020-11-27 17:09:55 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 3e2a7a449bd4ebf90550ca51d57bc17227f19013:
>
>   scripts: kernel-doc: remove unnecesssary change wrt Linux (2020-12-01 04:54:11 -0500)
>
> ----------------------------------------------------------------
> * Fix for NULL segments (Bin Meng)
> * Support for 32768 CPUs on x86 without IOMMU (David)
> * PDEP/PEXT fix and testcase (myself)
> * Remove bios_name and ram_size globals (myself)
> * qemu_init rationalization (myself)
> * Update kernel-doc (myself + upstream patches)
> * Propagate MemTxResult across DMA and PCI functions (Philippe)
> * Remove master/slave when applicable (Philippe)
> * WHPX support for in-kernel irqchip (Sunil)
>
> ----------------------------------------------------------------


Generates new warnings running 'make check' on a clang sanitizer build:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386 tests/qtest/bios-tables-test
--tap -k

Looking for expected file 'tests/data/acpi/pc/FACP'
Using expected file 'tests/data/acpi/pc/FACP'
Looking for expected file 'tests/data/acpi/pc/APIC'
[...]
PASS 2 qtest-i386/bios-tables-test /i386/acpi/q35
../../target/i386/kvm.c:4597:49: runtime error: member access within
null pointer of type 'X86CPU' (aka 'struct X86CPU')

Looking for expected file 'tests/data/acpi/microvm/FACP'
Using expected file 'tests/data/acpi/microvm/FACP'
Looking for expected file 'tests/data/acpi/microvm/APIC'
Using expected file 'tests/data/acpi/microvm/APIC'
Looking for expected file 'tests/data/acpi/microvm/DSDT'
Using expected file 'tests/data/acpi/microvm/DSDT'
PASS 3 qtest-i386/bios-tables-test /i386/acpi/microvm

(repeated for 2 other tests in bios-tables-test, and then again
for the x86-64 version of the test).

Also compile errors trying to build test-i386-bmi2:

make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
auto cc --cc gcc -i qemu/fedora-i386-cross -s
/home/petmay01/linaro/qemu-for-merges --   -Wall -O0 -g
-fno-strict-aliasing -m32
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c
-o test-i386-bmi2  -static
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:
In function 'main':
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
   38 | }
      | ^
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:38:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:
Assembler messages:
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:12:
Error: invalid instruction suffix for `pext'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:15:
Error: invalid instruction suffix for `pdep'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:18:
Error: invalid instruction suffix for `pext'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:21:
Error: invalid instruction suffix for `pdep'
Traceback (most recent call last):
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 709, in <module>
    sys.exit(main())
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 705, in main
    return args.cmdobj.run(args, argv)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 627, in run
    as_user=True)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 382, in run
    quiet=quiet)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.6/subprocess.py", line 311, in check_call
    raise CalledProcessError(retcode, cmd)

subprocess.CalledProcessError: Command '['docker', 'run', '--rm',
'--label', 'com.qemu.instance.uuid=a55882dc7c714411821263fb2c8159bf',
'-u', '1000', '-w',
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user',
'-v', '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user:/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user:rw',
'-v', '/home/petmay01/linaro/qemu-for-merges:/home/petmay01/linaro/qemu-for-merges:ro,z',
'qemu/fedora-i386-cross', 'gcc', '-Wall', '-O0', '-g',
'-fno-strict-aliasing', '-m32',
'/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c',
'-o', 'test-i386-bmi2', '-static']' returned non-zero exit status 1.
filter=--filter=label=com.qemu.instance.uuid=a55882dc7c714411821263fb2c8159bf
../Makefile.target:103: recipe for target 'test-i386-bmi2' failed
make[2]: *** [test-i386-bmi2] Error 1
make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:64:
recipe for target 'docker-build-guest-tests' failed
make[1]: *** [docker-build-guest-tests] Error 2
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:54:
recipe for target 'build-tcg-tests-i386-linux-user' failed
make: *** [build-tcg-tests-i386-linux-user] Error 2


thanks
-- PMM

