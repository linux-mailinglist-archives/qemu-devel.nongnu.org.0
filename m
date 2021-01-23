Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC45F301811
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 20:56:19 +0100 (CET)
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3P17-0007Bf-R2
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 14:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3OyA-0006HP-M9
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 14:53:16 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3Oy6-0002vo-VD
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 14:53:14 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s11so10584740edd.5
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 11:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6HrHCOGbzwKhc+H/KQgosdVI/PW0UaTV4WMRPmUpwf0=;
 b=N/csazI2HuQwYmbRcVRknbunyjK8CMBQ0NE6lo9AcO+dEZ8cUhh+5i2Pfnl2EX9wxT
 CtkUgRj0W1w/tnv8nXNzY1Hpkvg/M3FrtJFDBprBZI3LzU9Yg6EEuJ2Gr+5EC6tlaDDl
 41ZC27ppHoaY8Zt+87q0ZryGoTUg+CkgiwCI8GhNMA7+QwnomHG3ds/qumrN7jFcTqde
 XPHmCoomNi/zOkby7I4ky8emp0vDJVTUWAVK2aNNLWgUxj+mFYTiqcpvHGhm0xi7mn29
 M8g/yBJLhgc1JWFrIUaoFemOq135KzMf/4yUs6eL3huvRXaGP4r0sOZcFprAlOrN+OpW
 De9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6HrHCOGbzwKhc+H/KQgosdVI/PW0UaTV4WMRPmUpwf0=;
 b=CYzcCF05+JN3N1wnJy25K4wKECjtl2iOLx2eClWtgmNJVGCZSW8PzxtHm608QnMe0x
 IWq7TOicYsrsWjuyDhXLyWmxo7zUineL9eoVCxwCjtBfVWBa93cHuvFfAAHmmMINoQZA
 m562iL3OqBcJ6B5LrouwvepzfUroh/uShi9TwpBexbjW7SGfk4xHjZ5JTACt5PnbOcn5
 Fwdfta01z9QS8ITucrQ96fehGHEHR5c4PE+XLkMZz9nxGoL0T2B/Fah+jYkcsKgh8Vel
 uMzl9hpTgujh7ETqBEQivvRTRM7vSXle50aqYLbes457fOQh4to41kRtm1tCASrDRlVZ
 ubUQ==
X-Gm-Message-State: AOAM5320xjUHQ5wV7BB0jqB2KMSkZ8Dg6nd4OjfPVWZBZPoDwAVgksH5
 St1Q55XGUtvNZB8THbsUTBiDMGeoYgVvO5BstytorQ==
X-Google-Smtp-Source: ABdhPJzqxPdaFo29PDheWVMP+Zp+xnN/pmmIR4Z6YY3QJC6mIFZ+j14qu0kjJyZNKHt+ZVRGDE80zJdxyk6wKtdqZuI=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr113250eds.204.1611431588426; 
 Sat, 23 Jan 2021 11:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2021 19:52:57 +0000
