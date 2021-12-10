Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CF46FF00
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:49:55 +0100 (CET)
Received: from localhost ([::1]:55456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvdTO-0008Lo-0m
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvdRN-0007cs-P0
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:47:49 -0500
Received: from [2a00:1450:4864:20::32f] (port=43855
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvdRK-0008C8-NP
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:47:49 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so6294338wmc.2
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 02:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fG8oiNLY2NI87ku1TR1ryNNQlKhYgWZQKD9ARJrqSIE=;
 b=JoY57IylJ/1HMaglGmIQwfkaKDvFFj8fyInO/VV3hVy1cSE3EMxSxsrxaKlQs0A/v0
 1dv/AXrYUeH9rJSE0PO1S0TajHvNiqWnnCOEDJgMDCQXmMlrBhS78IEK21O28Tb5MD3j
 IOVTwtHzpFBAy3/8L0AehklD8/cQxI/26cxDfRoxdvtzKdbp9x5vjMChyjnSR8HsaeTQ
 prOk7I/Zhr0NFNY2f0Wv09elg+cUoGTLAVkezVt6+Dz/59m1S7oQPt0zE4VSAbP2YnJq
 DeiU3HCuQlnbwlAvDgmVbI8r5IE3/bOoB6qUyd1NFgz77UR6JIca9TPJtr5ft+tFo+86
 McYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fG8oiNLY2NI87ku1TR1ryNNQlKhYgWZQKD9ARJrqSIE=;
 b=GPAZewlQyRQSmw7AkZzdcXbAJ2CuAno8KAKoLcZ8lALhjBlrgQkznQa8tFpA9I2bT/
 2VRG4m5R8RZDDQ6aNqWrHoBN5rzW8MajlobjQt+iVS/cCcGttYNqCYJvI8kdSpmyM94A
 m5THpXaEh7DPYw8zgF+19MYvKf9lHYNfOyVSG2A2Er7m5EOO+poEBjmqoGfNC+5w220T
 v/CBrguUZccFnTyd9UiLUDRJkdValMHmBuikcZ8Qkwni8ebl+J1az34uGJJ7Medjirjs
 va6lS9inMC1U7C9KUwrhrICXpHri2+S6HU3O89Kf5BNkZTP4kE+/ITmy/DmTEVpx4fBC
 JL5Q==
X-Gm-Message-State: AOAM533eSXavfAOrV63oszPpFqe65kIsJjrS0m+Ckgn2cl1bjY6TonZC
 pzFUeAAtx+ShM5klnHoHZ/8s1Ip/iYijvrxdnGol3Q==
X-Google-Smtp-Source: ABdhPJxf6qQDCd5/CMZqSxaX6XQ7aaCBISuDe910CMts8YOAftDXxq3Gar/8rIjU0wBLX9rb1tvfVY50QXEims7VgDw=
X-Received: by 2002:a1c:96:: with SMTP id 144mr15819425wma.126.1639133264827; 
 Fri, 10 Dec 2021 02:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20211210084836.25202-1-pbonzini@redhat.com>
In-Reply-To: <20211210084836.25202-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 10:47:33 +0000
Message-ID: <CAFEAcA_Nh4ay7885nOnmA21d3Q2e1BE82zXHtmG6ResDxtYpXQ@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: use CONFIG_LINUX_USER, not CONFIG_LINUX
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Dec 2021 at 09:41, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The two more or less overlap, because CONFIG_LINUX is a requirement for Linux
> user-mode emulation.  However, CONFIG_LINUX is technically a host symbol
> that applies even to system emulation.  Defining CONFIG_LINUX_USER, and
> CONFIG_BSD_USER for eventual future use, is cleaner.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/tcg/configure.sh              | 8 +++++++-
>  tests/tcg/multiarch/Makefile.target | 2 +-
>  tests/tcg/x86_64/Makefile.target    | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 9ef913df5b..f859b61d90 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -225,8 +225,14 @@ for target in $target_list; do
>    echo "TARGET_NAME=$arch" >> $config_target_mak
>    echo "target=$target" >> $config_target_mak
>    case $target in
> -    *-linux-user | *-bsd-user)
> +    *-linux-user)
>        echo "CONFIG_USER_ONLY=y" >> $config_target_mak
> +      echo "CONFIG_LINUX_USER=y" >> $config_target_mak
> +      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
> +      ;;
> +    *-bsd-user)
> +      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
> +      echo "CONFIG_BSD_USER=y" >> $config_target_mak
>        echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak

I note that this is very subtly different from the logic
used in meson.build for setting CONFIG_LINUX_USER,
which uses "target.endswith('linux-user')" without the
leading hyphen...

Vaguely relatedly, gdbstub.c has some ifdefs:
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)

Is it possible for CONFIG_LINUX_USER to be defined when
CONFIG_USER_ONLY is not, or is the first clause in the #if
redundant?

thanks
-- PMM

