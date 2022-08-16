Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F7594A03
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:16:34 +0200 (CEST)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkG1-0006z0-GA
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkDv-0005O9-Bq
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:14:23 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkDs-0001NC-TK
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:14:23 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so8136500pjf.5
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=v8FAIBUT0y2E9lOj1EXqYC1Qphtay/r5eQzUJ96syJI=;
 b=S47xyi+/13hn+Ek8TRbnQdDilfZqCyUWSwjqSkusdKbk+K9rB+DHKjPrAK1HuhhDeU
 gVLW+r0VlCcx6D1JEbWE8a8ztjY7+3opY9+VljBNCMlafyOKTvkobMQqZHG28AyQNvkN
 G8GIeSiI+TujAsYDLWFNEDlF2YhdJSil3rAKXgEsUMxxOUXxcqnRwVggUVUt0JaGvXda
 44ZpG02xWwuwP5iTXKOja5e66geAxkDqh25jECEOXFbBH8Dc2IxA5F5tkDCJWH3LEuPe
 zGP/uuKnFBiywe0LIeWywsHKUvrTBTbPRSDJXxsCC27RKiDfOCIApvLJR0u1mJfnYL4G
 5yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=v8FAIBUT0y2E9lOj1EXqYC1Qphtay/r5eQzUJ96syJI=;
 b=pLSVz4QfQoI0NAhGl0SjOgr/NfRFz7V4HVqqvYLWAWmqvuUrOhDRJyh9EFEq4V5mYB
 JqpfmWVWJcvX+HK8SxCBqRbkVBwxPaaihTs96NdHIpLOvOylqbPYAZhMI0tN2j9HpruX
 bBY1qvnbN698o4VRHskNxr85goIvp60u+XbjeKB+Tv3RC8Ieys9Z/A1S4bHfheKXqZSY
 d3KpG6F5KVqiUDAuO36yhmQcAVX27tFO5AxuMJnCFnyNZ7tNEO676cnLdRzX9tRKkjLG
 yKsWtc+DnMbXayT+1xw99ie6NpB0z/6B3lgpGat/UWALt57tjpIN4AMGewAqMUapmLaW
 iG1w==
X-Gm-Message-State: ACgBeo3p67CUViA0ytLu+YKRWPa6Th+C9UcvKpmgDfSiRQr0aIXejjlk
 CN7oOga9ksV+5XaX//JNZz4=
X-Google-Smtp-Source: AA6agR4ebAlF9jhiQhMsCe+QBavHmUWRS7m3gsNJWUaRYMYdpnLoX//ym6t5mVAbDrbkW+2Ma7EpiQ==
X-Received: by 2002:a17:902:f7c6:b0:16d:c795:d43e with SMTP id
 h6-20020a170902f7c600b0016dc795d43emr19512852plw.162.1660608859550; 
 Mon, 15 Aug 2022 17:14:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c13-20020aa7952d000000b0053253b63e21sm7075255pfp.3.2022.08.15.17.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:14:19 -0700 (PDT)
Message-ID: <46a75f64-07a3-9f9b-3651-d2431966b191@amsat.org>
Date: Tue, 16 Aug 2022 02:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 05/20] disas/nanomips: Remove __cond methods from class
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-6-milica.lazarevic@syrmia.com>
 <45cd1f33-7d72-26ce-55ed-66901bfe3675@amsat.org>
 <46ac960d-bc92-05e3-37af-7ce371e6cf00@redhat.com>
In-Reply-To: <46ac960d-bc92-05e3-37af-7ce371e6cf00@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
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

On 15/8/22 16:20, Thomas Huth wrote:
> On 15/08/2022 13.07, Philippe Mathieu-Daudé wrote:
>> On 15/8/22 09:26, Milica Lazarevic wrote:
>>> NMD class methods with the conditional_function type like
>>> NMD::ADDIU_32__cond, NMD::ADDIU_RS5__cond, etc. are removed from the NMD
>>> class. They're now declared global static functions. Therefore, typedef
>>> of the function pointer, conditional_function is defined outside of the
>>> class.
>>>
>>> Now that conditional_function type functions are not part of the NMD
>>> class we can't access them using the this pointer. Thus, the use of
>>> the this pointer has been deleted.
>>>
>>> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
>>> ---
>>>   disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
>>>   disas/nanomips.h   | 14 ++------------
>>>   2 files changed, 23 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
>>> index 039c353d0b..9e720d0e8d 100644
>>> --- a/disas/nanomips.cpp
>>> +++ b/disas/nanomips.cpp
>>> @@ -787,7 +787,7 @@ int NMD::Disassemble(const uint16 * data, 
>>> std::string & dis,
>>>               if ((op_code & table[i].mask) == table[i].value) {
>>>                   /* possible match */
>>>                   conditional_function cond = table[i].condition;
>>> -                if ((cond == 0) || (this->*cond)(op_code)) {
>>> +                if ((cond == 0) || (cond)(op_code)) {
>>
>> QEMU C style is more like this:
>>
>>                     if ((cond == NULL) || cond(op_code)) {
>>
>>>                       try
>>>                       {
>>>                           if (table[i].type == pool) {
>>
>>> diff --git a/disas/nanomips.h b/disas/nanomips.h
>>> index a795ed44e8..0e6670adf5 100644
>>> --- a/disas/nanomips.h
>>> +++ b/disas/nanomips.h
>>> @@ -31,6 +31,8 @@ typedef uint32_t uint32;
>>>   typedef uint16_t uint16;
>>>   typedef uint64_t img_address;
>>> +typedef bool(*conditional_function)(uint64 instruction);
>>
>> Please add a space before the returned type. I'd rather
>> prefix functions extracted from the NMD class with `nmd_`:
> 
> But adding a prefix will also increase the size of the patches quite a 
> bit (well, maybe not for this identifier here, but certainly for some 
> other spots), so I think it's fair to keep it without prefix here, too. 
> Just my 0.02 €.

The typedef is moved from the header to the source file in patch #9,
so OK.

