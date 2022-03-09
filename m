Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C64D2FBB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:12:23 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRw74-0004uA-B7
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRw4k-0003Zi-Ru
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:09:58 -0500
Received: from [2607:f8b0:4864:20::b31] (port=38441
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRw4j-0001Bd-5N
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:09:58 -0500
Received: by mail-yb1-xb31.google.com with SMTP id u3so4227594ybh.5
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 05:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TO0954qr9ez+YuHbFpX9Z1twSNSrjsMggQpEmj8Wz/k=;
 b=vExH4CHyjE0vWqvXrjYBGrtHC5n35H8DYU5CiL1Jv98ltxRvUy5Ty8IpXqUy+RdrQf
 j1teMCXABAJIeAcIr+DWOP8OBPif6czw4y9kjZUiqn6TYlYa+1zUqoIdWcD1SFLPwi2N
 BRopkYNOyZWua4Z5XVwErK/qLTC/DcwJ6VTELtzFx7nmorcItdVVupqL0iwzl9+DyYDn
 E7oSxpl36xIGuu2Hy2xohtRwIi2HqnHL+EAA40WC7AhkYVyDmz5e9MzSfe6r11ZwZY1D
 f/l19nkMG9v53IF+KEmLifwNvsbcVhVlm1t3J43NRnDJxjTPIff0wTzkVrnK//wZTzs1
 urYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TO0954qr9ez+YuHbFpX9Z1twSNSrjsMggQpEmj8Wz/k=;
 b=V4qUAuXMFwo65Sxif1yrQWABoAaoGRxUXUWs2q2/i6nmw3dr8von8/AqkkOS3iv9K4
 F6FrB+NnIJwnoAj9BDkf8giBALjiXpayryhdN4HoYCmXOzIv37rv0nO2aUGAXz01P1Pq
 vIAWmVoFDogs/Vk32qB2Rp3pP9nsOEfzTm2Jh7Gg802ryiw002w7E85GL+LiRWsQIOAF
 k1/fuj3PUsbJDOD+dFQ627UovOFYSxiwNYjstuc7Be6S6jvEcK6e3DMDyGx+Z/ycqS2d
 A2GejULI80dwUPVlc6k2eI9ngaJpSXAPyt+Ry/ZCz0ux+r3uSZ/cSs99fyBXh6Ewaf3J
 FPEg==
X-Gm-Message-State: AOAM530yHIHUb9Q+UhrUYQSmTf6hUiUcHY0BmtnwB9KvIYFpglXfa0Li
 33Y56FceKbrdkonXgvLy62gKf0YNQe0WVkwPm0vWAw==
X-Google-Smtp-Source: ABdhPJzOOQO5Ns26fFnudEgUQ0Zgs5bvwNKjLcsfrnjUU6AGcrP/bf2K15GWN6+BHuZxtOkS/88QLzUjr3x+TcVR9V0=
X-Received: by 2002:a25:a08d:0:b0:62c:eed:e6c3 with SMTP id
 y13-20020a25a08d000000b0062c0eede6c3mr4829819ybh.67.1646831395322; Wed, 09
 Mar 2022 05:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
 <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
 <b05317e1-3659-2dce-4582-58bc6ca4a79b@redhat.com>
 <YiiehhaRPGWnM2Vn@redhat.com> <ae5f9f7d-e0b3-3d79-1fe1-d8dfdb1ba2b7@gmail.com>
 <YiilTXYgeORlVl96@redhat.com>
In-Reply-To: <YiilTXYgeORlVl96@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 13:09:43 +0000
Message-ID: <CAFEAcA85uL4gvUR9gJ7V7+KHYhE+40WjYHngxVyqusR8Xn6LBw@mail.gmail.com>
Subject: Re: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 at 13:02, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Wed, Mar 09, 2022 at 01:50:34PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Not sure which job to choose yet. Per the first google hits we
> > still want to cover Catalina first:
> > https://www.statista.com/statistics/944559/worldwide-macos-version-mark=
et-share/

...that page says that the figures for Catalina are "incorrectly
high", so not a very useful set of data for these purposes I think.

> My general gut feeling is usually to prioritize testing older versions
> as they tend to be more widely used, and we want to avoid regresions
> on stuff that has been around the longest. Compatibility problems with
> new releases tend to get reported by users/maintainers and would not
> be regressions, but rather enhancements to support the new platform.

Note that technically speaking Catalina (10.15) has already fallen off
the end of our support policy (which currently requires Big Sur (11)
and Monterey (12) support, as the two most recent versions). My
personal macos x86 laptop is still running Catalina, though,
because Big Sur dropped support for that hardware :-/
That suggests that maybe Big Sur would be what we should go for
now if we have to pick just one for the CI.

thanks
-- PMM

