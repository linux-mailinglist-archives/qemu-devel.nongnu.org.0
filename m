Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC562FC567
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 01:10:57 +0100 (CET)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l215L-0000zt-Mk
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 19:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2147-0000Zn-UX
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 19:09:39 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2146-00026H-D7
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 19:09:39 -0500
Received: by mail-yb1-xb32.google.com with SMTP id y128so17743279ybf.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 16:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ct72LzrLUuXF+MqKWun1FJM0lh/zSzAKEGrj9XBi+f8=;
 b=AnSMNxt3JnjXs7av1FexNTy3qHaPbAAC3r3KlJh70cT77qCRLI06TlOks0dIuUzlKk
 Gz0YnYJUAbd3cXgOq55+7ZKvnMxRvf2N7a5gkKtLRiNnHHdVvi49cXrFFMkXUFeIsgii
 XqwNWD3/wO0GOv/Q2YOZ0Xh3ZmXnE4BlIvzDIM5z/fOhYUHEDJX7oX5qk3rK4Ripch70
 of8X8JjqBmt1zkDQoa5ntJf7UVaIKiZw/8HIkvQQ5j0eY63zBwQ4sncUL00AMVyowQkA
 EcpVNwu6OaI6Ln7IozgXPEH4PukvVhwoiLaV7lV/XQ7uYkzaOw8vzkiVixvzKEfqmdpo
 0OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ct72LzrLUuXF+MqKWun1FJM0lh/zSzAKEGrj9XBi+f8=;
 b=ecdLz0ElxiYgamtgIvtRTPOvabvLLw9DmAP8abYjEqrwYjuoCukN8fomLMAGgb8SRz
 snmKPqvpnWsPPEEuDxy3j4BBX5bYxFeIVLGJCj5gxRqTBiDqtqEYb6b0PwFcDvBJAe3m
 0wdfpMdDgeyUsR+YdummXX65Qyiu+DxJKeRtXPPJn6tKdWfjVHc/GPIR0uVSPzzQ/Ued
 idtJlNhp8uN2ja0O5tjplJqQk8bhn6UotNvgMxaP0+NF/InZHu9EYmNnPC3QWF8EmS4v
 MZ+CsJ4DslHgLy1idyQo2HFsbKnyMUEhisA9zjOzxlCf+65OUtyVz2eZnM21DI8vmTY2
 wfQQ==
X-Gm-Message-State: AOAM5305vn366CgTF4OWPb4kOtiy/tdoRvPevaRCeckFjSyUiT9yx6Ak
 NibYMvvQmNUu5KU67GgIetcxTuBMoZ1y6vgPCpo=
X-Google-Smtp-Source: ABdhPJxMReHFJ2v9NIi7EW7sMgxBp9XnNM7sva+gZDQxlHRjtKEkHxw8UVNZr4gJyKUzYvR0pfQbGZxgMKdiNub0wXI=
X-Received: by 2002:a25:3bc5:: with SMTP id i188mr9392679yba.332.1611101377393; 
 Tue, 19 Jan 2021 16:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20201105160335.1222062-1-marcandre.lureau@redhat.com>
 <CAMxuvayPZ7FR4JCpuNk_9P8NTSo_G=F6c2cWK+gDvv676ibLxQ@mail.gmail.com>
In-Reply-To: <CAMxuvayPZ7FR4JCpuNk_9P8NTSo_G=F6c2cWK+gDvv676ibLxQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Jan 2021 08:09:26 +0800
Message-ID: <CAEUhbmUvb1i94cpOrh1pAyeBzMCUdnDm6YJN_Yh05ycvFbGbmA@mail.gmail.com>
Subject: Re: [PATCH] RFC: sphinx: adopt kernel readthedoc theme
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "P. Berrange,
 Daniel" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 6:57 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2020 at 8:03 PM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The default "alabaster" sphinx theme has a couple shortcomings:
> > - the navbar moves along the page
> > - the search bar is not always at the same place
> > - it lacks some contrast and colours
> >
> > The "rtd" theme from readthedocs.org is a popular third party theme use=
d
> > notably by the kernel, with a custom style sheet. I like it better,
> > perhaps others do too. It also has features that may come handy, such a=
s
> > "Edit on Gitlab".
> >
> > Tweak the nav header background to match qemu.org style, use the
> > QEMU logo, and favicon.
> >
> > The html_theme_options['description'] workaround doesn't seem necessary=
.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  docs/conf.py                           |  36 +++----
> >  docs/devel/conf.py                     |   4 -
> >  docs/interop/conf.py                   |   4 -
> >  docs/specs/conf.py                     |   5 -
> >  docs/sphinx-static/theme_overrides.css | 137 +++++++++++++++++++++++++
> >  docs/system/conf.py                    |   4 -
> >  docs/tools/conf.py                     |   5 -
> >  docs/user/conf.py                      |   4 -
> >  8 files changed, 155 insertions(+), 44 deletions(-)
> >  create mode 100644 docs/sphinx-static/theme_overrides.css
> >
>
> Am I the only one finding the default sphinx theme inferior to rtd ?

Of course not!

This patch does not apply on top of current HEAD. Could you please rebase?

Regards,
Bin

