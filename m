Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDE321982
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:57:04 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBhv-0001El-SN
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lEBfQ-00082f-VU
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:54:29 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lEBfO-0000Qz-2P
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:54:28 -0500
Received: by mail-oi1-x22d.google.com with SMTP id l3so14015138oii.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R6+yYm0C1zPQuRPPDqjyFhfV1kADZd9DS2XLA8lklLI=;
 b=AxU8O/dSIHmReCer238jdxbeMkbMNBrJfQqdpZMMFXXYhsSic/nlXz7vgDwWgNi2GV
 7mFsqobqp+r0VIBsqzjYSaM81DGL4diHn8MA3b6iFD6D7ceeCgSHlVtbd4Vk8CeDiDbc
 RspNTYaLCfDKU0G4B2GwRrr2wy2A+WZMMEbkhVqrrQrEyB3u2YChnxzEwrHLsSW81D1E
 KryOsWV50EBc1WDwavuX9UaTy/sOa6bO34/UzB7TGqfT7phTdQpCytqub+e4BKF7QliH
 9xcA1HKnyigtbeG+TgIhHKUzDu65ienHq/xE8vRy8M+2gywPWP3n6ARveJTC335fLc8y
 IEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R6+yYm0C1zPQuRPPDqjyFhfV1kADZd9DS2XLA8lklLI=;
 b=LFitnoDBGC+4msu1SZjBXNsb+Ey5oFVxtoWsrF+rewXr6Rq+yHjRp7ROqlzlUD5Q/y
 7s7k/XyNKs2M9nL8+FoKUuFStiX8q+kutwmEPHPSWbfF904zODq5Tw7R5uK2J5k0++bi
 tV9qIB7NY10TaouyjCJN2NnzWLSMnEc/hQmGF+smSmEubJqoR+yVY3BPfvuIcbTux8vt
 o32QoiUcexw0sz20vTULxQ1dneXdqDJnENefsQ9qe8j0P0zhkeMdAhBx3K9SHuadUk5s
 0IKhB+ztV9dTpxofDaJTXuSm9eem4daDd40D9paTa4+uRoHJLazWBADvCKm2kxf7jRaR
 lqIQ==
X-Gm-Message-State: AOAM5307nsw2fmpWJaKjRoFAdcg+UlE+nG7OTgGKeIsVFUQgjUexnQz8
 7XwurQWw0TMbZb4YJZUkW3fTlDbUJdEDLqNki9I=
X-Google-Smtp-Source: ABdhPJxYvaY36Ow1Z4pV0xeDeUWiyNFQQU6Ry+HIdkrNN49R0wNw/POx1wa3Xm5Z8SShQenf21Lpoy8tTDIURCf/lvE=
X-Received: by 2002:aca:bf0a:: with SMTP id p10mr16048320oif.97.1614002064493; 
 Mon, 22 Feb 2021 05:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20210221174510.22542-1-alxndr@bu.edu>
In-Reply-To: <20210221174510.22542-1-alxndr@bu.edu>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 22 Feb 2021 21:52:47 +0800
Message-ID: <CAKXe6S+uoebe+3toOPdGv03Muec6DPO5gev-R5FpFPUfAxTqEQ@mail.gmail.com>
Subject: Re: [PATCH v2] configure: fix --enable-fuzzing linker failures
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, Qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexander Bulekov <alxndr@bu.edu> =E4=BA=8E2021=E5=B9=B42=E6=9C=8822=E6=97=
=A5=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=881:48=E5=86=99=E9=81=93=EF=BC=9A
>
> With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=3Dfuzzer-no-link.
> This should allow us to build non-fuzzer binaries using objects
> instrumented for fuzzing. However, to do that, we also need to link with
> -fsanitize=3Dfuzzer-no-link. We were not doing that.
>
> Reported-by: Li Qiang <liq3ea@163.com>,
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Tested-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> v2: Fix a mistake in the added QEMU_LDFLAGS line
>
>  configure | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/configure b/configure
> index a79b3746d4..19f2b88589 100755
> --- a/configure
> +++ b/configure
> @@ -6096,7 +6096,17 @@ if test "$fuzzing" =3D "yes" ; then
>    # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and=
 the
>    # needed CFLAGS have already been provided
>    if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
> +    # Add CFLAGS to tell clang to add fuzzer-related instrumentation to =
all the
> +    # compiled code.
>      QEMU_CFLAGS=3D"$QEMU_CFLAGS -fsanitize=3Dfuzzer-no-link"
> +    # To build non-fuzzer binaries with --enable-fuzzing, link everythin=
g with
> +    # fsanitize=3Dfuzzer-no-link. Otherwise, the linker will be unable t=
o bind
> +    # the fuzzer-related callbacks added by instrumentation.
> +    QEMU_LDFLAGS=3D"$QEMU_LDFLAGS -fsanitize=3Dfuzzer-no-link"
> +    # For the actual fuzzer binaries, we need to link against the libfuz=
zer
> +    # library. Provide the flags for doing this in FUZZ_EXE_LDFLAGS. The=
 meson
> +    # rule for the fuzzer adds these to the link_args. They need to be
> +    # configurable, to support OSS-Fuzz
>      FUZZ_EXE_LDFLAGS=3D"-fsanitize=3Dfuzzer"
>    else
>      FUZZ_EXE_LDFLAGS=3D"$LIB_FUZZING_ENGINE"
> --
> 2.27.0
>
>

