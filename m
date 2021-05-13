Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036CA37F2DB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 08:13:03 +0200 (CEST)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh4aj-0007Uy-KB
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 02:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <katsuu@gmail.com>)
 id 1lh4Zd-0006ii-Lx; Thu, 13 May 2021 02:11:53 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <katsuu@gmail.com>)
 id 1lh4Zc-0007ai-5e; Thu, 13 May 2021 02:11:53 -0400
Received: by mail-ed1-x533.google.com with SMTP id s6so29678045edu.10;
 Wed, 12 May 2021 23:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YeYrCRqXI8zMLb1ULg0TwMpV+gm7WgDzm4xxyHMWg9E=;
 b=PbrIhwjJ5Dps2g0WBHCfl65/pluLORF/skYhkbpl4fWWInXnmHRoHEtMFnPy5JNY25
 mRwon/nOeGlzJyfpRB8h34McVbjbCiEFE3Ze87VRTWrhaBkOmfbezq2PVFC9KV3FUov0
 Iht+3U/NoW6zA7RcnQBK4wNVmsjPpC6qNezwwy3ohZyTGIXEN8z8wg0/WZ3DR+80rmMa
 /Vo4TUsQyvZdqR32UglezeQq+uIr6dV8LOPXvqqF3g/4znCi4iCvjHFJME5/6oxGsFQr
 RxYrGyz4cTd38+blY0PFQdESAtsJraizh5ysJHK3+obAio3baOlwlk5Z5IMi6WmtuKGw
 DzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YeYrCRqXI8zMLb1ULg0TwMpV+gm7WgDzm4xxyHMWg9E=;
 b=jwEV/UMCf07m6q8M7bAsls28MZad95Biq913RBG83dDZ4LR+/qk81uORE85FDckwBU
 zGUVmcu2y4ifQMF6aQW+73psLNuZ8fSUd+RAH25xuMpwG9GK6q+E9XeQq6fykgVYF+9N
 vtsSiKfMUbIA8WrhPUUbdajMaPeqFQ4z3UyV5VB8v/Hmc/twHspCDmhtzSP8sP4oDtFN
 z48Ph50fm1FEeVFkNqzERZEXsL5+lNzHpYUwTgGh4CaBTbMCSmbdstF3bn7UX+87IaHi
 Yox+WFMCwmPH+xN6CB8HOnSv454hqzAFKrNh5+aTu/GW1hxUprCXNkYEZK7C3s58iGa+
 PcIQ==
X-Gm-Message-State: AOAM533VCc9GWgY8gR3iMjXyAFM1+vPH64FLaM5QRtVu/Et8jrG4U66W
 t2DMBnzHxKJjuaQlzlIyXA+lKAeWEhzZx5oTRHwOlAg9
X-Google-Smtp-Source: ABdhPJxLlG3S8mhV0wLuJWC043CoFLE32fj8ilqs5pJRAB7YKZW+e1VgRP1SBww1wY1wrURvw/GYlQ2huIdq3s0ku6w=
X-Received: by 2002:a05:6402:270b:: with SMTP id
 y11mr47877738edd.332.1620886308776; 
 Wed, 12 May 2021 23:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+pCdY3iG+pKKQqEVknnWF-W0wK36S4U1jxPvxmGAPp6FFvz1Q@mail.gmail.com>
In-Reply-To: <CA+pCdY3iG+pKKQqEVknnWF-W0wK36S4U1jxPvxmGAPp6FFvz1Q@mail.gmail.com>
From: Katsuhiro Ueno <uenobk@gmail.com>
Date: Thu, 13 May 2021 15:11:32 +0900
Message-ID: <CANrJRq+XjSjRqweBqDak8V9vi7cyNPiv8-g-irHbr6VAzo0a9w@mail.gmail.com>
Subject: Re: [PATCH] hw/input/hid: Add support for keys of jp106 keyboard.
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=katsuu@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

2021-04-27 11:02 Katsuhiro Ueno <uenobk@gmail.com>:
>
> Add support for the following keys: KATAKANAHIRAGANA, HENKAN, MUHENKAN,
> RO, and YEN.  Before this commit, these keys did not work as expected
> when a jp106 keyboard was connected to the guest as a usb-kbd device.
>
> Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
> ---
>  hw/input/hid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/input/hid.c b/hw/input/hid.c
> index e1d2e46083..8aab0521f4 100644
> --- a/hw/input/hid.c
> +++ b/hw/input/hid.c
> @@ -51,8 +51,8 @@ static const uint8_t hid_usage_keys[0x100] = {
>      0x45, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e,
>      0xe8, 0xe9, 0x71, 0x72, 0x73, 0x00, 0x00, 0x00,
>      0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00,
> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -    0x00, 0x00, 0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65,
> +    0x88, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x8a, 0x00, 0x8b, 0x00, 0x89, 0xe7, 0x65,
>
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> --
> 2.24.3 (Apple Git-128)

