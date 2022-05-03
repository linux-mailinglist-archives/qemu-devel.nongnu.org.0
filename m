Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2651880C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:13:17 +0200 (CEST)
Received: from localhost ([::1]:43204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluDD-0002ta-S7
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluBP-0001qg-DL
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:11:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluBM-0000xx-SM
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:11:22 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n8so15214658plh.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=SSSfRTLeCSmVEqzVBqEHMVDIpIUfwujo+robT34xkMI=;
 b=U+sepfkg+qXEp9Sb1bpH+xIpLlkr8BzyAsegHbkffhproGHo6YzfYeXszPEXBkk6Zb
 mwq43SDQmNIcKBeUNv772uK94jwyp1puSyQW+U14Zy54FQ1hJKQ068PhIsMmRi9qCo+h
 v3EjTmMD1L5xHEYQQUC8w9lnOj/Y6FTdC42HPm+FGtgdoD4Ff1a4Stb9qb+g5i0SjRSM
 hAUgmBMEqXmMkyutAIVpdlYDuSL4gs264ekX/TJIYxCIvgFDZT030E+xuKpXwfdN4qjG
 PEr3ES1fc3/Lhm+0lWwrhe82K4oLDHh0xUX9azYJfp6fMHQR2R9rm1YDxH3529VXL3CN
 2fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SSSfRTLeCSmVEqzVBqEHMVDIpIUfwujo+robT34xkMI=;
 b=2CPltMBYzn8Rz39/QWWBFWKtntR0LnPTCaXnZ6mAGUkxblsCCNmOZHdEKGOPH12L9t
 eDvw4mBw8vVc7nPKLPJVH2wojqYFQDwHcyrrO4w2jBNFw4HbyJ2d6SncXJfak8yJhvKm
 ZUQ+roozuHmPJ6johaSJORr5aaDTI6LZq42W1Fyu1ZnblRVOpF150WAS+a77SLcN4yuv
 7lYWaYHV96M9TplqzajTOAi284mN4ZP801CNPy35KGjF1i89sF9KKykhk6SAmQVnlX/z
 l6cglb3zJnOCvvnAnENdZ+c/0bAHTtiXMhGBz8F9CGEtsKWpxOKumZJeeJFYhBOH444Q
 Gd0Q==
X-Gm-Message-State: AOAM531X+oXIpMKvLih4ier5GIC4EiFZKBCTRX9XKuzhOMvp+tXhdIFQ
 v+mOzyy1nfvq3x8csLlZZ2PW0Q==
X-Google-Smtp-Source: ABdhPJwLTD4AlMEvEFRikUOTx+QnDYBKawJSybJsj6xUqL+pWlm98RH0RMKjMzb0XTa2PqdHFP6hgg==
X-Received: by 2002:a17:903:32d0:b0:15e:8cbc:fd39 with SMTP id
 i16-20020a17090332d000b0015e8cbcfd39mr17123859plr.95.1651590679445; 
 Tue, 03 May 2022 08:11:19 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k129-20020a632487000000b003c14af5060dsm12879529pgk.37.2022.05.03.08.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:11:18 -0700 (PDT)
Message-ID: <e263efa0-58ea-25f2-7132-849fdbdfc2b4@linaro.org>
Date: Tue, 3 May 2022 08:11:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] target/mips: Fix SAT_S trans helper
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503130708.272850-1-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 5/3/22 06:07, nihui wrote:
> From: Ni Hui <shuizhuyuanluo@126.com>
> 
> Fix the SAT_S and SAT_U trans helper confusion.
> 
> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index 7576b3ed86..76307102f2 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -399,7 +399,7 @@ TRANS(BSETI,    trans_msa_bit, gen_helper_msa_bseti_df);
>   TRANS(BNEGI,    trans_msa_bit, gen_helper_msa_bnegi_df);
>   TRANS(BINSLI,   trans_msa_bit, gen_helper_msa_binsli_df);
>   TRANS(BINSRI,   trans_msa_bit, gen_helper_msa_binsri_df);
> -TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_u_df);
> +TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_s_df);
>   TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
>   TRANS(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
>   TRANS(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);

Cc: phil
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

