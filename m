Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F836531176
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:01:04 +0200 (CEST)
Received: from localhost ([::1]:58040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9YN-0008DY-Kx
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nt9Vg-0006H8-GH
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:58:18 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nt9Vd-0007EO-SO
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:58:16 -0400
Received: by mail-pf1-x432.google.com with SMTP id y199so13925652pfb.9
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8drOiZKEgFbFB9FvgeCTB0n8/3CkfMepgeRtUB8JT7w=;
 b=Db+agOjOGdjgVhGFcTt2IH4pn8pF/oWigzRQiWNIn6WDDzGv8LaI0uuvPhmx9ThBuE
 forvh/vvwocBzbWzNqgP6hWH/772eaauO7vhSpWW1Ivgokjsb3HYKsKMTl1dhq/a7hLZ
 r1WqtabveqELfGcmYzj1IFiVL0FOHLN1bNcj8CHtaWKQFkzcfAnOlP2GVybz5aH5cYLB
 xexGHK0INzShbHxJVGTAn0er55H8hKxb907bt675rKTLTFb8+9fke9vM6iTK9PvagV8k
 XtYfcAJCQuzrShST7DZtRAqCnYN20twPbM3rFQBT06qhJxa+R8/Kmpk3LskhB9AoAIKo
 41ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8drOiZKEgFbFB9FvgeCTB0n8/3CkfMepgeRtUB8JT7w=;
 b=7SChkOYhmb1XK//592ICeUIpEY2rRWl6N0gd8LsnZVEhHCWT3E4Fzup6jrrk9QgcGJ
 O9A5V9+/GW1+wHOTU6JUsAELrFmn1Vifb5uzNSIjT+wsKOibmZjKTYZEA1PXJBrOsFCz
 9trKhSI8Ps88ouxfBtLlrjIL3U+mqN4dX4vDx3jOCdbIeVwIqWij0ydwGE9Sv8XRFpT3
 ZZ5ex1YRKE1UuYJhM378rALJIOsUXtmJhm3+HUOHSgTPRWT/MGraoDilazGljc23u1ju
 5+LSvmzS8vuj5SWojKwqqLwYW6uURnohbBrdxLyKdmNNBvfVxjXWjxdSufxnhY8hUcAI
 7Leg==
X-Gm-Message-State: AOAM531trZKgDrmxEnJiB9zptGjGIRcCZIf1w3tZSZdr6om6cf+XKZ2t
 vmle6ixror0cz86Qekpxs00VcA==
X-Google-Smtp-Source: ABdhPJzJczySbVKrMhphIFjEVuORqBnrDWJwdoLhqVIy8ji5iYeog0n1QWimQhLnyRG71YL7wdKg5g==
X-Received: by 2002:a63:d10a:0:b0:3c6:c6e0:9b1e with SMTP id
 k10-20020a63d10a000000b003c6c6e09b1emr20855306pgg.410.1653317891415; 
 Mon, 23 May 2022 07:58:11 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a170902f1d300b001617541c94fsm5217368plc.60.2022.05.23.07.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 07:58:10 -0700 (PDT)
Message-ID: <763bccc7-ca4e-aa6d-730f-90e0cc806cf4@linaro.org>
Date: Mon, 23 May 2022 07:58:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 08/49] semihosting: Inline set_swi_errno into
 common_semi_cb
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-9-richard.henderson@linaro.org>
 <CAFEAcA8oja0sCwyCZgmCMW-y7fXTGhYrOvZAyz4LHtPH9CKzLw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8oja0sCwyCZgmCMW-y7fXTGhYrOvZAyz4LHtPH9CKzLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/23/22 03:58, Peter Maydell wrote:
> On Sat, 21 May 2022 at 01:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Do not store 'err' into errno only to read it back immediately.
>> Use 'ret' for the return value, not 'reg0'.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   semihosting/arm-compat-semi.c | 19 ++++++++++---------
>>   1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index c6bfd4d1ba..b00ed2c6d1 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -290,28 +290,29 @@ static target_ulong common_semi_syscall_len;
>>
>>   static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>>   {
>> -    target_ulong reg0 = common_semi_arg(cs, 0);
>> -
>>       if (ret == (target_ulong)-1) {
>> -        errno = err;
>> -        set_swi_errno(cs, -1);
>> -        reg0 = ret;
>> +#ifdef CONFIG_USER_ONLY
>> +        TaskState *ts = cs->opaque;
>> +        ts->swi_errno = err;
>> +#else
>> +        syscall_err = err;
>> +#endif
>>       } else {
>>           /* Fixup syscalls that use nonstardard return conventions.  */
>> +        target_ulong reg0 = common_semi_arg(cs, 0);
> 
> This should be "ret = ", right? (Otherwise I think this fails to
> compile. I assume that some later patch has this fix in it.)

Eh?  No, we're extracting argument reg 0, and then switching on it.
Why would it not compile -- I've moved the whole declaration down.


r~


> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


