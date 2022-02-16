Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3B4B8BFE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:03:55 +0100 (CET)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLqU-0004i6-A0
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:03:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLot-0003Mw-1L; Wed, 16 Feb 2022 10:02:15 -0500
Received: from [2607:f8b0:4864:20::f30] (port=46941
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLon-0002QJ-1H; Wed, 16 Feb 2022 10:02:14 -0500
Received: by mail-qv1-xf30.google.com with SMTP id n6so2329431qvk.13;
 Wed, 16 Feb 2022 07:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YJ1j6jNYmoZSXeOFtB+OgXbJfjAqsu5DuJtEpvHwN+0=;
 b=n2MDEejZy5pnQzNg76OPVZRZ3faq0kxzzrdtaP5AHK2WDfWcgQieKTL9WThG9Oo7tr
 7MaFM/picn8DPQWyfwDqwXSulcaKmQkaU0Cg+dGswJjQwAyYOwSJOOL0jBs/LrxQEpz9
 Hpt/Gkf25JxMHtEtALLUjr87wlSv/pynVtdYhhACOdPJQ9cTesiLX5OMlqGq+drvU0Vf
 NGwExZU4p9zPnQ7HrC3IGHWdiF7ojhZzpWXwUqNecyo4ogPfEcjyTwKPLZgfONCfCKiD
 PyrZAFRhlDD69h3VhI0zOIzgBK3ZbSPmhFa7qvHc5UzeKcknMNebVRhB0Jr5otkKFpyO
 mY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YJ1j6jNYmoZSXeOFtB+OgXbJfjAqsu5DuJtEpvHwN+0=;
 b=WhviQrjHIpo2OWlONB1yQJqSJZqylmVnLpODGcUEQn7C2IA1QoBxy4FDhACU/b1R+1
 q+G9Qh+qdfs8+k4mFEJmxhuMZ6KH1R6E6T7nWiAFoNBUjzXOhotSlFzDXhFdPiCbWQXV
 lp3dW3No8u266fhfdIHFdWeQau/r6KSwzawC7iJ+ixxw8nwzOVY1cxIAqyOcVWXUHHSc
 umLhcM7XTb8LjZJ+FrSH+FFLKjxbQtl8HpT0hP2K5a2G9IePojLeOnQTU63eVmwTX4/2
 P0Lsn/yV0e7vSOHxeq5qTsiJwjzXciAOmK6fJdmyXfMWKq20vhlk6dt+qcoN13u8fsi0
 vFiw==
X-Gm-Message-State: AOAM530Qr7Y52jjVdbh69hh+v3l2PZRI6cDrfSTkmAa/bdRKmRPf8Kfd
 AZssSCAyFlxVdGNNImFaBrY=
X-Google-Smtp-Source: ABdhPJybtmoWIZkGOp8hmbfbrNuhvRv4ktPPYyhuj+v12AdBsdIZpXXRmC+MSdq8fLwYn/EkQqcUtw==
X-Received: by 2002:ad4:470a:0:b0:42d:7937:1458 with SMTP id
 k10-20020ad4470a000000b0042d79371458mr2083763qvz.45.1645023727497; 
 Wed, 16 Feb 2022 07:02:07 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id bm8sm13423421qkb.25.2022.02.16.07.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:02:06 -0800 (PST)
Message-ID: <e356a02a-133b-8aac-b28a-9daf8c27c3a7@amsat.org>
Date: Wed, 16 Feb 2022 16:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/6] arm: Remove swift-bmc machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220216092111.237896-1-clg@kaod.org>
 <20220216092111.237896-2-clg@kaod.org>
In-Reply-To: <20220216092111.237896-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qv1-xf30.google.com
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
> It was scheduled for removal in 7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Message-Id: <20220216080947.65955-1-joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   docs/about/deprecated.rst  |  7 -----
>   docs/system/arm/aspeed.rst |  1 -
>   hw/arm/aspeed.c            | 53 --------------------------------------
>   3 files changed, 61 deletions(-)

>   static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1102,26 +1073,6 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> -static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> -
> -    mc->desc       = "OpenPOWER Swift BMC (ARM1176)";
> -    amc->soc_name  = "ast2500-a1";
> -    amc->hw_strap1 = SWIFT_BMC_HW_STRAP1;

Can we also remove this definition?

