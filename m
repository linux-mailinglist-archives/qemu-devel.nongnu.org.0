Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0B569715
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 02:58:20 +0200 (CEST)
Received: from localhost ([::1]:35846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9FqV-0000Xk-L6
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 20:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Fov-0007Sb-Eu
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:56:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Fop-00088l-2x
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:56:40 -0400
Received: by mail-pf1-x42e.google.com with SMTP id b9so197284pfp.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 17:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k4ICq4fWpDtAxbmYLOgRCh/DKTvg1MRkFvPP7ShO8wg=;
 b=KauHt9p9W506eq4CNmXfhpBvSItCbvgIzAWG/t+JyTqQ6rpTgTzNHV4h3k+Ct+jK6j
 1IzAEAtPa6hJnTYYgjsZ3xkx2yrohOw/WTV8OfstAyHmkLfa9G8yfLzGUwSGv1ejGoSh
 N47sVKawOANlD6ha3gXuaLbXFaTk4dDuE9vomyeHNqVVPHtn0oev4+t01IGyGG57EZGV
 ci00zcDE62cpMxiLoh/J+C/bU9tLoyRCtFcZuDrdk9KF3J7bcn6J/O1MwYyBtYknouT8
 7U2tCOlOZ3cvjsjikhn1aZ/hIpXTR9P4V7mk+r/vjYoN9zEsTj1hyyR2Cne7vpsAiAdv
 YdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k4ICq4fWpDtAxbmYLOgRCh/DKTvg1MRkFvPP7ShO8wg=;
 b=qntLV7jEAKNAHjIwP+BYNmZ3/ER1Af9sOLD5LVMjhFIGVfwoNdDRf2SmPY9CvZX91A
 ji7VzH2gSWgoE29HztMdnb7f/eBMAYweYXFgRsHnftYgv3cdS9qJm3gEvHpoMR1gMX5l
 +DmukvBYfsv6AoNxPwjp7dxZgbUueIZO5mNuxSJWaVLlvJFGTeIklpIckHpZ2KqYi3B5
 OQ6F2EEmX7ZN7LFG7lLR1aEWjgW2rKSbJwa+ovyg3efBxO7/mnHV6mA/8t7D/cgBPkl/
 pDkoi9QoDxF6Sg1eSKGdt79ZDCaXsKGmTVx3EMtyayYH6pZjgMT7oc1TlEn/FDhJczto
 xE6g==
X-Gm-Message-State: AJIora9OEBmGgdQgyT/97bslyrrvLylOmeXivBn+LjWYdQLkoR3a8P3Z
 OEYj1BpBpign3jeksDTm/kgrRA==
X-Google-Smtp-Source: AGRyM1s/geVOhAPSEjJXoxpvw6H5rgUb1doQO5Tzj7yn2hdwKkbW5kiac1Ekci/Y3X/fBsQTmYJitw==
X-Received: by 2002:a05:6a00:1990:b0:525:565d:8ce7 with SMTP id
 d16-20020a056a00199000b00525565d8ce7mr50660988pfl.82.1657155392894; 
 Wed, 06 Jul 2022 17:56:32 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a056a000bcd00b005206d4fd636sm25355291pfu.2.2022.07.06.17.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 17:56:32 -0700 (PDT)
Message-ID: <770adbb2-6ac9-f319-4841-c9746412a956@linaro.org>
Date: Thu, 7 Jul 2022 06:26:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 19/45] target/arm: Implement SME MOVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-20-richard.henderson@linaro.org>
 <CAFEAcA91ibFPZy61jEJ3dx4foNRHpgnbAYe4W2wwtRpUsa3UfA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA91ibFPZy61jEJ3dx4foNRHpgnbAYe4W2wwtRpUsa3UfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 7/6/22 22:17, Peter Maydell wrote:
> On Wed, 6 Jul 2022 at 10:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We can reuse the SVE functions for implementing moves to/from
>> horizontal tile slices, but we need new ones for moves to/from
>> vertical tile slices.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> +/*
>> + * Move Zreg vector to ZArray column.
>> + */
>> +#define DO_MOVA_C(NAME, TYPE, H)                                        \
>> +void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
>> +{                                                                       \
>> +    int i, oprsz = simd_oprsz(desc);                                    \
>> +    for (i = 0; i < oprsz; ) {                                          \
>> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
>> +        do {                                                            \
>> +            if (pg & 1) {                                               \
>> +                *(TYPE *)(za + tile_vslice_offset(i)) = *(TYPE *)(vn + H(i)); \
>> +            }                                                           \
>> +            i += sizeof(TYPE);                                          \
>> +            pg >>= sizeof(TYPE);                                        \
>> +        } while (i & 15);                                               \
>> +    }                                                                   \
>> +}
>> +
>> +DO_MOVA_C(sme_mova_cz_b, uint8_t, H1)
>> +DO_MOVA_C(sme_mova_cz_h, uint16_t, H2)
>> +DO_MOVA_C(sme_mova_cz_s, uint32_t, H4)
> 
> i is a byte offset in this loop, so shouldn't these be using H1_2 and H1_4 ?

Oops, yes.


r~

