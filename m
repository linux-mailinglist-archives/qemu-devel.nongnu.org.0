Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31CE4E3BA4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:22:15 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWaiU-0000Yu-Hs
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:22:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWaga-0008CA-8a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:20:16 -0400
Received: from [2a00:1450:4864:20::332] (port=52861
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWagY-0006NO-4w
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:20:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id r7so9975170wmq.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Atv071WkQQlAVYjopDMgYIK6RqzRN9Q9AlP8RlE06qE=;
 b=VU037wHlF2tLQ/07JKKKxLy+OXv3vQnGMYNGvnCbWjb1c6msYLAnzjQpiHLUoEz6OF
 UhLe/oIw+W58DwZn4GyyjdbNpYWLUAntqW4H6B+4KJFoNVqof+8MeWcveMEg9K6rOJYD
 MWHV7eEvUoAS9+UHaEZs0kbZxujxJb+YNtnE83O0xYYOr0GLx7e+suZLAjZY03ovX/FK
 Pl+4o68kpeTd0qAuUIGUqLuKTJmvr/h3OklbWk9nXDvAwnQawLv7rWzJ3QFFD7ACT0Es
 Q+8l2zraW2Cy0Pk5wnyeELeDLwo1tV2Klg+W+javykzhIUGPmc9ABKcHCW8vj31tKpcg
 NVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Atv071WkQQlAVYjopDMgYIK6RqzRN9Q9AlP8RlE06qE=;
 b=l/M2iqXYgZ40YSPqwlYq3gVMXNnZvLmOio76YecaIG2MQg6RQlCfRfCOWNz6aGJdJS
 t1Xg9xD5G6VsW+/PQLv5puzeiUqRZS+Ou60zqOYc8B5krpZ6Mxg0gFYbUcefb6MkP35v
 nUOVsTtDBD81W5SxKmzTYIJYV9OZkSCOHOOJ5hSQHOa1Dd34mk441F+bcqcy1n4HNQDR
 N2Q2MxSyhhVklDNGfCp+/jt87FAKIvYvgE/RXuS+2ebGcel5dTQ6uL3if3Kmn+AEJsoe
 lSlBSB/F3k9sk1+lqVgfQwslTEprD6V89fK0NwCT0vg8sTOwM5dOEJjE8Bb/aJhE7GRk
 fQDQ==
X-Gm-Message-State: AOAM530Cu1JbarLgl+CQy1iWIL3LhWRmWsWaVsJJhodQxp0C/DSvDS15
 KGQZJUdEVyxIDVR6sqogSus=
X-Google-Smtp-Source: ABdhPJxL7ITcYBNRuLxSl6LgZpoMgIUKhygeEsR1w3g7MIIihwAoA2nhrD6xhFyMDW79nBgace7rgw==
X-Received: by 2002:a5d:4f12:0:b0:203:f0cc:da04 with SMTP id
 c18-20020a5d4f12000000b00203f0ccda04mr18380212wru.248.1647940812181; 
 Tue, 22 Mar 2022 02:20:12 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 m185-20020a1ca3c2000000b0038c836a5c13sm1403884wme.20.2022.03.22.02.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:20:11 -0700 (PDT)
Message-ID: <7cf7c9a4-1575-c23c-9a6a-b8574656f5f0@gmail.com>
Date: Tue, 22 Mar 2022 10:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0 v2] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
 <7230eb78-0d9c-b636-f412-328b874280b3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <7230eb78-0d9c-b636-f412-328b874280b3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/3/22 09:32, Paolo Bonzini wrote:
> On 3/22/22 08:54, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Since commit 0439c5a462 ("block/block-backend.c: assertions for
>> block-backend") QEMU crashes when using Cocoa on Darwin hosts.
>>
>> Example on macOS:
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
>> Supersedes: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
>> ---
>>   include/qemu/main-loop.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
>> index 7a4d6a0920..48061f736b 100644
>> --- a/include/qemu/main-loop.h
>> +++ b/include/qemu/main-loop.h
>> @@ -270,10 +270,22 @@ bool qemu_mutex_iothread_locked(void);
>>   bool qemu_in_main_thread(void);
>>   /* Mark and check that the function is part of the global state API. */
>> +#ifdef CONFIG_COCOA
>> +/*
>> + * When using Cocoa ui, addRemovableDevicesMenuItems() calls 
>> qmp_query_block()
>> + * while expecting the main thread to still hold the BQL, triggering 
>> this
>> + * assertions in the block layer (commit 0439c5a462). As the Cocoa 
>> fix is not
>> + * trivial, disable this assertion for the v7.0.0 release when using 
>> Cocoa; it
>> + * will be restored immediately after the release. This issue is 
>> tracked as
>> + * https://gitlab.com/qemu-project/qemu/-/issues/926
>> + */
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
> I don't know, it seems to me that the reorganized initialization code 
> had only advantages.

Yeah, I just don't want to break the "no new code after soft-freeze"
rule.

> For now, it fixes the regression and makes the Cocoa build much more 
> similar to the others.  There is an easy way to fix the -runas 
> regression, by moving the code up to the call of -sharedApplication in 
> cocoa_display_init.

That worked for me, I'll respin and wait to see if Akihiko is happy with
the change and Peter won't object to the patchset past hard-freeze.

> Later, in 7.1, you have time to move more code out of 
> -applicationDidFinishLaunching:, remove the bools that are copied out of 
> the display options, etc.
> 
> Paolo


