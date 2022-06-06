Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B253ED4B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:54:24 +0200 (CEST)
Received: from localhost ([::1]:47910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGvn-0001ZN-SN
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGsy-00073i-H1; Mon, 06 Jun 2022 13:51:28 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGsw-0007om-VT; Mon, 06 Jun 2022 13:51:28 -0400
Received: by mail-oi1-x236.google.com with SMTP id p129so16003036oig.3;
 Mon, 06 Jun 2022 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fLIp6fo2r66IBvnuOw8BhFCTY37fBZdy9Sg10PdHTcU=;
 b=ii/4JfEw2DhHqSoKlxlj46fSB4cpXGO62GBKDoVE2J9Lfx+xe5+OhTkrSwAGQYYZjm
 gntSz1rc3+WU3+gRZkSphmGaW1XNf9EPBMc/OiDSQ81Bl7KAGRDQWrzoYpgtaANzSR5Q
 sYFUOC1jShhC3pSfpbip42iN7uJyeQ8jnL8eu3N9yKtGTDHla8QS1oc0+COijl84583k
 fNNeGWFCjJ/cOQSr48bcbIsROB2Jf94odttW0qsY5NQH4ORtXBY/PLMxAOH9YtxTrSsV
 jqRwkBsMU6NiuyYTnMR76t96mU2bsH0ihrgwHfdQFzy9Oq68bHOmfNKxP5mhzrdLNlZL
 KRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fLIp6fo2r66IBvnuOw8BhFCTY37fBZdy9Sg10PdHTcU=;
 b=WsHcIGREyetU8g8bDGip23ta3MhwIy4nJFI7u97Ak2iPVGYc2HNmeg+ks2rfpOd6u2
 MUKEb/aV1iL0zq6heNBVnFwPyRSCpUhbxgCKldOl/YwSlB9eTxxeGOU++wlyPAb9PLtA
 AaxcpBAd9r/m+TQb8Yow5UqAXw4BsXw5R74yOcLAa6RkP/qEmCki8jWPyu2iVoTK+5aq
 Zuv+SCiJvGWyeNGY1CUBq2zlznfzSx3jfLodKlxstrFoUlfmzEzGzFONHGv/A/S7ZfIu
 cExAYY8h1pFkKb+8D10nxYA3CNQ03NP7+WKNPJ1G7B54ZCmw3kmnPIL7lpZSiR3vVmU7
 Q1Tw==
X-Gm-Message-State: AOAM533uVxolZPLqmIsZ/obw6Kbfz8QT++a8gziUI6WDX3udnmWUSoL/
 e9rz+Vv/3xODFm5mOl8vWY0sqkLEISo=
X-Google-Smtp-Source: ABdhPJx5KgJHVngJQ4zRh6AImkThxTzwKj9QWdZugwBFse6hwIY2nRotvqetu3kaR2ld/BIvSdHTEg==
X-Received: by 2002:a05:6808:1599:b0:32b:18e3:3e04 with SMTP id
 t25-20020a056808159900b0032b18e33e04mr30404783oiw.227.1654537885280; 
 Mon, 06 Jun 2022 10:51:25 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.74])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a05687044c700b000f34dacf350sm6987454oai.6.2022.06.06.10.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 10:51:24 -0700 (PDT)
Message-ID: <c18b4a0e-85fb-aa16-3e7e-7e15724bc629@gmail.com>
Date: Mon, 6 Jun 2022 14:51:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc: avoid int32 multiply overflow in int_helper.c
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220602141449.118173-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220602141449.118173-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 6/2/22 11:14, Daniel Henrique Barboza wrote:
> Coverity is not thrilled about the multiply operations being done in
> ger_rank8() and ger_rank2(), giving an error like the following:
> 
> Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
>      Potentially overflowing expression "sextract32(a, 4 * i, 4) *
> sextract32(b, 4 * i, 4)" with type "int" (32 bits, signed) is evaluated
> using 32-bit arithmetic, and then used in a context that expects an
> expression of type "int64_t" (64 bits, signed).
> 
> Fix both instances where this occur by adding an int64_t cast in the
> first operand, forcing the result to be 64 bit.
> 
> Fixes: Coverity CID 1489444, 1489443
> Fixes: 345531533f26 ("target/ppc: Implemented xvi*ger* instructions")
> Cc: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/int_helper.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 105b626d1b..eb65ab4d82 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -789,7 +789,7 @@ static int64_t ger_rank8(uint32_t a, uint32_t b, uint32_t mask)
>       int64_t psum = 0;
>       for (int i = 0; i < 8; i++, mask >>= 1) {
>           if (mask & 1) {
> -            psum += sextract32(a, 4 * i, 4) * sextract32(b, 4 * i, 4);
> +            psum += (int64_t)sextract32(a, 4 * i, 4) * sextract32(b, 4 * i, 4);
>           }
>       }
>       return psum;
> @@ -811,7 +811,8 @@ static int64_t ger_rank2(uint32_t a, uint32_t b, uint32_t mask)
>       int64_t psum = 0;
>       for (int i = 0; i < 2; i++, mask >>= 1) {
>           if (mask & 1) {
> -            psum += sextract32(a, 16 * i, 16) * sextract32(b, 16 * i, 16);
> +            psum += (int64_t)sextract32(a, 16 * i, 16) *
> +                             sextract32(b, 16 * i, 16);
>           }
>       }
>       return psum;

