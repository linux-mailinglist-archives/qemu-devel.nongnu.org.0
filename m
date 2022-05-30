Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B753849D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:19:08 +0200 (CEST)
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhAi-0001OF-1a
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvh2p-0007oZ-Eu; Mon, 30 May 2022 11:11:04 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvh2l-0006Zx-Vx; Mon, 30 May 2022 11:10:58 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i18so10792642pfk.7;
 Mon, 30 May 2022 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wCZVEtHHcf54bfYPLovv548Nuh8agfnEWrBdVvw8/Os=;
 b=GL/f3w+5vd5cjYg6dyNiF/a1rzk9QP+AmDxOAkxFPm7ogxpakbNqvWANqQlkY1U4Yq
 aDQyPplCC+YP7zIhlqxwgq6gaYNk27prHZZi8yJRvO26VHYYBrrf4vATsYLjJAhc9cYK
 DL1v62mEzyTa4j8Q/+Pofq+RSxko35CLvAM2P2K7Qzw3u1dF9ElN+0EEFEhGyQDhOGYP
 uvmZh8OSGWSawI7VMwsL92zVc6t36/Yfe1eup5EbRPUHuRw5cn6Xdrc1LPFbm9w91sHd
 UnSy1aIqDEIt0tMlxkAr7CZ+lnMssdEXbZEpTL0EBDYIaZbW3NQM0I6Ho7BMYNB1guly
 1UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wCZVEtHHcf54bfYPLovv548Nuh8agfnEWrBdVvw8/Os=;
 b=ts9QRqgmHFgPr2som7BvhjiQ7tiPeLA3N1fYTSHMGpEdbL9VlIqMIXfBNQh+ljIya3
 HWBODdk+6U1VF3WuV6nu4dQr07mE089BDDwFDn1MnXe87RNtw8YVpYiAA01/f7tEyxYH
 sQEB3zGOOBUHCTsFPKeicCpZ7UJ0q1fBJSFrLw9lfPCjwI560Sr2z/6Z31fpq8a191jD
 62nzsEnixvHB/DLGI40DlADtbzk12EngrL3zhaK3bn/LWUIWciRJtXns5GBvdFpc1ZjM
 iJVB4DIEfhMm4MjxOCV0ju7EQ2awuFmN8SjIPDRNxTDwmWokALd3+64LTHGIgMBvLZ6I
 HEPw==
X-Gm-Message-State: AOAM5313iazJFjE6/mZM391Xmc3fg+QpqoB3UYWcmzZuEtvmRToZYt/4
 wz6ALILMsNvFVNjC6n8Mitw=
X-Google-Smtp-Source: ABdhPJywVXh51lAVKM7eRBn1DSPWixCXcG+Bl9oDTp5UZ9XNg/uyt/VLXBap0Sfrn3N8JBGI1jAWDw==
X-Received: by 2002:a63:2cd:0:b0:3fc:4a27:a985 with SMTP id
 196-20020a6302cd000000b003fc4a27a985mr60650pgc.64.1653923453562; 
 Mon, 30 May 2022 08:10:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a170902b78c00b00163daef3dc2sm2754875pls.84.2022.05.30.08.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 08:10:52 -0700 (PDT)
Message-ID: <e22c20ff-d6dd-66e6-4143-d60f81609261@amsat.org>
Date: Mon, 30 May 2022 17:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] tcg: Special case split barriers before/after load
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: redha.gouicem@gmail.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20220430234534.446733-1-richard.henderson@linaro.org>
In-Reply-To: <20220430234534.446733-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
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

Hi Richard,

