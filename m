Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D86136DD4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 14:20:27 +0100 (CET)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipuDB-0002LD-3i
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 08:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ipuCE-0001ur-K2
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 08:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ipuCD-0006Q5-7c
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 08:19:26 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45713)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ipuCC-0006MG-UY
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 08:19:25 -0500
Received: by mail-ot1-x344.google.com with SMTP id 59so1867580otp.12
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 05:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dXgZQlRBXdoPVaHCzFNqCY7Ia6IT0sg36Il/1y3LLgQ=;
 b=Csk1bf2AEo0AfhQ+t0mHTujDKIrXtDZrXcAROP9dl6KiTQJZVpim/3NmKDomgPyi0Y
 p788ex8vX8GNOE/4i7I1nh9A9hj1tNJaks6OAShqHIC0q3grVQm4E0ey5HqllL9OOFS9
 cCryWovYTf58nkFL27PEYEb0Z3zTIQwQ6RHbtLPvrx1yDcayhgHWpgbXNdHbvX6DiYKo
 Lyg3YuUCv2La7d65Gbvt/QQFiFzelXbm0lfnw4jQyiVc4ofr5rPOeScIys1OgPaoRbHW
 5SE7PtIkyBytAlzpNQCesp+EM40Wkh5iYZ/J/JAhBXTaY2ECPORNkIDCw+uUsaJM73bh
 cIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dXgZQlRBXdoPVaHCzFNqCY7Ia6IT0sg36Il/1y3LLgQ=;
 b=Z+/vpSgrnQJ8J679v42jIe1YnWNeBvUCNds7qlMSn9PxX86TYm9FzK3MUg5+rw09O0
 pMet7kOqoOSa+jpxQYLDJunKVcBQeFTrpf1zvuMzjk8BRFLpmZQ7R8G8DTP+teXyMwT8
 V0YYDrc+q6PgOcGuMeSiJTPZYk8Po6fyWRabCv8XWUxSmAAH0gcyvpDbUDtejMuI97lY
 FCpwKW0T8jncmCriDXZvQRo/tIVtrcLi2ENAWLfMUxFoBA2Gt1aBzVDi4h2LGWCqbcYz
 0Oqr/Y4a7VMFnrAbh3jIN5A+rbXSNOhQqWtaRUR7CI2lqvA0P7ACJHQDW+hp/oCEcAqk
 NMzw==
X-Gm-Message-State: APjAAAUQa2omSzf3ptyIYrmZYrdAn/ONmnlv3zfDNDZEB9b4NhgJJ8XM
 rtWRK38WtRi6yR2CCYdEIsd8Q5HwU1LflRfWjTlPag==
X-Google-Smtp-Source: APXvYqxdqetZ5baW2ZC7giOEKyamP2yqF/s8JGUL3MBrlXAVqSmb20qou7wuBw3Ohv5wMqKAc+854322D2C3NZX2TzI=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr2583594otd.91.1578662364047; 
 Fri, 10 Jan 2020 05:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20200110112725.689401-1-marcandre.lureau@redhat.com>
In-Reply-To: <20200110112725.689401-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2020 13:19:13 +0000
Message-ID: <CAFEAcA9rrNPTTWRze34Wy+3zVgPrgM41qeSuamCF3_bKBLpAnQ@mail.gmail.com>
Subject: Re: [PATCH] configure: check for gdbus-codegen presence
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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

On Fri, 10 Jan 2020 at 11:27, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Some distros ship gdbus-codegen separately for gio headers/pc...
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/configure b/configure
> index 0ce2c0354a..28ee2a254f 100755
> --- a/configure
> +++ b/configure
> @@ -3702,6 +3702,9 @@ if $pkg_config --atleast-version=3D$glib_req_ver gi=
o-2.0; then
>      gio_cflags=3D$($pkg_config --cflags gio-2.0)
>      gio_libs=3D$($pkg_config --libs gio-2.0)
>      gdbus_codegen=3D$($pkg_config --variable=3Dgdbus_codegen gio-2.0)
> +    if [ ! -x "$gdbus_codegen" ]; then
> +        gdbus_codegen=3D
> +    fi
>  else
>      gio=3Dno
>  fi
> --
> 2.25.0.rc1.20.g2443f3f80d.dirty

Thanks; applied to master as a buildfix.

-- PMM

