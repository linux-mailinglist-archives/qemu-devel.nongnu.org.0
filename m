Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059CC3AEA20
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:35:23 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvK5B-0000nl-Ph
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvK2E-0006Rs-2Q
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:32:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:47048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvK29-0000uy-GU
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:32:17 -0400
Received: by mail-ed1-x52c.google.com with SMTP id s15so18943773edt.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0WQ5WkLCR0zmy1vOqwDBFaCE/Z+93eOci7DrNImaRo=;
 b=wkGFOIEVsxG+gFc/FQ7ELbiiXjoK6hIL6ctQEM7x0jLd2TpZTPar+CpcSJCNcBTEuH
 cdDfICBMabdqGGszeXcmKVta0L61IJffcBeuzCXM3wXTUjAPts4KgmDsGlD/VmDMrl1K
 c21ay0BQ37JQNy2yuUThZqFWr+0UIU/FsjYbZXEvFeqEtUrgGBn9uo1QHmmq5o3Sprs/
 CedjEMOIhB7KIoj6Rl8EVLcqIgFF7KpWZJ8gCRux0f+xITuxIhWj3KTXr0uVyXFWGIr8
 MShEXc8ctORZ5M9Cjvl8JydBwVruQZNaE0/X/f5zUK19T3SWTf2/lx7PoOHOP8ilu9QP
 9GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0WQ5WkLCR0zmy1vOqwDBFaCE/Z+93eOci7DrNImaRo=;
 b=bMPXWHzK7gNJYs5k4iKAMZfQsMrK1+23LJyeFh8b+emOzzqT6NsPqL1++pgn4QwbsP
 uA97ROEtrBZ7NIF8hdsHl5nrI7ZfKpYVG/bHDnxgJlMgiw/yMegJJTpMwPDbkH+BTjY0
 QpTMt9qKBxrtUtiYB798h1XMiPYiNnOt7LS3gwi1kp8jobW13bpj4VwyUaE++p1X4ac9
 gBl2Urvf11Bi1pgjEg0gfYHNkYRFhtLeW4JwaIHOkYtJg+cwwNNBVxLfDpF0vIoKSEBs
 JYrPgxs0q5p3yad/JsA45JBlqWUxBPVz/lMm+JFhkBspX3K+HB7e2nHkVjVdiDw5TUYz
 sWLw==
X-Gm-Message-State: AOAM533EvNC3//DCwAyu+mvfLwj+IuCNyg8l8CuohhyVB2R+EN0/siBH
 oUaUTKHXfFUwMyQvFY2Worjul0bovk1I5PzKzCR+0Q==
X-Google-Smtp-Source: ABdhPJy43epzB4osEbawZJo1palzaaM0k0063543/M2w3Q/WmtI9ZMjWeSrzgX9KGl8bb9Yr2o/294JdjCWoTOT7KBU=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr1005292edz.44.1624282331874; 
 Mon, 21 Jun 2021 06:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
 <20210615192848.1065297-3-venture@google.com>
In-Reply-To: <20210615192848.1065297-3-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:31:36 +0100
Message-ID: <CAFEAcA9=L1F-DGW+1g5K6dC9XDMUJyrLf4PWJq9nQ3XthG7nZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/system/arm: Add quanta-gbs-bmc reference
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021 at 20:29, Patrick Venture <venture@google.com> wrote:
>
> Add line item reference to quanta-gbs-bmc machine.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  docs/system/arm/nuvoton.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index ca011bd479..197d149f66 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -1,4 +1,4 @@
> -Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
> +Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
>  =====================================================
>
>  The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
> @@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
>  The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
>  Hyperscale applications. The following machines are based on this chip :
>
> +- ``quanta-gbs-bmc``    Quanta GBS server BMC
>  - ``quanta-gsj``        Quanta GSJ server BMC

Why aren't we consistent about the names of the machines here?
This suggests that either we should have called the new board
'quanta-gbs', not 'quanta-gbs-bmc', or we should deprecate
'quanta-gsj' and rename it 'quanta-gsj-bmc' ...

thanks
-- PMM

