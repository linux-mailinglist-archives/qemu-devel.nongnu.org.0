Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B4A381FA4
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 18:11:32 +0200 (CEST)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liJMZ-0007fK-4K
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 12:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJKt-0005kA-1V
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:09:47 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJKq-0002hk-1S
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:09:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id lz27so5567912ejb.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ToUVxt88aH6dinD8va+eg6VECoFY59T9VHIDw/tiqus=;
 b=qDo+0kIIkLJB5c/yX3HmvooXxn+4epz5LtYhnuA29Bhx4oxu625HeBEagL2xEnWw+Y
 AHMNveE5iUj4Ia0SWO4uYEtrPVPZL+UKkKYyQ1mZNcYBev6fvA16MaOPKiRgK6lcEB8P
 OQoxys76IO7Q3XRGSIDLNIlCJZCoRhEzLlkC+L+164bMG3YeI8xkqolyNGXrDGqVVZoa
 eR1/fMm5zjW8JAQXerPh2Xdanxgyog4MI8UqOJqXu2olF2N0fpvQqKi6ZI6adUPRej0E
 QVnx4oe6V1IHfBoOpnErN+fbjkJpvnlp6RYtKAMegLUWTsq/BRjmc4RgdfK0y6GMC+X1
 KF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ToUVxt88aH6dinD8va+eg6VECoFY59T9VHIDw/tiqus=;
 b=ZmBTgZeewUTAurAXHOI+aSxduM53qW86MV+vTN/pP3KJnUDSUky3E3EA7HuC5uVpS2
 sF7Jb+p5nIRY3m0wZeKreDRKRGMLilw/2Zlk8QDJyRnfhIg8jEwH2ap2Ay9/NDPAgaxK
 +mO/DeJFgWY8dbLL+T7p/Nl66IVOKI60K1pPUZ0+OVMfgJr4YBRWf6RllMYZ5Yxs9on0
 zmaSGqNJgEYJfZyWglbS36DmRn5WfVsoIhewr8GldOzfxk+7OvLRgAFdouStNigJ542a
 osd1+hmPpaeKdNmCIr+k+LbzEfwwREQ0JSgczghcD0PuU2b3fIuvwfX/ID+8R7qWLLfl
 WQkg==
X-Gm-Message-State: AOAM531zRQiT0+Lm/ozOBpOlKV+TvdMM0s4yXk326k/KEih4d8XXvWUX
 4cqBfi/mqYJ7Qlha9NRvLc3qC/HgwVom1W7ff3UXdQ==
X-Google-Smtp-Source: ABdhPJyB9wJe7a0GMREJU4MLzRrFRwRkdtXjpVviJQxfrwc4iv+fb77zQR1AwJRWN5s7J1PbIPP46+WqwfW7ISYGGPU=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr35943175ejb.56.1621181382352; 
 Sun, 16 May 2021 09:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-78-richard.henderson@linaro.org>
 <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
 <47db40f0-52c4-f282-ecf9-eab2bdb7f1d1@linaro.org>
In-Reply-To: <47db40f0-52c4-f282-ecf9-eab2bdb7f1d1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 May 2021 17:09:27 +0100
Message-ID: <CAFEAcA8gYB+SWaUERkC+PbkqWwri3mx_E1TCgV184yX8YBvA6Q@mail.gmail.com>
Subject: Re: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 May 2021 at 18:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/13/21 2:25 PM, Peter Maydell wrote:
> >> -VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
> >> -               vm=%vm_dp vn=%vn_dp vd=%vd_dp
> >> +VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
> >> +               vn=%vn_dp vd=%vd_dp
> >
> > Is it possible to make this kind of bug a decodetree error?
> > It seems unlikely that there's a use for having a bit which is
> > decoded both by a %foo field specification and also in some
> > other way...
>
> That's not what's happening here.  This has separate fields "rm" and "vm"
> decoded in different ways.

But they overlap: rm:4 in the pattern itself is using bits [3:0],
and "vm=%vm_dp" is also using [3:0] because the %vm_dp field
specifier is defined as "5:1 0:4". I'm suggesting that if the
pattern uses a field specifier we should check that none of the
bits in that field specifier are used in the pattern for some
other purpose (here 'u' and 'rm').

thanks
-- PMM

