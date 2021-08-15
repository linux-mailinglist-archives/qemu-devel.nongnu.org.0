Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A233ECB19
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 23:26:42 +0200 (CEST)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFNeS-0007Gc-W2
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 17:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFNd4-0006IX-NT; Sun, 15 Aug 2021 17:25:14 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:59662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFNd2-00087l-Nq; Sun, 15 Aug 2021 17:25:14 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 0C042C6019D;
 Sun, 15 Aug 2021 23:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629062707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ELEgHucCu65ZYA6bTDYvaGOHXp7f0NsEa4uHXPEdCak=;
 b=e8K0sSwNqMXH1oWFSnWLahK6fXJgL2gJaTcI3zifWxwrkuiManDViy5a2/GGN5CoFrSrfs
 5rFv6r187Ichus0RRVYxzZIMF/3Nnsowt+hr1YPBntE1Np5KpQr2z/pUg0BGeJdTQEWXAy
 9fbE99VcN6wwB4+ayaV2FzBvnTF/WZlOdEFYNnzRAMz6uwoflB89wTwaUyK5y+IXPFhgMu
 8zTWKMSpm7as+q2Nzt5+rEd198A49xyea2QmrYm1/Lj355FGaX80vwbCWv0zf4Atc9dsFT
 rblrAl9DU5UNE/XXfWxuv0pe9g/cTXWt0QnbDhMaMaM857QgPvhNP7LTHOMWjw==
Date: Sun, 15 Aug 2021 23:27:17 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
Message-ID: <20210815212717.rewmmgfhksrcmaxf@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-10-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index fc5a99683f8..c371b9e977a 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c

> @@ -133,10 +143,21 @@ char *clock_display_freq(Clock *clk)
>      return freq_to_str(clock_get_hz(clk));
>  }
>  
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> +{
> +    assert(divider != 0);
> +
Maybe add a trace here to ease debugging?

> +    clk->multiplier = multiplier;
> +    clk->divider = divider;
> +}
> +

Otherwise:
Reviewed-by: Luc Michel <luc@lmichel.fr>

