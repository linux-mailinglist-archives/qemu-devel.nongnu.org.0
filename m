Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2195420276
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:54:19 +0200 (CEST)
Received: from localhost ([::1]:35750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3oh-0000KZ-1N
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX3mc-0007BG-Kk; Sun, 03 Oct 2021 11:52:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX3mb-0002mB-67; Sun, 03 Oct 2021 11:52:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r7so10195911wrc.10;
 Sun, 03 Oct 2021 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GrljlbyY6tla5jUqlP1QNdPaZPzSb5mbpaF/Zs2PVuA=;
 b=lucb1tME0x5XBuP/BF5EBNIzdgIYY1B++Ql/mJSGKu44M0tcs57Je4hwlvitLJdPqJ
 TecyJ8i3ziKuyU/T42OUdKN4P/lPP88kqB+pRpmbcaqb02MUFj73aoOupeXpRIV+W+l4
 REeNHIysIeDSMYWuHHU8449lQqz5ehNbHaF14V2ZZjgRqOfAqvcCB4krdBctW7i2lRLE
 gUvmPOnP65LqOR/r4qPcK7KXaReycoEB9Y717Zdpe2nuWbDk3AACVsFDptoFF0R8/un8
 VhlkJM3PCR5EeUqTPnBl0RiiX1fS2qXSHHO9pK1B9kQcSHNN2jnmbQg0CUZ9Qul34eo8
 7XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GrljlbyY6tla5jUqlP1QNdPaZPzSb5mbpaF/Zs2PVuA=;
 b=npdwEz4msAt7YG12vcqsvr7EnpldCkfW292u/NNuVlRHYEqiCBtWrPZCeHjFWX7k8U
 j1dJ4hT0P6+FeyW7DqIHonGQdsWJUyukw/dbtPH9tKzyw/jLHhuTySOGU8lc4ZeO+XMo
 d3wYPy9rwzR8lQ4EirC6Eb9fih0c9cys78P1sE/Ta2Gg808xCFHw5KeLrL6R9TBpVDfQ
 7oasy2bKSctYBMv/lpqmTr4jMAtvc0Rb/9gI0hsNHxlj3O4T63D1QPzHlJRNETsoB9ep
 Vy5+EC9Id/PeW1l7QUKQ97TWQ6EkWwI44SeiCs/gtNxazFsch/E/fhUIhoep07/5e4gG
 xkbA==
X-Gm-Message-State: AOAM530JDQh43ctyUkKZ5XXIWTqnY9vaRa2NuTaumHdNnwl3xdv+ZEiv
 gj4GwuGvlHu6rcXmvkL0oJs=
X-Google-Smtp-Source: ABdhPJw0UDh7inrC61fFSxGRratJCNABUvbVmtuxgKFTE1EQ1m2QWXmUsfhanV/aJqpwrs3kBJwMzA==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr4309578wrb.227.1633276327332; 
 Sun, 03 Oct 2021 08:52:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id p18sm489171wrt.96.2021.10.03.08.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:52:06 -0700 (PDT)
Message-ID: <b29ac0be-3761-1550-9b86-a3f4f7475764@amsat.org>
Date: Sun, 3 Oct 2021 17:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] target/arm: Introduce store_cpu_field_constant()
 helper
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211003143901.3681356-1-f4bug@amsat.org>
 <20211003143901.3681356-3-f4bug@amsat.org>
 <bf1c7cfa-6a0a-586c-58a2-8886402952a2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <bf1c7cfa-6a0a-586c-58a2-8886402952a2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 17:35, Richard Henderson wrote:
> On 10/3/21 10:39 AM, Philippe Mathieu-Daudé wrote:
>> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
>> +static inline void store_cpu_offset(TCGv_i32 var, int offset, bool
>> is_temp)
>>   {
>>       tcg_gen_st_i32(var, cpu_env, offset);
>> -    tcg_temp_free_i32(var);
>> +    if (is_temp) {
>> +        tcg_temp_free_i32(var);
>> +    }
>>   }
>>     #define store_cpu_field(var, name) \
>> -    store_cpu_offset(var, offsetof(CPUARMState, name))
>> +    store_cpu_offset(var, offsetof(CPUARMState, name), true)
>> +
>> +#define store_cpu_field_constant(val, name) \
>> +    store_cpu_offset(tcg_const_i32(val), offsetof(CPUARMState, name),
>> false)
>>   
> 
> You missed out on using tcg_constant_i32 in the end.

Oops... thanks :)

