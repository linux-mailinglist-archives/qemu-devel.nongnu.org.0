Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07117352EB3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:48:48 +0200 (CEST)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNuZ-0007QM-3p
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNsl-0006H0-CI
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:47:00 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNsj-0005sJ-28
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:46:55 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i6so3992961pgs.1
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2CIlzG8wgEea7tpPk6XinGt7JxCScIzHno8gXg/5Czk=;
 b=WmcHBgubMgAdOJGMi5oLLqmTcOVXF11ciqhdkfJGtuPZpF6El84sXawej3UqZrzLbE
 tD1TwsD0Tr4NO/9rGRlZGITbOTZTdRiC8FE7OmswEBYHWfHZ7KxkGT8FmleCQQc9GJxR
 Z1bZc7vJjndgrYSvQPia+fu9m6V7jbgj5I3gu4HiWSXlakzULa1Yz9OdgdQjEi5916SH
 T+/5P4Lc67YGeqdQ6HOPoSTLd+3B06+PumZ0V7ewOBlSgPKT1cqnAFZb1EAlNMd09etE
 K9lJf/aj4Osx2gZvFkrXYIuTLiJThcNSmdRp9TALzRVU+nHin209kmg/NZKGTHSuK/cg
 IiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2CIlzG8wgEea7tpPk6XinGt7JxCScIzHno8gXg/5Czk=;
 b=MxSrvHONpNpgxYs3f1n5Ko6YbgiV9fYDuOcPVM8TxK1DhWArxm7u911MiNum/2kzWb
 1oS/fxNDuTKxzIaX4rbpCYFJzA0INHJwJw6E5TZxk5XWisROo7fhl7wcBgp3azRMH2FD
 uvBFzwAKyPit0YWCNRzD4rcgg2xP9KX5B4JY7srh36j8nXOLcjyGxOU8l66XvSdhTaov
 o0oCf9yjaOyKZ//xUQv/IDkTBIs3Xa28vgGL8hiOOvOjp2zP2APdvgdjh9PRA9nPk+Bq
 +p1ejE4K4w+NFI5APK3FP8KTo3kluK97IbKIKU7raRLarU8XdrmTS/lPqpNW7Rql+dl+
 UTqw==
X-Gm-Message-State: AOAM531EPbtVuxZB7lYkVx27IlYy55aW9LyXc1U6X2ikNlbBz0vsL3wB
 ByKuLcoFF9Mqd3+Ha6CYtb3Udw==
X-Google-Smtp-Source: ABdhPJy+d3ptrjWwMFqdTHybGEiixOYxWmdqInMJRBsbzVXg+O2ZDFeAkgxrjjcEqK9swcWP8kT6CQ==
X-Received: by 2002:aa7:87cb:0:b029:215:3a85:95fb with SMTP id
 i11-20020aa787cb0000b02902153a8595fbmr13222517pfo.38.1617385611525; 
 Fri, 02 Apr 2021 10:46:51 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id j22sm8281743pjz.3.2021.04.02.10.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:46:50 -0700 (PDT)
Subject: Re: [PATCH v2 01/21] Hexagon (target/hexagon) TCG generation cleanup
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0cbf66d0-e306-972a-ca39-aadae2e9dc27@linaro.org>
Date: Fri, 2 Apr 2021 10:46:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> Simplify TCG generation of hex_reg_written
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 7481f4c..87f5d92 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -35,7 +35,6 @@ static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
>   
>   static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
>   {
> -    TCGv one = tcg_const_tl(1);
>       TCGv zero = tcg_const_tl(0);
>       TCGv slot_mask = tcg_temp_new();
>   
> @@ -43,12 +42,17 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
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

Having looked forward at patch 5, it appears this could be further improved by 
examining ctx->regs_written.


r~

