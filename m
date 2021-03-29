Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B21634D664
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:56:57 +0200 (CEST)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQw8G-0006QW-5Z
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQw6M-0005Yv-Fp
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:55:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQw6I-0007if-LY
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:54:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id b7so20821080ejv.1
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jK8u2MEKo7ZGbGMhOhRKN9muTlo0LaQ1tz33NT7rDAM=;
 b=J4zYgyhRDdpO8ZtsJluO56y7Gb21i7pJ4ps6xmkcyFcdpDqhU6QsBSv9lqbpK/tgdp
 iTVlspL631jxOuojA1dWqeQu9AwdmvCAXjUuj3Yk4V0zy0FcU8gmWKt1ADv4UsP/krdX
 KILhCpZdPaIXWC7aR1XNKNG0CO/0z3RMDo6VGpUyA2iWbqhUDt4WWrQBWQNj6aJjIWq7
 p6NnMiRpgjDtFORvFnz+daITlVplJWK9VTGMB4y3pfXxdP8e66wu6G+0FUOtiGPUjeUT
 rs1qQJ1HH8nddQ8dLuJSKWi4medsTrm014w+AEKnXUEl+75yjWZ0FXZ5c9BN07O7gC1u
 5syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jK8u2MEKo7ZGbGMhOhRKN9muTlo0LaQ1tz33NT7rDAM=;
 b=Jl1vvNy5XUaVgTU69DaYCCqlZUf2m5/Z/NeeloN5oP0OS/OY1bfnB6Si7WfbP4fD6v
 GQAWTnAi0ffy+8nNfz0xN99qnjbefS6A1+9HwGRClX7S8+ukJ9kJIYsu/Sp8BkebbAEb
 +GA1MZ7nmPYNKyivIUhmzIBa5FN4Hb8julGcK3prVB3kNmgxdQSR9XIbNMHDAr/SVEEN
 lceFQY8/WTyiLgBek8LuE12wlqRqF59wDatMZwUCeitPxd2wuVmIdy8ncfphb7evMjOt
 X5Y+X1EBQdaGjmWs9kZXRCL+ef3vardBCN/1Pz979NTHcEQKf9cP53iEhGSzXI+BI2C4
 jlLA==
X-Gm-Message-State: AOAM532IpKJFV6n6/L1Xvoop3k3rBB1iHMCZulLmzLI5JBwC7o1hR813
 C7r7nUs00frPgm7zASVjzHUrD2FgNiqj2e+dLNXzcw==
X-Google-Smtp-Source: ABdhPJzcL1IsYAxI6O9R6E4SNVtk67qN7JhLmddtMIubmQIsgufa4yULeVXH7Y7qnvW9HpyDV5wq8x5UpJAYNjb9XM8=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr30089699ejd.85.1617040492835; 
 Mon, 29 Mar 2021 10:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
 <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
 <CAFEAcA_i-jx4PvDSqcZ12TWtJMzRoEBGO3tUbUJqU1voecksaw@mail.gmail.com>
 <CAJ+F1C+uax+uUhR_dARx4kLAmc4-OgEMCh795+iW4yjm-1RPvw@mail.gmail.com>
In-Reply-To: <CAJ+F1C+uax+uUhR_dARx4kLAmc4-OgEMCh795+iW4yjm-1RPvw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 17:54:22 +0000
Message-ID: <CAFEAcA_=GCA8FgLfBxiLvjUaOkV0TATUsuO7an2phFxmJkMxtg@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
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
Cc: Lukas Straub <lukasstraub2@web.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 at 17:30, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Mar 29, 2021 at 7:56 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>
>> On Mon, 29 Mar 2021 at 15:17, Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> > ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
>> > Configuration error:
>> > The Sphinx 'sphinx_rtd_theme' HTML theme was not found.
>> >
>> > ../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python=
 3 version of python-sphinx and the readthedoc theme
>>
>>
>> So why do you get that message, and I see the above? Older
>> sphinx-build ?
>
>
>
> It's strange, it's like ModuleNotFoundError was not catched by the "excep=
t ImportError".
>
> What's the version of python?

It's whatever's in the BSD VMs. I also saw the same error on the
aarch64 CI machine, which has python 3.8.5 and sphinx-build 1.8.5.
My guess is that it might be the sphinx-build version here. I vaguely
recall that Sphinx is kind of picky about exceptions within the conf
file but that there was a change in what it allowed at some point.
It's possible we just can't do much with the old versions.

I'm inclined to suggest we should postpone switching to the rtd theme
until after the 6.0 release -- there isn't a strong need to get it
in this release, is there ?

thanks
-- PMM

