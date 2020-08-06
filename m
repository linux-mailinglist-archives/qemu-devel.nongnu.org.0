Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92B323DAF3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 15:41:35 +0200 (CEST)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3g9G-00080w-T2
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 09:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3g8D-0006ZG-Qd; Thu, 06 Aug 2020 09:40:29 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3g8B-0003Ea-PS; Thu, 06 Aug 2020 09:40:29 -0400
Received: by mail-wr1-x442.google.com with SMTP id r2so38958228wrs.8;
 Thu, 06 Aug 2020 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ylU/SmCrtt2425xM/6emOMdlx/lXWptSYXIbg0Z9e7k=;
 b=bY5E933VTBr6JJUfYrjkID9c1nt8dXJWKIghfE281tlbcfSe+WI/cV9RV5Q+TUNT71
 VwEiss8XhsVG51y1zwrqHizzogQT52r0EztBgHs6kc/IJTexGHwFbyeORVd+/2a3jdHG
 hMpfE/NYXAgP1hG6gV00esZUNu4HtUVTtnAEiRSXXPIOPOS8hqbduLP/oSgCUDek4el1
 oCdknzTnGrjNgF2CyU7U3xC60IL4XaR9tQX/emC8GuxnaKU4nExhcq6CZQ37YrLSZISg
 tai7KBN1BpRoWjdlMwHdqaKLMNL34swmK1dHYVzv+SmHI0Yg77ZRQsP5ROnLwRDTu6Ro
 FMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ylU/SmCrtt2425xM/6emOMdlx/lXWptSYXIbg0Z9e7k=;
 b=Yh5GSqoWrUi6wXLD1Svi/HGfCKnX1yMxSLAGx1UHQ0dqQ7h3x08Kc0CGQaFyx8b0np
 fNlknbHcNzCkJf0Kj3xf7dYguPHkDc6CWUbcmD3VopKjCuDtmLItflfKseZ0eCZYpE21
 QEiAaySXInNQ6GLzkhWgK47CiOcSaCDjH9A3Cajv6A0Os1TUIejKfq/lr+stgT/Xy2Oj
 w/eWbkVHL63/X1R5d+5bcqJKmJMHzsDyM4/2E/0ZaxWapIDijw/NAiaGHjNft44FbW/C
 26iWDSlkLICoFRaE6wSbLdH6cymZR7D8MdCC/h11Cg51KvrA16lFPX6fZUpAgyrK+d/X
 fOlg==
X-Gm-Message-State: AOAM533CBUOXNYkKWozNfp7QtoFU33Bx4NiR8eWJSo0fRK+wU9wKY/wR
 PrcEoAL7wQIkoNXDcyvWt5cBwAZM
X-Google-Smtp-Source: ABdhPJy8Eo5dt8lcQ01boLquv/tpx+Lw0HTK6o2yiTruei0AWRMlgTfL6jUZqw4FjZHg414Jwv8cpg==
X-Received: by 2002:adf:9e04:: with SMTP id u4mr8094842wre.302.1596721225337; 
 Thu, 06 Aug 2020 06:40:25 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id h11sm6506440wrb.68.2020.08.06.06.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 06:40:24 -0700 (PDT)
Subject: Re: [PATCH for-5.2 15/19] ftgmac100: Improve software reset
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-16-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <de09497b-4250-2dd8-d57e-b60ba0fdf82c@amsat.org>
Date: Thu, 6 Aug 2020 15:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200806132106.747414-16-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/20 3:21 PM, Cédric Le Goater wrote:
> The software reset of the MAC needs a finer granularity. Not all
> registers are reseted and some setting in MACCR are kept.

typo in "reseted".

> 
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Fixes: bd44300d1afc ("net: add FTGMAC100 support")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 987b843fabc4..0740049c5268 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -655,11 +655,10 @@ static void ftgmac100_reset(DeviceState *d)
>      s->itc = 0;
>      s->aptcr = 1;
>      s->dblac = 0x00022f00;
> -    s->revr = 0;
>      s->fear1 = 0;
>      s->tpafcr = 0xf1;
>  
> -    s->maccr = 0;
> +    s->maccr &= FTGMAC100_MACCR_GIGA_MODE | FTGMAC100_MACCR_FAST_MODE;
>      s->phycr = 0;
>      s->phydata = 0;
>      s->fcr = 0x400;
> @@ -812,6 +811,7 @@ static void ftgmac100_write(void *opaque, hwaddr addr,
>      case FTGMAC100_MACCR: /* MAC Device control */
>          s->maccr = value;
>          if (value & FTGMAC100_MACCR_SW_RST) {
> +            /* TODO: rework software reset to have a finer granularity */
>              ftgmac100_reset(DEVICE(s));
>          }
>  
> 


