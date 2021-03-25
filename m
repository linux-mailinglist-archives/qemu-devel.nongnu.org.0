Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB73496F7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:40:38 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPT2D-0002LN-1o
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSzw-00014m-TE
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:38:21 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSzv-0006pH-3E
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:38:16 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 p2-20020a4aa8420000b02901bc7a7148c4so622182oom.11
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VIgqMST8OYIlavixxxA2aWcjhvsl8euc3JvpcYZAogw=;
 b=FWJlJ+OUfemKUedPUvTEyVVnwayUTe7B5/unQKPJ9+ecAEq0z5tJaln2UjHiBdceiG
 ePCSD/1uNEVqS8qYmj5RBp50nyOuKfjcmBkjoAVe14JPOxU3m7SNYL53/ppvr8th5heJ
 wCDl1dKhAhKiKeBeK7NsLPwMHvX60Xkp0Uz/cPZVCODUfis+jNYTXmefgZp4r91M4Ius
 A0vwVLy6i0ZWQ4UEcwOcKZ1PvI+vBkoNFZBQJO/WzSjuX5rIXcwCgDrn1V4FWVRBesqw
 WNA9oi6iueEiToS1DfhySAvw4qLL00iaDzgeaAzN1eo0PJR0mtxam2QZxppryKKRMP1l
 e/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VIgqMST8OYIlavixxxA2aWcjhvsl8euc3JvpcYZAogw=;
 b=cB7g1arnt9XnNfSBg1avbkdxvkQQQI/x7WHmEsZep8uwfVIKwVe3WGIXEnvzYeNz/K
 YajYunA+oAtvVwrXl0rax2nMW0izVZ3gDgH2zcqT6W5zCAg0uWurr2fNlq5B2ROpglTJ
 DZnSKaKCUuGncWMn6EaDI1KDv26Aq359vLYqezp6EnM+I2hbQ/0WPKvgdpdS3A0AxeiR
 36npslPlo8LsvJ8Xy+HsG2UDl7BhPOhCrRUZweFaWI1EkAAWxvh26L7S5tXOJ5zHXW2A
 7QeSLa++rz9qJEiChyjAuOpDfKUsYMi4cp8FSaaQiE6YXC6k9HPBtsc8jye+g6B8wsfy
 qcDg==
X-Gm-Message-State: AOAM531/MkA6S7XakW8xs+HpYUGOnD26K0xIYeQNFjdmH787cn98YMA6
 i9VJQu6eG2oxe0MMm6NpklfJVg==
X-Google-Smtp-Source: ABdhPJwiwRZcmByITMAsG7Oy7GBFyiWlKgMDhahp2eaCx9X/Vuh308EOw85H3M/9vDi+Vuj5rrCgng==
X-Received: by 2002:a4a:d553:: with SMTP id q19mr7842956oos.28.1616690293996; 
 Thu, 25 Mar 2021 09:38:13 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id r13sm1338326oot.41.2021.03.25.09.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:38:13 -0700 (PDT)
Subject: Re: [PATCH 12/15] Hexagon (target/hexagon) bit reverse (brev)
 addressing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-13-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1d55ffb-d7e1-aa49-bd06-d301da05d48b@linaro.org>
Date: Thu, 25 Mar 2021 10:38:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-13-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
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

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> +static inline void gen_fbrev(TCGv result, TCGv src)
> +{
> +    /*
> +     *  Bit reverse the low 16 bits of the address
> +     */
> +    TCGv tmp = tcg_temp_new();
> +    tcg_gen_andi_tl(result, src, 0xffff0000);
> +    for (int i = 0; i < 16; i++) {
> +        tcg_gen_extract_tl(tmp, src, i, 1);
> +        tcg_gen_deposit_tl(result, result, tmp, 15 - i, 1);
> +    }
> +    tcg_temp_free(tmp);
> +}

This is very sub-optimal.  Coordinate with rev.ng, who added this as well.  But 
even there my suggestion was

uint32_t helper_fbrev(uint32_t x)
{
     return deposit32(x, 0, 16, revbit16(x));
}

because this operation is fairly large in tcg ops.


r~

