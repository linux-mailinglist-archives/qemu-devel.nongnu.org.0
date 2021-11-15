Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432544509CA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:38:34 +0100 (CET)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf03-0001I2-UD
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmeya-0000cE-KC
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:00 -0500
Received: from [2a00:1450:4864:20::32e] (port=42730
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmeyY-00057L-VQ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so280317wmd.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GFw+g2xUedEX8pG28zZ/4UhDi6aIJFVv6MSwVCG0eQs=;
 b=TkcdtP3jZ6p+pTXbzyFXJhuTfnjUxjqPAxlDFTL/20Li/B6n3lrXGW2kV9lG8PSQZ7
 fj0dol/xjktpngMLQS/MkgOpTlTSZRQQImfJ9pjo4/XgsrpxbYOSyBm6uV/PC4zD8CZQ
 BAx6xDLTxGRaI5yBpwINQ793QWndBcku0nzOcSYGhSbMl0JgrhQFjypi7KPdEy/h4JHn
 eJV8ROTE5rGXqOIqi+6TFBFPJXWwryhM6sl5VNGu9Ja3E/TjKeit50Nr3s1aF+FSpqg+
 ZdGh/U6+3qwdLqkoswEa3rl2OkfOhON+jDrGGANXcHOQ+8gnIB/i8cUW2m8lUGtqwuBi
 J9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GFw+g2xUedEX8pG28zZ/4UhDi6aIJFVv6MSwVCG0eQs=;
 b=rtMd/jjTau4qbu/p4Hm3JPY2z3Fmktw80bd9taxCMiMDGtlVBsbTDBDEQAZno7E37R
 yRApoqQD5DsRy1JDmIHEmj1WkL4UkU/B6zZhggJDQgkb4+TQ3epJlS7DtLatsEfrLb38
 gC0065RCggTukhXHWsMTFVf9dRMrod4IXL9Ylq6PNwF/546HBI4hFW/kObuoHzoJiL+t
 g4AGaUSp1H/gGaCTOOocWRTM9T1lsUss1z80bSf7fxdepxIxycQwDyuu9hlTXx309YIe
 Qe1yxC54dwjrkegAeh7EoQXHQ4AmkgHokyFurikgi6sxug5PFhyF5i8PEPWXH6RP0gzI
 TBQw==
X-Gm-Message-State: AOAM530uJqB8oJYmjBRVQXzAj/ohoW4jBuR9IKVFp9jdt9/H54aZpKd7
 O6KxLRZDKldENDEpCfu9P1v0bJ57qC1XiGvcV2KARQ==
X-Google-Smtp-Source: ABdhPJxAnqjLKz3fgV5EEy4iuAVJi0Ve0KDnF+NZUP2cj53n4y4sdVwIye+OcDHz1OIOue0aLbJ/gI1jgF0nir9xZHk=
X-Received: by 2002:a05:600c:3486:: with SMTP id a6mr13843wmq.32.1636994217284; 
 Mon, 15 Nov 2021 08:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-22-pbonzini@redhat.com>
In-Reply-To: <20211014162938.430211-22-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 16:36:46 +0000
Message-ID: <CAFEAcA8dxLqx4uXGRmhdWmP2aRXChk6gqO3t_RY54UVMHPEjWQ@mail.gmail.com>
Subject: Re: [PULL 21/26] configure, meson: move more compiler checks to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021 at 17:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130829.632254-15-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure        | 91 ------------------------------------------------
>  meson.build      | 44 +++++++++++++++++++++++
>  util/meson.build |  4 ++-
>  3 files changed, 47 insertions(+), 92 deletions(-)


> diff --git a/meson.build b/meson.build
> index 6bf43e6d30..6b7487b725 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1550,6 +1550,8 @@ config_host_data.set('CONFIG_INOTIFY',
>                       cc.has_header_symbol('sys/inotify.h', 'inotify_init=
'))
>  config_host_data.set('CONFIG_INOTIFY1',
>                       cc.has_header_symbol('sys/inotify.h', 'inotify_init=
1'))
> +config_host_data.set('CONFIG_IOVEC',
> +                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))
>  config_host_data.set('CONFIG_MACHINE_BSWAP_H',
>                       cc.has_header_symbol('machine/bswap.h', 'bswap32',
>                                            prefix: '''#include <sys/endia=
n.h>

Hi -- I've just noticed that this change breaks compilation for me,
because this test incorrectly fails to set CONFIG_IOVEC on a system
where the header defines 'struct iovec'. This seems to be because
"struct iovec" isn't a valid thing to test with has_header_symbol,
because it provokes a compiler error from clang.

The meson-log.txt shows:

Running compile:
Working directory:
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tm=
pfspzse_8
Command line:  clang-7 -m64 -mcx16
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tm=
pfspzse_8/testfile.c
-o /mnt/nvme
disk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpfspzse_8=
/output.obj
-c -fsanitize=3Dundefined -fno-sanitize=3Dshift-base -Werror
 -D_FILE_OFFSET_BITS=3D64 -O0 -Werror=3Dimplicit-function-declaration
-Werror=3Dunknown-warning-option -Werror=3Dunused-command-line-argument
-Werror=3Di
gnored-optimization-argument -std=3Dgnu11

Code:

        #include <sys/uio.h>
        int main(void) {
            /* If it's not defined as a macro, try to use as a symbol */
            #ifndef struct iovec
                struct iovec;
            #endif
            return 0;
        }
Compiler stdout:

Compiler stderr:
 /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/t=
mpfspzse_8/testfile.c:5:28:
error: extra tokens at end of #ifndef di
rective [-Werror,-Wextra-tokens]
            #ifndef struct iovec
                           ^
                           //
1 error generated.

...skipping...
            #ifndef struct iovec
                struct iovec;
            #endif
            return 0;
        }
Compiler stdout:

Compiler stderr:
 /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/t=
mpfspzse_8/testfile.c:5:28:
error: extra tokens at end of #ifndef r]
            #ifndef struct iovec
                           ^
                           //
1 error generated.

Header <sys/uio.h> has symbol "struct iovec" : NO


For comparison, with a gcc build the test works because gcc
happens to merely warn rather than fail for the syntax issue:

Running compile:
Working directory:
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/x86/meson-private/tmpidzeb=
j6t
Command line:  ccache gcc -m64 -mcx16
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/x86/meson-private/tmpidzeb=
j6t/testfile.c
-o /mnt/nvmedis
k/linaro/qemu-from-laptop/qemu/build/x86/meson-private/tmpidzebj6t/output.o=
bj
-c -D_FILE_OFFSET_BITS=3D64 -O0 -std=3Dgnu11

Code:

        #include <sys/uio.h>
        int main(void) {
            /* If it's not defined as a macro, try to use as a symbol */
 int main(void) { return 0; }

Compiler stdout:

Compiler stderr:
...skipping...
            #ifndef struct iovec
                struct iovec;
            #endif
            return 0;
        }
Compiler stdout:

Compiler stderr:
 /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/x86/meson-private/tmpidze=
bj6t/testfile.c:
In function 'main':
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/x86/meson-private/tmpidzeb=
j6t/testfile.c:5:28:
warning: extra tokens at end of #ifndef direcve
    5 |             #ifndef struct iovec
      |                            ^~~~~

Header <sys/uio.h> has symbol "struct iovec" : YES



-- PMM

