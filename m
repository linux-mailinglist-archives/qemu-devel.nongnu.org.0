Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB865BBFFB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 23:05:14 +0200 (CEST)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1TV-0002Wt-51
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 17:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1Qz-0000dQ-Rn; Sun, 18 Sep 2022 17:02:53 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1Qu-0001nu-JN; Sun, 18 Sep 2022 17:02:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so5392688pjb.0; 
 Sun, 18 Sep 2022 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=10iaEATlDXtwT5Sd2ba15wHec9AEEy4n4iKEGbILmQY=;
 b=AI5bunTzvJTpyqhxMfmQoA5kZdA7mIoCSLJOdMu/1bvXYbcpNA6IZ0wXa9itSz4g5/
 6g4q6NukT3MhTG4yamDTEt4EsgMAQbOi4CN8O0RF9xZArFhm5BPTRuU/uZVeSR06clRj
 AsmNBTDw0IZ1vBptrLhmY65UM+/8FupxrrUiZXvG0/Y9GC3JkfWG6FOOFz4mpwQmE8mG
 b58t7QaFt3ivMOpjuMgx5bFDIdakrQPLVe21u1pfJnZClBVpQkNOKZuqaK02CGu5bFYI
 I4fR7Jn6G4f74RmjPb9BeXbN4J81ZT+NRgS1jsChkuJAdv7HgiqvM3+OyxMIm8ThzA5R
 t7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=10iaEATlDXtwT5Sd2ba15wHec9AEEy4n4iKEGbILmQY=;
 b=rid0h1H/v7foVMR8lRnYXAul7U9A/w3Ao4wEU0K6iV+b16boNQwFIQMNjhSbu+7gju
 d9vlG26Uhh02XYwVuC4CAtneSYCvu0OtHGwlzwkX0JUKMIUy97ZpbOB1HMUJ6jj/6gYs
 K8xdZNtJ8zLb7DRdVyb8A0PsDZgJXUB2z7e2I53CcxHh7VOQV9EJJNOzbeiPsPoAH4+p
 H7h61DbBBqK1Y1ZiVob+rACLckqR0F4FvnI0oXncuyjGTS1IC8h5FFQ3zBWJhaU0AUGc
 MUsC311L1Ugv8klYbBypb+Nc8uxsBr+r9yqYORPZ06kE6N2i8OUZr0PInH0r48bZom/X
 aSPg==
X-Gm-Message-State: ACrzQf00qEgewURDeNNcbAiMZ67PhH9ElK5bO1RwNre0S359Yt+zUYO7
 FbbOLFlE7HG2LmkcJHZAte0=
X-Google-Smtp-Source: AMsMyM4tkFGwyjgydxd/jOpSKwv3e28EXuzmPAfAFKKwMLlhVkGKjUQCLZ+qNGP4J/R91PvgDAUDZw==
X-Received: by 2002:a17:90b:1e45:b0:201:6b28:5403 with SMTP id
 pi5-20020a17090b1e4500b002016b285403mr16829505pjb.164.1663534949139; 
 Sun, 18 Sep 2022 14:02:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a17090301c200b001754e086eb3sm19063764plh.302.2022.09.18.14.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 14:02:28 -0700 (PDT)
Message-ID: <8495fbef-7eda-fea5-1cf2-60dcb0a50dc4@amsat.org>
Date: Sun, 18 Sep 2022 23:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 16/21] ppc4xx_sdram: Move ppc4xx DDR and DDR2 SDRAM
 controller models together
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663531117.git.balaton@eik.bme.hu>
 <08665c5c248adc3fa4a44cc05065c38126bb8bfb.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <08665c5c248adc3fa4a44cc05065c38126bb8bfb.1663531117.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Zoltan,

On 18/9/22 22:24, BALATON Zoltan wrote:
> Move the PPC4xx DDR and DDR2 SDRAM contrller models into a new file
> called ppc4xx_sdram to separate from other device models and put them
> in one place allowing sharing some code between them.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/meson.build      |   3 +-
>   hw/ppc/ppc440_uc.c      | 332 -----------------
>   hw/ppc/ppc4xx_devs.c    | 414 ---------------------
>   hw/ppc/ppc4xx_sdram.c   | 771 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/ppc/ppc4xx.h |  24 +-
>   5 files changed, 785 insertions(+), 759 deletions(-)

This seems a proper cleanup, but even using `git-diff 
--color-moved=dimmed-zebra` I'm having hard time reviewing this single
patch.
Looking at the changes in the ppc4xx_sdram_types[] array, it
seems we can be move one model at a time, right?

[...]
> +static const TypeInfo ppc4xx_sdram_types[] = {
> +    {
> +        .name           = TYPE_PPC4xx_SDRAM_DDR,
> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> +        .instance_size  = sizeof(Ppc4xxSdramDdrState),
> +        .class_init     = ppc4xx_sdram_ddr_class_init,
> +    }, {
> +        .name           = TYPE_PPC4xx_SDRAM_DDR2,
> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> +        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
> +        .class_init     = ppc4xx_sdram_ddr2_class_init,
> +    }
> +};
> +
> +DEFINE_TYPES(ppc4xx_sdram_types)
[...]

