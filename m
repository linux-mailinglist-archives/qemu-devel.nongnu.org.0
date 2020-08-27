Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E7253B63
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 03:31:41 +0200 (CEST)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB6lQ-0006nt-HE
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 21:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kB6kA-0005hn-Nm; Wed, 26 Aug 2020 21:30:22 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kB6k9-0006RS-24; Wed, 26 Aug 2020 21:30:22 -0400
Received: by mail-ot1-x342.google.com with SMTP id x24so3150674otp.3;
 Wed, 26 Aug 2020 18:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nm4sEX9PdM7AiToWB48w4IbfSqGaxbKfFldJ+XehhfA=;
 b=bOz4aaUe1rLYmqY/AV36feC0oq1m7S00Ak37R/6DslKArNRBHuT8tTSCS14nZFIhwx
 A/HM8EuX1gl18pdbNMxFbI3LuUHRtb0DvFjlE1POt9a1C4Ye2NAoVoelGrGJtQFZDzFl
 1CNZ0AJm+OHRknBbcJOuvlQk0EbTnGJG1E2HxYw+wkOaE4nNfw0WsOWMF/jUQsUU0T3i
 yAydtzeVcogRGzUJ/K+BR4MxmekfHSLLd8BApv7GytosOGYpSIY3u1pwAmpSxIfuIpqX
 e8g243ILylNkxKSeIu+QUx5qrNMPN3XIuYg9uHNqgsoLvAwYw8+gXo4iWG3Bc7Fzkf/A
 YGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nm4sEX9PdM7AiToWB48w4IbfSqGaxbKfFldJ+XehhfA=;
 b=hz8HvsNP6P6BHEvxChqQ/6RQyiKREWmI1jOOmpX1pjO3uEccl15ITsbiy9ho99V/li
 Zcv2CA3nVo/SGX1wngGbzlhVngBSzHEO5gPU2qK4N9aqyVBkzDnKIvAlzzqISYQaRnAn
 Ibx+S/JUSmls2nfQRpE/0DkaB4HQoi94zId/eMzsrSlbc8heZPyfudnI9oekKGhQkbpt
 us1ebBDescdRgdPvonx9104yM5BwemVp0lIRQWQffIz4z3xPYu3rG0LW8rPI332VAjxt
 zTHPGJzaRFNMidVOfojsRTD7R7HigvcRdaHzpvC1L0RrFq+ceGF1/1AWY4MZcjDsdXBC
 G3+w==
X-Gm-Message-State: AOAM5318HWSrvkg7kQAgvwjlZt3FrAgkjYIta5JMGBBFp9Bx6IfaHkMR
 nawfaziaT+KubglcP8wsypHX6/fSshHPuGPLx50bfHWrv0c1gw==
X-Google-Smtp-Source: ABdhPJyVMJfCDUo4JCAE08O+NKpPRVV+CryD4tscgTQbr1S1quQZbJNcTI6Y4HrMawAFm27uvSAy0S3Z8Ovs3nAaf3I=
X-Received: by 2002:a9d:788:: with SMTP id 8mr4928722oto.181.1598491819506;
 Wed, 26 Aug 2020 18:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200826184334.4120620-1-ehabkost@redhat.com>
 <20200826184334.4120620-5-ehabkost@redhat.com>
In-Reply-To: <20200826184334.4120620-5-ehabkost@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 27 Aug 2020 09:29:43 +0800
Message-ID: <CAKXe6S+dJ8y4oWBA3Nc+vsx4_qOC9N7KQgVBSqebEJL+aRhEiw@mail.gmail.com>
Subject: Re: [PATCH 4/8] sclpconsole: Use TYPE_* constants
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8827=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:45=E5=86=99=E9=81=93=EF=BC=9A
>
> This will make future conversion to use OBJECT_DECLARE* easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/char/sclpconsole-lm.c | 2 +-
>  hw/char/sclpconsole.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
> index 2b5f37b6a2..5848b4e9c5 100644
> --- a/hw/char/sclpconsole-lm.c
> +++ b/hw/char/sclpconsole-lm.c
> @@ -355,7 +355,7 @@ static void console_class_init(ObjectClass *klass, vo=
id *data)
>  }
>
>  static const TypeInfo sclp_console_info =3D {
> -    .name          =3D "sclplmconsole",
> +    .name          =3D TYPE_SCLPLM_CONSOLE,
>      .parent        =3D TYPE_SCLP_EVENT,
>      .instance_size =3D sizeof(SCLPConsoleLM),
>      .class_init    =3D console_class_init,
> diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
> index 5c7664905e..d6f7da0818 100644
> --- a/hw/char/sclpconsole.c
> +++ b/hw/char/sclpconsole.c
> @@ -271,7 +271,7 @@ static void console_class_init(ObjectClass *klass, vo=
id *data)
>  }
>
>  static const TypeInfo sclp_console_info =3D {
> -    .name          =3D "sclpconsole",
> +    .name          =3D TYPE_SCLP_CONSOLE,
>      .parent        =3D TYPE_SCLP_EVENT,
>      .instance_size =3D sizeof(SCLPConsole),
>      .class_init    =3D console_class_init,
> --
> 2.26.2
>
>

