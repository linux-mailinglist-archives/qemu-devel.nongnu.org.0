Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDEC57716B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 22:43:05 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCocx-00045S-Bq
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 16:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCobe-0002k9-Pu
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 16:41:42 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCobd-0002CU-2o
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 16:41:42 -0400
Received: by mail-pl1-x633.google.com with SMTP id b2so5913836plx.7
 for <qemu-devel@nongnu.org>; Sat, 16 Jul 2022 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lkgfreF9I/TTtmkLtsFYQeBkZFyH6IrJbSyTCsmGiu4=;
 b=k/jQXQPVzPI9vtmOCm2re21D3mT8nbiUy7xmrbGQceSvULuY7DJ0p/mOzXwBrA7L3o
 TVFOqywCh32FLTcjEV6HaPOl4mYIIAxxslnRbadWUpAODcuOG9BDfXn/pN9nnB7X9Nt3
 64Pab2VtaB3xzPyxtQNas5+rpXmt1v9nP0HaP/QO2x5P8KAaX3on7OapM+sVjQgNwrO0
 tI6TIa9Unp6aZRG+ymRes8YIVTgLpcwJ7ZIft3muh0jp+i7zmtAl5tDJbRI/pTNCR/+h
 wy1vU36J6z69+cdYZ8cupodhdJDLjlLHBxNCoQqt1tbdV6kJQN9//8W2fI/euG0Tpph7
 J+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lkgfreF9I/TTtmkLtsFYQeBkZFyH6IrJbSyTCsmGiu4=;
 b=CHJzVK5gTPdDD2XKOq6sisIpeneRfcfojD6CQNbO5VyhYZr5hNNRIrqHpzOgy8++CV
 guiQp7Uv1F1551X9v8O6Qnq65JqoV0pZWkK/g2BBYPwTh6kTl6ABaPotGrg8celZascQ
 bTfAl70Z6T3eSF5EEdaEKpu+V0Be/UfjNLwxyn0uhRC7evpKilq/JeX34a9x0nwSaotM
 L6KDPTo7wYvFOskJVpiimgIT3g5cGZT0eOfIrzIQxpDcp5+MAFuS7H2zDNT2YUQPSNxz
 cEy4ZlJD5CE2ILXclecNEI7oryQhM4maVDF+0FQkTL2wk7QxXtrCKeHUkK5h/YKrZt+4
 mnUQ==
X-Gm-Message-State: AJIora/dK2mDRhPS1FsmDqHd9i4Gn9oEHoIPP1mK2ievsPgBUL2iqyaY
 pYgiwhcwYCiVNtNeMDOjjqU=
X-Google-Smtp-Source: AGRyM1uQ/gZobzrC1mG3dS1AxABi4i5lRSMRKLnpj8XSRGst1OFGos+3O21i48/lV1dsXhCNYEJFAA==
X-Received: by 2002:a17:903:110e:b0:16c:defc:a092 with SMTP id
 n14-20020a170903110e00b0016cdefca092mr3580870plh.143.1658004099117; 
 Sat, 16 Jul 2022 13:41:39 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 q102-20020a17090a17ef00b001ef8407f6d2sm8003854pja.46.2022.07.16.13.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jul 2022 13:41:38 -0700 (PDT)
Message-ID: <cf25f405-8cb8-ec37-8b4f-9adecfd80b13@gmail.com>
Date: Sun, 17 Jul 2022 05:41:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] ui/cocoa: Run qemu_init in the main thread
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220715134750.63090-1-akihiko.odaki@gmail.com>
 <20220715134750.63090-2-akihiko.odaki@gmail.com>
 <675d98f9-9045-5bf9-27c7-c2d5cb0b088d@redhat.com>
 <2704624f-6e89-1938-e54f-f5ddcb0daf6e@gmail.com>
 <CABgObfb3HL_JyW2PLT-WdMH+yFDPwLaWMoFoqu_18iT+LKuZsQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CABgObfb3HL_JyW2PLT-WdMH+yFDPwLaWMoFoqu_18iT+LKuZsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/07/17 1:39, Paolo Bonzini wrote:
> Il sab 16 lug 2022, 13:30 Akihiko Odaki <akihiko.odaki@gmail.com> ha
> scritto:
> 
>> On 2022/07/16 19:16, Paolo Bonzini wrote:
>>> On 7/15/22 15:47, Akihiko Odaki wrote:
>>>>    static void *call_qemu_main(void *opaque)
>>>>    {
>>>>       ...
>>>> +    [NSApp terminate:nil];
>>> Is this thread-safe?  I think it should be something like:
>>
>> Yes, -[NSApplication terminate:] is thread-safe. Methods of
>> NSApplication handle dispatches to the main thread by themselves.
>>
> 
> Is this documented anywhere?

Thread-unsafe classes (and more importantly, main thread only classes) 
are rather exceptional, and they are listed at:
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/ThreadSafetySummary/ThreadSafetySummary.html

Regards,
Akihiko Odaki

> 
> Paolo
> 
> Regards,
>> Akihiko Odaki
>>
>>>
>>> - here:
>>>
>>>       /*
>>>        * Nothing more to do in the QEMU thread, ask the application
>>>        * to exit.
>>>        */
>>>       dispatch_async(dispatch_get_main_queue(), ^{
>>>           [NSApp terminate: nil];
>>>       });
>>>
>>> - in verifyQuit:
>>>
>>>       if([alert runModal] == NSAlertSecondButtonReturn) {
>>>           with_iothread_lock(^{
>>>               shutdown_action = SHUTDOWN_ACTION_POWEROFF;
>>>               qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
>>>           });
>>>       }
>>>       /* and just return void */
>>>
>>> - applicationShouldTerminate: should be just
>>>
>>>       if (qatomic_read(&qemu_main_terminating)) {
>>>           return NSTerminateNow;
>>>       } else {
>>>           dispatch_async(dispatch_get_main_queue(), ^{
>>>               [self verifyQuit];
>>>           });
>>>       }
>>>       return NSTerminateCancel;
>>>
>>> - applicationWillTerminate: can be just the qemu_thread_join
>>>
>>> Paolo
>>
>>
> 


