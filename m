Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5444182CE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:41:03 +0200 (CEST)
Received: from localhost ([::1]:50160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8rN-0006iP-M7
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8pT-00061Z-TH
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:39:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8pS-0002tq-Dm
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:39:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id t8so36463524wrq.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dlo56twAi3Hu4gETbOXMBj7jeB9SpEgjQ3L57sibd94=;
 b=Rqs8+U00y3reGQq3WpsS0YmKCu5HU6S5YGhfNG4w2RdSA2yYvmvLfWY6Mh/6F+tVuP
 uLH1rhFGzI8zTbjWwRD2PvKcPuV4x9CTLatSt6LApzduvmvy722HgvHUJA4OIJ0W8wJc
 6fF3r86iQdeYl99v4WiIhyowwBfO6qDt5ULfnQqiDmd+kMGziUsjngHGTuOPx81ivFLH
 /mziNJdUJDQWrlxqFYuGk6FCE7jrUacH6MDonrDnZjapDzttL0ILyZU/9jguEdBIoXYK
 ZDXKuC9KkNTS5BpMOXbAIP9aLenq7N/7YwoyDXqW+5pDHqM1xObvwIhbh5wDVbj71mf4
 Okpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dlo56twAi3Hu4gETbOXMBj7jeB9SpEgjQ3L57sibd94=;
 b=h2K6aCxvY6tB/m1wUGcjZrQQNZyd+Fr5Aq7Pqy6OufdRkuFbvqPQHBrmV63v7W6afo
 X5qvA94RQEF9aC79WTXyE+hRJa10T72Pdyo95FaiMlCg1fcsgA2gREv/mGqKSNm0f39b
 YSDklodZrkgfS/31kjJNQwl182LUR11+ZL+PdfBO7+m5YbfQWrtZpqsI3YWl0SEAtdh4
 zA57CXW39Z//dheWAZJdI3+7N74XWa2TVSLp6xIROpAjQIJ0ZNQtm8ujMtF9CkoNQA9R
 3TOX1l7ZNgR1HtTAePrJxQoaFdSYrzJPZ5D34GCp4TiVkHg/G79kTEIIt6z+zxL1ea9V
 vCLw==
X-Gm-Message-State: AOAM533QYYnGJBMiCc7+6yYGaPmMbx2MR5HXzpwkzcVc3HgmFLUV9PSR
 UH+wXJ0n2wxiXe1N70PRjtM=
X-Google-Smtp-Source: ABdhPJwICaqaJ2ggAwvgA27D3qM5Br75IRkw89CWADJ7iGtr3l9ov/wcr5vnxKk0A9mhP/RAjyAy8Q==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr17322654wri.74.1632580740859; 
 Sat, 25 Sep 2021 07:39:00 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l15sm15548343wme.42.2021.09.25.07.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:39:00 -0700 (PDT)
Message-ID: <39eb1e37-68ff-8cf3-666f-030bbbac9844@amsat.org>
Date: Sat, 25 Sep 2021 16:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 19/30] tcg/loongarch64: Implement br/brcond ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-20-git@xen0n.name>
 <cab5c9aa-3371-783c-1b4d-c4e265a272f2@amsat.org>
 <93a52a0d-1f8f-3a74-e878-8da771f9fa22@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <93a52a0d-1f8f-3a74-e878-8da771f9fa22@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 16:12, Richard Henderson wrote:
> On 9/25/21 6:13 AM, Philippe Mathieu-Daudé wrote:
>>> +static const struct {
>>> +    LoongArchInsn op;
>>> +    bool swap;
>>> +} tcg_brcond_to_loongarch[] = {
>>
>> Richard, TCGCond is 4-bit, shouldn't we explicit this array
>> size to 16, and even better define TCG_COND_COUNT = 16 in
>> "tcg/tcg-cond.h"?
> 
> Perhaps.  Not in this patch though.  None of the other instances in 
> tcg/host/ do that, so I'd want to fix them all at once.

Ack.

FYI some (outside of tcg/host/) do, tcg/tci.c:

static const char *str_c(TCGCond c)
{
     static const char cond[16][8] = {
         [TCG_COND_NEVER] = "never",
         [TCG_COND_ALWAYS] = "always",
         [TCG_COND_EQ] = "eq",
         [TCG_COND_NE] = "ne",
         [TCG_COND_LT] = "lt",
         [TCG_COND_GE] = "ge",
         [TCG_COND_LE] = "le",
         [TCG_COND_GT] = "gt",
         [TCG_COND_LTU] = "ltu",
         [TCG_COND_GEU] = "geu",
         [TCG_COND_LEU] = "leu",
         [TCG_COND_GTU] = "gtu",
     };

And target/s390x/tcg/translate.c:

/* Table of mask values to comparison codes, given a comparison as input.
    For such, CC=3 should not be possible.  */
static const TCGCond ltgt_cond[16] = {
     TCG_COND_NEVER,  TCG_COND_NEVER,     /*    |    |    | x */
     TCG_COND_GT,     TCG_COND_GT,        /*    |    | GT | x */
     TCG_COND_LT,     TCG_COND_LT,        /*    | LT |    | x */
     TCG_COND_NE,     TCG_COND_NE,        /*    | LT | GT | x */
     TCG_COND_EQ,     TCG_COND_EQ,        /* EQ |    |    | x */
     TCG_COND_GE,     TCG_COND_GE,        /* EQ |    | GT | x */
     TCG_COND_LE,     TCG_COND_LE,        /* EQ | LT |    | x */
     TCG_COND_ALWAYS, TCG_COND_ALWAYS,    /* EQ | LT | GT | x */
};

/* Table of mask values to comparison codes, given a logic op as input.
    For such, only CC=0 and CC=1 should be possible.  */
static const TCGCond nz_cond[16] = {
     TCG_COND_NEVER, TCG_COND_NEVER,      /*    |    | x | x */
     TCG_COND_NEVER, TCG_COND_NEVER,
     TCG_COND_NE, TCG_COND_NE,            /*    | NE | x | x */
     TCG_COND_NE, TCG_COND_NE,
     TCG_COND_EQ, TCG_COND_EQ,            /* EQ |    | x | x */
     TCG_COND_EQ, TCG_COND_EQ,
     TCG_COND_ALWAYS, TCG_COND_ALWAYS,    /* EQ | NE | x | x */
     TCG_COND_ALWAYS, TCG_COND_ALWAYS,
};

