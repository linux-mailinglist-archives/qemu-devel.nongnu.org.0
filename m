Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432564C72C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:32:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5P0F-0003m1-1n; Wed, 14 Dec 2022 05:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5P09-0003kA-Hx
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:28:38 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5P07-0003UJ-Qq
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:28:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id m19so10871709wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OUfS1MIQik5mqCoblSgVuhJyVfoPiv1HTdLoCE1zGVc=;
 b=hSjddNxbq77bzw9gW91e+eUBsPnzibLjx3JTnyKmqypoNiKhE9CqqdTszKLfBVBfqf
 ZvqD7wO0OrxtTtnPoVoTvTzhZH7gHRYCQYPBGv3pMD/cgB/ype04enHH9TZ7EnC/Jsrw
 DD10iruAfocmVQdyVbN1Ydx91xE+sxZlHXqrAD5CgyFJ/7TgHxf6AMQWutid1sgXr1HO
 ghgTASPKcDmiXyMNuBWTbyJtatRYZdNcml2+70NEkUY4NZGihxioiEzgww5AYw9noV2u
 OWtWP3vY8m2IviGTAKN63+HrIHiu9x4dWbpsrxINUgMtEJJfQhQwAoelm01Q/YU53Nxv
 18/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OUfS1MIQik5mqCoblSgVuhJyVfoPiv1HTdLoCE1zGVc=;
 b=jX4jQvytEwN5XsmmAlggYbeV1k43Wj2oGh8LST4F4OUd6ITyfnWZA1rlDQLJRqS8Rs
 0Q0Zoj2dpcuCZpIudW5l6Ooni5NuUmXm5HH3+akPMzchY1kArSK/m6EXEPDzDuoT3LUF
 r4hjOD5Iv2e/C5ajBDcnhxfcU+OaVKeVZYVKEs3gcJkz+Z2yBUiTJNOSA8PHUF8BzlnA
 Hm1Vi4j8cta4gaJswyk7MsMxnVzq2IECAxagbFkZsm718NP+KMip5qkhrmF6lMtIIIss
 uxsSxJUMJ+4U3VIKbWe8wZvoHSoem4BDBtxM/M4YgPe6HY0L2r5g4WSYbM8jbB79m9aK
 Md/g==
X-Gm-Message-State: ANoB5pm1KJDF1suMkSA2CZbjYooZFM61QVMWWxvzGD6qPbdZrOtoqzxa
 gmxA6A0k04M2rK7mbN18fJ40Lw==
X-Google-Smtp-Source: AA0mqf4d20bf1+p8jDnnlf0aMN/ykO4Pg0aFH0OXuzusPZQoCZhv1L6aABmPDsy/oUqDysiD0pRg/w==
X-Received: by 2002:a05:600c:4d21:b0:3d2:29b7:abac with SMTP id
 u33-20020a05600c4d2100b003d229b7abacmr7597234wmp.26.1671013714475; 
 Wed, 14 Dec 2022 02:28:34 -0800 (PST)
Received: from [192.168.89.175] (91.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.91]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c510300b003cfa3a12660sm8226445wms.1.2022.12.14.02.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 02:28:34 -0800 (PST)
Message-ID: <26516050-1599-7a66-ebff-d7844c128b5f@linaro.org>
Date: Wed, 14 Dec 2022 11:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> include
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org
References: <20221125175532.48858-1-philmd@linaro.org>
 <87mt7qmn6s.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87mt7qmn6s.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 14/12/22 08:58, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> qemu_co_mutex_assert_locked() calls qatomic_read(), which
>> is declared in <qemu/atomic.h>. This fixes when refactoring:
>>
>>    In file included from include/qemu/osdep.h:113,
>>                     from ../../util/error-report.c:13:
>>    include/qemu/coroutine.h: In function 'qemu_co_mutex_assert_locked':
>>    include/qemu/coroutine.h:182:12: error: implicit declaration of function 'qatomic_read' [-Werror=implicit-function-declaration]
>>      182 |     assert(qatomic_read(&mutex->locked) &&
>>          |            ^~~~~~~~~~~~
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/qemu/coroutine.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
>> index 89650a2d7f..1750c30d8e 100644
>> --- a/include/qemu/coroutine.h
>> +++ b/include/qemu/coroutine.h
>> @@ -17,6 +17,7 @@
>>   
>>   #include "qemu/queue.h"
>>   #include "qemu/timer.h"
>> +#include "qemu/atomic.h"
>>   
>>   /**
>>    * Coroutines are a mechanism for stack switching and can be used for
> 
> I think this papers over the actual problem.
> 
> Compiling qemu/coroutine.h by itself succeeds for me.  Printing headers
> with -H shows:
> 
>      [osdep.h and everything it includes elided...]
>      . ../include/qemu/coroutine.h
>      .. /work/armbru/qemu/include/qemu/queue.h
>      .. /work/armbru/qemu/include/qemu/timer.h
>      ... /work/armbru/qemu/include/qemu/bitops.h
>      .... /work/armbru/qemu/include/qemu/host-utils.h
>      ..... /work/armbru/qemu/include/qemu/bswap.h
>      ...... /usr/include/byteswap.h
>      ....... /usr/include/bits/byteswap.h
>      ..... /work/armbru/qemu/include/qemu/int128.h
>      .... /work/armbru/qemu/include/qemu/atomic.h
>      [more...]
> 
> So, qemu/coroutine.h *already* includes qemu/atomic.h, via qemu/timer.h
> and qemu/bitops.h.

Well I'm not sure this implicit dependency is correct, since 
"coroutine.h" explicitly access a function declared in "atomic.h";
if I want to modify "qemu/timer.h" or "qemu/bitops.h" I'm back to
this very patch.

> I suspect the actual problem is an inclusion loop: qemu/coroutine.h and
> qemu/lockable.h include each other.  See my
> 
>      Subject: [PATCH 4/4] coroutine: Break inclusion loop
>      Message-Id: <20221208142306.2642640-5-armbru@redhat.com>
> 
> and Paolo's review.

So I guess I'll wait your series to get merged and see what happens
when I rebase my work on yours.

Thanks,

Phil.

