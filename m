Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C75BC024
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 23:37:56 +0200 (CEST)
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1z9-0007nz-Rg
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 17:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1xS-0005En-8h; Sun, 18 Sep 2022 17:36:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1xP-0006hl-D5; Sun, 18 Sep 2022 17:36:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id n12so4218384wrx.9;
 Sun, 18 Sep 2022 14:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=cefnW4Cfx2/IJdwChSTe88+5yoRf+3XhrRW9Pxka93Q=;
 b=c+ryFzz/lKRjEmRooHwYqEDjAR1BxGxvhXk47pZR3LojuqjqhoW22kVLD2A710A6nH
 VrkuFADxphV9CwEoolC6s+Fpc4n9jMOJcQIiJG1KMDlbfxBl5SUuYX0n5yJcePUEGxN+
 p/Z4vRvKrsLpW0SBxqF2SdDcJkKE9ZS3rA5BG9M5bchhozNzC3NtXJIXtJYd/mvtWiH1
 Wa5cLT6ebeGwx1RgsoqGn1b+NVA9kFdvYXmwwjo0HuHlGH5cbBLW+SZO4/fNjKVMr+xl
 goYiTCcetMOl0uinILOf07OlN9COzuLazxiSS/kpC7o8S/Sokz2pVUyVdBObiPHe8Oq1
 S4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=cefnW4Cfx2/IJdwChSTe88+5yoRf+3XhrRW9Pxka93Q=;
 b=qmUeOXm+nBM8EMPqL0HijOKHKcW4HyMtpgMoqLuM4XSXI8WmaI/PSHR4UQHUnzmp1i
 jLJYk2f1M+1I0m3YL3dAspkHSkbPQXCKRRMh6ky5OIbcQQrjjS3fh15BQtE83f+woTcv
 9I3aZ01pCVkdC86he1y1MGr6Fuh2hDA0ubwNQpOvtYyNf3MQEKfS/FZx+ieA1fkYjb/Q
 s3p6NHdZUf4hp9ikbG+vDkBJqrcvaD42liMcXwW2TkpwRv471bTfyfzrk32Mv1Ky+sYV
 X1LqOryA2HD7D83ulb+lvKnEUi6F6eUael+fljmeAnQ3VcEbRfcXUZXW2+vfYdUC9TCI
 W/2w==
X-Gm-Message-State: ACrzQf0gh+DGJDfRmQbfBDhMpsEGuAPBYEqDdV/FJt7cWwhPNPpv4vit
 9sgb3eOZn/j+j1YMmBPCMUs=
X-Google-Smtp-Source: AMsMyM63xDce7us5Hun94qVyUMY1ErhPiJOywmE+V8hWcHBX8ng9/J7vQBsF0VwDl4MLW5KxfnaDzw==
X-Received: by 2002:a5d:408b:0:b0:228:9c95:3b66 with SMTP id
 o11-20020a5d408b000000b002289c953b66mr9084100wrp.90.1663536965357; 
 Sun, 18 Sep 2022 14:36:05 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b0022a2bacabbasm11461280wrm.31.2022.09.18.14.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 14:36:04 -0700 (PDT)
Message-ID: <79cba383-04a3-db39-4578-64f031eadd45@amsat.org>
Date: Sun, 18 Sep 2022 23:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 16/21] ppc4xx_sdram: Move ppc4xx DDR and DDR2 SDRAM
 controller models together
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663531117.git.balaton@eik.bme.hu>
 <08665c5c248adc3fa4a44cc05065c38126bb8bfb.1663531117.git.balaton@eik.bme.hu>
 <8495fbef-7eda-fea5-1cf2-60dcb0a50dc4@amsat.org>
 <f933fad5-26b4-7e68-a4b0-a1b07014da1a@eik.bme.hu>
In-Reply-To: <f933fad5-26b4-7e68-a4b0-a1b07014da1a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

On 18/9/22 23:24, BALATON Zoltan wrote:
> On Sun, 18 Sep 2022, Philippe Mathieu-Daudé wrote:
>> Hi Zoltan,
>>
>> On 18/9/22 22:24, BALATON Zoltan wrote:
>>> Move the PPC4xx DDR and DDR2 SDRAM contrller models into a new file
>>> called ppc4xx_sdram to separate from other device models and put them
>>> in one place allowing sharing some code between them.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/ppc/meson.build      |   3 +-
>>>   hw/ppc/ppc440_uc.c      | 332 -----------------
>>>   hw/ppc/ppc4xx_devs.c    | 414 ---------------------
>>>   hw/ppc/ppc4xx_sdram.c   | 771 ++++++++++++++++++++++++++++++++++++++++
>>>   include/hw/ppc/ppc4xx.h |  24 +-
>>>   5 files changed, 785 insertions(+), 759 deletions(-)
>>
>> This seems a proper cleanup, but even using `git-diff 
>> --color-moved=dimmed-zebra` I'm having hard time reviewing this single
>> patch.
>> Looking at the changes in the ppc4xx_sdram_types[] array, it
>> seems we can be move one model at a time, right?
> 
> I could try to break this patch up some more if absolutely necessary but 
> I've already spent a lot of time rebasing this series as every little 
> change in earlier patch leads to conflicts later then patches get 
> squashed during rebase and I have to redo it again to separate them. So 
> if you can't review it looking at it some more I could try a v6 but 
> don't want if can be avoided. I'll wait for Cédric's comments too in any 
> case to only do as many respins as needed.

Sure, I totally understand. Let see first if someone is willing to
review it as it.

