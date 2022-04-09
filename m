Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105544FA976
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 18:17:09 +0200 (CEST)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDlr-0003oC-TU
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 12:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDjP-0001ml-Gg
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:14:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDjN-0008Dg-R4
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:14:35 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso14484576pju.1
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=BgkuGQYAGwboL6uEeInkJ8uZEQiTMLE5cpLTPIOBjrk=;
 b=Tzhn5KQlcShGgIjiyJs9I7XgMtDxgbBzLku3+pFBAqOXzosxbdbI4MHEuL396lNbGQ
 C2rMAr46E/tpvT5F4zVj2mT4SkZj+JwOmP91l5MdL+TxD66+ONy/cBt0Zv0XSpwgASTb
 iHQWQgmEDwaXw/pAPFJ+6N/5Jq50ZGr7xMEeTWKgd162uL7AN2y7WhbGcWETxuPlHwGA
 UXrHnnhDOpICctV3hUqwEkBiWvfJlf31nprvA5cfWm5wd2qlpW+Zb3JW5iGx89RJgZ+g
 Db3SI3WUA0ga6GX7uRyKcgcQpH3npSy7nB6Lq/zuYr0ucqN8gg6BAJmU/LspnfW/K02w
 XDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BgkuGQYAGwboL6uEeInkJ8uZEQiTMLE5cpLTPIOBjrk=;
 b=YLzS78bppmuB9a3QmRvIweDtYkTGGzZ+vuei0m0JVXt9IjRqL6ISn6sq3oCuM7bsqr
 j8aY5uYAaeURne60KNcRkD2pkSP7rtkm1vJlKbTsEkB0/uRs3bDcuvtVYptYQFrEo+Lt
 1WVeC1CHDmkyCaf3KoR0zB/skiFCrQO8JVMGEJuBoDX/mB3MJjG/11Codw7v6Tb0cTTp
 mPVEy+ehVgoPpj2v/5zfc2I9SMeifMWw5xWEQAJDwVoTyoI06INt2QVasWqk23kk9zoM
 sL+Ad5hJVPB/Za4XiG678tJWAqiYB7Y0WvEfo8P8+N2bhHq5o5OeveBob57hoslikPld
 8v3w==
X-Gm-Message-State: AOAM531thpHa4itpln371KuVfiBFOUDNI11pfX/Cs1dq+vWYG0sbrtem
 aD3vCswngvDDMK9Az1ZctrF0ew==
X-Google-Smtp-Source: ABdhPJzcikYTXj/VdTCqaJYnEW103hI2XtxQ4E9tzcIrwmxEVPXVanteZNkSEaqV8qcPpKXORC8IoA==
X-Received: by 2002:a17:902:db03:b0:155:cb6a:7c8e with SMTP id
 m3-20020a170902db0300b00155cb6a7c8emr25395381plx.125.1649520872386; 
 Sat, 09 Apr 2022 09:14:32 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a17090a091700b001cb57fd5abdsm3778564pjn.40.2022.04.09.09.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:14:31 -0700 (PDT)
Message-ID: <bf4dea8f-c644-224f-f073-18de611ccaa2@linaro.org>
Date: Sat, 9 Apr 2022 09:14:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 11/15] accel/tcg: add tb_invalidate_phys_page_range
 tracepoint
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/8/22 09:47, Alex Bennée wrote:
> This gives a little more insight into what is going on as we
> invalidate a range of TBs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/translate-all.c | 9 +++++++++
>   accel/tcg/trace-events    | 1 +
>   2 files changed, 10 insertions(+)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b0009177b9..625c46dd9b 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1671,6 +1671,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
>       TranslationBlock *tb;
>       tb_page_addr_t tb_start, tb_end;
>       int n;
> +    int checked = 0, removed = 0;
>   #ifdef TARGET_HAS_PRECISE_SMC
>       CPUState *cpu = current_cpu;
>       CPUArchState *env = NULL;
> @@ -1695,6 +1696,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
>          the code */
>       PAGE_FOR_EACH_TB(p, tb, n) {
>           assert_page_locked(p);
> +        checked++;
>           /* NOTE: this is subtle as a TB may span two physical pages */
>           if (n == 0) {
>               /* NOTE: tb_end may be after the end of the page, but
> @@ -1728,13 +1730,20 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
>               }
>   #endif /* TARGET_HAS_PRECISE_SMC */
>               tb_phys_invalidate__locked(tb);
> +            removed++;
>           }
>       }
> +
> +
>   #if !defined(CONFIG_USER_ONLY)

Spacing.

>       /* if no code remaining, no need to continue to use slow writes */
>       if (!p->first_tb) {
>           invalidate_page_bitmap(p);
>           tlb_unprotect_code(start);
> +        trace_tb_invalidate_phys_page_range(checked, removed, 0);
> +    } else {
> +        TranslationBlock *tb = (TranslationBlock *) p->first_tb;
> +        trace_tb_invalidate_phys_page_range(checked, removed, tb->pc);

Is this going to get us set without use warnings on CONFIG_USER_ONLY?


r~
r~

