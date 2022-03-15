Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4DD4D9266
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:01:32 +0100 (CET)
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwV9-0005P3-8Z
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:01:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTwTT-0004iG-1L
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 21:59:47 -0400
Received: from [2607:f8b0:4864:20::102c] (port=34730
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTwTR-0007jv-Hc
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 21:59:46 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 d10-20020a17090a7bca00b001c5ed9a196bso804330pjl.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 18:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yxga6EOl3k0jUbCfRodAmovpZFKTf4nZPobzUy/PtbM=;
 b=Vq67of8pveMLc7GMiwl1yyeDB5MFE1p1L5WrHsWFPLhUcDMcL6uFKo3GcMZVClg1H+
 1rKx4cjSOueGyZHhLIFIgMKmtaG7eu/jR+jAiPkYsfgIAq4GK1CXW48GZIqEismqXirs
 POBBmaJ9V8wBR8o2FgtZS2KNES/ippqDAWcsFURxxOtLT5OFdToyyDBCYaw3bPwFDcPJ
 pWhmC3ZdTgVmjRW85A6DamUtFwNKGei7Irr+dSK/SG7ODrfbCrwI4Eou9oZExcDUENzl
 EGXxqV2hqDJdycEPtPmAA9CfuMT4SrDHeHz//puMSBFfu/Lcw289WMqlU+GfQvzZ18V0
 070g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yxga6EOl3k0jUbCfRodAmovpZFKTf4nZPobzUy/PtbM=;
 b=DzPsMkjixyUhQJnHrD+sia98pi43ZZ/PqPm+sJwCTa+lu6fM5Z9pCV71zvzPCYkgoG
 5azSkXrc3BP4ZwBPT/aG+nqq2LM4Dajb6TVwqT2i9xlCrHGekTTGdCJ30kK19pd01pdp
 Qmt3uH1fO8712SToDu8d1qONoJmu3t63JF/R9Qika7ftfG78Ao2xk9TTi2ufqkQ+AeXD
 nNe1lB907bgx5TH6jFQqCvi3w17v5KYWprvfgPUV5dDnV0HbF8Y4WUjqydn8auUUgHGS
 yOtaSyrFNi7+pFbBl71Kcb6e8iGPQiy887xb+2DcZJX09V+kqTRc8LYebhFBc+f3cbR2
 N6ZA==
X-Gm-Message-State: AOAM530hoFiAmqLHPghbyJfKA4jyeDC/s5wzkj1vZ4EosV7uo8tJwFB7
 fBorC52BEDuH7COk52PkPcaL0vJl1mI=
X-Google-Smtp-Source: ABdhPJy5ITn75sCKHeKgD8+lcTdorNhgjV7s2pau8pBYLa6m7968w1mLOV9mhY19/UynFfP/lJy91A==
X-Received: by 2002:a17:902:d888:b0:151:6fe8:6e68 with SMTP id
 b8-20020a170902d88800b001516fe86e68mr25741470plz.158.1647309584178; 
 Mon, 14 Mar 2022 18:59:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056a0016c200b004f7e3181a41sm4484945pfc.98.2022.03.14.18.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 18:59:43 -0700 (PDT)
Message-ID: <9f0a7f26-0166-bd85-10da-4d6b1932ef9a@gmail.com>
Date: Tue, 15 Mar 2022 02:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] accel/tcg: Fix cpu_ldq_be_mmu typo
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315002506.152030-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315002506.152030-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 01:25, Richard Henderson wrote:
> In the conversion to cpu_ld_*_mmu, the retaddr parameter
> was corrupted in the one case of cpu_ldq_be_mmu.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/902
> Fixes: f83bcecb1 ("accel/tcg: Add cpu_{ld,st}*_mmu interfaces")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This really should have affected all big-endian guests regardless
> of the host.  I have no idea how the referenced test case fails
> on s390x and ppc64le hosts, but passes on x86_64 host.
> 
> 
> r~
> 
> ---
>   accel/tcg/cputlb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 3b918fe..2035b2a 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2174,7 +2174,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
>   uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
>                           MemOpIdx oi, uintptr_t ra)
>   {
> -    return cpu_load_helper(env, addr, oi, MO_BEUQ, helper_be_ldq_mmu);
> +    return cpu_load_helper(env, addr, oi, ra, helper_be_ldq_mmu);
>   }
>   
>   uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

