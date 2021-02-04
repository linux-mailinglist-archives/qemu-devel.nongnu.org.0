Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F184230F6B9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:49:37 +0100 (CET)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gsz-0002BZ-0W
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7glx-00062k-Ol
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:42:21 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7glv-0003ep-6F
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:42:21 -0500
Received: by mail-ed1-x533.google.com with SMTP id g10so4730398eds.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+ckfm6n+sOnXwOMHOXytgMCDD9zJ/BXY1sNM+p7UDM=;
 b=yHHjjH4eMZQ6N8MjR3bnqbr1X4R261ZO575sUsecsJBC+Ym2n/katJf8JD+BWWsWvu
 E4FIGS+j7rVREHsTdaASBXugQ/HwCkxMX7kmBZp3ig898iLDq2lbQZrDRbBn20VMB/B9
 xUDv0Kyod6kPhXyQpCem0NutghU+Jyxb/SQrLQWHmrFSR45oArdt1DpQy0fKHy71Tfdq
 6B5x6X8BKQsNPJBT6dmzjJDUQ1xegpS63uZHeWLFQN+8f5BeqnrvY2MNLU7LqHev/iRQ
 Bkll8npetTSOkKt2Y72lBevRenbwSzfFKfSwj4v6o5/OxYjc+22HQDSC9eJBvPcn3d3o
 IWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+ckfm6n+sOnXwOMHOXytgMCDD9zJ/BXY1sNM+p7UDM=;
 b=j0EL0u6wx3GbqawvM+91+E1SBOyO9EiQmTH1sbSWau3mTtBkRzrh6dWrpvKsvbM6Lr
 gZR0/j5MJCEuQ9S+y25AYNSTM2hjKwA6V4SWZKdJGk45axrmLfrMHWwFffCJ6pkHFPrB
 lkDDuP868U3mn60CDV4sL2SqnUvTnWQYOzqMmxYxiivy4RPzz67T3jOQj4kEvA7xdOL9
 nznHgsxTnrPOS/KUQotrqJ2KN5TQ5rTJx7OsDadWrUYhZ+kVOCga1Aqv/1yhgWyBBppq
 UOLEuXQg3PnBk98UFfvQ9Evj2wsiqqbTulgHBddUCPKNVDj4lv5PI4DRTWTwurU2jJro
 BwOA==
X-Gm-Message-State: AOAM530VCRYfR/84dgQx9mw3HeHUNIH7IMl1OQdyfBQesfLJGACgVX+M
 rwbYpeZ/t08TOMijye2MA78LPhTR09EBvkePtWH9kw==
X-Google-Smtp-Source: ABdhPJwNYY0j6EytsiNI6BCurJO+4r+sHPwL8whURncby5dGc1DsS+J+aXzJKPu9dR9FBx1Npvawzc1t4p+d/gQuDQs=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr8447913edv.36.1612453337142; 
 Thu, 04 Feb 2021 07:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20210202134410.9274-1-programmingkidx@gmail.com>
 <2cdac45d-6a4d-dca1-4f32-2fc6b549f8d5@redhat.com>
 <158A523E-8E81-4E56-BE52-460034476E9B@gmail.com>
In-Reply-To: <158A523E-8E81-4E56-BE52-460034476E9B@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 15:42:06 +0000
Message-ID: <CAFEAcA8mnac53=TO3HUXyzELD5D1R_7+FAi14kYs2Rk-MCdAfg@mail.gmail.com>
Subject: Re: [PATCH] Set icon for QEMU binary on Mac OS
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 15:39, Programmingkid <programmingkidx@gmail.com> wrote:
>
>
>
> > On Feb 4, 2021, at 3:54 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 02/02/21 14:44, John Arbuckle wrote:
> >> Before switching the build system over to Meson, an icon was
> >> added to the QEMU binary on Mac OS. This patch adds back that
> >> feature.
> >> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> >> ---
> >>  meson.build | 20 ++++++++++++++++++++
> >>  1 file changed, 20 insertions(+)
> >> diff --git a/meson.build b/meson.build
> >> index f00b7754fd..7f534f4e75 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -2183,6 +2183,26 @@ foreach target : target_dirs
> >>                 link_args: link_args,
> >>                 gui_app: exe['gui'])
> >>  +# set QEMU's icon on Mac OS
> >> +if targetos == 'darwin'
> >> +    newiconpart1 = custom_target('Icon for ' + exe_name + ' - part 1',
> >> +          depends : emulator,
> >> +          input : emulator,
> >> +          output : 'new icon for ' + exe_name + ' - 1',
> >> +          command : ['Rez', '-append',
> >> +           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
> >> +           meson.current_build_dir() / exe['name']],
> >> +          build_by_default : true)
> >> +
> >> +    custom_target('Icon for ' + exe_name + ' - part 2',
> >> +          depends : newiconpart1,
> >> +          input : emulator,
> >> +          output : 'new icon for ' + exe_name + ' - 2',
> >> +          command : ['SetFile', '-a', 'C',
> >> +           meson.current_build_dir() / exe['name']],
> >> +          build_by_default : true)
> >> +endif
> >> +
> >>      if exe_sign
> >>        emulators += {exe['name'] : custom_target(exe['name'],
> >>                     install: true,
> >
> > Maybe you can do it on install, using add_install_script instead?

Why would we want to only do it on install? A QEMU which
you run from the build tree ought to still have its icon,
surely ?

-- PMM

