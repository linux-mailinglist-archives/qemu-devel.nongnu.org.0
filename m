Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7B48BF40
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 08:50:20 +0100 (CET)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7YOh-0001Z9-9c
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 02:50:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n7YNT-0000sF-M3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:49:03 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n7YNR-0004bk-9e
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:49:02 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id C35B5C60912;
 Wed, 12 Jan 2022 08:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1641973733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8Ff43O9Vrt+f6gX0BKr+ov5fuI23ct06MB3iEYGr1Q=;
 b=B1zvvYEG/l8LsPdOlEq4DGdJFjfjpfc/N5e7bgbYzm1mVJYRaMj7r+f9vCo9n/IQr8cSDC
 Yp6sqPsLnoMwD1peFpXHYdFUlr8XE4xJMDOznKaYEwg9Sq2qAPKnqEXbGX0G5CmBeWz+h+
 g+e2reM6tlR9aGvWDPaB7hZq+kcY4DyUsuaa5rsSKLy0xqXA+Snm8T1TXckCR+Im/x5wvI
 kohj8uXl7pdecLgztEvHTThritK7o2+Xn0ghm2VHKmmdjMvixfH+PG0A19eR0m6SC1QChO
 MClJaEotvpT6x3V2mDHdSg4XDtFId9obmc5lhdaaEZEbS+FYXnKUAhoGe9sRww==
Date: Wed, 12 Jan 2022 08:48:53 +0100
From: Luc Michel <luc@lmichel.fr>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] clock-vmstate: Add missing END_OF_LIST
Message-ID: <20220112074853.4qqbi7cgmfsvbany@sekoia-pc.home.lmichel.fr>
References: <20220111101934.115028-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111101934.115028-1-dgilbert@redhat.com>
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10:19 Tue 11 Jan     , Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv
> 
> Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/core/clock-vmstate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 9d9174ffbd..7eccb6d4ea 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -44,6 +44,7 @@ const VMStateDescription vmstate_muldiv = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(multiplier, Clock),
>          VMSTATE_UINT32(divider, Clock),
> +        VMSTATE_END_OF_LIST()
>      },
>  };
>  
> -- 
> 2.34.1
> 

-- 

