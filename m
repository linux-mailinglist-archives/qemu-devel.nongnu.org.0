Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30E438589
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:31:07 +0200 (CEST)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOba-0000Ng-8W
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOa1-00089K-IP
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:29:29 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOa0-00015c-4s
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:29:29 -0400
Received: by mail-pf1-x42e.google.com with SMTP id o133so6849493pfg.7
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fksVFQx9CiqO2xWPHzMVD8c1ZUGjGBkzM2vjO+gnWcg=;
 b=tyXDyvckBQlq5INZ+qt5YGPZUf2llshNCx16gk8NQ51Swfd7f/PcGZByXV2On9HNaL
 8rRQ75QE0BMQBfUx1x9VO0k2GUX1lkP4yyk5m4CwYB2KfAgLORU8wrySkVO0UWBFnixL
 YGMjM7SwU/i7iIE1mQ7CX1I3ltsVOdgI7nH1UcZFPE/QdLoas9ntJCXPkk2JTsXwNrVs
 2QsBTMep8FcnJGVhuMcVjc70N1ukvUGIsk+L92gPPJy+rNhx6pgHifLoVRjHsBlssncQ
 r2laTtcOFwk6pUX6HnyMk+oiKNcJP0puSEhk5brUd/uCfYwoTxaJfYA4K9O68isk+4WY
 nQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fksVFQx9CiqO2xWPHzMVD8c1ZUGjGBkzM2vjO+gnWcg=;
 b=VlNtCHy+Q2Mun3qMRcX8jX2yz1ZMRbuzjPqYmpViE76LCfFkcZQIFHS+SF9QjnwSdQ
 rx51L2+5BQHFxMIz2LJBtVLI5n2TPsarPGVqrNcf4WLjqHUYl1+MQezwYEzz98eAnhId
 kKnAfjhawafhqZqeKitlF62Izgh1jZ1dofR94VD9/J7dPtVIHvxRk/ux8j5q0SmE9L5R
 rxhfd8+0qSb+J57LRqJkFYHME4aokVW3sQgQ6IdogqK+gJyVbAKidtdQBI0eBUO8ZRrn
 9zEwlh4BtmwYi2kxE5EQGWtf5raMGN7xNGXbecpt8wkf76lNN6ogJCSz3zhJGvDDV3E8
 n9Ww==
X-Gm-Message-State: AOAM532YvDTaiGCg3h19yJcHOh56EiOHEO7LtlHKObqvs8Sm4lnEPyO8
 MLmS7yxktyyg0p2IE3/wGZvcTQ==
X-Google-Smtp-Source: ABdhPJyHmAykuP3mnBUoNXsHZ2VdskVTINum54ie//g8t6OgVVrkomcW2AhM4A71oy/H/IRfzu4BYA==
X-Received: by 2002:a63:3548:: with SMTP id c69mr6125539pga.111.1635024566721; 
 Sat, 23 Oct 2021 14:29:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j11sm732582pfj.40.2021.10.23.14.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 14:29:26 -0700 (PDT)
Subject: Re: [PATCH 33/33] target/ppc: Implement lxvkq instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-34-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fea955b-3dea-9584-f9ac-40744da4a17b@linaro.org>
Date: Sat, 23 Oct 2021 14:29:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-34-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +static bool trans_LXVKQ(DisasContext *ctx, arg_X_uim5 *a)
> +{
> +    static const uint32_t valid_values = 0b00000001111111110000001111111110;

All of the specified values are non-zero, so this kinda duplicates the values table. 
Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


> +    static const uint64_t values[32] = {
> +        0, /* Unspecified */
> +        0x3FFF000000000000llu, /* QP +1.0 */
> +        0x4000000000000000llu, /* QP +2.0 */
> +        0x4000800000000000llu, /* QP +3.0 */
> +        0x4001000000000000llu, /* QP +4.0 */
> +        0x4001400000000000llu, /* QP +5.0 */
> +        0x4001800000000000llu, /* QP +6.0 */
> +        0x4001C00000000000llu, /* QP +7.0 */
> +        0x7FFF000000000000llu, /* QP +Inf */
> +        0x7FFF800000000000llu, /* QP dQNaN */
> +        0, /* Unspecified */
> +        0, /* Unspecified */
> +        0, /* Unspecified */
> +        0, /* Unspecified */
> +        0, /* Unspecified */
> +        0, /* Unspecified */
> +        0x8000000000000000llu, /* QP -0.0 */
> +        0xBFFF000000000000llu, /* QP -1.0 */
> +        0xC000000000000000llu, /* QP -2.0 */
> +        0xC000800000000000llu, /* QP -3.0 */
> +        0xC001000000000000llu, /* QP -4.0 */
> +        0xC001400000000000llu, /* QP -5.0 */
> +        0xC001800000000000llu, /* QP -6.0 */
> +        0xC001C00000000000llu, /* QP -7.0 */
> +        0xFFFF000000000000llu, /* QP -Inf */
> +    };

