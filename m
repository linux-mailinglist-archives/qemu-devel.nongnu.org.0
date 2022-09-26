Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECDD5EAF6F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:17:43 +0200 (CEST)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsfm-0007Pp-4I
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrbu-0006dU-IP; Mon, 26 Sep 2022 13:09:38 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrbs-0005ge-PO; Mon, 26 Sep 2022 13:09:38 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 h1-20020a4aa741000000b004756c611188so1212974oom.4; 
 Mon, 26 Sep 2022 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=eM7P3GHw0+Z3glCjhmaeRMrAfz8YMLy4SrjY5kGnkoY=;
 b=TQQ35FRYo+Ki0oE0V4Lt94i8B1ViExUhCJlvPsen7R3eqNFJAGbeZGbRoZQW2UMkB3
 BfAPSyS6cCXrcr+7Z8iKl/rNibRyDYPoWMdd3kddmMjK0fhotqhbibV/6py/H+ZpjLY1
 n/3ONXkU1yiWpADr7SPAep/Sm0zyr0MzyQXB3AYXnHD5SdsX5Ea2Oce5XoFRo+ACQW6P
 31PIewzt7tiH1GymQ8vaAEmyDgEuSLE6Y44P7JumMrq8Z1fd+9kFbt2qDw5gXUpPoPr3
 1UCVSXiJUIyxMyqdkgZD2IOsm/sm1AxrMokAvVVssHUGYNtQ4mjem1ia/mFeqhcjkR0W
 mZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eM7P3GHw0+Z3glCjhmaeRMrAfz8YMLy4SrjY5kGnkoY=;
 b=tFY/F7agW5XIcL6CdvDr2zy5o5HTdgBE/GDaVFF85Kw64VEz+PJnt7W33YtsB6g1dE
 xpjkvH9yapxDTxyklBgN/G+C7KHYcXuRNv2KKjJGfdumF2q3IrG7zB3nUV9Uy9wjdMjO
 VURS9Aft8TZzC/7Ovh2Zd23Rt4/8ej0nkczIlWc61qF2NKqFsUphqZhX4FYimr01DBML
 I0y666sd9A0P1b/h/zjjBi5Upb5uEz+AHZ1OchdioS6yEjSlScDSzmzQBMEoi6gg63rh
 4TN2e5B6V0MVyD0iPT87YBs6N5rTFVKci9nAsY4aZW4YkBOsd2T169t0JcKVoOOypctu
 JE2Q==
X-Gm-Message-State: ACrzQf1jux6ELrrchUG6b18GdeQJADSjxNy2lA9RNbRXY0ehPZthQca3
 qpC/Nl2zPrefHs7ZVBIiOcY=
X-Google-Smtp-Source: AMsMyM5qNnOB4zAzmp+5eL3N7JyEv/w06BeUdh1xgSg7joZ2amlhbSKkzaoA+0konPxAjwjmT0TOiA==
X-Received: by 2002:a4a:1507:0:b0:475:ec9f:aae9 with SMTP id
 7-20020a4a1507000000b00475ec9faae9mr9252600oon.8.1664212174013; 
 Mon, 26 Sep 2022 10:09:34 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 g20-20020a544f94000000b00344f28a7a4csm5263489oiy.22.2022.09.26.10.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 10:09:33 -0700 (PDT)
Message-ID: <6ad5fa00-ac5c-3fd9-48fd-c2cb93daeb21@gmail.com>
Date: Mon, 26 Sep 2022 14:09:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 00/25] ppc4xx_sdram QOMify and clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <cover.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
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

Zoltan,

I've started to push some patches to ppc-next. Patches 1-13 are already pushed
and I'm running tests on patches 14-17. Assuming everything is ok we'll be
left with patches 18-25 to work on.


Thanks,


Daniel

On 9/24/22 09:27, BALATON Zoltan wrote:
> This is the end of the QOMify series started by Cédric. This series
> handles the SDRAM controller models to clean them up, QOMify and unify
> them and at least partially clean up the mess that has accumulated
> around these in the past. This includes the not yet merged patches
> from the last series and new ones that change the DDR2 version used by
> sam460ex.
> 
> v6: Split patch moving sdram controller models together into smaller steps
> v5: Add functions the enable sdram controller and call it from boards
> v4: address more review comments
> v3: Fix patches that got squashed during rebase
> v2: address some review comments and try to avoid compile problem with
> gcc 12.2 (untested)
> 
> BALATON Zoltan (25):
>    ppc440_bamboo: Remove unnecessary memsets
>    ppc4xx: Introduce Ppc4xxSdramBank struct
>    ppc4xx_sdram: Get rid of the init RAM hack
>    ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>    ppc440_bamboo: Add missing 4 MiB valid memory size
>    ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>    ppc4xx_sdram: QOM'ify
>    ppc4xx_sdram: Drop extra zeros for readability
>    ppc440_sdram: Split off map/unmap of sdram banks for later reuse
>    ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
>    ppc440_sdram: Get rid of the init RAM hack
>    ppc440_sdram: Rename local variable for readability
>    ppc4xx_sdram: Rename functions to prevent name clashes
>    ppc440_sdram: Move RAM size check to ppc440_sdram_init
>    ppc440_sdram: QOM'ify
>    ppc440_uc.c: Move some macros to ppc4xx.h
>    ppc440_uc.c: Remove unneeded parenthesis
>    ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
>    ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
>    ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
>    ppc4xx_sdram: Use hwaddr for memory bank size
>    ppc4xx_sdram: Rename local state variable for brevity
>    ppc4xx_sdram: Generalise bank setup
>    ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>    ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()
> 
>   hw/ppc/meson.build      |   3 +-
>   hw/ppc/ppc405.h         |   8 +-
>   hw/ppc/ppc405_boards.c  |  13 +-
>   hw/ppc/ppc405_uc.c      |  33 +-
>   hw/ppc/ppc440.h         |   4 -
>   hw/ppc/ppc440_bamboo.c  |  25 +-
>   hw/ppc/ppc440_uc.c      | 267 +-------------
>   hw/ppc/ppc4xx_devs.c    | 413 ----------------------
>   hw/ppc/ppc4xx_sdram.c   | 753 ++++++++++++++++++++++++++++++++++++++++
>   hw/ppc/sam460ex.c       |  44 +--
>   hw/ppc/trace-events     |   1 +
>   include/hw/ppc/ppc4xx.h |  65 +++-
>   12 files changed, 859 insertions(+), 770 deletions(-)
>   create mode 100644 hw/ppc/ppc4xx_sdram.c
> 

