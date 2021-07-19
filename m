Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD683CCBDE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 02:55:21 +0200 (CEST)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5HZ2-0008Qz-5I
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 20:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m5HXZ-0007lS-Km
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 20:53:49 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m5HXX-0003GN-Fy
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 20:53:49 -0400
Received: by mail-oi1-x22a.google.com with SMTP id r80so5110840oie.13
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 17:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vn4HAwUhf5/Y6EC2a3KSAMl8TrrVHx01KHpMwJE/5Ss=;
 b=Toajm7R0YrJIANROVlvX7ZXBJeBhfIV6lGQKIWyOTBHBQIHsDlCR/j7bR6gtL+Itgg
 8SwkJwSCOXeZrpELyVGXPhCx7l/akJc1Otvr6FU6i5nkcZPwmS1sMG6bD17dIAYJcXrd
 PVqQV59pxyGUSJtsV/ih2mNAeNqz/ju9bzKKaqi0KZUBDu7mcNU7TAgKRsAh/oR5WYkL
 LToLW57hLgR5YOJh93OiicbLH9GH7EQ30NkhnXDWjPj7WNayNle+g3rYaAzX1ChXCAgs
 O2hnbIPC/BaULm7gFJyMgltClb67/qFS6B+eN1m5q6qSEjjhjURV/NZEL4/EG+qg8/j8
 lEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vn4HAwUhf5/Y6EC2a3KSAMl8TrrVHx01KHpMwJE/5Ss=;
 b=VYbjI+lPNTaP4ppf6RiSZV+h73XSGFIYRgKbGv9OH4PvDqMpmCeeRGZmXsEzOX2QCq
 wNMqTIN8Zl2JKODbdFM/VLCiBwn39lqOORsVyhhsxJ/yF94GqwH60C2rWVFG1Eiw/Y6s
 swXbQIW3PTUBoZVe7XNKjA6muDZKE+DmvB5l8xMkbyAE+quDgcw1kUeMI3j0F7iIsrke
 vPZATrph9nkfMgZoTsKJP69a++8GD4OkgMOg53cv+IDjbNtPVWaH2Si/lpuduhLXFoCA
 1uU+YGeJB2K0iBi1mBmbACXssjHJifdfTV0tbvtdAV043caCLt8y39hXZUl03cRKOcU3
 ewkA==
X-Gm-Message-State: AOAM53381kVw2K+zcLM3znGdA5KezW4z4iMaTythQNQbNJ+Kl+uDe9Nr
 oKrl6nfvis2l8qNxnxu6E/eVUA==
X-Google-Smtp-Source: ABdhPJydA3uc2T/YObkABuRSrJITdhI5NZAtFsh5cFGJaMjYE93EvCHitLa9609eAbDhWzQg2mtd1Q==
X-Received: by 2002:aca:aac4:: with SMTP id t187mr20328576oie.93.1626656025144; 
 Sun, 18 Jul 2021 17:53:45 -0700 (PDT)
Received: from ?IPv6:2607:fb90:e6d7:24cf:6680:99ff:fe6f:cb54?
 ([2607:fb90:e6d7:24cf:6680:99ff:fe6f:cb54])
 by smtp.gmail.com with ESMTPSA id x129sm3473304oia.26.2021.07.18.17.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 17:53:44 -0700 (PDT)
Subject: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
To: Brian Cain <bcain@quicinc.com>, Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
From: Rob Landley <rob@landley.net>
Message-ID: <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
Date: Sun, 18 Jul 2021 20:10:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22a;
 envelope-from=rob@landley.net; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.07, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 8:42 AM, Brian Cain wrote:
> If you don't mind binaries, there are x86_64 linux binary toolchains with lld
> on releases.llvm.org

I've never managed to run those binaries, because they're dynamically linked
against some specific distro I'm not using:

  $ bin/clang --help
  /lib/ld-linux-aarch64.so.1: No such file or directory

All the toolchains I build for distribution are statically linked on the host.
(Back in the day I even wrote a
https://github.com/landley/aboriginal/blob/master/sources/toys/ccwrap.c wrapper
to feed --nostdinc --nostdlib to gcc and build up all the includes again
manually to stop gcc from leaking random host context into the cross compilers,
but these days I use
https://github.com/landley/toybox/blob/master/scripts/mcm-buildall.sh with Rich
Felker's musl-cross-make to create statically linked cross and native musl
toolchains which I would happily post binaries of if they weren't GPLv3 and thus
non-distributable. Oh well.)

