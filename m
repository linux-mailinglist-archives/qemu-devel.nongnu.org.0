Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798ED260285
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 19:28:22 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFKwH-0006zV-1V
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 13:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kFKuv-00065C-Gn
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:26:57 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21180
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kFKus-00060q-Sv
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599499613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gxArzqPjfk9Gk3MsygbzTbvavWSzsX9zpdAPWOBN7LE=;
 b=iVqepr1j7cDnHKD9sahsoQSIol2OZ2Hg7UKGo1gBrSc4XqpCtNpZdVR8w8Lx4FuFsVO8pX
 nqLAFf1nOFh9kxkNnV8lBJVlBCQNX6ZJEgrwBcQtDHN90YHLrKo+DcgCKAzIIxcmo1QIwc
 Zd3BkmM2ROZak9aDTMuL+t/DYbXBr6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-h2MXDRJrPZ-tXygjEWWrfg-1; Mon, 07 Sep 2020 13:26:51 -0400
X-MC-Unique: h2MXDRJrPZ-tXygjEWWrfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71D1580EDA4;
 Mon,  7 Sep 2020 17:26:50 +0000 (UTC)
Received: from [10.36.112.218] (ovpn-112-218.ams2.redhat.com [10.36.112.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B87C78370;
 Mon,  7 Sep 2020 17:26:43 +0000 (UTC)
Subject: Re: [PULL 00/30] ppc-for-5.2 queue 20200904
From: Laurent Vivier <lvivier@redhat.com>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
 <CAFEAcA8xCpRBcsCaozEXnCuM5SqWr5ZEDrwLjs+8va=316_70Q@mail.gmail.com>
 <20200907023800.GJ341806@yekko.fritz.box>
 <675253df-b750-1a0a-5447-9dadef1accba@redhat.com>
 <7c287125-70b3-4330-fd5c-8e644e1c347d@redhat.com>
 <ffee957d-0428-d167-c1ab-3fe67b4d8c7c@redhat.com>
 <20200907165132.683d2880.cohuck@redhat.com>
 <f93673f9-3e83-ef5f-9628-819b25908e43@redhat.com>
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
 D+Ofp0T3KOr1RUHvCZoLURfFhSQ=
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <77b63a31-48a8-c77f-9956-7511db170594@redhat.com>
Date: Mon, 7 Sep 2020 19:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f93673f9-3e83-ef5f-9628-819b25908e43@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:29:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/2020 18:29, Laurent Vivier wrote:
> On 07/09/2020 16:51, Cornelia Huck wrote:
>> On Mon, 7 Sep 2020 16:31:24 +0200
>> Laurent Vivier <lvivier@redhat.com> wrote:
>>
>>> On 07/09/2020 16:05, Philippe Mathieu-Daudé wrote:
>>>> Hi Thiago,
>>>>
>>>> On 9/7/20 3:29 PM, Laurent Vivier wrote:  
>>>>> On 07/09/2020 04:38, David Gibson wrote:  
>>>>>> On Sun, Sep 06, 2020 at 04:20:10PM +0100, Peter Maydell wrote:  
>>
>>>>>>> The 'check-tcg' tests for the linux-user static build also
>>>>>>> failed on an s390x test:
>>>>>>>
>>>>>>>   CHECK   debian-s390x-cross
>>>>>>>   BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
>>>>>>>   RUN     tests for s390x
>>>>>>>   TEST    threadcount on s390x
>>>>>>> Unhandled trap: 0x10003  
>>>>>
>>>>> This is EXCP_HALTED (include/exec/cpu-all.h)
>>>>>
>>>>> The message error comes from cpu_loop() in linux-user/s390x/cpu_loop.c.
>>>>>
>>>>> The trap can only come from accel/tcg/cpu-exec.c
>>>>>
>>>>>     679 int cpu_exec(CPUState *cpu)
>>>>>     680 {
>>>>> ...
>>>>>     688     if (cpu_handle_halt(cpu)) {
>>>>>     689         return EXCP_HALTED;
>>>>>     690     }
>>>>>
>>>>> and
>>>>>
>>>>>     428 static inline bool cpu_handle_halt(CPUState *cpu)
>>>>>     429 {
>>>>>     430     if (cpu->halted) {
>>>>> ...
>>>>>     441         if (!cpu_has_work(cpu)) {
>>>>>     442             return true;
>>>>>     443         }
>>>>>
>>>>> and
>>>>>
>>>>>      58 static bool s390_cpu_has_work(CPUState *cs)
>>>>>      59 {
>>>>>      60     S390CPU *cpu = S390_CPU(cs);
>>>>>      61
>>>>>      62     /* STOPPED cpus can never wake up */
>>>>>      63     if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
>>>>>      64         s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
>>>>>      65         return false;
>>>>>      66     }
>>>>>      67
>>>>>      68     if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
>>>>>      69         return false;
>>>>>      70     }
>>>>>      71
>>>>>      72     return s390_cpu_has_int(cpu);
>>>>>      73 }
>>>>>
>>>>> and in target/s390x/cpu.h:
>>>>>
>>>>>     772 #ifndef CONFIG_USER_ONLY
>>>>>     773 unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
>>>>>     774 #else
>>>>>     775 static inline unsigned int s390_cpu_set_state(uint8_t cpu_state,
>>>>> S390CPU *cpu)
>>>>>     776 {
>>>>>     777     return 0;
>>>>>     778 }
>>>>>     779 #endif /* CONFIG_USER_ONLY */
>>>>>     780 static inline uint8_t s390_cpu_get_state(S390CPU *cpu)
>>>>>     781 {
>>>>>     782     return cpu->env.cpu_state;
>>>>>     783 }
>>>>>
>>>>> As cpu_state is never set, perhaps in case of linux-user it should
>>>>> always return S390_CPU_STATE_OPERATING?
>>
>> Possibly, we should not have any state handling for linux-user.
>>
> 
> I did that, but now 390_cpu_has_work() is false because
> CPU_INTERRUPT_HARD is not set in cs->interrupt_request.
> 
> I think we should not enter in cpu_loop() with halted set to 1.
> 
> Before the patch of this series, s390_cpu_reset() is called twice, and
> on the second call, halted is already 0.
> 
> With start_powered_off set to true in initfn, on the first reset
> "halted" is 0 and on the second it is 1 (because it has been copied from
> start_powered_off) and so cpu_loop() starts with halted set to 1 and fails.

What is happening:

[without start_powered_off]

  1- halted is set to 1 in s390x_cpu_initfn()
  2- halted is set to 0 in s390x_cpu_reset() by parent_reset()
     (cpu_common_reset()
  3- cpu_loop() is always entered with halted set to 0

[with start_powered_off]

  1- halted is set to start_powered_off (1) in s390x_cpu_reset() by
     parent_reset() (cpu_common_reset()
  2- cpu_loop() is always entered with halted set to 1

So in the first case, cpu_loop() is always started with halted set to 0
and in the second case with halted set to 1.

And I think, with linux-user, it should never be started with halted set
to 1.

We can't add a "#ifdef CONFIG_USER_ONLY" in hw/core/cpu.c to set halted
to 0 because it is in the common files, but we can do:

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 73d7d6007e8e..749cd548f0f3 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -291,9 +291,9 @@ static void s390_cpu_initfn(Object *obj)
     S390CPU *cpu = S390_CPU(obj);

     cpu_set_cpustate_pointers(cpu);
-    cs->start_powered_off = true;
     cs->exception_index = EXCP_HLT;
 #if !defined(CONFIG_USER_ONLY)
+    cs->start_powered_off = true;
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
     cpu->env.tod_timer =

Thanks,
Laurent





