Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F85F2EEC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:40:19 +0200 (CEST)
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIry-0004de-Jc
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofIod-0000Y6-LZ
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:36:51 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofIob-0002as-Rt
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:36:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id hy2so21148706ejc.8
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ka5OYBnMt7AR2fv41XuoUKjcHrfJHPkQwKJlaNNL2Pg=;
 b=lMM8YOiEUnfEL30VKGBNb3libh9hG+dFS2YxXbLNyAikvwx0/x7AXa0Vsa34GWkZGl
 cfF0RKOEpEYhEZ7Naukurh7vj+H3G0BvrVnEWKTJt6zC1qo4JCIGGYjyhtVFdEZ58jS4
 iEzOuwKw6tgR8RyFFKwyy4FPYvwQ7c5BfP3SoBv4uPZyFlQc1BNZBvmmZvMyy+GviyYy
 3ud1AjqRakmbQCjsWNquR//J8RnoHHZIAJXuKfLQRsQcgyCBzWZaRubREnkV6V4XYfGK
 JU+Rotf+28BpRwy4OnMRU9MHR3/H8scOwuLnje/EZIyutAf+G4z/ds2qIBweJ/R0vtmT
 FO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ka5OYBnMt7AR2fv41XuoUKjcHrfJHPkQwKJlaNNL2Pg=;
 b=1E/7+Af4eV/H3WmHzAoOLYwI5fthnhzt1g/uyhsYybQ/bj5oMmc10NsKKBKQh4bQri
 sXcssbPp92LSDKDMi89/+vYDZwcdNdyYCHUA318hk5mpJaemDqKQQzlYXHBWBaAG2cC9
 +BmiqiMc0ZQbynK9uk5OhjN8Yg3GbAeSJ1fYL7hAqgGHTGzIJwSHcC0iWoFYd6QJWQJ/
 Tow6lKb1rFhvfE8M/izHVP8v4tzWEdsJ8mL8/WUNSUI2Ohzf6QtOnvw1/pS3jkwDmOCt
 Ty0SQXxyjn3NdF9pBbBefhyfQuOPhxdC15mCcnP7BFei+kQRJMUoex7diI+vJfldTwId
 HE7w==
X-Gm-Message-State: ACrzQf3orMmFGWxxL+qNlvxnCazAGLEyInCJiO4JgQYKiLNe4qW9ScFV
 /t5UpJ5WcFpFLEcnLlsJoaKCSArkr9O7Kpp1MpTjCQ==
X-Google-Smtp-Source: AMsMyM4SEsN+P6cZTdpA8WBV0xQ4BEGfH3KkS8qdNF/957rs2/xH54cGJ0A7VsYJsOWZJCmHKo8U7z8BlYpEXJ0WY4g=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr14364199ejb.609.1664793407930; Mon, 03
 Oct 2022 03:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
 <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
 <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
 <a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com> <87o7utnuzp.fsf@linaro.org>
 <CAFEAcA9YyN802x43+K27Hv1-rvkBbxE2r5sfxxahwmJtFAEP=Q@mail.gmail.com>
 <87k05hnr0f.fsf@linaro.org>
In-Reply-To: <87k05hnr0f.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Oct 2022 11:36:36 +0100
Message-ID: <CAFEAcA9ks8Hv3N9gp3BgVm+Nu7AM2KnHrbik9uE+MMvvgmX=rA@mail.gmail.com>
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-discuss@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Oct 2022 at 11:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 3 Oct 2022 at 10:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >>
> >> Thomas Huth <thuth@redhat.com> writes:
> >>
> >> > On 29/09/2022 04.32, Jason Wang wrote:
> >> >> On Thu, Sep 29, 2022 at 1:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@=
amsat.org> wrote:
> >> >>> Jason, Marc-Andr=C3=A9, could we improve the buildsys check or dis=
play
> >> >>> a more helpful information from the code instead?
> >> >> It looks to me we need to improve the build.
> >> >
> >> > I'm not sure there is anything to improve in the build system -
> >> > configure/meson.build are just doing what they should: Pick the
> >> > default value for "slirp" if the user did not explicitly specify
> >> > "--enable-slirp".
> >>
> >> Shouldn't it be the other way round and fail to configure unless the
> >> user explicitly calls --disable-slirp?
> >
> > Our standard pattern for configure options is:
> >  --enable-foo : check for foo; if it can't be enabled, fail configure
> >  --disable-foo : don't even check for foo, and don't build it in
> >  no option given : check for foo, decide whether to build in support if
> >                    it's present
>
> Don't we make a distinction between libs that are truly optional and
> those you probably need.

Yes. If something is truly mandatory then configure will always
fail. This is true for zlib and glib, for instance...

> It seems missing working networking is one of
> those things we should be telling the user about unless explicitly
> disabled. It is after all how we worked before, we would silently
> checkout libslirp and build it for you.

...but building without libslirp is perfectly reasonable for some
configurations, eg where you know you're going to be using QEMU
in a TAP network config, and you don't want to have libslirp in
your binary so you don't have to think about whether you need to
act on security advisories relating to it. "no slirp" isn't like
"no zlib", where you can't build a QEMU at all. I think it's more
like gtk support, where we will happily configure without gtk/sdl/etc
and only build in the VNC frontend -- that's a working configuration
in some sense, but for the inexperienced user a QEMU which doesn't
produce a GUI window is almost certainly not what they wanted.

So we could:
 * say that we will opt for consistency, and have the slirp
   detection behave like every other optional library
 * say that slirp is a special case purely because we used to
   ship it as a submodule and so users are used to it being present
 * say that slirp is a special case because it's "optional but
   only experts will want to disable it", and think about what
   other configure options (like GUI support) we might want to
   move into this category

I don't think there's an obvious right answer here...

thanks
-- PMM

