Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867D15C293F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:54:17 +0200 (CEST)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3vM-0002ZU-Lp
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3se-0006Rv-27
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:51:28 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3sX-0000MW-U4
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:51:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id y11so7254711pjv.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=YUf+PFvntlkjitNPeDpIQsm0amzBtLV7TNsDUZyW99I=;
 b=jMGdgrWKUHDnK1ICXvBZ59ncjDpJIrW2IjUSkNhG0VGVR56OMQkHcMLiKEYo4RiCPa
 TpmK/j9hh6h1tLHFDOtwoaps0jNd5I/AlZN4dQc3H1DdmpGIuWAcgaK0EkriNMbiK5yG
 YtnuHf5O6KiMWh1qDHGGI6LkZD7ht5g3nXN1kEK5BYieiNIgwyHaz+EaLak5qKfYHijG
 J0j5V8Chl/aqRpTIbdoboKnZSdNyE63+AjwbwknotTL3Xkf0wMBNpgiUvSxr5f0jsgRO
 IsuIxPzQ88WnGlrVMNY3KvEsCw+pgdTCb+NXrLxlRFj04iAtJgq3iaPoiYGSYCoRewW2
 ZjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=YUf+PFvntlkjitNPeDpIQsm0amzBtLV7TNsDUZyW99I=;
 b=wOM1rok2UKfOQmR2BpXKP7WmsJua21syLVOs1aRDSGYrss6+WoFHszrrOjnqSjt5Km
 L7H7hon9t194bj2qu1YfrFyqdaXNEWzWBJOgQ9Mj145qxyE9JCIYd+b/f1ATU4W503e+
 V/kQoJZppIA8seKsz4enfRDq0QP4K0KpMoA0HpdSMj4sEZGVjg+cKZW0f8cUeaWLHXLd
 4xeauiH/Eq9nv00SuNO+TPNfXl1ohn7OJwWjwgYYCHOxqBN5m7i8haA8PX81lwuniZ+L
 dQYooj8bcU89PAkj2uaMsglZtnnO7wjLvNOZVnDbMQUG0ziis1kPkr1Iyl2nT+zBbAcj
 tz5g==
X-Gm-Message-State: ACrzQf2TyuKAqxZ7Y7amejAxxbnVNKoJdWf8m+nmPO4lP9CvyzvDevlK
 eSVZMsNxYLEjT6dsqR6p8nc=
X-Google-Smtp-Source: AMsMyM7WmPiCOGtbMnoGizXMX/Y6P1LhNXDJWoefehv55HAAciW5lzeaRw4ssg1UQk+xsCyzolxYiA==
X-Received: by 2002:a17:902:6b0a:b0:178:9a17:5b89 with SMTP id
 o10-20020a1709026b0a00b001789a175b89mr5762008plk.113.1663782678388; 
 Wed, 21 Sep 2022 10:51:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a626001000000b0053b9e5d365bsm2417040pfb.216.2022.09.21.10.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 10:51:17 -0700 (PDT)
Message-ID: <13109499-4b19-03eb-d4f2-7ecfd198a1bf@amsat.org>
Date: Wed, 21 Sep 2022 19:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/23] target/i386: Return bool from disas_insn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-3-richard.henderson@linaro.org>
 <b0adb12e-56d7-76ca-0eed-ec4938ffcb58@amsat.org>
 <6f8145a0-b479-5624-3158-18fee240b24c@linaro.org>
In-Reply-To: <6f8145a0-b479-5624-3158-18fee240b24c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 14:14, Richard Henderson wrote:
> On 9/6/22 15:42, Philippe Mathieu-Daudé wrote:
>> On 6/9/22 12:09, Richard Henderson wrote:
>>> Instead of returning the new pc, which is present in
>>> DisasContext, return true if an insn was translated.
>>> This is false when we detect a page crossing and must
>>> undo the insn under translation.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/i386/tcg/translate.c | 42 +++++++++++++++++++------------------
>>>   1 file changed, 22 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
>>> index 1e24bb2985..46300ffd91 100644
>>> --- a/target/i386/tcg/translate.c
>>> +++ b/target/i386/tcg/translate.c
>>> @@ -4665,7 +4665,7 @@ static void gen_sse(CPUX86State *env, 
>>> DisasContext *s, int b)
>>>   /* convert one instruction. s->base.is_jmp is set if the 
>>> translation must
>>>      be stopped. Return the next pc value */
>>> -static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>>> +static bool disas_insn(DisasContext *s, CPUState *cpu)
>>>   {
>>>       CPUX86State *env = cpu->env_ptr;
>>>       int b, prefixes;
>>> @@ -4695,12 +4695,13 @@ static target_ulong disas_insn(DisasContext 
>>> *s, CPUState *cpu)
>>>           return s->pc;
>>
>> Shouldn't we return 'true' here?
> 
> Whoops, yes.

Returning 'true':

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


