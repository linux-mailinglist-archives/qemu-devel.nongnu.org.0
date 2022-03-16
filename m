Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6C4DB034
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:59:06 +0100 (CET)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTF2-0005y7-TD
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:59:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUT9m-0000p9-Eg; Wed, 16 Mar 2022 08:53:38 -0400
Received: from [2607:f8b0:4864:20::532] (port=38822
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUT9k-0006GA-P7; Wed, 16 Mar 2022 08:53:38 -0400
Received: by mail-pg1-x532.google.com with SMTP id 132so194006pga.5;
 Wed, 16 Mar 2022 05:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=YcXaDk8cOWxx/Oofjx/qhmj1dof84Qelu/6vaq15B/4=;
 b=axVbZouNHk8rzCRV+ZkRGZCQ2Q0QDBxvpdxnvOhbPgf4OUopROZaXFPw2Bq1wvR3do
 eSrUG5kdmu4Fqyva+9QH32x/e7HWW8zOOxPAFyUlSuXqR0a1NoIEYHu6s93xaN9fxAMB
 sBaszOsQvifvaoP78iCeepwVzWP/jK+oULdkRPmGCFeygQy75LrhROwqN1HyoUDaCGft
 E6aBLvcXSfcfIgtj3M4gKfHIJfZSa0gx2Ctii9MLS8IKiFsH/7b/Km1FcBz9rI9Bbjr+
 3iIJzIfcpje2rjBhf/LxKSbpIwq4+ags3G3KaIo+QHIX98bPes3/Ec9JMICJBBUGZyOV
 3kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=YcXaDk8cOWxx/Oofjx/qhmj1dof84Qelu/6vaq15B/4=;
 b=UH9AuJCax4+VMIiY3LfN9/LIaAJEusNeASJei9PIzlVv7tmafyT2pKjPe71oNBmFHu
 Eu6R2OWE9M9oMny0n72Pg6eIedxH5JAWGDC4CTx19WP6Njj9buTSx41sRD1EyjyKRMR8
 PAjeSMwMGYIPqnCLLq/9uKDRPZXdbu1+47W9eM4vuxscFsbguOaa9TKnQwcsTLLgiEoh
 QttQp7+LZnbvl10EUVw4mqzRVMtcTO4lru4kIpEJASqrIfryNg3KtaaFEc+bzP+yzYXz
 QelQdhHyQZfBxCMGyb38KBN0Mzw8mmyl04joTkk7J/+v21Qmnuomd5Ie0hkLB0Kj3P4r
 PwTg==
X-Gm-Message-State: AOAM532zDEtJeuVk6IyrcKkyymmuGA+rMooYAi3jpfX8+fvWTCntRLLu
 Z/Xri7uv9Ca5Xpc14lEbzd0=
X-Google-Smtp-Source: ABdhPJzGItKjOi0cLin+3bgOyt3prAaRFqGqSsg6A+mqUXCqrqu1CSQt+Q57IkRJuDn1k97+Yw5OYw==
X-Received: by 2002:a05:6a00:1907:b0:4f7:945:14cf with SMTP id
 y7-20020a056a00190700b004f7094514cfmr28673079pfi.47.1647435214779; 
 Wed, 16 Mar 2022 05:53:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00218200b004f6519ce666sm3170535pfi.170.2022.03.16.05.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:53:34 -0700 (PDT)
Message-ID: <cecef6bd-951a-aab6-e603-96e3551e3e9e@gmail.com>
Date: Wed, 16 Mar 2022 13:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL 21/50] block/block-backend.c: assertions for block-backend
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
 <20220304164711.474713-22-kwolf@redhat.com>
 <c005130e-10f0-b575-4493-2080ba08494b@gmail.com>
In-Reply-To: <c005130e-10f0-b575-4493-2080ba08494b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 13:44, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 4/3/22 17:46, Kevin Wolf wrote:
>> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> All the global state (GS) API functions will check that
>> qemu_in_main_thread() returns true. If not, it means
>> that the safety of BQL cannot be guaranteed, and
>> they need to be moved to I/O.
> 
> I'm getting this crash:
> 
> $ qemu-system-i386
> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file 
> block-backend.c, line 552.
> Abort trap: 6
> 
> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file 
> block-backend.c, line 552.
> qemu-system-i386 was compiled with optimization - stepping may behave 
> oddly; variables may not be available.
> Process 76914 stopped
> * thread #1, queue = 'com.apple.main-thread', stop reason = hit program 
> assert
>      frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 
> at block-backend.c:552:5 [opt]
>     549    */
>     550   BlockBackend *blk_all_next(BlockBackend *blk)
>     551   {
> -> 552       GLOBAL_STATE_CODE();
>     553       return blk ? QTAILQ_NEXT(blk, link)
>     554                  : QTAILQ_FIRST(&block_backends);
>     555   }
> Target 1: (qemu-system-i386) stopped.

Forgot to paste the backtrace:

(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason = hit program 
assert
     frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill + 8
     frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + 288
     frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
     frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
   * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 
at block-backend.c:552:5 [opt]
     frame #5: 0x00000001003c00b4 
qemu-system-i386`blk_all_next(blk=<unavailable>) at 
block-backend.c:552:5 [opt]
     frame #6: 0x00000001003d8f04 
qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at 
qapi.c:591:16 [opt]
     frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined] 
addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
     frame #8: 0x000000010003ab04 
qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at 
cocoa.m:1980:5 [opt]
     frame #9: 0x00000001012690f4 dyld`start + 520

> Bisected to this patch:
> 
> 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 is the first bad commit
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Message-Id: <20220303151616.325444-9-eesposit@redhat.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   block/block-backend.c  | 78 ++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/qdev-monitor.c |  2 ++
>>   2 files changed, 80 insertions(+)

