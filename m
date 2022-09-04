Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE645AC42F
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 13:56:50 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUoF7-0004t2-EE
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 07:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUoCN-0002dZ-6g; Sun, 04 Sep 2022 07:53:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUoCL-0006pm-EJ; Sun, 04 Sep 2022 07:53:58 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso4244826wmb.2; 
 Sun, 04 Sep 2022 04:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=R+alh+x16l0S0zPd98FsN2y+wCrAexJuoaih2aS2tMY=;
 b=Yg4Rkgq9qokx3uH675MYQjcwD9298TIrMC5R3cvELkr87EBGqgDxAlo26HvPR1iO+M
 dzAylhRZmWimYodTt8jyRFEcDV0fyV0jvz6u05VtnFWfsTirud4iAdU61TH23j5zCBiN
 LKHQAo4FJU1+OeaDTgMk8lB8xy93C1lM2eRNry5DA2oA2w8rsTa+Refh94KOGRl1+0M2
 2o6/Kfdee8SnxTEICvVmYS77Mbf1MEpjB1K4yCNS3kgAv33uADF1/eZfVG7f5LHdwHGi
 ZLHnPkEK4buNKjXNMLgvngxv6p0m6xSbTgZ03PbYZr6xVSb6fun7FbsBAwhocWzr+Xj0
 nfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=R+alh+x16l0S0zPd98FsN2y+wCrAexJuoaih2aS2tMY=;
 b=M9ZgWaZ5L6P21r7f1SrKHyZG2YH0/idYkJnxvSqv0Dc30q/2yR8vN/niq/aghQLpS9
 Nt7pTV4s0H6FvPSDVeXlYJmIXqDhqs81sHfa357bTB1LGH9hEPwjCyJLYsiejn+A/8sJ
 nScAnOAJqij4R/t3U8qfgP7puZAVc3MpUcfFEc7QDvEaRm4teSnjQ92SBlHKQ5/v8kCD
 kIHqJB5pQGCR/nMv7zbdN9unZPLVe5cTwPYKZpaQG4KVxztSRHIWfbjK7qs68uTWEI+i
 MbKVGldd/Yz+5f1tRfclB24eCs5r/4cGEEeoTNmi4HFwfu+83j68lITvNQ4mxTHipV2u
 0EYQ==
X-Gm-Message-State: ACgBeo1ylqcZepudMhMi+FF5A2RguC7lN0tCDDgyliadFdxBV2wrkRMV
 QC3J7liMyh69jVNRsbAPhaE=
X-Google-Smtp-Source: AA6agR7ZgbiGTY412zKqY+AQ/d7gB+qJ79mzdJDPzXB1UK7NXDU8c/O0ZhZdoQAFWdZ8MuRQnK52Hg==
X-Received: by 2002:a05:600c:19ce:b0:3a5:ffb3:d546 with SMTP id
 u14-20020a05600c19ce00b003a5ffb3d546mr8202797wmq.6.1662292435133; 
 Sun, 04 Sep 2022 04:53:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d48c4000000b00225239d9265sm5923251wrs.74.2022.09.04.04.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 04:53:54 -0700 (PDT)
Message-ID: <13f53514-2e71-0832-2284-4fcd68385a26@amsat.org>
Date: Sun, 4 Sep 2022 13:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 10/20] ppc440_sdram: Implement enable bit in the DDR2
 SDRAM controller
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <b37dac18c136a1b3dfc40b443a55480dd1ad8e90.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <b37dac18c136a1b3dfc40b443a55480dd1ad8e90.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 19/8/22 18:55, BALATON Zoltan wrote:
> To allow removing the do_init hack we need to improve the DDR2 SDRAM
> controller model to handle the enable/disable bit that it ignored so
> far.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c | 34 ++++++++++++++++++++++++++++++++--
>   1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index c33f91e134..7c1513ff69 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -23,6 +23,7 @@
>   #include "sysemu/reset.h"
>   #include "ppc440.h"
>   #include "qom/object.h"
> +#include "trace.h"
>   
>   /*****************************************************************************/
>   /* L2 Cache as SRAM */
> @@ -484,6 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>   /* SDRAM controller */
>   typedef struct ppc440_sdram_t {
>       uint32_t addr;
> +    uint32_t mcopt2;
>       int nbanks;
>       Ppc4xxSdramBank bank[4];
>   } ppc440_sdram_t;
> @@ -581,12 +583,15 @@ static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
>   {
>       if (sdram->bank[i].bcr & 1) {
>           /* First unmap RAM if enabled */
> +        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
> +                                 sdram_size(sdram->bank[i].bcr));

You extracted sdram_bank_unmap() for "reuse", so better
add the trace event there.

>           sdram_bank_unmap(&sdram->bank[i]);
>       }
>       sdram->bank[i].bcr = bcr & 0xffe0ffc1;
>       sdram->bank[i].base = sdram_base(bcr);
>       sdram->bank[i].size = sdram_size(bcr);
>       if (enabled && (bcr & 1)) {
> +        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));

Ditto.

>           sdram_bank_map(&sdram->bank[i]);
>       }
>   }

