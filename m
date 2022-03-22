Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4B4E3A02
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:01:33 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZSO-0006Tp-O8
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:01:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWZKu-00024H-40
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:53:48 -0400
Received: from [2a00:1450:4864:20::42b] (port=35490
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWZKs-0004XI-49
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:53:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v22so9794443wra.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HawULAcIkpizdOROzR2kzBjIf1cjgqjhDGBSTZzzU94=;
 b=k2/R9jNAXJ4gs0lEOrIdhuxZgWq+D5XpUe0YkyTskIo3mK5tjksRaJteOko8EjuV4O
 NWXxDoBYZYc0O0Yy39PizG3yeJkOph3iA8oCpFm+j7exMBflIWYzollAr7MXBoqzOatg
 iW8wuIsqHSXEgVWyp6AwmdG9qQ1CrPC6Ggj0/RDmBGXhJirqYXzqrgWaLaEyqbRxr2Sv
 W+upHGjUpza3QMfVpNLbM5dsQaCm1uV/1npM6ohGRnUEVn+iLH5cAm58fsAi2dwSFEqd
 1V/I5Y3btCxAr4A4cgqPdaNnqnr45kkhDcxztXkpwjyTFRGGQERN+hGDAqbRqQfcdHrE
 A0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HawULAcIkpizdOROzR2kzBjIf1cjgqjhDGBSTZzzU94=;
 b=gFap9ZnlZQh1Z7q79Y57hr2tWJWWcfIynZWLgPKT1j7lDnzoSMWXr8aeQnNfv5gfTk
 dGTJuo3Imu/RYyGXhVtTvdHprGs5BY2nNgtgzPT3KXfHZu6BjOwS2NuKNeH9Ia5yrdiq
 3i7Xo3Jb5fmdQvm3vLaT2jzna1XXmhCAMZ6GMuo98pgUQreW2xAzG9stQPWkB5hhPPTv
 wc+ST1UashKhcW4uWJBv5++6Ir+GOHzy/S8Z/BDxJ/Teb6RaU6M+yBzqYU+lLMf4RpRl
 lNLN4jdMjX500VN6qX1UEhUjV4ZxWFtbi/n/aH6zjAIZAcMn+hkjlNDGmmA0AS3xxO/Z
 iLzw==
X-Gm-Message-State: AOAM531hpGJFHtc7N2rMy0cUfUAWLyfDGO1/898sov5Fwk6soFPgj/Gx
 si3PNg4rT5c/o5b6xHj3PW0=
X-Google-Smtp-Source: ABdhPJy7GcrS8Rlz0DgR+EjT9snK7l/RX48vEICRA6i2TyRe2T3xoTVo3Q+BXeB30iRdTcQHTOMLbQ==
X-Received: by 2002:a05:6000:1566:b0:204:20d9:a5b0 with SMTP id
 6-20020a056000156600b0020420d9a5b0mr2613399wrz.207.1647935624508; 
 Tue, 22 Mar 2022 00:53:44 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm15655363wri.4.2022.03.22.00.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 00:53:44 -0700 (PDT)
Message-ID: <87fd0f15-594a-71aa-4383-6a97bdf2da27@gmail.com>
Date: Tue, 22 Mar 2022 08:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0] qemu/main-loop: Disable block backend global
 state assertion on Darwin
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
References: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
 <223681b8-ae67-8e9b-c41c-1538d7319da9@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <223681b8-ae67-8e9b-c41c-1538d7319da9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 23:08, Akihiko Odaki wrote:
> On 2022/03/21 23:55, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Since commit 0439c5a462 ("block/block-backend.c: assertions for
>> block-backend") QEMU crashes on Darwin hosts, example on macOS:
>>
>>    $ qemu-system-i386
>>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, 
>> file block-backend.c, line 552.
>>    Abort trap: 6
>>
>> Looking with lldb:
>>
>>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, 
>> file block-backend.c, line 552.
>>    Process 76914 stopped
>>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit 
>> program assert
>>       frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
>>    at block-backend.c:552:5 [opt]
>>        549    */
>>        550   BlockBackend *blk_all_next(BlockBackend *blk)
>>        551   {
>>    --> 552       GLOBAL_STATE_CODE();
>>        553       return blk ? QTAILQ_NEXT(blk, link)
>>        554                  : QTAILQ_FIRST(&block_backends);
>>        555   }
>>    Target 1: (qemu-system-i386) stopped.
>>
>>    (lldb) bt
>>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit 
>> program assert
>>       frame #0: 0x00000001908c99b8 
>> libsystem_kernel.dylib`__pthread_kill + 8
>>       frame #1: 0x00000001908fceb0 
>> libsystem_pthread.dylib`pthread_kill + 288
>>       frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
>>       frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
>>     * frame #4: 0x000000010057c2d4 
>> qemu-system-i386`blk_all_next.cold.1 at block-backend.c:552:5 [opt]
>>       frame #5: 0x00000001003c00b4 
>> qemu-system-i386`blk_all_next(blk=<unavailable>) at 
>> block-backend.c:552:5 [opt]
>>       frame #6: 0x00000001003d8f04 
>> qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at 
>> qapi.c:591:16 [opt]
>>       frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined] 
>> addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
>>       frame #8: 0x000000010003ab04 
>> qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at 
>> cocoa.m:1980:5 [opt]
>>       frame #9: 0x00000001012690f4 dyld`start + 520
>>
>> As we are in passed release 7.0 hard freeze, disable the block
>> backend assertion which, while being valuable during development,
>> is not helpful to users. We'll restore this assertion immediately
>> once 7.0 is released and work on a fix.
>>
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/qemu/main-loop.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
>> index 7a4d6a0920..c27968ce33 100644
>> --- a/include/qemu/main-loop.h
>> +++ b/include/qemu/main-loop.h
>> @@ -270,10 +270,14 @@ bool qemu_mutex_iothread_locked(void);
>>   bool qemu_in_main_thread(void);
>>   /* Mark and check that the function is part of the global state API. */
>> +#ifdef CONFIG_DARWIN
> 
> You may use CONFIG_COCOA instead. The assertion can still do its job on 
> Darwin if ui/cocoa is not in use.

Yeah better.

> Also, some code comment is nice to have since the intention is rather 
> unclear from the code even though this is temporary and few people would 
> stumble upon it.

Indeed, I thought about that during the night ;)

> Regards,
> Akihiko Odaki
> 
>> +#define GLOBAL_STATE_CODE()
>> +#else
>>   #define GLOBAL_STATE_CODE()                                         \
>>       do {                                                            \
>>           assert(qemu_in_main_thread());                              \
>>       } while (0)
>> +#endif /* CONFIG_DARWIN */
>>   /* Mark and check that the function is part of the I/O API. */
>>   #define IO_CODE()                                                   \
> 


