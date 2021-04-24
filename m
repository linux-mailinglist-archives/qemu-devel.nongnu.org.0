Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E69B36A03F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 11:00:47 +0200 (CEST)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laE9c-0004Zp-0Y
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 05:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laE82-0004Ac-7N
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 04:59:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laE80-0001RM-E8
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 04:59:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id h8so19870443edb.2
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGtgn0/sEnpah+y29agSagIMWoNgZ935OYri/zH4R3s=;
 b=gvnZZZuhvrtQ3xGZrPc/QgYVR8VcW3EwOwSj786X3Ea+WMLs89vz3Duln8JlJOpco/
 zJILHUXckRogHgH6QvU0H+QBvJWi25IMfrrQ/wYNL+Qpf0VdM3krToi01T8sQdixAbnk
 3iKySvB9Uupm6Y8bMPohlwvFHvwlMPulCz1+35WeXOKDhQEXvyOJJPI8gE0jhsFM3lGm
 plXEumW62L9ouwOVFqHruztl3BhQ06rbR5jxtnkH3RBMTg2R2XMtS/JlNLqxFnu6GnFW
 54YdeNG6bpYrI0iZosvuLbEV4qD0uLNxgdzS1MiqJQE2scDDJnpPrpJrdlOWBLyM5euZ
 shwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGtgn0/sEnpah+y29agSagIMWoNgZ935OYri/zH4R3s=;
 b=oR9I8L78S2mLDm1/6/v2pHRywTJ6m1fi0NRRvd7bVCSYtJ1yTzNnoNyy+lSDVi98eD
 Bg7sX0LNb5sVBPMn8uHEds/pl7Xy/c0OVJAXS5CPqrkQtcYcISBG+BA55EUxFEgBEleT
 iWO7h7wCRlkPtzv3iOGllr1MJq+K2fPDvvXlJqBAyERMe2Gvun8l72whkRCazU5bgF+Z
 zZeemM0/K1dRyDNI5yKz4p0MbWd/+cen7Cd/Bf9kB/0n1ZQL9Ga1/VOliPM6ih3Rh03y
 xmfc4JKz+oxXQrDoQcpPFS26WUD/Hlg/eLQ74BjRQ6oKPTHvCBN1UwBhbpMFa0ITGbR5
 rJ6A==
X-Gm-Message-State: AOAM533nmc/FLg5NN4xiPn0GWv8EclVqHyXJUAL+7Bek76kyHVQjc1b/
 nDEeXC42p4vCfb3iRV/TB1ouwBtMd4JqrmzLgTjNNw==
X-Google-Smtp-Source: ABdhPJxr2qv/0FSYcyfN5lXtMPB2+9Kw9UWpANvlZfdaDr1ZkEB73F/IaWMzIF2zEpoWYn5sTkShcITuYTs584FnzOQ=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr9114070edv.44.1619254742525; 
 Sat, 24 Apr 2021 01:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <7846F474-7718-43F0-98FE-933956352F0D@gmail.com>
In-Reply-To: <7846F474-7718-43F0-98FE-933956352F0D@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Apr 2021 09:58:06 +0100
Message-ID: <CAFEAcA-pspW3cMaiUJ5=p0TDGDuhErJXCT0XBgLWQV1CcLN3fg@mail.gmail.com>
Subject: Re: Ping: [PATCH] Set icon for QEMU binary on Mac OS
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 22:08, Programmingkid <programmingkidx@gmail.com> wrote:
>
> This patch was submitted in February and I haven't heard anything about it since. Could this be included in the up coming release please?

It's about two weeks late to get into 6.0, I'm afraid.

Cc'ing Paolo for review since it's a meson.build change.

-- PMM

> https://lore.kernel.org/qemu-devel/20210202134410.9274-1-programmingkidx@gmail.com/
>
> Before switching the build system over to Meson, an icon was
> added to the QEMU binary on Mac OS. This patch adds back that
> feature.
>
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
>
> meson.build
>  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
>
> diff
>  --git a/meson.build b/meson.build
> index f00b7754fd..7f534f4e75 100644
> --- a/meson.build
> +++ b/meson.build
>
> @@ -2183,6 +2183,26 @@ foreach target : target_dirs
>
>                 link_args: link_args,
>                 gui_app: exe['gui'])
>
>
> +# set QEMU's icon on Mac OS
> +if targetos == 'darwin'
> +    newiconpart1 = custom_target('Icon for ' + exe_name + ' - part 1',
> +          depends : emulator,
> +          input : emulator,
> +          output : 'new icon for ' + exe_name + ' - 1',
> +          command : ['Rez', '-append',
> +           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
> +           meson.current_build_dir() / exe['name']],
> +          build_by_default : true)
> +
> +    custom_target('Icon for ' + exe_name + ' - part 2',
> +          depends : newiconpart1,
> +          input : emulator,
> +          output : 'new icon for ' + exe_name + ' - 2',
> +          command : ['SetFile', '-a', 'C',
> +           meson.current_build_dir() / exe['name']],
> +          build_by_default : true)
> +endif
> +
>
>      if exe_sign
>        emulators += {exe['name'] : custom_target(exe['name'],
>                     install: true,
> --
> 2.24.3 (Apple Git-128)

