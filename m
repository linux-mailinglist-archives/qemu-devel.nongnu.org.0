Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAC637FC6C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:23:03 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF38-0002uX-Ac
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEyJ-0004rA-4z
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:18:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEyB-0005ln-AJ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:18:01 -0400
Received: by mail-ed1-x52d.google.com with SMTP id c22so31797649edn.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JwtHKDaw7lmLrQh9ZwCs1bZJtfLDvUwcaRFfGJMenNQ=;
 b=dw54XNlCadW8SLM58LSSMscx99inaPX94KMnInvHmYFqM6zSCUZRRJcsmnsgVJDZ10
 L+AVCExr3eZWnXPtw6OKXWJ52dmzm8B+HRR7RocpQZ04GD8l7FZozEelomAQ/RI/lhZm
 VLDSfjeG8pj5R5SWAe0qp2cbtVM5en02JMj0tj0ypPMdtrM/juULHJI+BvViqS6TD7qR
 cRGe4E2XO4otS6QZSV9vNLHcXDT6w8PjCq8q04Gnc4RH8jRIrhGKRp8/yIXxtKePDCqs
 VcAHPR0KIvM3qGrmDcFAvecqqjPY8MIURLvyQ1LS/tZFH6n6B2PfnOT+kXJai7TooKsK
 X7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JwtHKDaw7lmLrQh9ZwCs1bZJtfLDvUwcaRFfGJMenNQ=;
 b=Po4nn4Mcmi/k1c1y55GnFmxpFnUbvbm1Pe1ovF4YJXjeqWNorde2uHIH0FcpsW0cdV
 Oa1K2od54vsmZoGt2XbxtxkqcttcnOdlucgaQKo8LATt9meQlH6UFGNGXvo5Sn6H8smw
 fLaQ1fG59I6gMgiH0hApmMKjzWbNLFBzTrDe/y9Z33Orjcg7GlWHbbSbgSnNRekgDPVK
 9U9kjthedJDywoDXmLe17ufqV0A86BQoR4qPcrtW4Rr4c2ORO8aFx8YGh/4vtJ8teqOO
 zsWWfS3e5n0jPgIVSaNEfYJHMMyMq6V8iBXiVau3FQ2TQI/N1De1WRfhSOjxJfNhoz98
 2SqQ==
X-Gm-Message-State: AOAM531RwHZJOmKFsnmXXJ4OSoXxdDrkkEtsBcjlBtQt5PRv/KCPgxkh
 wmY/7azxUpgkgRaHT3SkJyTyx1cJZnM5Z50LVY8tUw==
X-Google-Smtp-Source: ABdhPJzbKvwC1JSNg9X5Srn/MLNsGL9Y0AVkn8fxg/fDq/6kB0CKY39lWLbWstKNfewP17/wDw8wkbZIFZryb2y6eVo=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr51627084edv.204.1620926271876; 
 Thu, 13 May 2021 10:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
 <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
 <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
 <CAFEAcA_zT-LW1eApzs5+TZLWkigCokY6S2Dc46pqVyiDuMLTUw@mail.gmail.com>
 <CAFEAcA8qV0Re8AYHpW14-1wkUcGacO7E6+ta-DWwj-9pN0iVOw@mail.gmail.com>
 <CAJ+F1C+V=x8=tcm0WhtFxS5P_4WjLNVXOVKEnvgWpmFDwom6-Q@mail.gmail.com>
In-Reply-To: <CAJ+F1C+V=x8=tcm0WhtFxS5P_4WjLNVXOVKEnvgWpmFDwom6-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 18:17:39 +0100
Message-ID: <CAFEAcA_BTwg2KyyfsG8Q2_FFzKuYN+5J0X85OBpN-x=-5PFANw@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 at 17:03, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> This should work, can you check?:
>
> diff --git a/docs/conf.py b/docs/conf.py
> index 3802b70d62..9e3d7cee0e 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -29,6 +29,7 @@
>  import os
>  import sys
>  import sphinx
> +from packaging.version import parse as parse_version
>  from sphinx.errors import ConfigError
>
>  # Make Sphinx fail cleanly if using an old Python, rather than obscurely
> @@ -162,7 +163,7 @@
>  # Theme options are theme-specific and customize the look and feel of a =
theme
>  # further.  For a list of options available for each theme, see the
>  # documentation.
> -if html_theme =3D=3D 'sphinx_rtd_theme':
> +if parse_version(sphinx_rtd_theme.__version__) >=3D parse_version('0.4.3=
'):
>      html_theme_options =3D {
>          "style_nav_header_background": "#802400",
>      }

This fails:

../../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
Configuration error:
There is a programable error in your configuration file:

Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in __in=
it__
    execfile_(filename, config)
  File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
150, in execfile_
    exec_(code, _globals)
  File "conf.py", line 32, in <module>
    from packaging.version import parse as parse_version
ModuleNotFoundError: No module named 'packaging'




> However, we agreed before to not have support fallbacks for missing deps.=
 Perhaps we should require rtd >=3D 0.4.3 instead?

That would prevent the docs from building on too many platforms,
I think. 0.4.3 was only released upstream in Feb 2019.

thanks
-- PMM

