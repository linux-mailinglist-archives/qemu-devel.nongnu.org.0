Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA5569107
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:48:20 +0200 (CEST)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o998N-0000AP-GO
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o995b-0006qx-7Y; Wed, 06 Jul 2022 13:45:27 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o995W-0005mN-Uy; Wed, 06 Jul 2022 13:45:24 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id o185so3365653vsc.7;
 Wed, 06 Jul 2022 10:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xkXaDtuPxnwRb/Ss1toDMUevu1G3NlGpY8nbQ83dHj8=;
 b=fOaTWcFkAwz0QdDOE+/J0IlgvfFrZVR5UJYulpejYntbOlEGiN5eyy9BD4srXGw1/5
 lsXlg92Tjkc2zmOEFte6E3Is+FvKKLwtOZzNmTtjB54zZZC5vM29aeT7RirFX1uHm9ed
 Wg1wLEIZhBKnXq5OHyppiCB8troROJftSc50NyVkE4ols8EWPB95hPtO+KaU1KsUoxpu
 iMe5js90HqOgEk5PcbfoM3AOSCmujh5Kxh67c1xU0SEv3NTPHEx7kKyusYsg0c1cLPtV
 eBxLA1ndBSuT/HCg9fmnFg2yMmj4jpL5Eir8BXfQDPXvZVgSOYrZw+GVSYDWO1sxtIHX
 Hv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xkXaDtuPxnwRb/Ss1toDMUevu1G3NlGpY8nbQ83dHj8=;
 b=PinuWSwAHFK2p79lZdIHL/ceiQ58ZlqmZ7Kf0zzjcFlGW07CTc/fpyel4o37ccxau4
 gRuc3XLwsltoeMWn1o7EZQDAQNXBzxNW/HRG8Z3LZue6cq5J8HeXZOEe3I32p/CY/iuu
 DR/aJlmKyv9zEwlGtUL/Mp2c7LJeRFkeAVbDvpDVJdX0RXtiw2f72bFuwnTi+09+wwXx
 UtwpPQrqNwx/lZ/3TPHImBM/6qMxNUzEjB+NBxR8nQhmZ+vbHUPgaiP9nklfnCYLVRHn
 Uw+pf3UFcIvZugQxemyLg+lJAj0yoo+4xPlFJ2HsVu8xoaXnT7Sdy0BkL4/nncm4Rm2S
 Z2Jg==
X-Gm-Message-State: AJIora/yHM2vIsExvmMBnM0rAVV4kuzf2kNvmzXGTCs0FU3Qd6NYllD3
 DYXXZEPNvczBgxhiNFnhhl4=
X-Google-Smtp-Source: AGRyM1sD1iWBqyeh76LyKMuHo5qscrEmvhU7IApqiazEbe+HQmAAYiJ2GXdsLAuzyzpm1GvgAUgQJg==
X-Received: by 2002:a05:6102:370d:b0:356:f866:831c with SMTP id
 s13-20020a056102370d00b00356f866831cmr5669583vst.87.1657129520651; 
 Wed, 06 Jul 2022 10:45:20 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 z26-20020ab0389a000000b003827ff7211bsm5778577uav.5.2022.07.06.10.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 10:45:20 -0700 (PDT)
Message-ID: <48a8cd48-772b-1717-f28b-5c4de379d309@gmail.com>
Date: Wed, 6 Jul 2022 14:45:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc: Fix MPC8555 and MPC8560 core type to e500v1
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220703195029.23793-1-pali@kernel.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220703195029.23793-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2d.google.com
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



On 7/3/22 16:50, Pali Rohár wrote:
> Commit 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
> changed core type of MPC8555 and MPC8560 from e500v1 to e500v2.
> 
> But both MPC8555 and MPC8560 have just e500v1 cores, there are no features
> of e500v2 cores. It can be verified by reading NXP documentations:
> https://www.nxp.com/docs/en/data-sheet/MPC8555EEC.pdf
> https://www.nxp.com/docs/en/data-sheet/MPC8560EC.pdf
> https://www.nxp.com/docs/en/reference-manual/MPC8555ERM.pdf
> https://www.nxp.com/docs/en/reference-manual/MPC8560RM.pdf
> 
> Therefore fix core type of MPC8555 and MPC8560 back to e500v1.
> 
> Fixes: 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And queued in ppc-next after appending the commit message with the
following:


