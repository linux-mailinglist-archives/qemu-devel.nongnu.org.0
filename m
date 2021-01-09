Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CF2F047A
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 00:56:24 +0100 (CET)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyO5n-0005Wc-6O
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 18:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyO4e-0004r7-DB; Sat, 09 Jan 2021 18:55:12 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyO4c-0002R9-Cw; Sat, 09 Jan 2021 18:55:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v14so10684479wml.1;
 Sat, 09 Jan 2021 15:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vijG4FFreQy6BJ60KhlPviZ62YJiRPrEV+PjAUukHhY=;
 b=qWuNT32Phdvc7LAOanhFdba1eloGqKA2ViJP7EQJnhg94OiFjenn00Jwl08RTrQ4/0
 mWhAf4ybj0KvU6qAcmr9nqmW0fpoRmQOHxDyMoY77pC6D84RHmCQeGRxLZsdghZCdjNE
 Jj9aK1lEq6zkoTBuYz5M0a3oaSTchUNPYwhLqlptJgD68W1pkG2hPFsaYIKf5c/O/XEa
 v6iydhnbWA/9gpj360dSwqPugQYnSg5oPhRUEBttL4CqfX8hsE03oqgj3GTU4NkekTWF
 FZD3CKeCT70gbfVS2jQ0Z9wneFCUA3UspWBzSLDyFlelGssLPBe0Vu+w5UdoLznmp2Vy
 Lu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vijG4FFreQy6BJ60KhlPviZ62YJiRPrEV+PjAUukHhY=;
 b=g3eE0vV0h+WoYq1nvGgM7kzpMfhhJkLd+kmbumwO0rbnS5FOjBb2Lr7b5Ar/j93V0L
 chWwVnQpzsKH6isAdAjscBUio+j+uNHfTdv7ADmMSQXZ28KzfWr5ds/kGiF5E/m58fdD
 A2oyVqaz6st1BiMFQ5/MKLcfePRp3wC1GF6u7x0kulY4s2ftK3sLS3/7iKA+cktb+JMN
 swhF6Xz1cZEVHvydxd/C8ggtueOqMZO7zWA//AAepqKgNnAte4BzR9OY9XRsDa7tnvSv
 Oe1tShmPMij5HTF9afkcWTfw89shTfJz6nWLnfA9St692zWeAbNlaDeVxUp8Zk5/kSJP
 IJUg==
X-Gm-Message-State: AOAM531j4nSx+fFQ9IpB6OyKCD0w+UdEPRSsrFowEpq0t1TwiMMv8kbP
 CbNkgXLzvTuOiJlOK3Me1d4=
X-Google-Smtp-Source: ABdhPJxmHg43O0NlN/rjDbI/dXqs7nTLQW7A21md0OXZH5q4GfWkFH/Od+r38QmKdypq/v4CHGMmTg==
X-Received: by 2002:a1c:220a:: with SMTP id i10mr8667970wmi.93.1610236507989; 
 Sat, 09 Jan 2021 15:55:07 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id k1sm18892921wrn.46.2021.01.09.15.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:55:07 -0800 (PST)
Subject: Re: [PATCH v3 4/6] hw/ssi: imx_spi: Log unimplemented burst length
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
 <20210109123545.12001-5-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7c966c4e-eccd-3fe9-7811-b5b2c6c65c69@amsat.org>
Date: Sun, 10 Jan 2021 00:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109123545.12001-5-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 1:35 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Current implementation of the imx spi controller expects the burst
> length to be multiple of 8, which is the most normal use case.

s/normal/common/?

> 
> In case the burst length is not what we expect, log it to give user
> a chance to notice it.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - new patch: log unimplemented burst length
> 
>  hw/ssi/imx_spi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 880939f595..609d4b658e 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -128,7 +128,16 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
>  
>  static uint32_t imx_spi_burst_length(IMXSPIState *s)
>  {
> -    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> +    uint32_t burst;
> +
> +    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> +    if (burst % 8) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "[%s]%s: burst length not multiple of 8!\n",
> +                      TYPE_IMX_SPI, __func__);

Please log the burst length value in the log message.

With it:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    }
> +
> +    return burst;
>  }
>  
>  static bool imx_spi_is_enabled(IMXSPIState *s)
> 

