Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4631B57D7D0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 02:37:42 +0200 (CEST)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEgfk-0006is-W5
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 20:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEge5-00052c-Hw; Thu, 21 Jul 2022 20:35:59 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:46858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEge3-0005iX-PG; Thu, 21 Jul 2022 20:35:57 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31e7c4b593fso33252497b3.13; 
 Thu, 21 Jul 2022 17:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10h8h3yp/TpiYXW1UUasKIhcmMM9s/WOczOCuLd3oVs=;
 b=EaZQMAnX3PhNqf9qlBVW2fm9ZxcYBGt/azXjDchNs6kH4l+0VvHhJI1PE8msy7n8gl
 gaOQRV0KFG8cfZZIgPBxgHB8Q2VaO2bA01CAc5xHFRTOmwkr7MEkSAbvl8EWKux9LzzX
 MfxhZUdyHFJnnW8eMGLhg0pgxUbsiPM6l5Q4jZiIjZ+ZZw7Q4LFKEti1HhidGwUXMbfo
 UZpMOfIrTuEo21kJRICq7+J0laLVwyGaN2nEmFrzQDLl3Cp5UNaCJgveTE0Pid/HYLJx
 g+Q6k7bB9tRL5aPagMgHEk2vpdAS7DU+CnfpZtfktUIGLsa4AxnyWtMiU1UCD6AHwO0X
 TR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10h8h3yp/TpiYXW1UUasKIhcmMM9s/WOczOCuLd3oVs=;
 b=m2k0VpGiz1tYmUasYdMgpRtw0NYryfWU9z3oUkiwVYBVh+GTJdR9B5IOyDAOYlXsa+
 7lzBZuF5IO71az1IqASROth71GKiMX/i98dYDHzd1rrXCgd4B9uWOXf/XrKCVemT0qa4
 gL3H84P+2xYvAYtp67lZsf8N3blbyxoaaUHfetZw39q06BgKreZTUJDFb6wIr4RQh5zM
 dSaEeazG3no7kScyvBINr2kppXRhJcJ6O9N739yiYj7vrhDpDpC4p5H4SmdSuGzXPQ0p
 IyFoCwGXBi/3Pw0oKcp1Z1BZL3fI62VCuNVqmYEh5M5Se3JMU2b0xLpjgRj4hjT7XovD
 EWQQ==
X-Gm-Message-State: AJIora9I/Aeq8CtjDlv1fE3RHZBAEWgVr5RpJrOmzt6K3zhuBag5x3FQ
 +usa8x0JrgBMRyEhuoL/Vr6n88r5Ej9WLnJGjjg=
X-Google-Smtp-Source: AGRyM1sZTqxF0Mzl/S848L+YL3rtZvgo8fcyhM4JV+DdgHc/aQO6dV5YkWFh/a3US4kGCg4tKKG8BZY5jZMuGCfJOe4=
X-Received: by 2002:a81:9950:0:b0:31e:6a05:bfb1 with SMTP id
 q77-20020a819950000000b0031e6a05bfb1mr1045913ywg.336.1658450154314; Thu, 21
 Jul 2022 17:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220719075930.315237-1-aik@ozlabs.ru>
 <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
 <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
 <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
 <a6831bc7-c796-e11e-9a3d-e1e46caf1fa4@ozlabs.ru>
In-Reply-To: <a6831bc7-c796-e11e-9a3d-e1e46caf1fa4@ozlabs.ru>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 21 Jul 2022 20:35:42 -0400
Message-ID: <CAJSP0QX_5oeuKADBMU7NzqhW6vwnHrr-ueuusrg83fJO9mE1zg@mail.gmail.com>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 21 Jul 2022 at 05:06, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> On 21/07/2022 18:48, Peter Maydell wrote:
> > On Thu, 21 Jul 2022 at 09:19, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >> On 21/07/2022 02:08, Daniel Henrique Barboza wrote:
> >>> Hey,
> >>>
> >>> On 7/19/22 04:59, Alexey Kardashevskiy wrote:
> >>>> Alexey Kardashevskiy (1):
> >>>>         pseries: Update SLOF firmware image
> >>>>
> >>>>    docs/system/ppc/pseries.rst |   2 +-
> >>>>    pc-bios/README              |   2 +-
> >>>>    pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
> >>>>    roms/SLOF                   |   2 +-
> >>>>    4 files changed, 3 insertions(+), 3 deletions(-)
> >>>>
> >>>>
> >>>> *** Note: this is not for master, this is for pseries
> >>>> *** Note2: this has not sync'd to git.qemu.org but softfreeze is
> >>>> too soon so I am posting it anyway.
> >>>
> >>> I forgot to send a reply yesterday, sorry.
> >>>
> >>> Don't worry about rushing this SLOF pull. Given that this build doesn't
> >>> have bug fixes we can wait to pull it in 7.2. You'll have the time to
> >>> sync it up with git.qemu.org and so on.
> >>
> >>
> >> Well, the git.qemu.org is still not updated, and I have no control over
> >> this process anyway, who manages it?
> >
> > Syncing of those git repos is supposed to be automatic, but
> > occasionally something falls over. Stefan, who looks after
> > the sync process ?
> >
> > Alexey, which specific repo is not syncing ?
>
>
> https://git.qemu.org/git/SLOF.git from git@github.com:aik/SLOF.git
>
> For example, the latest is:
> https://github.com/aik/SLOF/releases/tag/qemu-slof-20220719
>
> But it has not made it to where git.qemu.org redirects to:
> https://gitlab.com/qemu-project/SLOF

Hi Alexey,
I have manually pushed the qemu-slof-20220719 tag and latest master to
QEMU's GitLab mirror.

The automatic GitLab mirror job should work. We just don't have much
control over it and maybe it got stuck ~6 days ago and couldn't pick
up your latest changes. Please let me know if you have mirroring
issues again in the future.

Thanks,
Stefan