On 1/5/22 01:45, Richard Henderson wrote:
> When st:ld is not required by the guest but ld:st is, we can
> put ld:ld+ld:st barriers after loads, and then st:st barriers
> before stores to enforce all required barriers.
> 
> The st:st barrier is often special cased by hosts, and that
> is expected to be more efficient than a full barrier.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Redha, I expect this to produce exactly the same barriers as you
> did with your 'fix guest memory ordering enforcement' patch.
> 
> While this compiles, it does not fix the failures that I see
> occasionally with our private gitlab runner.  The standalone
> version of this failure is
> 
>    export QTEST_QEMU_BINARY=./qemu-system-i386
>    for i in `seq 1 100`; do
>      ./tests/qtest/ahci-test > /dev/null &
>    done
>    wait
> 
> About 10 to 15% of the runs will fail with
> 
> ERROR:../src/tests/qtest/ahci-test.c:92:verify_state: assertion failed (ahci_fingerprint == ahci->fingerprint): (0xe0000000 == 0x29228086)
> 
> Note that this test never seems to fail unless the system is under
> load, thus starting 100 tests on my 80 core neoverse-n1 system.
> 
> 
> r~
> 
> 
> ---
>   tcg/tcg-op.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 5d48537927..4c568a2592 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -2834,9 +2834,6 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
>   
>   static void tcg_gen_req_mo(TCGBar type)
>   {
> -#ifdef TCG_GUEST_DEFAULT_MO
> -    type &= TCG_GUEST_DEFAULT_MO;
> -#endif
>       type &= ~TCG_TARGET_DEFAULT_MO;
>       if (type) {
>           tcg_gen_mb(type | TCG_BAR_SC);
> @@ -2868,12 +2865,49 @@ static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
>   #endif
>   }
>   
> +typedef enum {
> +    BAR_LD_BEFORE,
> +    BAR_LD_AFTER,
> +    BAR_ST_BEFORE,
> +} ChooseBarrier;
> +
> +static TCGBar choose_barrier(ChooseBarrier which)
> +{
> +#ifdef TCG_GUEST_DEFAULT_MO
> +    const TCGBar guest_mo = TCG_GUEST_DEFAULT_MO;
> +#else
> +    const TCGBar guest_mo = TCG_MO_ALL;
> +#endif
> +    TCGBar ret[3];
> +
> +    if (guest_mo == 0) {
> +        return 0;
> +    }

This part ...:

> +    /*
> +     * Special case for i386 and s390x.  Because store-load is not
> +     * required by the guest, we can split the barriers such that we
> +     * wind up with a store-store barrier, which is expected to be
> +     * quicker on some hosts.
> +     */
> +    if (guest_mo == (TCG_MO_ALL & ~TCG_MO_ST_LD)) {
> +        ret[BAR_LD_BEFORE] = 0;
> +        ret[BAR_LD_AFTER]  = TCG_MO_LD_LD | TCG_MO_LD_ST;
> +        ret[BAR_ST_BEFORE] = TCG_MO_ST_ST;
> +    } else {

... could deserve another patch.

> +        ret[BAR_LD_BEFORE] = (TCG_MO_LD_LD | TCG_MO_ST_LD) & guest_mo;
> +        ret[BAR_ST_BEFORE] = (TCG_MO_LD_ST | TCG_MO_ST_ST) & guest_mo;
> +        ret[BAR_LD_AFTER]  = 0;
> +    }
> +    return ret[which];
> +}
> +
>   void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
>   {
>       MemOp orig_memop;
>       MemOpIdx oi;
>   
> -    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
> +    tcg_gen_req_mo(choose_barrier(BAR_LD_BEFORE));
> +
>       memop = tcg_canonicalize_memop(memop, 0, 0);
>       oi = make_memop_idx(memop, idx);
>   
> @@ -2904,6 +2938,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
>               g_assert_not_reached();
>           }
>       }
> +
> +    tcg_gen_req_mo(choose_barrier(BAR_LD_AFTER));
>   }
>   
>   void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
> @@ -2911,7 +2947,8 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
>       TCGv_i32 swap = NULL;
>       MemOpIdx oi;
>   
> -    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
> +    tcg_gen_req_mo(choose_barrier(BAR_ST_BEFORE));
> +
>       memop = tcg_canonicalize_memop(memop, 0, 1);
>       oi = make_memop_idx(memop, idx);
>   
> @@ -2959,7 +2996,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
>           return;
>       }
>   
> -    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
> +    tcg_gen_req_mo(choose_barrier(BAR_LD_BEFORE));
> +
>       memop = tcg_canonicalize_memop(memop, 1, 0);
>       oi = make_memop_idx(memop, idx);
>   
> @@ -2994,6 +3032,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
>               g_assert_not_reached();
>           }
>       }
> +
> +    tcg_gen_req_mo(choose_barrier(BAR_LD_AFTER));
>   }
>   
>   void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
> @@ -3006,7 +3046,8 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
>           return;
>       }
>   
> -    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
> +    tcg_gen_req_mo(choose_barrier(BAR_ST_BEFORE));
> +
>       memop = tcg_canonicalize_memop(memop, 1, 1);
>       oi = make_memop_idx(memop, idx);
>   

Redha, could you test this patch?

Regards,

Phil.

