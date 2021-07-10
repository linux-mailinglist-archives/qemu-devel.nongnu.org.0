Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7B3C3639
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 20:57:08 +0200 (CEST)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2I9y-0006ay-52
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 14:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2I8A-00055t-VV
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:55:14 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2I89-0002hh-8y
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:55:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id bu12so23590665ejb.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 11:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NqRPSaaAzxs+kwRJsRVk7VTlURSZw9MTH/WRnZUiJc=;
 b=Wx4Fycc6Xhucn4QXThmxJn8k57xf/t38O/7hUZmxNQbtnjUa3PrnYyrzZlaO8XZKtK
 u0QHBqZfopVgOWFkqStE4RZj5IHz79czJ3rokVG3BhcdWEQ1AWi8FQKeHDpEJAidbmEI
 sFcUKr1s0AQnzecQpQp1mo1uCgC1+J7aJA4kSk0ZDcPwgvYAov0ejDgTjOyEkZVtQj+T
 mS+QIAeEAc3z0xLW5iFVOJfE+33kBtAMMBeqrEpth4gNVJjqai8whieMxKPrCf9oyhjh
 9jWhsdgstHqZ+fg20AVj49Ubio/uBqC4Yt7TV3Z6ICiY6234frznVJ5c307FsFCTnzcg
 QRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NqRPSaaAzxs+kwRJsRVk7VTlURSZw9MTH/WRnZUiJc=;
 b=rCWn/eY16r/4ceuehre1vOxB8/U9qiN1Ea5WeQ6HY+H5V9c74lPGyvxJ5Hs7o9spBW
 WE6UEEn5PawG3KyopXZsKYPBjEeuVWGgqXoQhtgjyKRMaYgGsHT179MNWUhFhxIzmKgD
 xSY4Q8AoMpNYg1ifefr1Xgac7NitM2ZTqOpJTnYgXnbw+5AAq2eKp5PdoGuL5uywfhX6
 po153IN/A3Gv76kTmIlm+FZn2yTb3CM23R8oEllaom48cWvQS/qMwK4bAN1Xrb8LYUIz
 jEb9nDZrqHMOQpc7a1eGS0IvMOyMHUzs2jUnVAtWzEVRuOFuJhe87VtgJ8p0S6gzH6rl
 HVJg==
X-Gm-Message-State: AOAM531K4fCtIgmHcf0sUMTkKmzTu8it7Vu7KaTGOTyJhEiJPhKePEM9
 kowFZPX/S8nOCILc+0vaV/2/EjGFB7cT/SIt9PxJXQ==
X-Google-Smtp-Source: ABdhPJzP8st4X1IWgrox2p0kAwgp+036rq2DWCb35QCd/ho6v7y+vT9YMlJxAr4lcCrRLWfqUc5w/HBK/NcelL4Zbq4=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr44340740ejy.407.1625943311557; 
 Sat, 10 Jul 2021 11:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Jul 2021 19:54:32 +0100
Message-ID: <CAFEAcA-EnDhNhUSicGyYH48qHoEihWDo4UfqZjx2rzYeiaYGNA@mail.gmail.com>
Subject: Re: [PULL 00/33] ppc-for-6.1 queue 20210709
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021 at 06:17, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210709
>
> for you to fetch changes up to 82123b756a1a2f1965350e5794aaa7b5c6a15282:
>
>   target/ppc: Support for H_RPT_INVALIDATE hcall (2021-07-09 11:01:06 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-07-09
>
> Here's a (probably) final pull request before the qemu-6.1 soft
> freeze.  Includes:
>   * Implementation of the new H_RPT_INVALIDATE hypercall
>   * Virtual Open Firmware for pSeries and pegasos2 machine types.
>     This is an experimental minimal Open Firmware implementation which
>     works by delegating nearly everything to qemu itself via a special
>     hypercall.
>   * A number of cleanups to the ppc soft MMU code
>   * Fix to handling of two-level radix mode translations for the
>     powernv machine type
>   * Update the H_GET_CPU_CHARACTERISTICS call with newly defined bits.
>     This will allow more flexible handling of possible future CPU
>     Spectre-like flaws
>   * Correctly treat mtmsrd as an illegal instruction on BookE cpus
>   * Firmware update for the ppce500 machine type
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

