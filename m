Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AE8440DD0
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:22:19 +0100 (CET)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh7yk-00089P-M0
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7wq-000784-1F; Sun, 31 Oct 2021 06:20:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7wm-0002J0-QE; Sun, 31 Oct 2021 06:20:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id d3so23777127wrh.8;
 Sun, 31 Oct 2021 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AhU1dxfLfoMO9uWPnYI5Ff1E1SpuMIZ/1lV+Q7pjkqs=;
 b=Pg2vLjbtAQekasWAyI9xejx/aue/V+DvrE71Glc64WDfodaaONIRQrtouX33CETITV
 KQBcqLQIHCQDdzGMmxQh8y0c4PHbElNH08OLS4hpebjJ9xOPp9vsaCKeXqh/ulkn+QTt
 8SSDBKOfLfSPDLoay7BVNID0nLvZQQC4ApDSyVzT+3QnWE0XygtHiawSJHyvalYXI3lA
 2inPLK4vJUsyPGNowGyaUg9+83J1h57kic5sDsViibgTMnGuGPYrNX7plpiz7ZyTk3Cs
 6dYsZdsWCLiuvwAt/6Opxxu2eK9iG+smBv/v7XXKMnTiJYejZ/7dvpgpZeDt72awXmf+
 96qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AhU1dxfLfoMO9uWPnYI5Ff1E1SpuMIZ/1lV+Q7pjkqs=;
 b=K7qCgWOB9cMc3+CRp+Y0WlYRhn5bBeJDxhGro4XR2Qa/D3ArMfMc0sni0C4Bu1ZlrL
 S0iao0gjOgfL8ut/bts2z2V8CtdM/yNPpjwNAZdRr8k+5TqZm+kKcg2e+jrYNCFlh0Ns
 /5tsC3YJYTZKFggLA/C0QuVBFta7PpnP8jDS3cEo0VhZ82GganDphb2sPHi2148haMlq
 xefa+fRjP4BxkUiu6DCL5rM6XVaA21sIwrrBVID/JrJr887O62sYBRZgTFJhQiTFaMqJ
 qckA9vCW35HzWJhzNCJaM8ncclasPiQw7DOSyxwRksg80rFiUi/fjbqc0rdc6GWDD1E6
 i/Zw==
X-Gm-Message-State: AOAM532lwtj0nnY2mpbPo32r7Z4Bo+p4woLmEw8nqIiJPoeUJsVHLHr8
 xA1TlKrdrfp/p/wV4/W+R1w=
X-Google-Smtp-Source: ABdhPJwnfJkl3vLQfPsfDdbsndUjUCVY1Kqh+fPL51YWAdlCccBXqyS45egxkNJ1yEzr1H55xI3r6A==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr10348227wri.381.1635675614788; 
 Sun, 31 Oct 2021 03:20:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u10sm13453712wrs.5.2021.10.31.03.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:20:14 -0700 (PDT)
Message-ID: <d1f69333-44cb-e888-4e71-db089c360d3e@amsat.org>
Date: Sun, 31 Oct 2021 11:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 36/66] target/s390x: Use probe_access_flags in
 s390_probe_access
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-37-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 19:16, Richard Henderson wrote:
> Not sure why the user-only code wasn't rewritten to use
> probe_access_flags at the same time that the sysemu code
> was converted.  For the purpose of user-only, this is an
> exact replacement.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 17e3f83641..362a30d99e 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -141,20 +141,12 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>                               MMUAccessType access_type, int mmu_idx,
>                               bool nonfault, void **phost, uintptr_t ra)
>  {
> +#if defined(CONFIG_USER_ONLY)
> +    return probe_access_flags(env, addr, access_type, mmu_idx,
> +                              nonfault, phost, ra);
> +#else
>      int flags;
>  
> -#if defined(CONFIG_USER_ONLY)
> -    flags = page_get_flags(addr);
> -    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
> -        env->__excp_addr = addr;
> -        flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
> -        if (nonfault) {
> -            return flags;
> -        }
> -        tcg_s390_program_interrupt(env, flags, ra);
> -    }
> -    *phost = g2h(env_cpu(env), addr);
> -#else
>      /*
>       * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
>       * to detect if there was an exception during tlb_fill().
> @@ -173,8 +165,8 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>                               (access_type == MMU_DATA_STORE
>                                ? BP_MEM_WRITE : BP_MEM_READ), ra);
>      }
> -#endif
>      return 0;
> +#endif
>  }
>  
>  static int access_prepare_nf(S390Access *access, CPUS390XState *env,
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

