Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BFA57FC14
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 11:12:53 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFu8z-0004am-33
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 05:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFu4d-0000cY-64
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:08:29 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFu4Z-0008FH-Ar
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:08:20 -0400
Received: by mail-yb1-xb36.google.com with SMTP id k85so18923399ybk.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z3PJVB4sv/YS74Jp+v8nHCxqgLV5zuPX6kfbGV4tUeQ=;
 b=WiM9duHZ4fuzzNsInx/G5/XoU95DwLAQfVymyIyAzkqeCykzCrLEbbokQ7xK6zco4s
 4rK/dH0BrtO8Hc5wV5YbxKxTfBF1uPJwBlVeiA0BePs3fWGhSm0NL24c4kZCdFTHGFfW
 s0JP4ppGMvkendev7RlhiVyBSccq1Fd2IBeAdl2Bx5dgN1fRY4WzAA1v6cUtHTJf/egc
 aimQFnFENRz4KASOyoXHRI9IHoNznHFHpWh+/cY2ccBUj6tEVB3xh9Q5poYH1bdTPW7f
 gbzV+xGXp86dSZ62WOvgSWUmg53xwGuNpzIpunUfAUILI8Hs7OaZJ4gdacaOUPr16UVd
 u+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3PJVB4sv/YS74Jp+v8nHCxqgLV5zuPX6kfbGV4tUeQ=;
 b=x6Ukt7krpkO43nDr5eoDZvP2ZzXzzTp81UI9ZryocYvt5fZTg6gFcBQLNrw9bof/O5
 cQAuIxitQhI7G3W7PcYnQueFyCB3EZYHxJVgzLr5HUOEsMKqnw530vzzui6XTncJmp2T
 g2RIF49vBh1Qr8nW3d7JtirK/FcjNDFwWhQfNVhj/6bJ+XxV1OgOncRvuM1ojsOXNk4T
 ABY/YnDg8zQUV/EQKhAFexbRHgb7j3e7LVU01c0u26W8yVkNyJJMmOf6AAob1Y69IkQm
 zsusrguq8zfXVrDvp77LcmFMJ3UqSxt8/DtNvmkPzqKYUgWAMTzB3up4u7vH5BCTlqlP
 wZEg==
X-Gm-Message-State: AJIora+6lru8QDPw0k8b1ciV8riEhbb3I4wf7HBitlW6sbadLL2Onbh/
 EY4+brVRj2IzEPIJ/l+4SbN7qhfMLOKnzV3AEfKPKA==
X-Google-Smtp-Source: AGRyM1vjvZmIMXUMJFlXHduMdYwHQyhqkiW6A1NnhqHLp7A4uO1+DInvWTO/b5Rv3+ktzu+PXkig6ovkAxN9WELXSVc=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr8260841ybq.140.1658740097900; Mon, 25
 Jul 2022 02:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
 <87y1woyxvo.fsf@linaro.org>
 <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
 <CAFEAcA8sWMD1eZCZyiMPz_SNKRn6J--Gm53aQuTo-KO5bWyFrQ@mail.gmail.com>
 <CAK7rcp8pvQfn=x1DsFwmr2GbK-tqmCxh8stkA8+QmfdC-peXPA@mail.gmail.com>
In-Reply-To: <CAK7rcp8pvQfn=x1DsFwmr2GbK-tqmCxh8stkA8+QmfdC-peXPA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 10:07:38 +0100
Message-ID: <CAFEAcA9BUmWp9-=rsUFV816X3--ihi6oeh=NcMq3NT2fDST8SA@mail.gmail.com>
Subject: Re: Access target TranslatorOps
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 22 Jul 2022 at 06:09, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
>
> I need to determine the set of instruction encodings that the TCG can support for a given platform. I am not bothered whether the target runs at all, and in fact it is better if it doesn't, so runtime or translate time doesn't bother me.

So, something like "does the emulated CPU support guest architecture
feature X" ? Look at how eg arm handles setting the Linux hwcap bits,
for instance.

> Imagine I were adding support for more instructions for a given platform.
> I would like to check that I'm using the API right. It's amazing that
> it's been so far and there's no way to check that the correct behavior
> occurs when a given encoding is encountered regarding the TCG.

The way to test "is the emulation correct" is to have test programs.
For Arm we use 'risu' to generate random instruction sequences and
check their behaviour against some golden reference, which can catch
things like "is this insn supposed to undef in this configuration".

> A boolean result from a can_translate called just when the target
> encounters the instruction would be good. Additionally, the ability
> to force the translation of arbitrary encodings would be good.

I am completely confused about what you want to do here, because
these requests just sound completely bizarre to me. The translator
is its own self-contained, and linux-user should have no requirement at
all to be told whether an instruction happens to translate to
"raise an exception" or "generate code to do something".

> Additionally, the ability
> to force the translation of arbitrary encodings would be good.

This is easy -- just put the right bytes into the test binary.

-- PMM

