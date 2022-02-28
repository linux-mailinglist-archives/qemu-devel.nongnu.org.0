Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E14C71F5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:49:46 +0100 (CET)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOjDV-0007gN-I5
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:49:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOjAd-0005NL-8s
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:46:50 -0500
Received: from [2607:f8b0:4864:20::112a] (port=40644
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOjAb-0005qt-Mu
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:46:46 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2d68d519a33so115207667b3.7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UUGh/9gqJPUcFbsoDD0s0jo26jPiuQSYfwbzN6L2/Tw=;
 b=UDiPNmJBsZLK6en2yKOGSdlpDJkej2xA8oi49G1OOAxp8JqS3XGdUoqCEFNvMYF5Qz
 55nTtHnL6J7OFQ1f4XgkcJEwWGmNLncVDzK22k0CSXu2jFWIVrELWeMSr7cIuH7LfoM8
 8fn4FZXJ6AxNE9R4wo9vuUgSsSjM7EUfQgG0WANfnt8yntBY1OEv++SncAKADMBnnIKj
 43dtLEz9J8yJ4VCauB8OrUUUO8H0WJnFYNwnxC0zYN48UEjsQ9pGd3+qy79s6UcTNGa9
 w5MQqtFVoxNK9dWFZzl4lB+7GjTcq5jFesVBL8snkLaA0+a7fhi+AstQqRZjNe5VEoHU
 dHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UUGh/9gqJPUcFbsoDD0s0jo26jPiuQSYfwbzN6L2/Tw=;
 b=b0ZQowkM1A5NhzJSyG7Qc+g/AtnLBldSUaoJBkUUI5DgipZ6RKdkBGPOUITY699DyT
 AglXDVSTRKMQwM1wi+fCcTwt+nClmjX9TAu4yU7EYUbRT8enBI1qtpW1WaoI7+SLOM0n
 VtmHxL458ZuKjz9bzBBUuz2D8Zb3uKZPcxWo4mZDsVm5fuT/5xg5JKLebBtYBSzZDRAw
 UoyHRlgiCxvviVmvrZ0CvtV+JCnZChX7A+xYKbzG+v6B9C7MRyoAWxQlNot6DGAuf5tE
 LMxS0g2zZrNrW6zSrBbqd4wSB/AlZCPB5EaJQQy7Yp/jCKAetfb2y/wv8PobwkejDvkc
 MgmA==
X-Gm-Message-State: AOAM530yExMusr/pBzab/SLILmu+VOSvvcuzXP1cVmMZwZTVoJcYtrqB
 1fdAjliB/+kcEiJpLbd1Bg6c0qVGV5/RjNdvxSF2xg==
X-Google-Smtp-Source: ABdhPJw+moKL0NkJu4SPQCN7+5c6dZyD0xpL0HpyJEc8kUrA71dCpeH5h2niHQ/HP7qOZvdHw03ZlGYyt1y+hvkNkUg=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr21669826ywf.469.1646066803670; Mon, 28
 Feb 2022 08:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20220226015924.1293022-1-shorne@gmail.com>
In-Reply-To: <20220226015924.1293022-1-shorne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:46:32 +0000
Message-ID: <CAFEAcA8r11SPTEcRBLg-KKP61iW-935048Rn1_ZVg8O4GPUT=g@mail.gmail.com>
Subject: Re: [PULL v2 0/6] OpenRISC DTS Generation patches for 7.0
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Cc: QEMU Development <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Feb 2022 at 02:03, Stafford Horne <shorne@gmail.com> wrote:
>
> The following changes since commit 4aa2e497a98bafe962e72997f67a369e4b52d9c1:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-next-pull-request' into staging (2022-02-23 09:25:05 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/stffrdhrn/qemu.git tags/or1k-pull-request
>
> for you to fetch changes up to 9576abf28280499a4497f39c2fae55bf97285e94:
>
>   hw/openrisc/openrisc_sim: Add support for initrd loading (2022-02-26 10:39:36 +0900)
>
> ----------------------------------------------------------------
> OpenRISC patches
>
>  - Add automatic DTS generation to openrisc_sim
>
> ----------------------------------------------------------------
>
> Since v1:
>  - Added fdt file include into meson.build
>  - I couldn't figure out how to run CI easily, so but I think this is the right
>    fix.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

