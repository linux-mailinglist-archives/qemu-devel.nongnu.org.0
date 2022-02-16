Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53424B8BF2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:01:50 +0100 (CET)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLoT-0001WD-25
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:01:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLmP-00005B-G8; Wed, 16 Feb 2022 09:59:41 -0500
Received: from [2607:f8b0:4864:20::f35] (port=37798
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLmN-0001nS-Id; Wed, 16 Feb 2022 09:59:41 -0500
Received: by mail-qv1-xf35.google.com with SMTP id a19so2353231qvm.4;
 Wed, 16 Feb 2022 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HCwQ5n10CaOFxQZnPNWsRrLw6em1r9vm4xFTrSfEEXU=;
 b=NRMQtgl5HcxMyIu/YQGGl75dn3OlGfHTm+mYT/teEgu3p25ELCIiA/1vvWIRsbblsi
 BIpltToFSu/AL8oGr45qQ8sT5W43v4isXHI0VtzKULvziXQzAYs5Ui5NaKs2a64O+EL8
 GmNFp1JYQK7QGZygC+nnKjs+wrmu7evfNK8vUbBKN4+fGOazJ8q5GcbRNwiTRE6NQCr+
 bi5nj49AnrcrlbxbnJyV2kwDPy3n1an597R/DFQCKfmWRYmKcD1V/pvTrI2aun/yjLuq
 NQ/2xxy6E5rpzVO192UQLnMjXmDHS9CdYGlcvWfvaiijQDx0Nk13KfNW8ht1b1Zo2eF3
 p7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HCwQ5n10CaOFxQZnPNWsRrLw6em1r9vm4xFTrSfEEXU=;
 b=t6cEnfMxJCKoBKJ+1JSYm2wa28mMI2meoUvW1OYTagAYNLHaDhd8dVh6amYwReIoEe
 NMO2Hd0C7+qWgbDRSfrVjqA2xWzBXIlhNZ/g0t++ThVrK2jV4fFHsYU8TpgnJqQhtwaE
 2p4ZbgKkIf8oWmNe9N5F+ovFHbtrvvRyVj5twwLiBuW1/msSiXTPRQp08SCV9K7AiDgN
 0moUB/PNXlW6aYbL7DjK5qcxgChQFoWF28Bp3vDMNKzVVVuH8MrObkBYddVmbxsXNWUt
 wsRpzbpdd4vsbW6H1E/rrco4MhvDHvPZsYtBL3bks67tfv1wxK+YEefPA1eammmvrUVE
 Emaw==
X-Gm-Message-State: AOAM532O2ZYkJIPu4DskERVHEbeFpFzkEwofvFfD0Sc4F0xQyAUlcoBY
 4ZlNRmF2FZesWXeaMc89tfM=
X-Google-Smtp-Source: ABdhPJyCPwU7C92utEivNCPloBV6uW8+yej2WGsvs5md88MQhhPyVuB9XvRrUYy6ctn2/HctiBF/VQ==
X-Received: by 2002:ac8:7d8f:0:b0:2d8:9bfb:f975 with SMTP id
 c15-20020ac87d8f000000b002d89bfbf975mr2246497qtd.548.1645023578223; 
 Wed, 16 Feb 2022 06:59:38 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id l11sm19818114qkp.86.2022.02.16.06.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:59:37 -0800 (PST)
Message-ID: <a7667501-4ec6-271f-e9d5-0f03f3c73297@amsat.org>
Date: Wed, 16 Feb 2022 15:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 3/6] aspeed: rainier: Add i2c LED devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220216092111.237896-1-clg@kaod.org>
 <20220216092111.237896-4-clg@kaod.org>
In-Reply-To: <20220216092111.237896-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/2/22 10:21, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> This helps quieten booting the current Rainier kernel.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9789a489047b..0e5e5c31d59c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -723,6 +723,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>   
>       aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
>   
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552", 0x61);

Possible cleanup: add a create_pca9552(soc, i2c_bus_id, i2c_addr) static
helper which uses the TYPE_PCA9552 definitions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

