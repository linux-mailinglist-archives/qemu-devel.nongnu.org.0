Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2754DB4D0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:28:22 +0100 (CET)
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUVZV-0004o5-D3
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:28:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUVX4-00033e-8a; Wed, 16 Mar 2022 11:25:50 -0400
Received: from [2607:f8b0:4864:20::42d] (port=41563
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUVX2-00008r-Fg; Wed, 16 Mar 2022 11:25:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p8so4228126pfh.8;
 Wed, 16 Mar 2022 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wO3ZSC7OBVfr+yGxNeJldU8Sm1QodZTT5Nvxjn2S+t8=;
 b=VE4G+SsaGsnIB/MEl077yjaOxmshJXdFxftXN06Hzs8LhbOxLEa1Hp+9+dGKgdKEB/
 3WqCmwyQAYNei1DGekYcu4PWDb/dNlx4ilYxUQPYE2B3Xk43DXRd2gD0MggbC8D6q8fQ
 7a+JLulUSNpqVOwV7ZNmX1WxiDsev7i+hsg8kwxScdridPmB4/zfpAcSEtzr/vp81aWA
 rA74pajnwe2FGkPkngBuSlO7l6qsuW5nxSIVZBSCmypWE4nFJUhi2UmCUh30ydM04EPT
 n4o3fmb1mOoFaiXZarfsFbdpOESbaUDaMPm5uVFgjXMIK2lSdsdrkyfbnCAAToXVp+YW
 AktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wO3ZSC7OBVfr+yGxNeJldU8Sm1QodZTT5Nvxjn2S+t8=;
 b=lL3EGn+W3rNER9HRJ0SFvvG8QIW7sCyJVzhNC5utoMDHtFSeYOGKRrtK4OmuoriZed
 zeYXr2NaG8v5rKVROW45h7R/RIbHd45c3JAKoxJxIH/GQ7B9OAJG5HjDE9+/RqU4LF6v
 xbl0QM1sB1ROy+MgyEy4hFx2Z1c3Re/VUMUdQTymvlxlA+muQPfs0c7skXkiRGDWa6vj
 AFldBDEscxFa8r/smPrTRtZDBkdoW+RHPUmlRPfh13UzZdIG7pDUhBATOAXaJdc+mGLv
 SwFFke46c/4wCiQRu7syIc/INwLiuIJfkSZl2zLYlpzZQQdTswYnx3ifY0Wt9UmDzhte
 GuiA==
X-Gm-Message-State: AOAM531CaYEAVbv+BVZNnIl+IPtKBMXmBfirUZHfVqqOSDecDhhwWubw
 OVBa+Cv2d5wx/HNS8WuVDaA=
X-Google-Smtp-Source: ABdhPJwWDRn104nSzbPb2hirZI2SNgpSyEN9Xa9FKjwaqODZCsxKbI1FR1C1ho1oiqnQsVYYffaf0g==
X-Received: by 2002:a62:de82:0:b0:4f7:86e1:869c with SMTP id
 h124-20020a62de82000000b004f786e1869cmr366447pfg.13.1647444345305; 
 Wed, 16 Mar 2022 08:25:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a633c46000000b003817d623f72sm3065891pgn.24.2022.03.16.08.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 08:25:44 -0700 (PDT)
Message-ID: <b8bc1a54-1eb8-b3b5-c40f-d1cbaa9e69d8@gmail.com>
Date: Wed, 16 Mar 2022 16:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL 21/50] block/block-backend.c: assertions for block-backend
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220304164711.474713-1-kwolf@redhat.com>
 <20220304164711.474713-22-kwolf@redhat.com>
 <c005130e-10f0-b575-4493-2080ba08494b@gmail.com>
 <cecef6bd-951a-aab6-e603-96e3551e3e9e@gmail.com>
 <d600ff25-d854-7239-9001-7315b24b9054@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <d600ff25-d854-7239-9001-7315b24b9054@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 15:46, Emanuele Giuseppe Esposito wrote:
> Am 16/03/2022 um 13:53 schrieb Philippe Mathieu-Daudé:
>> On 16/3/22 13:44, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> On 4/3/22 17:46, Kevin Wolf wrote:
>>>> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>
>>>> All the global state (GS) API functions will check that
>>>> qemu_in_main_thread() returns true. If not, it means
>>>> that the safety of BQL cannot be guaranteed, and
>>>> they need to be moved to I/O.
>>>
>>> I'm getting this crash:
>>>
>>> $ qemu-system-i386
>>> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
>>> block-backend.c, line 552.
>>> Abort trap: 6
>>>
>>> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
>>> block-backend.c, line 552.
>>> qemu-system-i386 was compiled with optimization - stepping may behave
>>> oddly; variables may not be available.
>>> Process 76914 stopped
>>> * thread #1, queue = 'com.apple.main-thread', stop reason = hit
>>> program assert
>>>       frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
>>> at block-backend.c:552:5 [opt]
>>>      549    */
>>>      550   BlockBackend *blk_all_next(BlockBackend *blk)
>>>      551   {
>>> -> 552       GLOBAL_STATE_CODE();
>>>      553       return blk ? QTAILQ_NEXT(blk, link)
>>>      554                  : QTAILQ_FIRST(&block_backends);
>>>      555   }
>>> Target 1: (qemu-system-i386) stopped.
>>
>> Forgot to paste the backtrace:
>>
>> (lldb) bt
>> * thread #1, queue = 'com.apple.main-thread', stop reason = hit program
>> assert
>>      frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill + 8
>>      frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + 288
>>      frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
>>      frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
>>    * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at
>> block-backend.c:552:5 [opt]
>>      frame #5: 0x00000001003c00b4
>> qemu-system-i386`blk_all_next(blk=<unavailable>) at
>> block-backend.c:552:5 [opt]
>>      frame #6: 0x00000001003d8f04
>> qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at
>> qapi.c:591:16 [opt]
>>      frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined]
>> addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
>>      frame #8: 0x000000010003ab04
>> qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at
>> cocoa.m:1980:5 [opt]
>>      frame #9: 0x00000001012690f4 dyld`start + 520
> 
> I think Paolo and Peter talked about this a couple of days ago on #qemu,
> and have already found a solution if I remember correctly.
> 
> Maybe it's worth to check with them first.

Maybe this discussion?

https://lore.kernel.org/qemu-devel/20220307151004.578069-1-pbonzini@redhat.com/

> 
> Emanuele
>>
>>> Bisected to this patch:
>>>
>>> 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 is the first bad commit
>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> Message-Id: <20220303151616.325444-9-eesposit@redhat.com>
>>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>>> ---
>>>>    block/block-backend.c  | 78 ++++++++++++++++++++++++++++++++++++++++++
>>>>    softmmu/qdev-monitor.c |  2 ++
>>>>    2 files changed, 80 insertions(+)
>>
> 


