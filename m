Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B04697A27
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:46:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFIU-0000Va-Uw; Wed, 15 Feb 2023 05:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFHq-0000AX-HB
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:45:21 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFHm-0001y1-I2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:45:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bu23so18627671wrb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uPHkV2SzBZJK7310CGyKTdxCfpXXoNlLMItSVMs6Q6g=;
 b=NzhIBsVBUPyglM+P8SGOiiLbTx9c5O9mMK+YRP54TjeS8Heud0a1Lw8+J/M4BYKr4F
 V4qfstehfIQlbp6Czo2K3+9ZctlVAIu4M5SkyTbWamjcS+qh4KbTwk0YR7K+ZW275GUk
 ybCDXrxURPe5pa4LnNYB+h0XSCQV/YB/lGgY9c3/OOniiHpJFfFYhx8wGVAYXnqi1oge
 ME1J2mOK9Cw5ajbVtNuyQIDVLzFnJgUTeFgVeig6XKtWyXqDWgXlennQpZXcTgQNUE2F
 s+Csbh2kWNQ14BHPGVa5smz0u+aB5wG47zeEG9SCiNPX+nxX9mBtJF/oNxScJDS1iDGi
 zEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPHkV2SzBZJK7310CGyKTdxCfpXXoNlLMItSVMs6Q6g=;
 b=3A32PaNghENE5BecqJthevaqbdaSX/Cs4CUv7KNHgcmRQPVf/O6XFV7qcVeWKlBruA
 d/m8CqrpKy72/4YEBnmjE05gGKZ9DA5L/WykEMKCaCXe7wcE8KzbBzmf71o7SUqZpxpK
 52NwJOYB+fl06BG47iibiczlWXW/cqUUCzPlKVDEjIRj9lBmF1EEczCStEvGqYa88ZbE
 hGMh261n7orTVtmyrbm2DzKBvsq7Fd0c+Zo2hVrNJLGXDoFLDz0MsHkMBpiht1l5HJdH
 iEZ7XrVtT2Fc+fi7DdOBt8yPw9ooNWW8NP/ql1NciIP1YVFZFuvwnLPUxbuxHXEn6OTZ
 rCXQ==
X-Gm-Message-State: AO0yUKVlW/ONEG02ecqBBUxDpF6l1y5GyXc4UESLnzVAEv4OzhCPxi2O
 +bEnPZLJAX3I7gmJDn9ev0ZOKA==
X-Google-Smtp-Source: AK7set91LXjwzr8KiwU82VsK52DMCWblJR5GRNYUn+vcZNZ7FXDzPgDoLLfYcHImWvMKrY3vag5caA==
X-Received: by 2002:a5d:5256:0:b0:2c5:587e:75ba with SMTP id
 k22-20020a5d5256000000b002c5587e75bamr1035420wrc.55.1676457912615; 
 Wed, 15 Feb 2023 02:45:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff94d000000b002be099f78c0sm15034357wrr.69.2023.02.15.02.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:45:12 -0800 (PST)
Message-ID: <01ff80e9-c564-5566-5405-b2ca26dfbf09@linaro.org>
Date: Wed, 15 Feb 2023 11:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 14/2/23 18:18, Cédric Le Goater wrote:
> Hello,
> 
> This series starts with a first set of patches fixing I2C slave mode
> in the Aspeed I2C controller, a test device and its associated test in
> avocado.
> 
> Follow some cleanups which allow the use of block devices instead of
> drives. So that, instead of specifying :
> 
>    -drive file=./flash-ast2600-evb,format=raw,if=mtd
>    -drive file=./ast2600-evb.pnor,format=raw,if=mtd
>    ...
> 
> and guessing from the order which bus the device is attached to, we
> can use :
> 
>    -blockdev node-name=fmc0,driver=file,filename=./bmc.img
>    -device mx66u51235f,bus=ssi.0,drive=fmc0
>    -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
>    -device mx66u51235f,bus=ssi.0,drive=fmc1
>    -blockdev node-name=pnor,driver=file,filename=./pnor
>    -device mx66l1g45g,bus=ssi.1,drive=pnor
>    ...
> 
> It is not perfect, the CS index still depends on the order

Quick thoughts here:

TYPE_SSI_PERIPHERAL devices have one input SSI_GPIO_CS.

TYPE_SSI_BUS could have a "cs-num" property (how many
CS line associated with this bus) and create an array of
#cs-num output SSI_GPIO_CS.

TYPE_SSI_PERIPHERAL could have a "cs" (index) property;
if set, upon ssi_peripheral_realize() when the device is
plugged on the bus, the GPIO line is wired.

So we could set the 'cs=' property from CLI:

   -blockdev node-name=fmc0,driver=file,filename=./bmc.img
   -device mx66u51235f,bus=ssi.0,cs=1,drive=fmc0
   -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
   -device mx66u51235f,bus=ssi.0,cs=0,drive=fmc1

> but it is
> now possible to run a machine without -drive ...,if=mtd.
> 
> This lacks the final patch enabling the '-nodefaults' option by not
> creating the default devices if specified on the command line. It
> needs some more evaluation of the possible undesired effects.
> Thanks,
> 
> C.


