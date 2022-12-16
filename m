Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE164EF13
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DZZ-0006UK-BH; Fri, 16 Dec 2022 11:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DZF-0006RI-Ae
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:28:17 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DZC-00019I-I6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:28:13 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h10so3045007wrx.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QWbN1O525e/FzsyKi0QvHVMg6hB/eQpzdtCxsQajocw=;
 b=yJOVylYRXz+BYMJ6i6tNwST7je5Y0QZXsegx4pQGpJ5pmyA1Qud7oydkaSUR11k0Hm
 0v7P4E7edMmmFDJ1CfJD7HY89i59ccRkW2lpmpwcY/kijyXperxw+MI2W6oWFl1s81zZ
 WOofQcLddc/czieodpEmC2vhHCK+tD1LKR5xFh3emnNLvUH6mP46i8THKNJc8VDMJYeC
 1+fw29SZf5omTnn6NwU01Lp1BL+1RXqpcqd4u/eU5auy9JPkUV+B5ZEC53WfATlEaSPr
 AgNWcc0axO03BVZP9LpI4+7pB4PbZqAQQKRoypU7E4AzV4kBRS4KK8yIjzoN2H0rWylP
 z/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QWbN1O525e/FzsyKi0QvHVMg6hB/eQpzdtCxsQajocw=;
 b=4x6QXcUtfUqY0MK12tEsXsr2Sbn2gXi+tApkTP0VergbcqMOLhdJqF2XvgoTYTTJlV
 +nK98hcCaok0kmSn1D86wMfwuPljT0foru2mi7Gcu2MU7o6/9SRL+7mWToPLucoHPeeT
 LzDFs0eehwuRRpBKWd+pGK5RmHygRUGeWwVlrpMrRf8Rf+50+AS4Ct2w3JS5HvkBEn5Z
 KzxkrrmNrhcD7H/widmpSBQRAwfT8BaEGGjwdOZ8URj2UvoNWbhLIfpXwWeot+tA5WD+
 kDORnl0VSW0ef9sJxXwATHVgGRmDCxp9gEqJjq5ziVOXltY6nUrTrkx6d7gx0XIaynk1
 dDEQ==
X-Gm-Message-State: ANoB5pndsL0XCBNIrHhxN2H0uCxe3x7K5ay0obiN+oSyH2x95pMA0vwB
 nEH7j9FajUYJUrduCdZL2ribSg==
X-Google-Smtp-Source: AA0mqf7h8Q92du9DrFipLBBQiwkEruoja1cRpQrcOecqIbC9mIluCHuVu7yqsauOrHgoyeHvAr0B4A==
X-Received: by 2002:adf:f446:0:b0:24c:f111:82ad with SMTP id
 f6-20020adff446000000b0024cf11182admr15429859wrp.54.1671208087255; 
 Fri, 16 Dec 2022 08:28:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600018cc00b002423edd7e50sm2623866wrq.32.2022.12.16.08.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:28:06 -0800 (PST)
Message-ID: <fa2a12e8-3640-0c86-d812-86e171407046@linaro.org>
Date: Fri, 16 Dec 2022 17:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 3/6] hw/ppc/virtex_ml507: Prefer local over global variable
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216145709.271940-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/22 15:57, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/virtex_ml507.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 13cace229b..f2f81bd425 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -157,7 +157,7 @@ static int xilinx_load_device_tree(MachineState *machine,
>       int r;
>       const char *dtb_filename;
>   
> -    dtb_filename = current_machine->dtb;
> +    dtb_filename = machine->dtb;

https://lore.kernel.org/qemu-devel/20200109152133.23649-1-philmd@redhat.com/

\o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