---------

Just for completeness, here is list of all Motorola/Freescale/NXP
processors which were released and have e500v1 or e500v2 cores:

e500v1: MPC8540 MPC8541 MPC8555 MPC8560

e500v2: BSC9131 BSC9132
         C291 C292 C293
         MPC8533 MPC8535 MPC8536 MPC8543 MPC8544 MPC8545 MPC8547
         MPC8548 MPC8567 MPC8568 MPC8569 MPC8572
         P1010 P1011 P1012 P1013 P1014 P1015 P1016 P1020 P1021
         P1022 P1024 P1025 P2010 P2020

Sorted alphabetically; not by release date / generation / feature set.
All this is from public information available on NXP website.

Seems that qemu has support only for some subset of MPC85xx processors.
Historically processors with e500 cores have mpc85xx family codename and
lot of software have them in mpc85xx architecture subdirectory.

Note that GCC uses -mcpu=8540 option for specifying e500v1 core and
-mcpu=8548 option for specifying e500v2 core.

So sometimes (mpc)8540 is alias for e500v1 and (mpc)8548 is alias for
e500v2.
--------


Thanks,


Daniel


>   target/ppc/cpu-models.c | 14 +++++++-------
>   target/ppc/cpu-models.h | 14 +++++++-------
>   2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 976be5e0d171..44a2710c5843 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -385,19 +385,19 @@
>       POWERPC_DEF_SVR("mpc8548e_v21", "MPC8548E v2.1",
>                       CPU_POWERPC_MPC8548E_v21, POWERPC_SVR_8548E_v21, e500v2)
>       POWERPC_DEF_SVR("mpc8555_v10", "MPC8555 v1.0",
> -                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v2)
> +                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v1)
>       POWERPC_DEF_SVR("mpc8555_v11", "MPC8555 v1.1",
> -                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v2)
> +                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v1)
>       POWERPC_DEF_SVR("mpc8555e_v10", "MPC8555E v1.0",
> -                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v2)
> +                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v1)
>       POWERPC_DEF_SVR("mpc8555e_v11", "MPC8555E v1.1",
> -                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v2)
> +                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v1)
>       POWERPC_DEF_SVR("mpc8560_v10", "MPC8560 v1.0",
> -                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v2)
> +                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v1)
>       POWERPC_DEF_SVR("mpc8560_v20", "MPC8560 v2.0",
> -                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v2)
> +                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v1)
>       POWERPC_DEF_SVR("mpc8560_v21", "MPC8560 v2.1",
> -                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v2)
> +                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v1)
>       POWERPC_DEF_SVR("mpc8567", "MPC8567",
>                       CPU_POWERPC_MPC8567,      POWERPC_SVR_8567,      e500v2)
>       POWERPC_DEF_SVR("mpc8567e", "MPC8567E",
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index 76775a74a9b6..1326493a9a05 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -184,13 +184,13 @@ enum {
>   #define CPU_POWERPC_MPC8548E_v11     CPU_POWERPC_e500v2_v11
>   #define CPU_POWERPC_MPC8548E_v20     CPU_POWERPC_e500v2_v20
>   #define CPU_POWERPC_MPC8548E_v21     CPU_POWERPC_e500v2_v21
> -#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v2_v10
> -#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v2_v11
> -#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v2_v10
> -#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v2_v11
> -#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v2_v10
> -#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v2_v20
> -#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v2_v21
> +#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v1_v10
> +#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v1_v20
>   #define CPU_POWERPC_MPC8567          CPU_POWERPC_e500v2_v22
>   #define CPU_POWERPC_MPC8567E         CPU_POWERPC_e500v2_v22
>   #define CPU_POWERPC_MPC8568          CPU_POWERPC_e500v2_v22

