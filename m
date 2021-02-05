Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E30310FE1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:28:37 +0100 (CET)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85qN-0003MG-T6
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85Vw-0006M4-QK; Fri, 05 Feb 2021 13:07:29 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85Vt-0006qW-M4; Fri, 05 Feb 2021 13:07:28 -0500
Received: by mail-ed1-x534.google.com with SMTP id t5so9781501eds.12;
 Fri, 05 Feb 2021 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ujuqgyRNPFX8hPnv3zv6sUfuu8CdlXQi5HCBTCzwr44=;
 b=qVULq0FOwctjdWr5WV5echVUDFzPn4CR7GKPIJPMnePxzK6m+RBjkKeB7uc2Xkv6Q5
 QPtqYbNU9Iixagy9iWIIoSHtSwLDTI5TMWA8cOol7lKMBE9wESd+5pRhSAa2vS6oE4u3
 nWxZ+ThQkGnlv5NCGzMW6kPTx4YGjYQDNqFAEhkdKDoWG5/I5sarf4TAxibrakRtb3G7
 smSZo3fKXtBILyOSUAcZGRSyQQbLAjiiwvT3ewCClLsvPQToHnUvhztwroI1tZhRoHF+
 vsAhfw8xQn/bRtItnPPkY256NsJaCSJui4TNEzWPa6+1Q33BFGENQYkmi83PnU18bTpK
 AnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ujuqgyRNPFX8hPnv3zv6sUfuu8CdlXQi5HCBTCzwr44=;
 b=mhHGGUDO6I/6o5IoF3tGRqCRE882maqEqOeafyN9KLXniu9Pfh7MfBJFfi/yNwh+Zx
 Whp3vUum43EOg6otemWKSZg1LxsxEfdLWx4TDcbtCe3HoesoQutlC3Li4DC1lAJ3jxb0
 Xnwr/CuQCr2rMZhCSU1seqGkiEvnpox0cIoxdqqItgP9TKKT3jRJ/KFFtkr38zS+qrSF
 B42xHeYcSgO3fVtZWRHWiGZA/WQ4S2yCYB9ZLJBUSZCK0R3rfriJLbJR5Xj8EWhdgNYR
 mOTMdoyeUmRd777NOzyG4L1/541n+BQqdu/jI2B3S/0zEcYuuDU+P+EuJk9OGuT1vLtl
 jmhw==
X-Gm-Message-State: AOAM531WqQbV8wr9m4jB8+IrRty0xqegCKJC0LKRRIwqL+U/5cbOzamB
 1IJVvl088tXux2M9YgXT2pPCaDpC4LE=
X-Google-Smtp-Source: ABdhPJwPALSlPleQ8xW/YHNhIHcIr+TzfM8DF0akIym41j4fIubguz+krJM45p7uYhut1KxFwBtr9A==
X-Received: by 2002:a05:6402:1c0f:: with SMTP id
 ck15mr3539558edb.16.1612548443017; 
 Fri, 05 Feb 2021 10:07:23 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k2sm4224335ejp.6.2021.02.05.10.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 10:07:22 -0800 (PST)
Subject: Re: [PATCH] arm: Update infocenter.arm.com URLs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205171456.19939-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ddf77dc-35c6-6955-9433-abd3898c3ee7@amsat.org>
Date: Fri, 5 Feb 2021 19:07:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205171456.19939-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 6:14 PM, Peter Maydell wrote:
> Update infocenter.arm.com URLs for various pieces of Arm
> documentation to the new developer.arm.com equivalents.  (There is a
> redirection in place from the old URLs, but we might as well update
> our comments in case the redirect ever disappears in future.)
> 
> This patch covers all the URLs which are not MPS2/SSE-200/IoTKit
> related (those are dealt with in a different patch).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/dma/pl080.h                 | 7 ++++---
>  include/hw/misc/arm_integrator_debug.h | 2 +-
>  include/hw/ssi/pl022.h                 | 5 +++--
>  hw/arm/aspeed_ast2600.c                | 2 +-
>  hw/arm/musca.c                         | 4 ++--
>  hw/misc/arm_integrator_debug.c         | 2 +-
>  hw/timer/arm_timer.c                   | 7 ++++---
>  7 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
> index 1883f042701..3c9659e4381 100644
> --- a/include/hw/dma/pl080.h
> +++ b/include/hw/dma/pl080.h
> @@ -10,11 +10,12 @@
>   * (at your option) any later version.
>   */
>  
> -/* This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
> +/*
> + * This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
>   * The PL080 TRM is:
> - * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0196g/DDI0196.pdf
> + * https://developer.arm.com/documentation/ddi0196/latest

Oh, /latest :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

