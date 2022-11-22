Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63DE633B64
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 12:31:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxRTy-0002pl-Om; Tue, 22 Nov 2022 06:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxRTt-0002pF-BX
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:30:25 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxRTr-0007Ba-D0
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:30:24 -0500
Received: by mail-wr1-x42f.google.com with SMTP id cl5so24257753wrb.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lU5YJfqzWPp7s5ARkYGoyySsSs62haJMwVNObcwndfI=;
 b=HzE5oNwQwthXwqa3epC95tLG0BSapvamoI5k2Uq8oqS0ncqi1RXy70GaselIqNg0d1
 yMZAOGewbKK4BIuCmIb/kjFR9zU547nJhnWxaOAbt0SKkD+6qc8leGOHE1E+4ukqlc57
 gX93faI4bJMya3Vx0w3XvZt2J4BBjo6cNkT4W0dDZmgrPYsos9uMV/7m7ubKUBFAa5sG
 XrzaXXjyEKKy0z9S/EF6Y0aJBvXfARfbIkdUMyjONZJoSqbVahckOGHunvHTHZ/ysBFF
 IaFVKzSainJYnWX42PmeTaanR8LlppGWwZjTwqL7zZ5rfMwBr95vaRWW4SYkJxDAPAES
 wYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lU5YJfqzWPp7s5ARkYGoyySsSs62haJMwVNObcwndfI=;
 b=e/nabIpA3uOp4q0TZBIIBEFPnpAFzHGJ3mjdlXDqKJootefKF/5BcR9ZTaF4/PFmne
 /2bwkvKI5nDws02K+A2xo7xBwGsuuiZnKx0GNpHHgWurXJNEuwz+PgRU9PMBADcdLBh6
 BcgEQoxOkaOMV9Vsl88lTLVUkS7LPa428K0AVy5Stf8Kjgg0/D0ui9Q28DeXcVrFDHBP
 CM//NvScI6fwCm+6lab+8Wor4u4k9v94dgt03fd+gd4AD8rauVKjFOvS2QisGEs9hPsG
 l9guldzpzU9JLpO/5ppHla3B4LZcatukHVhszwF6jbWz8QrbkoYf43An26iOeuaibW1I
 g4vg==
X-Gm-Message-State: ANoB5pm5/2RqNCgBIa1PfP/I3+Xq+R1dvNWAgsYWXdzHy9KDylvnwljH
 fRbNikTU4i9x+ienQpPWeRR/UPV84wFpTA==
X-Google-Smtp-Source: AA0mqf7qLR1zHimXxje5A0n2j9fkf/o1q5683TS8Tazf8l/m4InGU/OX6g5NOC17kztpnKvAEXN6Hg==
X-Received: by 2002:adf:e4ca:0:b0:241:d5a7:8bf7 with SMTP id
 v10-20020adfe4ca000000b00241d5a78bf7mr3213476wrm.440.1669116619240; 
 Tue, 22 Nov 2022 03:30:19 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adffc4f000000b00241dec4ad16sm2713679wrs.96.2022.11.22.03.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 03:30:18 -0800 (PST)
Message-ID: <6e038f52-6736-ec37-5f67-bbc41e83a228@linaro.org>
Date: Tue, 22 Nov 2022 12:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 14/45] tcg: Introduce tcg_type_size
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111074101.2069454-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/11/22 08:40, Richard Henderson wrote:
> Add a helper function for computing the size of a type.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 16 ++++++++++++++++
>   tcg/tcg.c         | 26 ++++++++++++--------------
>   2 files changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index f2da340bb9..8bcd60d0ed 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -319,6 +319,22 @@ typedef enum TCGType {
>   #endif
>   } TCGType;
>   
> +/**
> + * tcg_type_size
> + * @t: type
> + *
> + * Return the size of the type in bytes.
> + */
> +static inline int tcg_type_size(TCGType t)
> +{
> +    unsigned i = t;
> +    if (i >= TCG_TYPE_V64) {
> +        tcg_debug_assert(i < TCG_TYPE_COUNT);
> +        i -= TCG_TYPE_V64 - 1;
> +    }
> +    return 4 << i;

I'd feel safer if we assign TCG_TYPE_I32 .. TCG_TYPE_V256 in TCGType,
just in case.

> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


