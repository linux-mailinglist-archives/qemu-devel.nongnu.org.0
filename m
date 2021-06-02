Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3F398FB3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 18:09:52 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loTRH-0006md-HX
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 12:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loTPd-00053Y-Oc
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:08:10 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loTPa-0000nI-R3
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:08:09 -0400
Received: by mail-ed1-x529.google.com with SMTP id dg27so3537253edb.12
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ds8HzCmZafUhZsBUl5ZTOCPpyCyYHSz7qR6sLFLAGhQ=;
 b=IaZBE5rufZpfN5VCNtPCz5G8+ZjPXa02WGCz5kQHTYQp667COu40APMWNZiOCkhavx
 9T8KmxQekdsiCnBjyOMzYCxhbsIjNCGrl9JsABCnfigvZjvo0d9P69khldade2lOPo0b
 MhGH3+swjgEJaNuwN+iShMQK/Gc8W7tWecJwQpih21WtI0Ul5AT8J4KgYpYApC0KyUQA
 dffpIzwn7B7tiTk6p6/QccYKfHQekPtdE0y8TiPAoZGLAXlc0cCTh2THT3K36aqbE2sq
 6A/7HS/eNU56Z7cOuiV+vFRv7PL0nurTDaZSQSksKEVnFJ4rLAaKwevVcft/taUYOtCH
 pM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ds8HzCmZafUhZsBUl5ZTOCPpyCyYHSz7qR6sLFLAGhQ=;
 b=TC84MszFn2JHNPpEvMkQPKFYzRCbqr8hL18NdAeT0+yq9AxpnyDbaHWx8LDj/VntBF
 yY1FCmNQsssj1aEpkHyMHqbTqnZkAkTY1V5VTLU95HxZK+AhaqDT/uTM8AADwORDVpXB
 wVvejIzCaJcv7an2gRnFc+zTsd1OCfBihDXApmOfOlm0kkFjLNJcmiKJYPIXOVylpID6
 cM0cB4aJ4RP+4dGNLh9/WrT/srm9vHWya6SniQyYFRGPOQqMroeF1BFfUFapuWt6OH9y
 Z6GKrGBDZDif7EbsiUsQfy4FfzIzTDCqip4Le314xmPQdqH5ahWqJcPT9OTrMAw/4nDB
 zgvg==
X-Gm-Message-State: AOAM532dC1XU77Y8VrBDrSVqIUfTnXldly+coqotNpfWM71vkmWYOx9G
 iMkzpY0q9fxpPbSRUd0nasipBUj8ZX6NwBMnUca4Pw==
X-Google-Smtp-Source: ABdhPJyoeWpXCqHpaGZ3htWfnuJ4s4YLPJtDXjg/ZfVpGRGl9QbQU4BMx6gtV/i25hhS2gyYNvOXNe8xV2Yqb26aMnA=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr38903399edv.44.1622650085266; 
 Wed, 02 Jun 2021 09:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210601233118.1103509-1-jsnow@redhat.com>
In-Reply-To: <20210601233118.1103509-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Jun 2021 17:07:33 +0100
Message-ID: <CAFEAcA9J97B2XqC-9vnej2pb=rLjAJv9KnT4buU4BVU20pmy4A@mail.gmail.com>
Subject: Re: [PULL v2 00/44] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 00:31, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 52848929b70dcf92a68aedcfd90207be81ba3274:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210528-pull-request' into staging (2021-05-30 20:10:30 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 6b9c277797879ce41ed20deb6737f4156cc279b3:
>
>   gitlab: add python linters to CI (2021-06-01 16:21:21 -0400)
>
> ----------------------------------------------------------------
> Pull request
>
> V2:
>  - Squashed in fixup for
>    'Python: add utility function for retrieving port redirection'
>  - Rebased on today's upstream
>
> CI here:
> https://gitlab.com/jsnow/qemu/-/pipelines/313202814
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

