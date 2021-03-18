Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABB340B82
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:17:46 +0100 (CET)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwHJ-00076K-6h
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwEo-0005ZV-CP
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:15:10 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwEm-0002HR-Mv
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:15:10 -0400
Received: by mail-ej1-x632.google.com with SMTP id u5so5141512ejn.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=31leKgiW7kB6uj0FIdVGaADHwh7YyDYCcKw0QV3UEr8=;
 b=sFAFboUNaxo925DuZRa2yXi8zrfCGnObQkjAdPBFw7XqnBGE2pS/3CqL6OqYwvxFch
 skUtBOfxzIVcsKik+cE31/zx+UGJqZl7mFnYfJgsSL5uunh1dOE+m3x8wGt2bqbiOOg1
 K06t4dnQjDsyo0IRt0A7aDDO42p2yEHucxq0yFw/42yNKM7gnwsJPjBUvoS9XRBRo3Gt
 TkCVQaTToPQJwKaLu+ROUf1EoGFn2UMpN9W3NCvrcaCcWnL9Ivr1dM5DCbWUDdoABvAR
 pjtteiXZzr1PyP7fxP6V8uPJUWjIkxdoaDuweLIz5ssMmkUCN0CrWbRgoQ/2G8em0iCQ
 L2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=31leKgiW7kB6uj0FIdVGaADHwh7YyDYCcKw0QV3UEr8=;
 b=ThhBgBHL2Pf0qg7qgrxoVdKX4QKpWm8pRY+BDIJ6ftZBXpdWWvAJUVTfFAZTN6RWvB
 EZYyw8iUrO1nF1AqvqDrOcyVVcMGhJY3eW83Cb/SEYKlQMwkJ4/z+3Wt43HH5Y/vIQ73
 Cltyjqj4wJoPMWh5XMqs2Kstyb/A0ugCRxVaCCpVknMWqrcxr1FvswUWYBsp4TdD7tYC
 TH40XqEHolRVXuefCOMv61zc4PoI5nUGP2TYCBNgahoCm50btOOcTbtV3R14YRVO5yT/
 j4AU1oHulIvYK1q4njH589nmz2X4QXvY+waGFATaswZtt9Yk8Yoigf7l365pqvpRkVrZ
 EHMA==
X-Gm-Message-State: AOAM533FFpMdD0Nk5kZcVM5EK4VZS5pMQP4EoChwLo/Sd/o7cToH28QW
 hgqBwt4KGUUZmjVE6UEujXm1QxYAp+d3q/OgSEZ8rQ==
X-Google-Smtp-Source: ABdhPJzHsO5MQZO+K4zqMEyrwBT33o9jlfWh9qXXvf0bQ0GORd1nDyzQmhEhtQsI4YgPaWB2jQ3tsWNn4KiZ1LlIP9g=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr42724832ejd.85.1616087707157; 
 Thu, 18 Mar 2021 10:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <20210312172939.695-3-peter.maydell@linaro.org>
 <f9bbdc90-51ca-8ba6-26d8-3db820193a15@amsat.org>
In-Reply-To: <f9bbdc90-51ca-8ba6-26d8-3db820193a15@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 17:14:42 +0000
Message-ID: <CAFEAcA-WoS9-VPz948s-X8BxesF00jt0oKK1WwPeXR4GxPYCJg@mail.gmail.com>
Subject: Re: [PATCH for-6.0 2/2] target/arm: Make M-profile VTOR loads on
 reset handle memory aliasing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 20:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Your solution seems generic, and the problem is not resticted
> to Cortex-M:
>
> $ git grep rom_ptr target
> target/arm/cpu.c:334:        rom =3D rom_ptr(vecbase, 8);
> target/rx/cpu.c:61:    resetvec =3D rom_ptr(0xfffffffc, 4);
>
> Some thoughs:
> - make find_rom_for_addr() generic ("hw/loader.h" again?)
> - poison rom_ptr() under target/ to restrict it to hw/

This problem isn't specific to code in target/, that's just
the particular case I care about. The uses in hw/ are mostly
in board init code, which (like cpu reset code) runs before
the rom blob reset function, and so wants to directly look
at the blob data. If a board has multiple aliases for a piece
of RAM then rom_ptr() will cause problems for code in hw/ too.
The only advantage that uses of rom_ptr() in hw/ have is that
they can know which board model they're running on and so either
(a) be sure that the address they're looking at doesn't have any
aliases elsewhere in the AddressSpace or (b) manually look at
every alias address in turn.

thanks
-- PMM

