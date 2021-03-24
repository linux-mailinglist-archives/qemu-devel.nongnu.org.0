Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521BE347D40
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:04:31 +0100 (CET)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5zh-000587-OB
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP5ux-0003Zr-1q
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:59:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP5uu-0001rP-7Z
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:59:34 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so33727853ejc.10
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=waNLBDAzefMNFRM86JImHF1BI5w3bxJ2t99OqvN2eJg=;
 b=LAQvqWAKPEGaVAMxrdhru1xsatO5Nofp7LmE/OyRawhixNELSYXoeeDdCNYukpnkag
 xbxqbJOr5HUAjrwhBQ/1mn5Lth5ktWFeCAnPdwkiypnE5II8psDUC3cqI7nCv9kDsXl7
 es/yG6kJ+wtLSv2p228Utrye4gp8nR/I3rNcktz83+Jio9tv4QfsIQ/SA9Zc3AoxAG0f
 ON0HofPckD15Ihq69k6NzblleVrEjyMzby83ZvhE85ZujcHhTK+UJQCnX62jb5MH8D1c
 wbtVeDu3trCZlviZDqAvmQKUyd27C/GqNPZnBBXk9x81rM7a6zD8jA6e3o9wvZu66Gvp
 Q2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=waNLBDAzefMNFRM86JImHF1BI5w3bxJ2t99OqvN2eJg=;
 b=HN4Lc5PoVEpwRBaXOYFOeIm7c5TS4BsBmi0bFNZbP0byfO+51Mdl0MqRXXv9ApdTXc
 Vlw0WsZYsOQ20xUvCJU5zosB9vO1F1cKwK44IeH+gM7kAP0mt8T84Qb0d53IGjEroIEG
 GHwShHprhUXlk7GyZtnoAo2UJW84FaPdaRvtd1Nnr4/x9d6huLXGmBmyiBSK+Jz6wCY/
 neu/+91tI2dbcPsi1zS+K43Nch8mFghqh0MBBWRj7yVY20ljE1cyaqHZ4iLzsdMmdFT3
 uJei84R1pwNuNzHxCgt1Kjz1eqhh/B+Y8TY2W0iX6CcievnH0iDGN8bFX87vUw6kdmzj
 0R+Q==
X-Gm-Message-State: AOAM531KkN8I1Df708u3dXucDW9dW6NMz5XZTx/BYJqTy+hW3LuWvS6O
 s46ZHJQzEqUBNRiPj1vSpELkvdNZi/SnHFuFUs1F3w==
X-Google-Smtp-Source: ABdhPJylxgISdCUiBUmeEVly1oPNR67PjOGc9gnJGZGSELFntk5hx2NOmzY+AWRqgsPvoZf/DVTnp2vFL89m3WNHt2g=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr4362853ejz.382.1616601569931; 
 Wed, 24 Mar 2021 08:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210323165308.15244-1-alex.bennee@linaro.org>
 <CAFEAcA_c0xYHhwyJtgcwhzVfv9EaRTYdjRCWJsk-ZOuE5okTbg@mail.gmail.com>
 <875z1giqac.fsf@linaro.org>
In-Reply-To: <875z1giqac.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Mar 2021 15:58:59 +0000
Message-ID: <CAFEAcA8gOrZOhWzNzu7NbXemNzgaYvmfeCFpOZpwFnPFB-o0uA@mail.gmail.com>
Subject: Re: [PATCH for 6.0 v2 00/22] fixes for rc1 pre-PR (kernel-doc,
 semihosting, testing)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Wed, 24 Mar 2021 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 23 Mar 2021 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >> I've added a testing patch to extend the CFI times, Laurent's series
> >> to fix the iotest regressions currently keeping the CI from going
> >> green and an optimisation to the --enable-docs build to try and start
> >> bringing the total CI time down a bit. rc0 is being tagged today so
> >> I'll probably roll a PR from this later in the week in time for rc1.
> >
> > That's tricky given you sent this patchseries at 6pm on the day
> > when rc1 was nominally going to be tagged :-)
>
> The wiki says:
>
>   2021-03-30    Tag rc1
>
> so I thought I had a few days.

Oops, yes, you're right, sorry. I always get confused by softfreeze
not being rc0...

-- PMM

