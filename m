Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D934B546760
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:29:57 +0200 (CEST)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzei4-0000Ti-7q
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzegP-0008Be-RX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:28:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzegN-0007s5-W3
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:28:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q18so22756423pln.12
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gTckBfJvM9DjaPYcWoyNasfcxd4zt0TMTwlkAsXpHY8=;
 b=oECGyg7fMAqW2ZX/OLbSqAXxTVevdw1JM228b4Ta5TQA4R6StjmxiFKI3entBmOP0h
 2WoWIhJrNBSZUY8tmIOsN72z4JtFLId6s1fi6GtjCO5xRiNwctL+eU9V05+dDnuXAjc5
 zxc3YLT1Z3l0y0omSiY2Wb1EBxfJfi4hM2ho4L0KwrSq4nbTT0hTrk4MxNXP7D1UhQei
 0n7vAOjTFgBwx/xB8ZaVWpX47/BUyltZww//tccmlYBjhrAnzJ0Cmd54uv/WSYpHgGA2
 UoTjZHRXJxC2MW7wQKf0aAcY4oRt40noPIBW0+o8yghh5zq42Ma5KCCM4z0K89ZMe9B0
 Rdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gTckBfJvM9DjaPYcWoyNasfcxd4zt0TMTwlkAsXpHY8=;
 b=cZOTpMNBwe/AMk5i60LfxGFk/V9lSojmGga6J8r496dRQgfZV7BBYzi1M9H9tYmJCN
 qMvJQxa4CRkgQPZxyPWnWb3h0x2o8xBP4oWCjhEfSLGWTpyV8N9e2gjIqLP2FHb72/8K
 EUOJYmBbTdaohr2rI2qUvLa94cc511CzTCEXMjrR6yiNvsMkidyIWv0AS6ATB94Oh+aa
 ecNqN1mNDFT8uulH5ykL5xQIPgUBCcGgYDL+/W7kNRqWAMRvrRr6wNw7W2bO6wkj8hRx
 Tgs3xmRxJ8fLkfrGGnVjaKkLFrwE7QfQF7cT+nV8QX1g3VXcGSulp+zFxqYyTJoX3oy7
 rPMQ==
X-Gm-Message-State: AOAM533R3vn6epI/tGBtOokUDQHvfNTze83VHiiOZcxYSlheDhDO6jqt
 nTmmYXpHyjtPaOFVJDUsX1Y=
X-Google-Smtp-Source: ABdhPJwvr8YtGmFFlNASL4wTBTeMmVQL/IPCtCPHhzdPFYUfDKcSeJ7QjQhF9aDZabfoagmpuZGqtQ==
X-Received: by 2002:a17:903:234a:b0:167:997f:bc53 with SMTP id
 c10-20020a170903234a00b00167997fbc53mr17773011plh.47.1654867690460; 
 Fri, 10 Jun 2022 06:28:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a62e513000000b0050dc762814fsm19528749pff.41.2022.06.10.06.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 06:28:10 -0700 (PDT)
Message-ID: <d3461ca2-9e7a-164b-4760-0540b19fb5e0@amsat.org>
Date: Fri, 10 Jun 2022 15:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] target/mips: introduce Cavium Octeon CPU model
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com, Aaron Williams <awilliams@marvell.com>,
 Stefan Roese <sr@denx.de>
References: <165476301211.40568.5713018312386387782.stgit@pasha-ThinkPad-X280>
 <165476301751.40568.12438882180412050686.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165476301751.40568.12438882180412050686.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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

Hi Pavel,

On 9/6/22 10:23, Pavel Dovgalyuk wrote:
> This patch adds Cavium Octeon vCPU for providing
> Octeon-specific instructions.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> 
> --
> v2 changes:
>   - vCPU name changed to Octeon68XX (suggested by Richard Henderson)
> ---
>   target/mips/cpu-defs.c.inc |   28 ++++++++++++++++++++++++++++
>   target/mips/mips-defs.h    |    1 +
>   2 files changed, 29 insertions(+)
> 
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index 582f940070..7f53c94ec8 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -921,6 +921,34 @@ const mips_def_t mips_defs[] =
>           .insn_flags = CPU_MIPS64R2 | ASE_DSP | ASE_DSP_R2,
>           .mmu_type = MMU_TYPE_R4000,
>       },
> +    {
> +        /*
> +         * Octeon 68xx with MIPS64 Cavium Octeon features.
> +         */
> +        .name = "Octeon68XX",
> +        .CP0_PRid = 0x000D9100,
> +        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
> +                       (MMU_TYPE_R4000 << CP0C0_MT),
> +        .CP0_Config1 = MIPS_CONFIG1 | (0x3F << CP0C1_MMU) |
> +                       (1 << CP0C1_IS) | (4 << CP0C1_IL) | (1 << CP0C1_IA) |
> +                       (1 << CP0C1_DS) | (4 << CP0C1_DL) | (1 << CP0C1_DA) |
> +                       (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << CP0C1_EP),
> +        .CP0_Config2 = MIPS_CONFIG2,
> +        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA) | (1 << CP0C3_DSPP) ,
> +        .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M) |
> +                       (0x3c << CP0C4_KScrExist) | (1U << CP0C4_MMUExtDef) |
> +                       (3U << CP0C4_MMUSizeExt),
> +        .CP0_LLAddr_rw_bitmask = 0,
> +        .CP0_LLAddr_shift = 4,
> +        .CP0_PageGrain = (1 << CP0PG_ELPA),
> +        .SYNCI_Step = 32,
> +        .CCRes = 2,
> +        .CP0_Status_rw_bitmask = 0x12F8FFFF,
> +        .SEGBITS = 42,
> +        .PABITS = 49,
> +        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON | ASE_DSP,
> +        .mmu_type = MMU_TYPE_R4000,
> +    },
>   
>   #endif
>   };

^ This part should be the last patch of this series.

> diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
> index 0a12d982a7..a6cebe0265 100644
> --- a/target/mips/mips-defs.h
> +++ b/target/mips/mips-defs.h
> @@ -42,6 +42,7 @@
>   #define INSN_LOONGSON2E   0x0000040000000000ULL
>   #define INSN_LOONGSON2F   0x0000080000000000ULL
>   #define INSN_LOONGSON3A   0x0000100000000000ULL
> +#define INSN_OCTEON       0x0000200000000000ULL
>   /*
>    *   bits 52-63: vendor-specific ASEs
>    */
> 

This hunk ^ belongs to the next patch, but I'd rather split patch #2,
first part being similar to commit 9d00539239 ("target/mips:
Introduce decodetree structure for NEC Vr54xx extension").

The series would look like:

target/mips: introduce decodetree structure for Cavium Octeon extension
target/mips: implement Octeon-specific BBIT instructions
target/mips: implement Octeon-specific arithmetic instructions
target/mips: add Cavium Octeon68XX CPU model

Regards,

Phil.

