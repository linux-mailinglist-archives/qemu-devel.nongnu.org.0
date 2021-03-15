Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BB633B4C6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:42:11 +0100 (CET)
Received: from localhost ([::1]:50896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnU2-0006ej-7K
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnSC-0005tw-Sy
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:40:16 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnSA-0003GW-0d
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:40:16 -0400
Received: by mail-qt1-x829.google.com with SMTP id a11so9052316qto.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4h4EFO06FiC1mtXG10uEDfCM3jtibNnMRBOAs57YGQs=;
 b=zAOWlUpC/rZvFW8LguDs4eBKFgbdTz2+GKDOfBFNEbhqNLdTjO+wJBNHgFF3gpgYZG
 b4RE1FSs51II2har4iLpb6SkoPAYzXD8+P2pxG0ZbYqam5HzbGxr/hCSdPQFdqSZy0zt
 jZEq/zK0W+StnJUZiema3CzWubxFXjTUphi+rwQ1qlcQY2n+hhZr1SNpQSr3LKs/77ta
 KUz7r+aG9u7hvP0Kk6+cnkKrnC3Rr07x1ax922kxKkiG22DguTleqMNcslRHVzkZtgbz
 tTis9yFYgrCZdIUg+/RoWdOpbgw7lEQ1qnQm1Qtams7seiSiRh0cf6kWGE4T/QBjL3QW
 xBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4h4EFO06FiC1mtXG10uEDfCM3jtibNnMRBOAs57YGQs=;
 b=UHLC7STrYwBYmEd0ChBiunhBEZVdExIx5xkS07tNXcIgNWkxDkWvM/vzcj/cxjpGHD
 g7AdUXOvm03qP374Ee+8JmU5InZU6SHAjqMfbD68BMhIaT51hQUQ4Hpc7LWmwCu4gBht
 1sotb0kUyBtqQy2E7SCyd0xybWSXfqpTpRuOvAYKqWrd8gn/yl2SAE+sITCCa0QfP0ed
 qqHutve0SNl1JUJPR1lKk8kdmmpnDKGSoqjyWnt9De0fVGSBI2rS8dhjhy3FjNHF3WFm
 gXzKaQxCE45U96Ddm9vvsqJussdBfJ81yXrQwTHnfK9nzj/sP4Lildw6xBKw9TG4jQvl
 MAsg==
X-Gm-Message-State: AOAM531r+0j4QyN9gj+jLFpjL5gUKzpHr+SAHxgwKY/ay6iWJDg+NFWN
 w5HV7ZvVSPWQPCaPgL9aJTf49Q==
X-Google-Smtp-Source: ABdhPJyJRvH5VQ/ImekKKtDqGpW/qubjCsUOtrKAIe3z1ScqYY3Uz0Z7jlnbjAiHRSz5rR3oNpmclw==
X-Received: by 2002:ac8:5747:: with SMTP id 7mr23259437qtx.274.1615815612942; 
 Mon, 15 Mar 2021 06:40:12 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 1sm3634153qtw.3.2021.03.15.06.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 06:40:12 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) TCG generation cleanup
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784088-26384-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f607fe6e-ed0e-e3a8-4b5e-378328f57557@linaro.org>
Date: Mon, 15 Mar 2021 07:40:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615784088-26384-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:54 PM, Taylor Simpson wrote:
> Simplify TCG generation of hex_reg_written
> 
> Address feedback from Richard Henderson <<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 7481f4c..0ad63fe 100644
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
> +     * (i.e., slot was cancelled), so we negate the value before
> +     * or'ing with hex_reg_written[rnum].
> +     */
> +    tcg_gen_xori_tl(slot_mask, slot_mask, 1 << slot);
> +    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);

reg_written appears to be a boolean, not a mask of any kind.
I think you want

     tcg_gen_setcond_i32(TCG_COND_EQ, slot_mask, slot_mask, zero);

and not the xor.


r~

