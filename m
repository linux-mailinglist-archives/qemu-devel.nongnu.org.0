Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D028D537E6A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:09:51 +0200 (CEST)
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvg5e-0007zq-Up
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfvO-0001LL-Q2
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:59:15 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfvN-0002mt-6j
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:59:14 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s68so10203108pgs.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FBVM1w1D7W1ftQ1tTSfM+YiMWzRkZGzfR3siYsMKSfg=;
 b=Wbo4koPyqont8WXnL2gMszssIvqQtCdTkMnl3b5uCGBURocBP0kiR//mr+yikyezyL
 lq74zYjYvtW0RDEQG7FCQuWXClfFcKiqShO3MpUfP2K5RsJQMcmY6xZSZvPcGFcs9ISP
 5f13jmQuTxOJK7epDE9Vuw+I7OtveLUbAU6oE06KBrM/uXqe44vvJay7Dl9h+qaW87lH
 8BEQ9wYnpWuOJMt3lNsYwtXHaYCzWKB+u3GASSPEQm9lJIS+12eebKo5+02VCbZ0PXB1
 yBE+Dpf2TQ6u0BOdkKWVr2QkDCbpoAHwf5fHLeNdKrNIZV74MprGNGjpvyX4QAsNGfe9
 pGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FBVM1w1D7W1ftQ1tTSfM+YiMWzRkZGzfR3siYsMKSfg=;
 b=2AlXy2P61J2wSuu9bx+AZBrVerVmngOzX48SDO5U2LUj0J/uFlfsWQRWbUnG+Pvnce
 /UnInS9Y1jcvQb6e5H66JeXfDhqqWOyaJDaDnmOYrsInNXbb136sn5JhycjvSE/3EWm3
 mN/lp5roZCVXyLUwGz8Hz8uJ8QNsrJ76tKN+ev0bkEcl1SCAF8RO1vp7BpjxKsm6URtM
 /lRioTAj805awbt+iVbYNxdwcKuhbkoc95yktVdMFcsr/57r3J999CllWKMccNDPyaPl
 nA9uEB5sE95tM6qlyGrkgjZSAGjQkK8Y6JZDZrzmhjXak7EtjXjKFueXmH5DSZS1zHLs
 aKrg==
X-Gm-Message-State: AOAM533/fo/WoB9Tc39zn44wqb5LpPLMuODyG8GNAkw+hnreKgYfHq/B
 Dnk87fN4zsvS25WIRPuNH5g=
X-Google-Smtp-Source: ABdhPJxX8aT8vNl9Xp9eOXVLZmF4jP2xELVX8jL8PjqVkwNsBBIPKCxma/65H6rswQqLelOog6HFXg==
X-Received: by 2002:a05:6a00:1487:b0:518:b952:889b with SMTP id
 v7-20020a056a00148700b00518b952889bmr35251150pfu.43.1653919150690; 
 Mon, 30 May 2022 06:59:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a634a62000000b003c14af5063fsm8547501pgl.87.2022.05.30.06.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:59:10 -0700 (PDT)
Message-ID: <89f8258e-2bd2-56d6-cac8-4a69bafbaf30@amsat.org>
Date: Mon, 30 May 2022 15:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] target/mips: Fix df_extract_val() and df_extract_df()
 dfe lookup
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
 <20220503130708.272850-2-shuizhuyuanluo@126.com>
 <4863f69d-0713-6d05-9703-8882ecbb2bfc@linaro.org>
In-Reply-To: <4863f69d-0713-6d05-9703-8882ecbb2bfc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/5/22 17:12, Richard Henderson wrote:
> On 5/3/22 06:07, nihui wrote:
>> From: Ni Hui <shuizhuyuanluo@126.com>
>>
>> Actually look into dfe structure data so that df_extract_val() and
>> df_extract_df() can return immediate and datafield other than BYTE.

Doh my bad again.

Fixes: 4701d23aef ("target/mips: Convert MSA BIT instruction format to 
decodetree")

>> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
>> ---
>>   target/mips/tcg/msa_translate.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/mips/tcg/msa_translate.c 
>> b/target/mips/tcg/msa_translate.c
>> index 76307102f2..aa45bae0aa 100644
>> --- a/target/mips/tcg/msa_translate.c
>> +++ b/target/mips/tcg/msa_translate.c
>> @@ -68,8 +68,8 @@ struct dfe {
>>   static int df_extract_val(DisasContext *ctx, int x, const struct dfe 
>> *s)
>>   {
>>       for (unsigned i = 0; i < 4; i++) {
>> -        if (extract32(x, s->start, s->length) == s->mask) {
>> -            return extract32(x, 0, s->start);
>> +        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
>> +            return extract32(x, 0, s[i].start);
>>           }
>>       }
>>       return -1;
>> @@ -82,7 +82,7 @@ static int df_extract_val(DisasContext *ctx, int x, 
>> const struct dfe *s)
>>   static int df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
>>   {
>>       for (unsigned i = 0; i < 4; i++) {
>> -        if (extract32(x, s->start, s->length) == s->mask) {
>> +        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
>>               return i;
>>           }
>>       }
> 
> Cc: phil
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued to mips-next tree.