Vaguely trying to make an llvm-buildall.sh for toybox, which might be a fourth
section to https://landley.net/toybox/faq.html#cross but first I'm trying to
make the hexagon-only one work based on your model. :)

> and there's also a binary hexagon-linux cross toolchain that
> we shared for use by kernel developers.  The hexagon linux
> toolchain is built on Ubuntu 16.04.

Where's that one?

> But when building your toolchain, omitting LLVM_ENABLE_LLD should work just fine.

It did, thanks.

Now I'm trying to figure out what all the extra CFLAGS are for.

The clang_rt build has CMAKE_ASM_FLAGS="-G0 -mlong-calls -fno-pic
--target=hexagon-unknown-linux-musl" which
https://clang.llvm.org/docs/ClangCommandLineReference.html defines as:

-G<size>
  Put objects of at most <size> bytes into small data section (MIPS / Hexagon)

-mlong-calls
  Generate branches with extended addressability, usually via indirect jumps.

I don't understand why your libcc build needs no-pic? (Are we only building
a static libgcc.a instead of a dynamic one? I'm fine with that if so, but
this needs to be specified in the MAKE_ASM_FLAGS why?)

Why is it saying --target=hexagon-random-nonsense-musl to a toolchain
we built with exactly one target type? How does it NOT default to hexagon?
(Is this related to the build writing a hexagon-potato-banana-musl.cfg file
in the bin directory, meaning the config file is in the $PATH? Does clang only
look for it in the same directory the clang executable lives in?)

And while we're at it, the CONTENTS of hexagon-gratuitous-gnu-format.cfg is:

cat <<EOF > hexagon-unknown-linux-musl.cfg
-G0 --sysroot=${HEX_SYSROOT}
EOF

Which is ALREADY saying -G0? (Why does it want to do that globally? Some sort of
bug workaround?) So why do we specify it again here?

Next up build_musl_headers does CROSS_CFLAGS="-G0 -O0 -mv65 -fno-builtin
-fno-rounding-math --target=hexagon-unknown-linux-musl" which:

-O0
  disable most of the optimizer

-mv65
  -mtune for a specific hexagon generation.
  (Why? Does qemu only support that but not newer?)

-fno-builtin
  musl's ./configure already probes for this and will add it if
  the compiler supports it.

-fno-rounding-math
  the docs MENTION this, but do not explain it.

And again with the -G0.

These flags probably aren't needed _here_ because this is just the headers
install (which is basically a cp -a isn't it?). This looks like it's copied
verbatim from the musl library build. But that library build happens in a bit,
so relevant-ish I guess...

(Also, why does building librt-but-not-really need the libc headers?
The libgcc build EXPLICITLY does not require that, because otherwise you
have this kind of BS circular dependency. Also, how do you EVER build a
bare metal ELF toolchain with that dependency in there?)

Next up build_kernel_headers has KBUILD_CFLAGS_KERNEL="-mlong-calls" which
again, A) why does the compiler not do by default, B) can't be needed here
because you don't even have to specify a cross compiler when doing
headers_install. (I just confirmed this by diffing installs with an without a
cross compiler specified: they were identical. I remembered this from
https://github.com/torvalds/linux/commit/e0e2fa4b515c but checked again to be
sure.) Presumably this is more "shared with full kernel build".

And then build_musl, covered above under the headers build: lotsa flags, not
sure why.

> -Brian
> 

Rob

P.S. It took me a while to figure out that clang_rt is NOT librt.a, I think it's
their libgcc? Especially confusing since librt.a has existed for decades and
was on solaris before it was on linux, and the OBVIOUS name is libcc
the same way "cc" is the generic compiler name instead of "gcc".
(In fact that was the posix compiler name until they decided to replace
it with "c99" and everybody ignored them the way tar->pax was ignored,
largely because make's $CC defaults to "cc" so it Just Works, and yes
the cross compiler should have that name but the prepackaged clang tarball
above does not. *shrug* I fix that up when making my prefix symlinks. The
android NDK guys at least have the excuse of shipping NINE different
x86_64-linux-android*-clang with API version numbers and thus not wanting to
pick a default to single out, so leave making the -cc link as an exercise for
the reader. I give instructions for doing so on the toybox cross compiling page
I linked above. :)

