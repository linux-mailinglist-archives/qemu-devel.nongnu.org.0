Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7E142CB7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:02:20 +0100 (CET)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXdD-0004fa-LK
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itXat-00034q-7Y
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:59:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itXar-00077D-3g
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:59:55 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41799)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itXaq-00076h-Vk
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:59:53 -0500
Received: by mail-oi1-x242.google.com with SMTP id i1so28537483oie.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 05:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9C4cxku4EuN276kH2zSsBROBZcYr/SLI9wjT+E0UXR8=;
 b=uBUcvIbBcJnPn9jXudVl9NQEZMpDDdH8JEkC3blzx7aCUgc+GKS0sWopY2F7b8SqOa
 JZV9r1Ua+3Q+Yi8cFkK7aqFT1B8iHGPuA5j36DEGTHF1vSx/yJXwpzoZd386SsQWjXf3
 7eiZKhRVv4yOS+R/7Pg2diTMe5Wy6H5T3CmOBudAJREx8xtOjcqmclgRVjXZpU5UvDEb
 u+ipOMWsZiAJ3pP5aoC5gsm09WvdIzTiTeMcZNCkg7BcN6FMM3UzMtlgMn0NCk0qBIYs
 aH6G+Vudd0wSxGg4ZaraKBmsUCZygFCg8c+Max4rANLk8DemGI4T7yIy5reTB8pO3dpe
 eAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9C4cxku4EuN276kH2zSsBROBZcYr/SLI9wjT+E0UXR8=;
 b=VLOdah3O+75Ln7pIJkT4Fw+49Rsq6APxmkzWhMnqHb5vxqCoF/d3AGi/3JqWxuLlsP
 B6CtUr7EnfqpQl6Vqeler+mSkblrYqOA9c2x/EanA/HyfhMC6WBkd/xq1NxbZJstasI8
 awoZzfvDQaPq1wocvPhVXkw8V7W1Znq+iKdhL7vX7d21s/fsSEN82VAzhYSi2F45zMjA
 GUJdvaC0sPo/m8eR7wIZcS007ynHTRiqBGX22Cy/oLAGdpLY7j5HAXsmTdfqLJjrQqgG
 gFfsTccjX7n06hLDqmveYEF5cx0KWks3PIFMZaWGn5FU4AsJHce2LrGV82k+tnWJQU5+
 Mv9w==
X-Gm-Message-State: APjAAAUMosExnsR1o3LrE7cFllUnZsziAow6gVToEU22WTPV5uFnMkEn
 RYSzd2PIqwz0Gkq3Qrt2a0KEfBZlvDvH0T78Gfd6wA==
X-Google-Smtp-Source: APXvYqytss0xtfkovsQAsO4NycOWghmc36RWoC2Wceg0UTgg3zxvUtRKCyuai746sufNAeSdcKgAWJEW5fNiUfYebO0=
X-Received: by 2002:aca:d78b:: with SMTP id
 o133mr13086702oig.163.1579528792161; 
 Mon, 20 Jan 2020 05:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-8-linux@roeck-us.net>
In-Reply-To: <20200118164229.22539-8-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:59:41 +0000
Message-ID: <CAFEAcA9ADoUh+eKXKMTv2x=ubqTiyENNdKxuwVHfP3t6=dZXUg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The Exynos4210 serial driver uses an interrupt line to signal if receive
> data is available. Connect that interrupt with the DMA controller's
> 'peripheral busy' gpio pin to stop the DMA if there is no more receive
> data available. Without this patch, receive DMA runs wild and fills the
> entire receive DMA buffer with invalid data.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Context changes; improved description
>     This patch has an outstanding review comment, suggesting that
>     uart and pl330 device states should be kept in Exynos4210State.
>     I did not address this comment for a number of reasons.
>     It looks like the problem is hypothetical, the problem may
>     apply to all devices created in exynos4210_realize(), and I am
>     not sure I understand what would need to be done to fix
>     the problem for good (ie for all devices created in the same
>     function which have the same problem). Overall, I think that
>     handling this situation would be better left for a separate patch.
>
>  hw/arm/exynos4210.c | 42 +++++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

