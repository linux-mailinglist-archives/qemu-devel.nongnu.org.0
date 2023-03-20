Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070C6C13E8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:47:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFrL-0006ZG-BZ; Mon, 20 Mar 2023 09:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFrI-0006Yt-S4
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:47:32 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFrH-0005If-4g
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:47:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id y14so10413809wrq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679320044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=issrWhWxlumlWILR//l08NRcX1QmWeSPROM7hvZL8fU=;
 b=VG4SCy9juTPWuqnEthIQZEP0YJeVFL52THQHz3wQlhjT5aNUaq3OmdQz+dW14/AdzL
 yQb1rhk8NUGbS7m1pAAi3YTen4ZhIYSAqvIZcEdjWjbCqKxWKtjZN9QLYi0kE25/Vrwr
 YBVR+TForB5uz/jSx5KQsdUbDFK/rgJomJCdu/zfbXfsWSEDa5/4PxFpSVOIWqlOwxCS
 +CBIqsp49SiL3a01EQGJA7LHhTOEBlZQGUjdPmiyWYeGJwHZo0kRZHXqcGMhBsx5RI1P
 x8q1gWcrIRSixue2BzL5g0agTEsZXbkK8hs25AnmfNQIqZLoRXD8OLeMWznTS72VBOIL
 xW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679320044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=issrWhWxlumlWILR//l08NRcX1QmWeSPROM7hvZL8fU=;
 b=VqMaWhyGkGYVnX6Tdn4n1qFLWHOb65PPSoU9c1H4xAD5+OVYRKWUj+JHE0VfKcTR1n
 KT9ked1GSRKwrUuhPTt1JXSo8NkLlPir2fYdzs+efSuSdYUMRedf07w474TB5OJ2v+Mg
 igHl5rLvVijSTw3eYiD/4CV7BMaqPwm295/IREpUQtBAaKyvhkD2FaaCOTnJY57wYz/6
 MYJrVeWYv0Hcoaq8bz7N0RA9pzoTBA1zoQsCzbsTUndPxzkM/3xwO/lW6R8hfjdkqP2e
 BpXstlxhXEWreutoKPY9W7ijkkpAy5vaXVA6uL9/1GWurF4UzPhIFb3x4Lssta4P50jH
 ouow==
X-Gm-Message-State: AO0yUKVExnypOuozVCSNPLkhPPcMjhkeevih+5duYGjLmf7hLcw5zl6w
 gqIADTBneyHrKH7Ozqt/xoRlNgnW4qDCeP7ZpQx8gg==
X-Google-Smtp-Source: AK7set9bMEKkaDyGJy7DS0v+IbwIJ9bvU6p2X+5NWWPlHS4HaQFhUBdYoGhv1auKtdrHaf7riEj+Ug==
X-Received: by 2002:a5d:490f:0:b0:2d4:766d:e02f with SMTP id
 x15-20020a5d490f000000b002d4766de02fmr6458509wrq.59.1679320043851; 
 Mon, 20 Mar 2023 06:47:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j6-20020a5d5646000000b002d2f0e23acbsm8962436wrw.12.2023.03.20.06.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 06:47:23 -0700 (PDT)
Message-ID: <42cc3cee-b148-aab0-cfd5-a684ce55d7f6@linaro.org>
Date: Mon, 20 Mar 2023 14:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] qemu/osdep.h: Do not declare function prototypes
 using extern keyword
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Sebastian Wilhelmi <wilhelmi@google.com>,
 Eric Blake <eblake@redhat.com>, Sebastian Wilhelmi <seppi@seppi.de>,
 =?UTF-8?Q?Simon_W=c3=b6rner?= <contact@simon-woerner.de>
References: <20230320131426.16348-1-philmd@linaro.org>
 <ZBhfRmJc0M93s1F5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZBhfRmJc0M93s1F5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/3/23 14:27, Daniel P. Berrangé wrote:
> On Mon, Mar 20, 2023 at 02:14:26PM +0100, Philippe Mathieu-Daudé wrote:
>> By default, C function prototypes declared in headers are visible,
>> so there is no need to declare them as 'extern' functions. Remove
>> this redundancy. This also fixes when building under MSYS2:
>>
>>    C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: standard attributes in middle of decl-specifiers
>>    1075 | # define G_NORETURN [[noreturn]]
>>          |                     ^
>>    C:/msys64/code/qemu/src/include/qemu/osdep.h:240:8: note: in expansion of macro 'G_NORETURN'
>>    240 | extern G_NORETURN
>>          |        ^~~~~~~~~~
>>
>> Reported-by: Simon Wörner <contact@simon-woerner.de>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541
> 
> There's already a fix for that issue included in a PULL request from
> Thomas:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05225.html

Not the same patch. I'll rebase and post for 8.1 then I guess :)

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/qemu/osdep.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index f68b5d8708..79c26c748a 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -237,7 +237,7 @@ extern "C" {
>>    * supports QEMU_ERROR, this will be reported at compile time; otherwise
>>    * this will be reported at link time due to the missing symbol.
>>    */
>> -extern G_NORETURN
>> +G_NORETURN
>>   void QEMU_ERROR("code path is reachable")
>>       qemu_build_not_reached_always(void);
>>   #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
>> -- 
>> 2.38.1
>>
> 
> With regards,
> Daniel


