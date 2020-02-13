Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C015BF06
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 14:13:59 +0100 (CET)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2EJb-0002wl-1e
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 08:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2EIX-0001up-IM
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:12:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2EIW-0005SJ-Ky
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:12:53 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41533)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2EIW-0005Rg-GV
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:12:52 -0500
Received: by mail-oi1-x243.google.com with SMTP id i1so5679995oie.8
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 05:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qLCjiEl/fV4vLzfh0r+e6Z98cbRbz5s7MCFg80dBhPc=;
 b=OP8lotIG96RWxSjUKz2CSvhauN5Me5GInOIwRKc+arnG6aEChClQDc7SAbbFWY1ntG
 qIrEFevFM0hMC9Bkm5KBBJP8UvOs/RjIj8OZITdJ30967R5Zk40xgzIzvW3rqVp6C2Yf
 OFxF6lBY0vyfqGKqVsYjIOuTsnytGEbuhea3Bn/fuWnuDZYvWa4pGJoDLlScnBI0SMQ5
 yUmpSWRmUsfd1WrucaQGj65Peqavyqpl7YGpavaoM8k9vZLH3KcfTpSDPq8Eu0cYf2XK
 0RIwLohTaoFUNojFtgENoBfYrpemo0ZLv1R5qfV/swVP6LEdB2aPfegFkUsvqrF1JUZR
 pkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qLCjiEl/fV4vLzfh0r+e6Z98cbRbz5s7MCFg80dBhPc=;
 b=MDT46WlejsNZFc583wS/MQC7DyNe1tGfcVwLLuCtneUyWbL91QLc5py3qb+w2PBPyG
 /mFFDa2+4/FXoFRtnekPXsqGv3eA9alOi5AWxfoBbfWxxuEGJdhwDQXsayZhXn6gPPpy
 3cz/WIT5Gczq/EBdD4ZdJof5hIHjGrivLXRqCtU3Lj2kBtLCypGOW7GHD0MZ6L2cxLcK
 LIyp1PmXfuM9o53fQ7n4qk4YL0c8BMqU4p4AzwK1ijpRaaf9ZsqZ+ebJ/QzZ0Hj60ACl
 sMIsqt8fWQo/b8hs5wq7VCfrrxIgu8fOPE95wQIToB68tLWsPNFQgtlP41Nb+MXuKJdd
 Q8yw==
X-Gm-Message-State: APjAAAXABEKb+psS0+YkyOriMubIPJ1TNH4IrEFpt/4+z7UfH7wYdzO/
 Z9QxEMrI7IYpKrjxjK5Ha02n5mbm7Ce2DyoQQswdYg==
X-Google-Smtp-Source: APXvYqxyP+rSD9Qs7PMxWIkPVdEpvs9SDM5Ddriy9t0BAZab/0vBZVkxmqdqev6NCi65OauVjDCD6BWcqMbTarW4nWA=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2902519oiy.170.1581599571716; 
 Thu, 13 Feb 2020 05:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20200211194228.16907-1-richard.henderson@linaro.org>
 <20200211194228.16907-3-richard.henderson@linaro.org>
In-Reply-To: <20200211194228.16907-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 13:12:40 +0000
Message-ID: <CAFEAcA-F3Z_QnkJ4t1x+eN-ubrHi9DbsgP+=ORRuWxVkojgQRA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/arm: Split out aa64_va_parameter_tbi,
 aa64_va_parameter_tbid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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

On Tue, 11 Feb 2020 at 19:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For the purpose of rebuild_hflags_a64, we do not need to compute
> all of the va parameters, only tbi.  Moreover, we can compute them
> in a form that is more useful to storing in hflags.
>
> This eliminates the need for aa64_va_parameter_both, so fold that
> in to aa64_va_parameter.  The remaining calls to aa64_va_parameter
> are in get_phys_addr_lpae and in pauth_helper.c.
>
> This reduces the total cpu consumption of aa64_va_parameter in a
> kernel boot plus a kvm guest kernel boot from 3% to 0.5%.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

