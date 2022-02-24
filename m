Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A25B4C3676
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:03:00 +0100 (CET)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKKJ-0005MT-FH
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNKH9-0003By-4B
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:59:43 -0500
Received: from [2a00:1450:4864:20::330] (port=38757
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNKH7-0008EU-7r
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:59:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m13-20020a7bca4d000000b00380e379bae2so449589wml.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=STUJfwCstdG/0hHcm9tgwxIXL6YB8fGeJ0+W4UizBpE=;
 b=d0KxwnmGKTOvWnhVITaLgIvt4gMWCkvFWK1eXd50eAzWWFdEnoJUPVdCayMoS/BUjL
 +ZJ/84qnNmvBnEMFFJh3UCqrWQveFXUemuMEh8rphb7pByLRLu1c2e7xT7BJ1MN7ITLj
 TG6i9MdlfHZPnq5WUkD6sbrSrS+zkdMvdN+2ImUsgQjgFfu/V6xMYiSMsjmlCym7H1Go
 CeQTuIn799mSr0uT7V5WNrFi3j+RiMWBao6Y+XVw79r6tZX/DoYjVBDqlN/klK7ZOWxh
 +oqPqQO8Vpw3WfOen7KP/F08lhdygdABp4qU4NRZ7+sgLv7afC8onLXy6j/H6JeDU/DD
 CpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STUJfwCstdG/0hHcm9tgwxIXL6YB8fGeJ0+W4UizBpE=;
 b=N37pa5oF5cKYXxMXOciHPhk2kZUdrfKz/pdHyjqEIAHMvpP3eT6hA43OkEiucQi1I5
 MI+Z+VZH4vsyzQsHp3yQWKi/GNJH6ZfK4goR0rR0rrGx4Viohfj+gWsmm4uqUx7KVz86
 13ue0QCSilZp88q1nGhlGXS8tgfAMyX4T+3uNjsdJi+Pbg7/xGb7yXYNsjPrundTzU/f
 XiSpKmJIIzL7ZYagsxNn0J5veHHq2Qb6d8FLoenfbX202PNbhH26ilV8zOhAqMTCJi82
 xoqFiprkoOFd7nmD1NIrOm/Wg9bkczmEXNF9FYlxn43WWa6LeeCmhkfqfwmcyIIqOy2x
 /C1A==
X-Gm-Message-State: AOAM530t5vda7LbIde0hSGYegdpPmbs9ogzcMCrNs35Tx9hfaauRHqbw
 WppSHaDxkVXd1ph5P0keUY+AVcjB92NtT6Mse0s=
X-Google-Smtp-Source: ABdhPJwkpNgdLPhgwAItjxzXiDyKqq4RaWe9HKVO9Y1a+fDrj6Wm3CdUyVw35j+nHuIIkXej/krRO/0CBgG7RVvWpzM=
X-Received: by 2002:a05:600c:240b:b0:380:f424:f2be with SMTP id
 11-20020a05600c240b00b00380f424f2bemr7779086wmp.16.1645732779923; Thu, 24 Feb
 2022 11:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-7-marcandre.lureau@redhat.com>
 <98773975-c448-879a-eea6-58a7fe6a1707@linaro.org>
In-Reply-To: <98773975-c448-879a-eea6-58a7fe6a1707@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 24 Feb 2022 23:59:28 +0400
Message-ID: <CAJ+F1CJWKSoBhAdM4qYE8OTXJE03O798YdfwjO5dnRswCrzuOA@mail.gmail.com>
Subject: Re: [PATCH 06/12] Replace config-time define HOST_WORDS_BIGENDIAN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000be1df305d8c90577"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000be1df305d8c90577
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 24, 2022 at 11:41 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> >
> > Replace a config-time define with a compile time condition
> > define (compatible with clang and gcc) that must be declared prior to
> > its usage. This avoids having a global configure time define, but also
> > prevents from bad usage, if the config header wasn't included before.
> >
> > This can help to make some code independent from qemu too.
> >
> > gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
>
> Looks ok.  I'd like HOST_WORDS_BIGENDIAN to be poisoned, so that we're
> assured that we've
> caught all uses and new ones don't creep back in.
>
>
ack

--=20
Marc-Andr=C3=A9 Lureau

--000000000000be1df305d8c90577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 24, 2022 at 11:41 PM Ri=
chard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 2/24/22 08:36, <a href=3D"mailto:marcandre.lureau@r=
edhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Replace a config-time define with a compile time condition<br>
&gt; define (compatible with clang and gcc) that must be declared prior to<=
br>
&gt; its usage. This avoids having a global configure time define, but also=
<br>
&gt; prevents from bad usage, if the config header wasn&#39;t included befo=
re.<br>
&gt; <br>
&gt; This can help to make some code independent from qemu too.<br>
&gt; <br>
&gt; gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Looks ok.=C2=A0 I&#39;d like HOST_WORDS_BIGENDIAN to be poisoned, so that w=
e&#39;re assured that we&#39;ve <br>
caught all uses and new ones don&#39;t creep back in.<br>
<br></blockquote><div><br></div><div>ack</div><div>=C2=A0<br></div></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br><=
/div></div>

--000000000000be1df305d8c90577--

