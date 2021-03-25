Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2334927D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:57:45 +0100 (CET)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPYW-0005By-FJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPXK-0004lR-5S
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:56:30 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPXH-0005iv-Jo
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:56:28 -0400
Received: by mail-oi1-x236.google.com with SMTP id x2so2018097oiv.2
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8mWZb2gmmCwEqZYJF3kYoHBQrJm+iQ7/6ip+MtGzXYk=;
 b=lNDDiIi5yPpq9dWcwqU/NCahCSi1tJtWWchUdp+Z6o0I8ypcIQp9JtiYzeC1IHDfqn
 /MeOwhp9vGCZa3tY9wGHP03ralWygqijjVWI10PWePdwBI8/Q7w4R7ObNiHCgowoNDkd
 eJ1NIbcwMupOhyHh300Qkm7ap4AzqmQvcaYJrLq2rkbGvS4fcSj1ilLhTkz3iSzPz2D6
 MCfKxQQbkCBPFhPm16DxCZvGCA9jQ2ArD3P2El9n2oryMOQRXIVvEnwI5PRHqvA3T2a8
 WB7LGlClPFvXzLbAfMzxlJDcDC01Jkm5NltxFSQr/J/+Q04xulQqwA+qjBCOeXnQ3fNL
 PCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8mWZb2gmmCwEqZYJF3kYoHBQrJm+iQ7/6ip+MtGzXYk=;
 b=syu03SdMTBMbPlRjBWbvZZ5FZgJJxyKLf2EQPFFc5N/3qIFgJmxGdWXZ6jScCSYXKw
 E95G+kJlLvAKPhJjTMJGwYncWP3nf84OO3KklDpEum6qzxEFLIYr/BICXQ3f72TpVtQ8
 zrnFaUwBPISSm9A3vZnN4sFlkZWnHOU7C5gq1jx1Y/2mtaQMVv3EqurYL/ZFaw97sg9Q
 nxoV6MVFClQ15L5HQ+k4Mv8sQKXD58xg5zR1P+NXZMUH3ZTMskvADXJEry96uJP413eE
 WW44KrguPuE51WfihCiryTF8QwOSzcX0v09YN1iU3hSB9+O6fKo6Sj1mGeIdn4LkIYea
 5Udg==
X-Gm-Message-State: AOAM530ZNrr9tzEka4RKdE+VWi0GB7Zks0IOSTutzJ4ajJtoGts5Ny2Z
 CC2U60cKoPGuibtPbxb1wtt2eA==
X-Google-Smtp-Source: ABdhPJxTjvRVdwUieE4wv6drGHSqB2RADQ3O73pkNeS2/qnBEl6RJfq9WnKw9nn/Rf87qKlaksY4tA==
X-Received: by 2002:aca:d941:: with SMTP id q62mr6178013oig.119.1616676986315; 
 Thu, 25 Mar 2021 05:56:26 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id l190sm1052240oig.39.2021.03.25.05.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:56:25 -0700 (PDT)
Subject: Re: [PATCH 01/15] Hexagon (target/hexagon) TCG generation cleanup
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b3e689cd-2a0b-f1d9-0e8c-838ae014b6a7@linaro.org>
Date: Thu, 25 Mar 2021 06:56:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:49 PM, Taylor Simpson wrote:
> Simplify TCG generation of hex_reg_written
> 
> Address feedback from Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 7481f4c..349b949 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -43,9 +43,15 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
>       tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
>                              val, hex_new_value[rnum]);
>   #if HEX_DEBUG
> -    /* Do this so HELPER(debug_commit_end) will know */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum], slot_mask, zero,
> -                       one, hex_reg_written[rnum]);
> +    /*
> +     * Do this so HELPER(debug_commit_end) will know
> +     *
> +     * Note that slot_mask indicates the value is not written
> +     * (i.e., slot was cancelled), so we create a true/false value before
> +     * or'ing with hex_reg_written[rnum].
> +     */
> +    tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
> +    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
>   #endif
>   
>       tcg_temp_free(one);

The one variable is no longer used.

r~

