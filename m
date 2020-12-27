Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541622E31B2
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:34:46 +0100 (CET)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktY4D-0006aH-Dc
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktY3H-00063S-BR; Sun, 27 Dec 2020 10:33:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktY3F-0004TS-KM; Sun, 27 Dec 2020 10:33:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so8352046wrj.7;
 Sun, 27 Dec 2020 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wIwrgEeB0Gk8LvEcBLSk6cbcI6l4JQ9plLchvKHin8c=;
 b=HYijz3u9TbGi1IKGKfTFh7+caxDLG8aPGywV5dJAhhCRJxkYsj0i9Le+Fy73eNfF7T
 iX74y7emEZEvxAklSw1xqLRSw07G/knmD9v5GnJnUVHWVQT/DekJPjQXl16UVeGewnJh
 stkk1Bej6UJTXLDN5wmery9txeyUThe7xF2HBiSsg7bSkAayte/LjoNpbNMymqZI30/3
 4DuJYNceSKSwFx2j+UGocd5mliiu416vieG43/b8C8kpS6X2r+GDT3yqxlLYEKOZ+S35
 9bC9MqumnvGIhQ59yP+CE1ydbZZZRpzrjOOfVWG6ZqtyVXK5aSiFsju4m/wh5Myjv7Ug
 7cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wIwrgEeB0Gk8LvEcBLSk6cbcI6l4JQ9plLchvKHin8c=;
 b=Ted5tmCSiSFyAkgGigWjCRpeqs1JvOVbOs/lZMxAG+2jerA8MvSJ2CmgHN5gLhGQpZ
 7laFoqxkk0Pw71X0F62ULrB64VxgDdQqF8p30dKcuyGnuAFXlsWKy2BTMVZKwl3wWMmn
 IbXoUXzrSS65o6ezIyBVSyBYH9ZRpxPe2ub9sOqJsqEoM78U2oVOmxYD07vxRq9Iq+PR
 sdsfKFg/HzquNs6MdjIAyXWKRdRRJz2V+d3yQP49+Pm7JwGHG1zc+nDn15NpRLhZJgPQ
 TddsFIEbki/R25GgBps9yXejOS8L30q1NC/+1Sv7ajdTVWsuhKLS95xcEf/eHaFQtuL1
 aBNg==
X-Gm-Message-State: AOAM532mvi52pcGPG3bNWmVG6Q4RwWF7gB72HUvIFRE4tg2aC6VGHupB
 9ghekRefodSQoA40tg3BN3A=
X-Google-Smtp-Source: ABdhPJxN82Uc0aJOYstoecFnFsznAvr17SIRNpUtO5mna2Gu8xlZ3ih2H9Olx6hscgUPwhgYMFO9QA==
X-Received: by 2002:a5d:4f8a:: with SMTP id d10mr46667356wru.219.1609083223275; 
 Sun, 27 Dec 2020 07:33:43 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id i18sm53008875wrp.74.2020.12.27.07.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:33:42 -0800 (PST)
Subject: Re: [PATCH 2/3] sam460ex: Drop unneeded dependencies
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1608937677.git.balaton@eik.bme.hu>
 <01f1df6570298564ad7303e9146c1473b247d951.1608937677.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6838d371-7306-9381-9871-9bfb5cecb7bf@amsat.org>
Date: Sun, 27 Dec 2020 16:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <01f1df6570298564ad7303e9146c1473b247d951.1608937677.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/26/20 12:07 AM, BALATON Zoltan via wrote:
> Remove dependencies from KConfig that are not actually needed.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 8548f42b0d..5893f80909 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -55,7 +55,6 @@ config PPC4XX
>  
>  config SAM460EX
>      bool
> -    select PPC405

You reviewed commit def9119efe2 ("hw/ppc/Kconfig: Let the Sam460ex
board use the PowerPC 405 devices").

>      select PFLASH_CFI01
>      select IDE_SII3112
>      select M41T80
> @@ -64,7 +63,6 @@ config SAM460EX
>      select SMBUS_EEPROM
>      select USB_EHCI_SYSBUS
>      select USB_OHCI
> -    select FDT_PPC

Correct, I guess I got confused by the _FDT() macro used in
sam460ex_load_device_tree(). So:

Fixes: b0048f76095 ("hw/ppc/Kconfig: Only select FDT helper for machines
using it")

>  
>  config PREP
>      bool
> 