Message-ID: <CAFEAcA-2v9csPRBraXWNnnE67AhyRHMZNYJn6No0GUusMnwBRw@mail.gmail.com>
Subject: Re: [PULL 00/31] Misc patches for 2020-01-21
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Sat, 23 Jan 2021 at 14:36, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit fef80ea073c4862bc9eaddb6ddb0ed970b8ad7=
c4:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-01-20' i=
nto staging (2021-01-21 10:44:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to fc70d67e73e9cba950cf9d16281a78eb4ab6e4ce:
>
>   qemu-option: warn for short-form boolean options (2021-01-23 09:29:42 -=
0500)
>
> ----------------------------------------------------------------
> * Make MinGW respect --bindir (Joshua)
> * Switch MinGW to a "deep" installation (Joshua + NSIS fixes by myself)
> * Fix compilation errors/warnings (Qixin, Philippe)
> * Switch slirp to a subproject (Marc-Andr=C3=A9)
> * QemuOpts cleanups (myself)
> * Consistency improvements for -action (myself)
> * remove deprecated "change vnc TARGET" functionality (myself)
> * meson cleanups (Philippe, myself)
> * IDE out-of-bounds access (Prasad)
> * LA57 fix for -cpu max (Weijiang)

Fails to compile, OSX. There's an oddball "unable to rmdir"
warning immediately on git checkout, which may or may not be
related:

From git://git-us.linaro.org/people/pmaydell/qemu-arm
   e93c65a6c6..9bfe4825ae  staging    -> pmaydell/staging
warning: unable to rmdir 'slirp': Directory not empty
make: Entering directory '/Users/pm215/src/qemu-for-merges/build/all'
config-host.mak is out-of-date, running configure
Disabling PIE due to missing toolchain support
Submodule 'subprojects/libslirp'
(https://git.qemu.org/git/libslirp.git) registered for path
'subprojects/libslirp'
Cloning into '/Users/pm215/src/qemu-for-merges/subprojects/libslirp'...
cross containers  no

NOTE: guest cross-compilers enabled: cc
/usr/local/bin/ninja  build.ninja && touch build.ninja.stamp
[...]
ninja: no work to do.
/usr/local/bin/python3 -B
/Users/pm215/src/qemu-for-merges/meson/meson.py introspect --targets
--tests --benchmarks | /usr/local/bin/python3 -B scripts/mtest2make.py
> Makefile.mtest
[1/5915] Compiling C object
subprojects/libslirp/libslirp.0.dylib.p/src_ip_output.c.o
[2/5915] Compiling C object subprojects/libslirp/libslirp.0.dylib.p/src_ncs=
i.c.o
[3/5915] Compiling C object subprojects/libslirp/libslirp.0.dylib.p/src_mbu=
f.c.o
[4/5915] Compiling C object subprojects/libslirp/libslirp.0.dylib.p/src_mis=
c.c.o
[5/5915] Compiling C object
subprojects/libslirp/libslirp.0.dylib.p/src_slirp.c.o
FAILED: subprojects/libslirp/libslirp.0.dylib.p/src_slirp.c.o
cc -Isubprojects/libslirp/libslirp.0.dylib.p -Isubprojects/libslirp
-I../../subprojects/libslirp -I/usr/local/Cellar/glib/2.66.1/include
-I/usr/local/Cellar/glib/2.66.1/include/glib-2.0
-I/usr/local/Cellar/glib/2.66.1/lib/glib-2.0/include
-I/usr/local/opt/gettext/include -I/usr/local/Cellar/pcre/8.44/include
-Xclang -fcolor-diagnostics -pipe -Wall -Winvalid-pch -std=3Dgnu99 -O2
-g -m64 -mcx16 -DOS_OBJECT_USE_OBJC=3D0 -arch x86_64 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -fdiagnostics-color=3Dnever
-Werror -Wno-error=3Ddeprecated-declarations -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -fstack-protector-strong
'-DG_LOG_DOMAIN=3D"Slirp"' -MD -MQ
subprojects/libslirp/libslirp.0.dylib.p/src_slirp.c.o -MF
subprojects/libslirp/libslirp.0.dylib.p/src_slirp.c.o.d -o
subprojects/libslirp/libslirp.0.dylib.p/src_slirp.c.o -c
../../subprojects/libslirp/src/slirp.c
../../subprojects/libslirp/src/slirp.c:131:17: error: unused variable
'old_stat' [-Werror,-Wunused-variable]
    struct stat old_stat;
                ^
../../subprojects/libslirp/src/slirp.c:143:10: error: unused variable
'buff' [-Werror,-Wunused-variable]
    char buff[512];
         ^
2 errors generated.
[6/5915] Compiling C object subprojects/libslirp/libslirp.0.dylib.p/src_sbu=
f.c.o
[7/5915] Compiling C object
subprojects/libslirp/libslirp.0.dylib.p/src_ndp_table.c.o
[8/5915] Compiling C object
subprojects/libslirp/libslirp.0.dylib.p/src_socket.c.o
ninja: build stopped: subcommand failed.

thanks
-- PMM

