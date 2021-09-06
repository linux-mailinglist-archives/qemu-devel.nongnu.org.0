Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305C401AA5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 13:42:12 +0200 (CEST)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mND0t-0004QT-5w
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 07:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNCwj-0002vp-Md
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:37:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNCwh-0002a4-NJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:37:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4753088wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 04:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cu2UMxkjY9PZ57JqQ2jouY/5QR045vVbZ9dLADpfGiw=;
 b=dw7J4ywgEyeoCJPA1G0z41/TVDj60YcrtBxu3ZCwbnmPszNiaAsBtmU3kwB4tzxx7D
 cLsaxhRk/JXWIOnwUrNdOW7+kf3ZxfGIgwFAXG8AGGm4zvyL18Ew2CHixy+UiAStaBBU
 IFaPSQvuqFnOmeRARTqXjTYP7CD9i+ioyArD+Y6NYuoQNHYh5jAmSFNmYFu7H6wjfWy0
 rEIw9FySdgvROPW9Zpq8SludWGbqr7Qo/gQ+D9oiuSuIhAISWsSMmFcadosLyKAQUgMS
 xfTDLqwaiShKF1CcMy7UQELZ4Zd8neKlVvdcUHWiG9YOhF4M2IUTRlPqY+YxSdufSz+I
 V9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cu2UMxkjY9PZ57JqQ2jouY/5QR045vVbZ9dLADpfGiw=;
 b=AhhxtftGq+VEvtB55uWikZqzKBc/itfR9cPxXNA1ogDBBWPiM6Ec3AZi0ISOrk9LFh
 ARlKPjfMr1MdfOEjHVy2RWkp5LrUpOKgiVZpXyPzPb9i/2XmPh5+qoCPFJm4SG7ZXn03
 yx0AYVaurPGgL3PqUdz4b1nDPcOYAinFvdtbLgELA0OnS4KMQkXkt24MvLdbTFOrwbI3
 mwHdHV/f+XusEastzhb803mCjEcJZrZ7eYak9DYAPpTkXIPi2CNRiclqY3z10qizGJe3
 sqacHzdFWjnqRgO9Mv70k5D+pDM8r/x9tCuE3HZVRruiuuGEHc0iicNUEVO8vli+rysW
 ZNVg==
X-Gm-Message-State: AOAM5308ytDjp50q7Hqe866heQRH9R/YlAg88C5X1mh0nCN5YaInA9r0
 65pCOGG4E0m9qmAACrl+iaO7HhWvibRieKaqumDwVTpGCYwJfg==
X-Google-Smtp-Source: ABdhPJx5RJndLV7MYJ6BAk3RfJDPpnWmTsFS5MCbCmm8forLF/LsHWOdFHK/Ny6S+B3dYSOFHp18O2OGE+7Zi5i+2ds=
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr10991927wmq.32.1630928270147; 
 Mon, 06 Sep 2021 04:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210906112945.88042-1-thuth@redhat.com>
 <20210906112945.88042-2-thuth@redhat.com>
In-Reply-To: <20210906112945.88042-2-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 12:37:01 +0100
Message-ID: <CAFEAcA_kZp64PedHb_fFtbtTpV3RrRHaZC9qALZSXHB3+jh+eQ@mail.gmail.com>
Subject: Re: [PULL v2 06/10] configure / meson: Move the GBM handling to
 meson.build
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

On Mon, 6 Sept 2021 at 12:30, Thomas Huth <thuth@redhat.com> wrote:
>
> The GBM library detection does not need to be in the configure script,
> since it does not have any user-facing options (there are no
> --enable-gbm or --disable-gbm switches). Let's move it to meson.build
> instead, so we don't have to clutter config-host.mak with the related
> switches.
>
> Additionally, only check for GBM if it is really required, i.e. if we
> either compile with OpenGL or with virglrenderer support.
>
> Message-Id: <20210714085045.797168-1-thuth@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I assume this doesn't change behaviour here, so this is more of
a maybe-followup-improvement note, but the gbm checking (in the
old configure version) recently confused somebody on qemu-discuss:
https://lists.nongnu.org/archive/html/qemu-discuss/2021-09/msg00010.html
They didn't have libgbm installed, and because there's no
--enable-gbm there's no way to force configure to enable the egl-headless
UI frontend -- it is always silently falls back to "don't build that".
Ideally we ought to provide a means for distros and users to say
"make sure you build this feature or barf" the way we do with other
things, I guess.

-- PMM

