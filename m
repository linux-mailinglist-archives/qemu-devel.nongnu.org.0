Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98D3A79D6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:10:34 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt55d-0004JR-EW
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt53D-00029c-Li
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:08:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt53B-0000U6-9D
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:08:03 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gt18so2834151ejc.11
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghtabWKaLVE7wk08TGzpI4OvyM7abc7BhaYk2ImRNVE=;
 b=c4VsOqmXnXECG165rJWxjMJHZdDcfhsRZSoT5n6tz4zhTRzuIt2TPvsVgL9iPBCike
 cRXCqCAqVCXJ1TNhEJlOTyggqAhaW35DprIvua81EwGzNKTo7y4tZf3eZ1VgfPfJTSJ1
 OQZepC6irrJmJQHOR5hJIErQMxIwfGkkcugiM5EvDBAiop0Vjx0kq8GZjtJCTG+mJEdO
 Wu+yQjpBwQCAjdEdEss2ANNhEPcHaRg2x7xsPg/UgNQEwwz9+Nfuc3R3cX26aNjOfnJV
 EfDeXdYjga+7sGe/LmXNw+mtCh+Z1m+1vhFUEZmQ1pTYxBxiXWBgZiURMEGV47ANGp6K
 Jikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghtabWKaLVE7wk08TGzpI4OvyM7abc7BhaYk2ImRNVE=;
 b=sDGFUfIy58Wbj5KT8e8fdIR/JiOpLRWf7kV9zibG6U8TKxvw81Jl1NVkbbyKjbIidE
 4vl8Y7C5/B7eqyMU2JGjKIgkI4qSbsmVkrZMFn3tMmdSRatWKB2u/WwREywQa7nYQe9m
 JCsR0k5WWK9QGn1lDOHu2kXgxTY0JKmnQYSbmQDQ6LnC3JAs3JImlfDDna5EwAH81cVe
 Bfz8M5Enr5HaM5dPJccUuCt4+FFOpzJHXDNgf2QF0EBgxoMnQQLHK+XaNjx1TBO5rwu9
 JOU3ji/LLGmjG25J7KomaVe3W6nLvLTFIoZEZedSMBfgJPK3HdmgON2RvJvHrpJS5pgd
 suHg==
X-Gm-Message-State: AOAM5327tqHclUmeZLsb3mcBKPSTD41CPYlnXNzh7qRw6sqcAl39x7mR
 04xTNo3+1O1SgB0PaDFDeG2ObWVj+yR29g9h8BnDBQ==
X-Google-Smtp-Source: ABdhPJx8jmRYugBqixBcLLd0r20Ttmzle0YTt0y6S/B5iBiUvnBkyu1rCBcyCPNK7oRNydsANI6QuvAhcOqh4dHVo+k=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr19432297ejc.4.1623748079287; 
 Tue, 15 Jun 2021 02:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-3-erdnaxe@crans.org>
 <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
 <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
In-Reply-To: <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:07:24 +0100
Message-ID: <CAFEAcA8rz3XkBzieMGZf7TbMkv-RPdgQG-LD06-f6kTLo-G2WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021 at 08:16, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
> On 6/14/21 5:52 PM, Peter Maydell wrote:
> > Could you add some documentation for the new board, please?
> > This lives in docs/system/arm. Commit c9f8511ea8d2b807 gives
> > an example of adding docs for a board.

> Should I rather:
> 1. Add `docs/system/arm/stm32vldiscovery.rst` to document only this new
> machine?
> 2. Add `docs/system/arm/stm32discovery.rst` to document this new machine
> and future STM32 Discovery boards?
> 3. Add `docs/system/arm/stm32.rst` to document all STM32-based boards?
>
> STM32 boards share a lot in common so I believe option 3 is more
> appropriate, what is your opinion?
> If we go with option 3, I can also try to document the Netduino Plus 2
> (maybe in another commit, or another patchset later).

Yes, I think that a shared stm32.rst is probably the best thing.
If you want to document the netduino boards too that would be
great, but I don't insist on it.

thanks
-- PMM

