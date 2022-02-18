Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE5C4BBEDF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:59:48 +0100 (CET)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7Xm-0006Ux-VY
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7UZ-0003kh-Kb; Fri, 18 Feb 2022 12:56:27 -0500
Received: from [2607:f8b0:4864:20::636] (port=43806
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7UY-0000yH-94; Fri, 18 Feb 2022 12:56:27 -0500
Received: by mail-pl1-x636.google.com with SMTP id x11so7735984pll.10;
 Fri, 18 Feb 2022 09:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hkqFGLye3+uKqjcsmmYuC43xC87P/OEy9aGOkogiBDk=;
 b=Y45fZHvv25iVm27hoPN5qISrWPihSZVpMl95cnfoPhA0+nFxPWjQXb/Yh5gj6no2eO
 zP7Hz+pMWxtd2WGQQB2YpCeHwAtHT4JZ2aEdN3pifweDfHs/apnx8sjMGW/xDS9sAd6b
 l9m9M9nXF2Jxcrjz/8QhhSjvjcYqRdze/4GsVvZekn5Xxb3bJix4yMKWUBqdjmr3ve0Q
 O2OYoTJSj01Xj0w3kwYMuC931gMUW3i2hkc16VZktMCh+DyhCZjyFJlHTzlXNiXoUQaf
 U/2hjWeXtCJWruYoQNl/NOx4m1+/zQ7XixVuVoNNo65xOdsMQH6+QnZ3wNIh19yYv/e6
 CSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hkqFGLye3+uKqjcsmmYuC43xC87P/OEy9aGOkogiBDk=;
 b=aRmuTfR5wU/rlkvwnHyCsCLUGHz7NmC3RUfq9rXUOwTuGz2Yo22ONU51MboID3Cdsd
 sNl5rPEYADZeAC+1JA42wbxd6AtoUNNSEHAtNVqKftKyqreoiZgjtH4G/et0Pp8kOR8K
 aaNZga9E/ab2qmFAi8ScUVLK/O9Bqm9fgePC6OWlXcF8ePCtckBe5drrQxTEnBhnKUrq
 b2vfB0HP3prelenSl9O2sjJKZR00nBL9dahX27o3Fr1NXYKazoHT3wNywweXaMMS1ozd
 Up2Jc+t0VQtkfLqqx1GleaveFPYrGTOHWrjHeHQXsC2Rq8AbekmEQ1njefcB5XVzDx7x
 TPLg==
X-Gm-Message-State: AOAM5316H0HIMdW6e0e4xfV1N5j4t+jhGU+XyCi/q8tGM738Iz8KzEPW
 Ea3mbiYxPgZR74YZa6kZNcc=
X-Google-Smtp-Source: ABdhPJzFuW6uWTBqBh731SK8dqyIQG7bBHPdWq7uhUYddDbANzzOFSn2J+dqqqCUnfGmbD2g4wIhPg==
X-Received: by 2002:a17:90b:4f84:b0:1b9:f59a:8511 with SMTP id
 qe4-20020a17090b4f8400b001b9f59a8511mr13709101pjb.164.1645206984440; 
 Fri, 18 Feb 2022 09:56:24 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id pj14sm57759pjb.43.2022.02.18.09.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 09:56:23 -0800 (PST)
Message-ID: <194ed308-000a-2198-958c-27bea13b64ee@amsat.org>
Date: Fri, 18 Feb 2022 18:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 7/7] aspeed/sdmc: Add trace events
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220218081815.641169-1-clg@kaod.org>
 <20220218081815.641169-8-clg@kaod.org>
In-Reply-To: <20220218081815.641169-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 18/2/22 09:18, Cédric Le Goater wrote:
> This is useful to analyze changes in the U-Boot RAM driver when SDRAM
> training is performed.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/misc/aspeed_sdmc.c | 2 ++
>   hw/misc/trace-events  | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 08f856cbda7e..d2a3931033b3 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -130,6 +130,7 @@ static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned size)
>           return 0;
>       }

> +# aspeed_sdmc.c
> +aspeed_sdmc_write(uint32_t reg, uint32_t data) "reg @0x%" PRIx32 " data: 0x%" PRIx32
> +aspeed_sdmc_read(uint32_t reg, uint32_t data) "reg @0x%" PRIx32 " data: 0x%" PRIx32

I'm surprised by the uint32_t conversion, but why not.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

