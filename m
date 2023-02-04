Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B121D68AC00
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 19:56:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pONhF-0006zq-1c; Sat, 04 Feb 2023 13:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pONh4-0006zI-KV; Sat, 04 Feb 2023 13:55:23 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pONh2-0000KE-9d; Sat, 04 Feb 2023 13:55:21 -0500
Received: by mail-oi1-x236.google.com with SMTP id r205so6814588oib.9;
 Sat, 04 Feb 2023 10:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8VLC/azSnv7y7eHAG0V0W2Fop8W6hbKD/fkPchfj8g4=;
 b=VfBBDHciErApRk9GZNVu/PuupKwvKt6ZLoi/M1dKLyoKZSDb2UbHsCo08MJ/R0WR6E
 Npyp+hCZoeeCpa3WhSu91PQfD/cqz87k3wkpPEyxCYvnpSQ86wyRsitYHydTP0tXgTUj
 4zIEKbYgi5oq52Mdk5mqJcj7YK9qQ7KP9kgBT6+FMybiMzYmX1LpnPe+ePqbzowrrwKb
 uun6BACtXJs1+u1Y/mYOL+bQDax43x1xpTessyqm6nwcQw3JxKRbHR0wOx9fc3mQd1Gl
 J1tqLgkv2OP/5p7ppfKLkMbVTsQv6kbI5LrFKz2624xL/WwPXXwog5mcovOftt9m02LE
 jTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8VLC/azSnv7y7eHAG0V0W2Fop8W6hbKD/fkPchfj8g4=;
 b=Q7cZST5kuzNDyiEpyXQ9sVQaR9kU2yv8FH27Z8lrTfWvS0Nc4rNZ2JHDy+CDmC5XLS
 A4fl2CxGoLcY+aseMp6S6+dUmBnUVZnNJrFUXTklqBvxWlFV/7Poo8u10nmHjptSPNt0
 S0wdFWt+d8ViG0hI3i23fq53LbeVjhJm5agAINBjffgfu+sVp7XEqzPcvvYPsqtsq497
 9LvcioSuyCzQT+zLPyLmpP1YxmKCkCgo7aq6eZW5RvEnQMsfpMU2XmA4iSm+bm9B4yvO
 nOkvcby8DHi6dHq6IX57/y6dnER2DpJEsUVwF9SEPc1Hrn1QgAxX9Cy+y4FmBzkb0xyN
 ZEsA==
X-Gm-Message-State: AO0yUKXiSGMWxgtamnrr64AAkk3DWv8BaDr9jiT/3a9yKMaK4lHPOxip
 0p4piQpU1/g6H+6uqZd9j/9Abwv8jPU=
X-Google-Smtp-Source: AK7set97hdZ1pXP9+30n5tz9xnk3PPOWJBgMfNKOGK8Ap413BwQQ1Qtw5bOq+Km4nh0MQbFJLep+LA==
X-Received: by 2002:aca:a887:0:b0:37a:2bf0:5024 with SMTP id
 r129-20020acaa887000000b0037a2bf05024mr3187113oie.18.1675536916460; 
 Sat, 04 Feb 2023 10:55:16 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a05680808cf00b0037ab4f054f0sm2065503oij.12.2023.02.04.10.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Feb 2023 10:55:16 -0800 (PST)
Message-ID: <560fb172-837e-5c10-8e7a-81a250631398@gmail.com>
Date: Sat, 4 Feb 2023 15:55:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/ppc/pegasos2: Fix a typo in a comment
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230203194312.33834745712@zero.eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230203194312.33834745712@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 2/3/23 16:43, BALATON Zoltan wrote:
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/pegasos2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 1a13632ba6..a9563f4fb2 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -564,7 +564,7 @@ static void dt_isa(PCIBus *bus, PCIDevice *d, FDTInfo *fi)
>       qemu_fdt_setprop_string(fi->fdt, fi->path, "device_type", "isa");
>       qemu_fdt_setprop_string(fi->fdt, fi->path, "name", "isa");
>   
> -    /* addional devices */
> +    /* additional devices */
>       g_string_printf(name, "%s/lpt@i3bc", fi->path);
>       qemu_fdt_add_subnode(fi->fdt, name->str);
>       qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);

