Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEF81613A4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 14:36:32 +0100 (CET)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3gZb-0007aZ-FK
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 08:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gXy-0005hd-0h
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:34:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gXw-0004sc-Ud
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:34:49 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:38602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gXw-0004rU-QA; Mon, 17 Feb 2020 08:34:48 -0500
Received: by mail-yw1-f66.google.com with SMTP id 10so7804382ywv.5;
 Mon, 17 Feb 2020 05:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kOIeXK5UnDls0eZbl5PI2vUsCXUJNGSzkBMIWnAo6Qs=;
 b=o8KKJE4IB6fIWm82WL7l5BMdsrJLxu/jBR+FKOno39P/OZITwS199GtuCTEcY1G2S0
 Pd8Lwqkt7HdVvxNw3ImYrU8iES1fZ7eBsaYLbAPtUQeCkMRFZZp0tLN5d6Wgyd3ZdcQs
 OTI9UcW1GJOk+hdibAl9SWLPhYNC8JG8Q2SFm0maRVwJuI5H+YtElTfHZzrljGJ0W3zn
 0EZo7xyFn1Vt8md9P+CoUg0tY8+qAvDhdNZusovIBlyBWX6nF/6DVzFqr69h8cwrELcs
 0CxcY2i+g1oCg9Pd0gpAvm63FzN52m+lXWnPnzbD0fS4ILkkGbWHS64dg9SF+7GAQ3T2
 SEjg==
X-Gm-Message-State: APjAAAVqmhQ7TUcZYNAMPHo7Tr7ssvitSdX1vzJhSUhtj4snO0+K0XDg
 foUUR01zYfu012KmaUnZHAltUeOu7Hihnz4fqfChT4N9uW4=
X-Google-Smtp-Source: APXvYqymrKkHcWD7yZG1zt3P7qa9+/mEYrs41oPWqy0RuLGRUxZ8b88OadVYXQLGZfhKAhktKNK3ExGWpiEDkzQLT3I=
X-Received: by 2002:a81:8443:: with SMTP id u64mr12354778ywf.443.1581946488040; 
 Mon, 17 Feb 2020 05:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20200217133327.25144-1-f4bug@amsat.org>
In-Reply-To: <20200217133327.25144-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 17 Feb 2020 14:34:37 +0100
Message-ID: <CAAdtpL5b6O4LX4gTHCWdrh2eaZeu2eQsA8+n81GZF_tMj9MVWw@mail.gmail.com>
Subject: Re: [PATCH v3] configure: Avoid compiling system tools on user build
 by default
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.66
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 17, 2020 at 2:33 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> User-mode does not need the system tools. Do not build them by
> default if the user specifies --disable-system.
>
> This disables building the following binaries on a user-only build:
>
> - elf2dmp
> - qemu-edid
> - qemu-ga
> - qemu-img
> - qemu-io
> - qemu-nbd
> - ivshmem-client
> - ivshmem-server
>
> The qemu-user binaries are not affected by this change.
>

I forgot to add:
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3:
> - fixed typos (Aleksandar)
> v2:
> - use simpler if/else statement (therefore not adding Richard R-b)
> - improved description (Aleksandar)
> ---
>  configure | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 6f5d850949..efe00dd497 100755
> --- a/configure
> +++ b/configure
> @@ -455,7 +455,7 @@ guest_agent_ntddscsi=3D"no"
>  guest_agent_msi=3D""
>  vss_win32_sdk=3D""
>  win_sdk=3D"no"
> -want_tools=3D"yes"
> +want_tools=3D""
>  libiscsi=3D""
>  libnfs=3D""
>  coroutine=3D""
> @@ -2213,6 +2213,16 @@ else
>      echo big/little test failed
>  fi
>
> +##########################################
> +# system tools
> +if test -z "$want_tools"; then
> +    if test "$softmmu" =3D "no"; then
> +        want_tools=3Dno
> +    else
> +        want_tools=3Dyes
> +    fi
> +fi
> +
>  ##########################################
>  # cocoa implies not SDL or GTK
>  # (the cocoa UI code currently assumes it is always the active UI
> --
> 2.21.1
>

