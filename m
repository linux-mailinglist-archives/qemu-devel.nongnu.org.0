Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515E58F90A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 10:28:38 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM3YT-0002SB-2s
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 04:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oM3Uj-0008NW-KK; Thu, 11 Aug 2022 04:24:47 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oM3Ud-0002BP-CA; Thu, 11 Aug 2022 04:24:41 -0400
Received: by mail-vs1-xe34.google.com with SMTP id m67so17541906vsc.12;
 Thu, 11 Aug 2022 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=WwbFqSXsSRuidxYrebQoaqDB3kAAWCNu9lSC/nIt8kg=;
 b=GYoV/6Uo1S81YbKAmVhYIX8MOshdSq8tjVBjaE2tOFdcQe+KZgMW3IrwzE1sfZXDY1
 v0jMSztNjQr/JuhKicTan4UN4V5NTYHoffL+VvmUoH75/ZOxo8w/ifPoF8zGbOh7KPrI
 jHPzF0xXbb35M6T+R0A9nUsTez4PIaEJNtmoymSz1iQw+ZIEn6NyQFBRnw0gkGXiwF5/
 EaukhF/IPElKScK5HfNur9ZgqJuxVnRxieo6CSTS6cKZpoyZV1DHg7aiVcQBaBVrsM/c
 8MsxG28UsqR8SCZLNlhbuTu49CI3XTheq4e1sBlTiSO32srNgkYxhgtZkskDhMvU6+Q8
 DHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=WwbFqSXsSRuidxYrebQoaqDB3kAAWCNu9lSC/nIt8kg=;
 b=F9IcC2RJ8h02mGGkxJQ+hL00zoKHrtHdgtUlQcGZ90tvNREJ9wEAlbDkM+9UsqHbfc
 U14goAUWrYZ1w32wLL0qSAXvmFC9MVZmmSKN4k3qXtOKxYPIOIvCfTk+GIjALMVrQGI6
 jnzazpp7i1CZd+qxL5m47QkP0n63JozjbKDsope/s5u1Q4RE3pOP9HjBc0B+YTZFJlG1
 BrjvrV4p99IP9EpXamH+4lgk9++KfcbkzmBFlTQmmAj1dEc3c3YnUl8VnpYflmK3OMjK
 SpO5cSM9ubmfS8zdMCJ3jHM8xPO4nDlGsL//854YJE8MHHGEXboDH74tL5AjGPaaeFd7
 USaw==
X-Gm-Message-State: ACgBeo3UkrodtRNsG5w+XIaZAkQwHsCOfexrJZptNkYJvpqte/95WdpW
 FYSDFC9XttiX6AzgsBaxncc=
X-Google-Smtp-Source: AA6agR5YDJpvIIa0cLF/HTPO9Jxx/Hzk5sYltFbafxEmQzKJc4Vsk/fSGAst22JxprfeW3ad9aygtA==
X-Received: by 2002:a67:ca88:0:b0:356:51a5:993e with SMTP id
 a8-20020a67ca88000000b0035651a5993emr13071069vsl.12.1660206277953; 
 Thu, 11 Aug 2022 01:24:37 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 k124-20020a1fec82000000b00377b6c5f926sm1456725vkh.42.2022.08.11.01.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 01:24:37 -0700 (PDT)
Message-ID: <ecf67325-f640-23e6-08f4-adbfa03c025e@gmail.com>
Date: Thu, 11 Aug 2022 05:24:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 00/24] ppc: QOM'ify 405 board
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220809153904.485018-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220809153904.485018-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Cedric,

I pushed patches 1-7 to gitlab.com/danielhb/qemu/tree/ppc-7.2. This
way you have 7 less patches to worry about for the next versions.


Thanks,

Daniel


On 8/9/22 12:38, Cédric Le Goater wrote:
> Hello,
> 
> Here is large series QOM'ifying the PPC405 board. It introduces a new
> generic machine and SoC models, converts the current device models to
> QOM and populates the SoC. The process is quite mechanical without too
> much issues to handle. The noisy part is the initial patch introducing
> the SoC realize routine.
> 
> Thanks,
> 
> C.
> 
> Changes in v4 :
> 
>   - Attempt to QOM'ify SDRAM controller, with 2 initialized banks at
>     the SoC level
>   - Report errors to the user for invalid RAM config
>   - Moved CPU reset in PPC405 model
>   - user_creatable comments
>   - Renamed FPGA device model
>   - Various small cleanups
> 
> Changes in v3 :
> 
>   - New device model Ppc4xxDcrDeviceState
>   - Removal of ppc4xx_mal_init(), ppc4xx_plb_init() and ppc405_ebc_init()
>   - Fixes for some reset issues
>   - Kept 2 RAM banks at the Soc level but only one is initialized.
>   - Moved SRAM under the machine. It's not part of the SoC according
>     to the 405 specs
> 
> Changes in v2 :
> 
>   - docs/about/removed-features.rst update
>   - Fix compile breakage (uic)
>   - Fix CPU reset, which breaking u-boot boot
>   - Changed prefix of memory regions to "ppc405"
>   - Reduced the number of RAM banks to 1. Second was a dummy one to
>     please ppc405ep_init()
> 
> Cédric Le Goater (24):
>    ppc/ppc405: Remove taihu machine
>    ppc/ppc405: Introduce a PPC405 generic machine
>    ppc/ppc405: Move devices under the ref405ep machine
>    ppc/ppc405: Move SRAM under the ref405ep machine
>    ppc/ppc405: Introduce a PPC405 SoC
>    ppc/ppc405: Start QOMification of the SoC
>    ppc/ppc405: QOM'ify CPU
>    ppc/ppc4xx: Introduce a DCR device model
>    ppc/ppc405: QOM'ify CPC
>    ppc/ppc405: QOM'ify GPT
>    ppc/ppc405: QOM'ify OCM
>    ppc/ppc405: QOM'ify GPIO
>    ppc/ppc405: QOM'ify DMA
>    ppc/ppc405: QOM'ify EBC
>    ppc/ppc405: QOM'ify OPBA
>    ppc/ppc405: QOM'ify POB
>    ppc/ppc405: QOM'ify PLB
>    ppc/ppc405: QOM'ify MAL
>    ppc/ppc405: QOM'ify FPGA
>    ppc/ppc405: Use an embedded PPCUIC model in SoC state
>    ppc/ppc405: Use an explicit I2C object
>    ppc/ppc4xx: Fix sdram trace events
>    ppc/ppc405: QOM'ify SDRAM
>    ppc/ppc405: Add check on minimum RAM size
> 
>   docs/about/deprecated.rst       |   9 -
>   docs/about/removed-features.rst |   6 +
>   docs/system/ppc/embedded.rst    |   1 -
>   hw/ppc/ppc405.h                 | 196 +++++++-
>   include/hw/ppc/ppc4xx.h         |  82 ++-
>   hw/ppc/ppc405_boards.c          | 381 ++++----------
>   hw/ppc/ppc405_uc.c              | 859 +++++++++++++++++---------------
>   hw/ppc/ppc4xx_devs.c            | 326 +++++++-----
>   hw/ppc/sam460ex.c               |  24 +-
>   MAINTAINERS                     |   2 +-
>   hw/ppc/trace-events             |   3 -
>   11 files changed, 1042 insertions(+), 847 deletions(-)
> 

