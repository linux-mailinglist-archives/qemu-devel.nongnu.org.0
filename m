Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85537BEC6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 15:47:25 +0200 (CEST)
Received: from localhost ([::1]:37236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpCu-0006pC-6o
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 09:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpAo-0005sg-9K
 for qemu-devel@nongnu.org; Wed, 12 May 2021 09:45:14 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpAm-0001yj-H5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 09:45:13 -0400
Received: by mail-ed1-x533.google.com with SMTP id g14so27164591edy.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=McaQ+WYzF6mNoMQvbJjqy+KAm8CrUXXgTZnmtAkApR4=;
 b=VWplz+NjEDWS6cE9K4enNl9P5ficKy1ceOX99E5Ly4mwUstRtBzuvI1qjJD1bQsGFs
 YvOJMO/1+NViYicWo+bPIFHklr+4Nvbns+dWttiq4huPwbpExLn8lrCO1ZcQXxTfc5kA
 fpz6pBy9ACUngSd6EWlLfuxJ6/KwmamxZIigjqcdFLiT+sJ2fZu9vyp6RncHxg4GtYUn
 XnfRMTx1RkE1Re9gfXysgFFM7/AWCtw8JEG86t4IoLmWgy0k5kYFw9vRGHr09lDQByQt
 i1ZX0Ov15gdLmJ97+flGii3/4KsAdKqlMxahwyjesl4bRu1F4jvSmPhQpE145JxXnz2v
 cwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=McaQ+WYzF6mNoMQvbJjqy+KAm8CrUXXgTZnmtAkApR4=;
 b=qrh/YPune2bWMYHQws1nq9ke7Um9faVgkALg4zwh26ZmNwWXagof845pGHA8g9QwNP
 ql6dVB4FkVXYvUcJ2vWe8vTudbV/GcElkj7Ypx2C8pDwXAVrVxSv3f91DIQ7dL4NndvW
 uczdgBbBvDjXrPjaoBOFc4kCjhd5w26emGAOTd3X+PwhGRM5Kahik6K51aINSJlBtGfc
 mcZ75DCv5d+DOG0LjOBPlUbM660p7+jPIyyWRzHQKgLYtT3lGQcXNupVWskDjYKFnZVJ
 PDZ8Vk9E6mi07uqPpj2i6lyTpFHNgAGzQvNsswJVaiabAKeXs9WX51+2jasAvtLQde9e
 OdwA==
X-Gm-Message-State: AOAM531LGZdUMsc7fG7mIJsHfyyhvUZxfuWWye+qq1W1WRmD6y8Jm9dN
 YRDL0kZ07XNSFtlQYfOF+a1zICvpR4yhwkQZF3UbJQ==
X-Google-Smtp-Source: ABdhPJwnQdOmBUoqqh9Y5YbtizzHIm2fzeue8wsJ69m+BBIgHKJ4Usag+wJo2VaQ8fHZq2xMxc2i8K8egkE5uOM9tic=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr42933068edd.251.1620827110992; 
 Wed, 12 May 2021 06:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210510130617.320981-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 14:43:56 +0100
Message-ID: <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Mon, 10 May 2021 at 14:06, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd486=
72:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-202105=
04' into staging (2021-05-05 20:29:14 +0100)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request
>
> for you to fetch changes up to f1852f5d7e6fc2ead874261c0388b18898257000:
>
>   sphinx: adopt kernel readthedoc theme (2021-05-10 15:12:09 +0400)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------
>
> Marc-Andr=C3=A9 Lureau (1):
>   sphinx: adopt kernel readthedoc theme

NetBSD now complains:

Configuring 60-edk2-x86_64.json using configuration
Program qemu-keymap found: NO
Program sphinx-build found: YES
../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
Configuration error:
There is a programable error in your configuration file:

Traceback (most recent call last):
  File "conf.py", line 154, in <module>
    import sphinx_rtd_theme
ModuleNotFoundError: No module named 'sphinx_rtd_theme'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in __in=
it__
    execfile_(filename, config)
  File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
150, in execfile_
    exec_(code, _globals)
  File "conf.py", line 157, in <module>
    'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme
was not found.



Program python3 found: YES (/usr/bin/python3)
Program diff found: YES
Program dbus-daemon found: YES


as does freebsd and openbsd. Can we get the theme added to the VM
configs for those ?

-- PMM

