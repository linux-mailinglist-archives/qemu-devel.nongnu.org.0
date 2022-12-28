Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A406576B2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVvu-0003rV-6n; Wed, 28 Dec 2022 07:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVvs-0003pZ-Fz
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:53:20 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVvq-0005DM-Oc
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:53:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id d4so6875911wrw.6
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rxfc7CW7oGNzp0VzsOMpC41WaHXJV/KUX7YgFZe3gOk=;
 b=kJvfWqqPUBuhzfFraX2X46Vcz8Uy98XQypUd9lkDH9hcSWzfvrUwwueFAM8C2NKm/i
 5PdSokC61nsk/qUv/ZupAVTOi9MMoWGRXHTKrgRFeFMVDtujsAGI/pEbYUeurimn0IKe
 DfFtXSWBDKjpexObrP8PFcjOxTEfmXBwjy6bdCpuv5mZWP0PdPIi7HhNi/vUDxnPxvPJ
 nEVUpB3MBIKbEFdQ1KPmWbk8sFDFMNDejM+xn/w5/4J8qWptkrq+JZcAoYmTSXm8eXO/
 NRGb+T6HWij+s8BqE1CRfH+5LnseKmIi23kkvPhKYyRKzSQV+Ox/PXZMFqW6vdOXQeIs
 9Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rxfc7CW7oGNzp0VzsOMpC41WaHXJV/KUX7YgFZe3gOk=;
 b=4gdTtwGTrj8aoaq+Jw4iMJenTqC2q9ourBq1l/YjxqO1/HIhWDxuyyjXW8u1WGmW+u
 qyK8dLAcBLtA5TwQkq+VBUIrdfHfCEm4FQ65sj7URGIpxvRlO5WSktnLGyi+jv0YGQaQ
 CgfSmazqwQvbCGxm4Ld8+JFpRcJfrSNw/CYQVqXDgxnl7mp647XLA5ORxvmHpBKcK8iv
 gWiYQOuPVlUU5d1JGcSiWhlbnfVtlOwuIxYHsw0E9bGBJ23ibtc4gHr4lY/x25qxLy73
 G47/Bpar95pRJW20QVsfTuuH3y8TK3jW5wmTjoBt1HUdP1VRTEZ1TXoZx1OaqanyZxZq
 l04w==
X-Gm-Message-State: AFqh2kryzRTT6dkaRUqHO6tjtkzrfoTPIeYUkH0eiofIA39FujSD7ECD
 8aO9djPuD2VZA2Rw+hu1ylk17w==
X-Google-Smtp-Source: AMrXdXvJwXx5fSowJYHzDA5VCWg/fucyw5O1AmsKiYLBQMk7G5SUzxeBo0kOvPTovHtFLlljQw3PbA==
X-Received: by 2002:a5d:4687:0:b0:289:552f:ed16 with SMTP id
 u7-20020a5d4687000000b00289552fed16mr712004wrq.34.1672231997020; 
 Wed, 28 Dec 2022 04:53:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e13-20020adfe7cd000000b0027f9f073211sm6775933wrn.65.2022.12.28.04.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:53:16 -0800 (PST)
Message-ID: <5df82542-3f5c-402c-3b59-1dc61c47da3e@linaro.org>
Date: Wed, 28 Dec 2022 13:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] accel/tcg: Handle false negative lookup in
 page_check_range
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-4-richard.henderson@linaro.org>
 <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
In-Reply-To: <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 28/12/22 08:24, Philippe Mathieu-Daudé wrote:
> On 24/12/22 16:18, Richard Henderson wrote:
>> As in page_get_flags, we need to try again with the mmap
>> lock held if we fail a page lookup.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/user-exec.c | 39 ++++++++++++++++++++++++++++++++-------
>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>> index 2c5c10d2e6..c72a806203 100644
>> --- a/accel/tcg/user-exec.c
>> +++ b/accel/tcg/user-exec.c
>> @@ -525,6 +525,7 @@ void page_set_flags(target_ulong start, 
>> target_ulong end, int flags)
>>   int page_check_range(target_ulong start, target_ulong len, int flags)
>>   {
>>       target_ulong last;
>> +    int locked, ret;
> 
> have_mmap_lock() returns a boolean, can we declare 'locked'
> as such, ...
> 
>>       if (len == 0) {
>>           return 0;  /* trivial length */
>> @@ -535,42 +536,66 @@ int page_check_range(target_ulong start, 
>> target_ulong len, int flags)
>>           return -1; /* wrap around */
>>       }
>> +    locked = have_mmap_lock();
>>       while (true) {
>>           PageFlagsNode *p = pageflags_find(start, last);
>>           int missing;
>>           if (!p) {
>> -            return -1; /* entire region invalid */
>> +            if (!locked) {
>> +                /*
>> +                 * Lockless lookups have false negatives.
>> +                 * Retry with the lock held.
>> +                 */
>> +                mmap_lock();
>> +                locked = -1;
> 
> ... skip this confusing assignation, ...
> 
>> +                p = pageflags_find(start, last);
>> +            }
>> +            if (!p) {
>> +                ret = -1; /* entire region invalid */
>> +                break;
>> +            }
>>           }
>>           if (start < p->itree.start) {
>> -            return -1; /* initial bytes invalid */
>> +            ret = -1; /* initial bytes invalid */
>> +            break;
>>           }
>>           missing = flags & ~p->flags;
>>           if (missing & PAGE_READ) {
>> -            return -1; /* page not readable */
>> +            ret = -1; /* page not readable */
>> +            break;
>>           }
>>           if (missing & PAGE_WRITE) {
>>               if (!(p->flags & PAGE_WRITE_ORG)) {
>> -                return -1; /* page not writable */
>> +                ret = -1; /* page not writable */
>> +                break;
>>               }
>>               /* Asking about writable, but has been protected: undo. */
>>               if (!page_unprotect(start, 0)) {
>> -                return -1;
>> +                ret = -1;
>> +                break;
>>               }
>>               /* TODO: page_unprotect should take a range, not a 
>> single page. */
>>               if (last - start < TARGET_PAGE_SIZE) {
>> -                return 0; /* ok */
>> +                ret = 0; /* ok */
>> +                break;
>>               }
>>               start += TARGET_PAGE_SIZE;
>>               continue;
>>           }
>>           if (last <= p->itree.last) {
>> -            return 0; /* ok */
>> +            ret = 0; /* ok */
>> +            break;
>>           }
>>           start = p->itree.last + 1;
>>       }
>> +
>> +    if (locked < 0) {
> 
> ... and check for !locked here?
> 
>> +        mmap_unlock();
>> +    }
>> +    return ret;
>>   }

Modulo using a boolean:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



