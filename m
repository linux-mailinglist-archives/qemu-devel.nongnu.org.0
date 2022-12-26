Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A32A656543
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 23:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9vbo-0001dq-5H; Mon, 26 Dec 2022 17:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p9vbm-0001bd-D6
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 17:06:10 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p9vbk-00056y-EK
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 17:06:10 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 74AE2607B6;
 Tue, 27 Dec 2022 01:06:02 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7302::1:b] (unknown
 [2a02:6b8:b081:7302::1:b])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 16X1D20QpuQ1-4yyNF40M; Tue, 27 Dec 2022 01:06:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1672092361; bh=JxNLpRSxGh6WV7Sil5HK54GoNrkPyRbwduWaq/iuvbE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=1Gx6oW3v98f6j/H3AMPEX5pbCzQJXKP1LptKdyJ/7BZT4ndQHaTYqyZSCY6AHzqv8
 BdVT8+GJ8Rj7xLpboU5QmKSq/EKohOBBlDqvw2c0Zn6qgta7NG6+XYnY0ZAG0QCl3g
 DjAaqXYA7pKcAsOYDt72VjMSWumpsK9wRhAndLB0=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c994400e-d50c-7857-ebc9-846e618afb18@yandex-team.ru>
Date: Tue, 27 Dec 2022 01:06:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] scripts/coverity-scan/model.c: update
 address_space_*_cached
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, armbru@redhat.com, pbonzini@redhat.com
References: <20221223204330.260647-1-vsementsov@yandex-team.ru>
 <ba877dc8-5628-4cb1-dc58-c68972982536@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <ba877dc8-5628-4cb1-dc58-c68972982536@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/24/22 14:22, Philippe Mathieu-Daudé wrote:
> On 23/12/22 21:43, Vladimir Sementsov-Ogievskiy wrote:
>> Make prototypes correspond to their origins. Also drop
>> address_space_rw_cached() which doesn't exist anywhere in the code.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   scripts/coverity-scan/model.c | 15 +--------------
>>   1 file changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
>> index 686d1a3008..b40d0fcbf3 100644
>> --- a/scripts/coverity-scan/model.c
>> +++ b/scripts/coverity-scan/model.c
>> @@ -69,7 +69,6 @@ static void __bufread(uint8_t *buf, ssize_t len)
>>   }
>>   MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
>> -                                      MemTxAttrs attrs,
>>                                         void *buf, int len)
>>   {
>>       MemTxResult result;
>> @@ -80,25 +79,13 @@ MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
>>   }
>>   MemTxResult address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>> -                                MemTxAttrs attrs,
>> -                                const void *buf, int len)
>> +                                       const void *buf, int len)
>>   {
> 
> Oops, missed in commit daa3dda43a ("exec: Let the address_space API use
> void pointer arguments").
> 
>> -MemTxResult address_space_rw_cached(MemoryRegionCache *cache, hwaddr addr,
>> -                                    MemTxAttrs attrs,
>> -                                    void *buf, int len, bool is_write)
>> -{
>> -    if (is_write) {
>> -        return address_space_write_cached(cache, addr, attrs, buf, len);
>> -    } else {
>> -        return address_space_read_cached(cache, addr, attrs, buf, len);
>> -    }
>> -}
> 
> Apparently never required?
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Thanks for reviewing!

Seems, even better patch is possible, we can get rid of the whole physmem-related modelling, look at "[PATCH] coverity: physmem: use simple assertions instead of modelling".


-- 
Best regards,
Vladimir


