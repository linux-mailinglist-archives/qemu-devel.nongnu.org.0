Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1F41A6FCB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 01:20:52 +0200 (CEST)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO8Nn-0007QH-2t
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 19:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jO8Mj-0006Z6-SC
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 19:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jO8Mi-0002eH-LL
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 19:19:45 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37945)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jO8Mi-0002dc-8l
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 19:19:44 -0400
Received: by mail-pg1-x541.google.com with SMTP id p8so5162209pgi.5
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 16:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jY4NloNnYN/xR1cqdj1lfHYLk3Wix42tT4AJJzqRYFc=;
 b=v0X5YBDB3a5m8VUpe4oBCJo30jvsgxYEfohcstDUIHZJsRj3I5s2F9Ge/xXeYa4lfA
 vmgV8q64UNkCEl50KZr1j8XtJ/vqkkg41W7XPsjXGzgQsiha2yRSO9rnfgfJZidCNPze
 b3YR/WFJBeb/XYxNrpJ1Uvu8XrH7wrZ8RvXHvcW4BCeYmFkdTMEjqtvB2cGuQgdMUOv3
 H88KrKs6nnRun8s+FTn8bh7VnaUxpYj4L+k7MTcgIsHmMFS8Y7XinwYHC0IDMp2bsODL
 QMS4JlLu6bcj51vHlefb3KKg5AlXAUiwbWlCGqA7Xa+Oaqq5bgV4FRYIW2Alj8req7sk
 ZluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jY4NloNnYN/xR1cqdj1lfHYLk3Wix42tT4AJJzqRYFc=;
 b=cbYthk+cekZIWk1OJ3wBQAbXBeSjHE9CwRN6ISDdbRSJ2Ytx0LcQDwgYIut3x3B0CB
 VYVY4omzoJaDhDYTUZfJi0YAyuUKY9gd+ltwYKbg/BRXJJFVIE3dSDj5q4vy5Rq1POL7
 HntkB1rufeXV/aLWCbucuu7LLY45zT/JiIW5k7NlvikGhUontOJttSiAhvmdyOpJtzkY
 eg1sgEANUYByuX+AmeFucj7YbuYwjoQERaOrEqIAkr5Whf7qNnWgY4mtB9V+qbmWYPKF
 4rr8RVqst6njBeAP5bXxGlAMgkp1Ebo0HPIA5yxWgjVkwyWgC9XoV9SzqnZ/1oOtKlkX
 7fvg==
X-Gm-Message-State: AGi0PubMcE8u31kridszdi7l7uAmUwAR3124/gCfS4+97v/GVMR2F/mI
 Q6TEAos9kVk5DAz6QZqtFmCEZA==
X-Google-Smtp-Source: APiQypL4goOxENIWFoVMuZDQS13g09Qrf0yzS7OJ+olMbtv1bk34QUIzjeiJpkt8SJiEAdWQqQg3YA==
X-Received: by 2002:a65:6250:: with SMTP id q16mr19987284pgv.9.1586819982632; 
 Mon, 13 Apr 2020 16:19:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 9sm1647315pfn.204.2020.04.13.16.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 16:19:41 -0700 (PDT)
Subject: Re: [PATCH 21/31] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-22-richard.henderson@linaro.org>
 <CABoDooNE=R_jQjg-dZrdaK-atmuQ4XjMkGjKnmebKvuXcTpDQg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae2cb680-2200-e9cb-afa1-e55593ef6d6d@linaro.org>
Date: Mon, 13 Apr 2020 16:19:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABoDooNE=R_jQjg-dZrdaK-atmuQ4XjMkGjKnmebKvuXcTpDQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: rajav@quicinc.com, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, apazos@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/20 9:15 AM, Laurent Desnogues wrote:
> On Fri, Mar 27, 2020 at 12:18 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> [...]
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index a3653007ac..a0995d95c7 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -1216,6 +1216,30 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
>>
>>  #undef DO_ZZZ_NTB
>>
>> +#define DO_ABAL(NAME, TYPE, TYPEN) \
>> +void HELPER(NAME)(void *vd, void *va, void *vn, void *vm, uint32_t desc) \
>> +{                                                              \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                     \
>> +    int sel1 = (simd_data(desc) & 1) * sizeof(TYPE);           \
>> +    int sel2 = (simd_data(desc) & 2) * (sizeof(TYPE) / 2);     \
>> +    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
>> +        TYPE nn = (TYPEN)(*(TYPE *)(vn + i) >> sel1);          \
>> +        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
>> +        TYPE aa = *(TYPE *)(va + i);                           \
>> +        *(TYPE *)(vd + i) = DO_ABD(nn, mm) + aa;               \
>> +    }                                                          \
>> +}
> 
> ABAL is either top or bottom not a mix of two.  So only sel1 is needed
> and its multiplicand should be the number of bits of TYPEN.

Yep.

> vd is both a source and a destination so a temporary should be used.

In what way am I not?  Both sources are read before the write.  The operands
are all in columns of the wide type (unlike the addp case you pointed out).


r~

