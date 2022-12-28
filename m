Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE016585C6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 19:29:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAb9I-0002Sj-Go; Wed, 28 Dec 2022 13:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAb9G-0002SY-Jw
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:27:30 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAb9E-0008L8-Pz
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:27:30 -0500
Received: by mail-ed1-x532.google.com with SMTP id i15so23876048edf.2
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wsc4WpHROor2Sf7/YDFnMXIz5pGd2T8RZa90vbXGJcI=;
 b=B8tbZrKEPYLbhIeGjfmytg0hAuX7kMPxXruDKG4+iHKwUu0GNOVzUKav3jmbhkAErb
 3I5k0TIUbuTUZ81JoZT6cUwrf6pj/FjWt0GAXC2CPRDn6MBUe8bLOJ4KVkTWg+c771Im
 tmv5AgKaq8lquafgaRskOvShFaqhWbFldv1+vzX3GqmXahbhFT9VOh5mFWFfUp414WJ/
 WABW816gtXQEM9vX9gM/W5kuIKnVWrZGqnIAIGTpsIG//iRZv/vgsvqjLrBl9mRckW7X
 tUdwDLWtPYAi6uBlhx5lBZyFj/i6pUlgYxwvAZqGe5uTWKzTyKIoU4Gaob80Nrl/109W
 6Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wsc4WpHROor2Sf7/YDFnMXIz5pGd2T8RZa90vbXGJcI=;
 b=Z8TnbAG5fRRS9XoLtOlE3zxtCcnTHhmdZ116d31OgGKQgwqnNSytObCCeNF2/kqlTE
 s7/lSmvJU3TbAYkAUmr3IZvfiZe2Q5l0D9i6W2G5MEpF8Rn92+viTFyyEi9Z+bgWaXRk
 R7AKTek/ljBHvmnA3KdbyQh64GP4JsQ3GHSpzbLydRuzsvSvZuvgb3UPfzgo2B2fLA+D
 kHUiCe2CRIe4ujjlFQomjBnT13aX4PHG/CFDf+UYkbVyzQbeeBMCGhyyM4lueA+7fP5q
 574exfYe2kIdu/3F47ARx0qMEciUonJnXCidFbYAjOHL6muSWpspbky/D1Du/gFjBcB2
 oVIg==
X-Gm-Message-State: AFqh2kr86ejCZIxPcn/F+idNizeMWxP4WnzovDXxxq/6rJg0q63K44Ml
 niUoJ7oCP+87z23p+E1t3OMx1Q==
X-Google-Smtp-Source: AMrXdXvYjEeGocNxVQw3vJSDqKKp/2wQNyh7Fd2Crpq73eAeUDdN4DYp7pTrMOyMKQSF27uBv9SAkg==
X-Received: by 2002:a05:6402:f02:b0:46f:a2c2:405b with SMTP id
 i2-20020a0564020f0200b0046fa2c2405bmr28951479eda.37.1672252046595; 
 Wed, 28 Dec 2022 10:27:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a17090630db00b00782ee6b34f2sm7634602ejb.183.2022.12.28.10.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 10:27:26 -0800 (PST)
Message-ID: <376567a3-bf28-4faf-4ca7-11d467c826ed@linaro.org>
Date: Wed, 28 Dec 2022 19:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] accel/tcg: Handle false negative lookup in
 page_check_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-4-richard.henderson@linaro.org>
 <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
 <eba7c0ee-96dc-928d-b2a2-19fc46dbb8f4@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <eba7c0ee-96dc-928d-b2a2-19fc46dbb8f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/12/22 18:36, Richard Henderson wrote:
> On 12/27/22 23:24, Philippe Mathieu-Daudé wrote:
>> On 24/12/22 16:18, Richard Henderson wrote:
>>> As in page_get_flags, we need to try again with the mmap
>>> lock held if we fail a page lookup.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   accel/tcg/user-exec.c | 39 ++++++++++++++++++++++++++++++++-------
>>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>>> index 2c5c10d2e6..c72a806203 100644
>>> --- a/accel/tcg/user-exec.c
>>> +++ b/accel/tcg/user-exec.c
>>> @@ -525,6 +525,7 @@ void page_set_flags(target_ulong start, 
>>> target_ulong end, int flags)
>>>   int page_check_range(target_ulong start, target_ulong len, int flags)
>>>   {
>>>       target_ulong last;
>>> +    int locked, ret;
>>
>> have_mmap_lock() returns a boolean, can we declare 'locked'
>> as such, ...
>>
>>>       if (len == 0) {
>>>           return 0;  /* trivial length */
>>> @@ -535,42 +536,66 @@ int page_check_range(target_ulong start, 
>>> target_ulong len, int flags)
>>>           return -1; /* wrap around */
>>>       }
>>> +    locked = have_mmap_lock();
>>>       while (true) {
>>>           PageFlagsNode *p = pageflags_find(start, last);
>>>           int missing;
>>>           if (!p) {
>>> -            return -1; /* entire region invalid */
>>> +            if (!locked) {
>>> +                /*
>>> +                 * Lockless lookups have false negatives.
>>> +                 * Retry with the lock held.
>>> +                 */
>>> +                mmap_lock();
>>> +                locked = -1;
>>
>> ... skip this confusing assignation, ...
>>
>>> +                p = pageflags_find(start, last);
>>> +            }
>>> +            if (!p) {
>>> +                ret = -1; /* entire region invalid */
>>> +                break;
>>> +            }
>>>           }
>>>           if (start < p->itree.start) {
>>> -            return -1; /* initial bytes invalid */
>>> +            ret = -1; /* initial bytes invalid */
>>> +            break;
>>>           }
>>>           missing = flags & ~p->flags;
>>>           if (missing & PAGE_READ) {
>>> -            return -1; /* page not readable */
>>> +            ret = -1; /* page not readable */
>>> +            break;
>>>           }
>>>           if (missing & PAGE_WRITE) {
>>>               if (!(p->flags & PAGE_WRITE_ORG)) {
>>> -                return -1; /* page not writable */
>>> +                ret = -1; /* page not writable */
>>> +                break;
>>>               }
>>>               /* Asking about writable, but has been protected: undo. */
>>>               if (!page_unprotect(start, 0)) {
>>> -                return -1;
>>> +                ret = -1;
>>> +                break;
>>>               }
>>>               /* TODO: page_unprotect should take a range, not a 
>>> single page. */
>>>               if (last - start < TARGET_PAGE_SIZE) {
>>> -                return 0; /* ok */
>>> +                ret = 0; /* ok */
>>> +                break;
>>>               }
>>>               start += TARGET_PAGE_SIZE;
>>>               continue;
>>>           }
>>>           if (last <= p->itree.last) {
>>> -            return 0; /* ok */
>>> +            ret = 0; /* ok */
>>> +            break;
>>>           }
>>>           start = p->itree.last + 1;
>>>       }
>>> +
>>> +    if (locked < 0) {
>>
>> ... and check for !locked here?
> 
> No, we may have entered with mmap_locked.  Only unlocking if the lock 
> was taken locally.

Oh, so you are using this variable as tri-state?

