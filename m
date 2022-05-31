Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AFD5396C2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 21:12:23 +0200 (CEST)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw7Hx-0005Wl-TB
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 15:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nw7DM-0003Vy-04; Tue, 31 May 2022 15:07:36 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nw7DK-000515-4t; Tue, 31 May 2022 15:07:35 -0400
Received: by mail-pl1-x629.google.com with SMTP id h1so4465126plf.11;
 Tue, 31 May 2022 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IsrV0z+oTObhUMOinSX9dk2RI7tCuck2hDq/t/yuK7k=;
 b=gbulYDxn+DBqcQtRzQb1cnGapM7j9cWTKMyJDZcyuXvV1QcHkD7Y+A2CIyNjqHqgmE
 oF8E23UkzowU5ECcaTmptFmL5P7rYlZxcpGP7CBCJgcP9kBdC5Ahmm4OYGek/HcSUS1w
 QNCJ+CwdiLkRiKzOT57bwCooIIZpeEKwvtCC7dpSxhmQZANm9zH1AVb1mOHUA9TeZzfG
 BE4Eu+TgoV2OCt6/ZnQn3zAk7CPXvlWUbH1y02r+u/ZdHA5waHQzP3aCBONiUCHjZ3h8
 D7C8PPWoeUpUcz6CbYFv3Y9onFYaae3mpDfDwtWkzFnpXpn5uuOvWs9VH+3yI0jwlixv
 uFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IsrV0z+oTObhUMOinSX9dk2RI7tCuck2hDq/t/yuK7k=;
 b=OzgCXTQtB8Z2J09USD1c87iVjeWykRzmeF90BdV/1mpfQ06J3ryeTcM3Y/j4PrjLBq
 w8/S0UxwulsyZ0r11Gfg5+8HRG+HzPgkqD9XIBmNkFrCk0dBWIaJAx63Uk47/pwSRX0I
 H9f86hMMXL8X2wa7FlHOLxKCiF753W/uPQ4ByZzt9mcP1PZ0f6Zd/cFwSUdzuQG/gQFf
 sXFqYwDKEZnYTrkavTD658kobbZBwpAyiN+IF7M6KxEyQnluLRvwhx7mKmHLoY5QqC4w
 5eqe4hhipUJew1Rdyahv/osbhF3XoF3fLPy2fR5JdIgkiGyViGL9r9LCIq+hlh1h8JAt
 SY5g==
X-Gm-Message-State: AOAM532ApM/JmW2lENfts0zJZfKU115cbwdLgT8wHGa69m0wT61KXHl/
 IHIaGxltsh0ouJcUQXFqr/4=
X-Google-Smtp-Source: ABdhPJyjcwsGqb31QscB6VIr0XN+HBB1vwhVSRGdK1u/PGGTH8u2bDJZED4d5NF4EUSUZsP6SQ/3qg==
X-Received: by 2002:a17:903:209:b0:161:7f66:b9e0 with SMTP id
 r9-20020a170903020900b001617f66b9e0mr46215437plh.73.1654024051764; 
 Tue, 31 May 2022 12:07:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a170902860b00b0015e8d4eb248sm11393869plo.146.2022.05.31.12.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 12:07:31 -0700 (PDT)
Message-ID: <9a265410-49f1-ba56-6c9b-d58e641e71b4@amsat.org>
Date: Tue, 31 May 2022 21:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/25] hw/sd: Rework models for eMMC support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <28f1b244-d1f9-c490-4b33-ca40824b5a19@kaod.org>
In-Reply-To: <28f1b244-d1f9-c490-4b33-ca40824b5a19@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 31/5/22 11:19, Cédric Le Goater wrote:
> On 5/30/22 21:37, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Rebase/respin of Cédric RFC:
>> https://lore.kernel.org/qemu-devel/20220318132824.1134400-1-clg@kaod.org/
>> (sorry it took me so long guys...)
>>
>> Pushed at https://gitlab.com/philmd/qemu/-/commits/emmc-v2
>>
>> I plan to queue patches 1-12 via sdmmc-next later this week.
>>
>> Cédric, if you are happy with this series, it should be easy to rebase
>> your other patches on top and address the comments I left on the RFC :)
> 
> I pushed an update on :
> 
>    https://github.com/legoater/qemu/commits/aspeed-7.1
> 
> Here is an image :
> 
>    https://www.kaod.org/qemu/aspeed/mmc-p10bmc.qcow2
> 
> run with :
> 
>   qemu-system-arm -M rainier-bmc -net nic -net user -drive 
> file=./mmc-p10bmc.qcow2,format=qcow2,if=sd,id=sd0,index=2 -nographic 
> -nodefaults -snapshot -serial mon:stdio

Useful, thanks.

I see in hw/arm/aspeed_ast2600.c:

     /* Init sd card slot class here so that they're under the correct 
parent */
     for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         object_initialize_child(obj, "sd-controller.sdhci[*]",
                                 &s->sdhci.slots[i], TYPE_SYSBUS_SDHCI);
     }

     object_initialize_child(obj, "emmc-controller.sdhci", 
&s->emmc.slots[0],
                             TYPE_SYSBUS_SDHCI);

     /* eMMC Boot Controller stub */
     create_unimplemented_device("aspeed.emmc-boot-controller",
                                 sc->memmap[ASPEED_DEV_EMMC_BC],
                                 0x1000);

     /* eMMC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, 
sc->memmap[ASPEED_DEV_EMMC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));

Where is 'emmc-controller.sdhci' realized?

In aspeed_sdhci_realize() you set sd-spec-version" = 2, is that OK
with eMMC?

What expects the real hw?

Thanks,

Phil.

