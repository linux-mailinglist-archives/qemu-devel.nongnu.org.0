Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC0346DE7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:36:59 +0100 (CET)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqa2-0004bR-QB
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqYL-0002kh-MX; Tue, 23 Mar 2021 19:35:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqYJ-0006sx-Tp; Tue, 23 Mar 2021 19:35:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id x13so22552387wrs.9;
 Tue, 23 Mar 2021 16:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wNy6eV0f/gRHkFfOt6Fcm2vdqPvQtlmPLmSpVQ/my70=;
 b=Uo6168Abl1dSuVcJWKSDIqgq34sQXztCiiDeicBmSMxx58EvT9HvpSn7o4g3SuR4WM
 ZnPhAvlOZJxgeabEmx+kP/woh2F7YyG0uLpjQ7WknvXFAzqnLlv3IQdIZzNqMdahVjek
 XllsLVZT7WlWU8jis7ZfHsrOwfrbxk36TRmpStsw6GdM/Jfv6iMg2bAKn7lkwqx8N2iq
 uqn2yrOJxmi0z0cTKb8i+Nyok5JpzQyOvpe3pX5xYTZcfg96vfifN5aEYoQXY/nooX5Q
 gSlVIs2IxiQoDQ41r6XJyXaafoOsHvSb2RAOO//bwhEsC4YbXu2aQvIOg+cNJKG3q3Hy
 56+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wNy6eV0f/gRHkFfOt6Fcm2vdqPvQtlmPLmSpVQ/my70=;
 b=hUGVhnS9eHZVggSAlWkF9KDaDYCoqpBI2jJ4FGTWahHe+yunlrwEy3l/g9/WJSjuIW
 paJAebJ4B8ZFcDVBbPjn+3e+zmXQQ40+Chn6i7eh192J4JdyLajCwR53x+KUIZFYErIB
 q4Oy5R9vMFzI+62aLDaZyZkAdqPiqaSe5FIErj8OjURrtSvDLGLusckn4DKDmsyjFej2
 2DMTpsAoWlBTn6bMhgYYw5E+I/OXWHcHgFNm4+y9YQYNtzjzrebn6jEMQznhpOyRgXBT
 /x4Hdkw+JubMjQWfsinsMLc8r45WVLs5e22vopxLp3R5QheGTuZYFvWwAFJA2nCKVRvM
 /YPA==
X-Gm-Message-State: AOAM532jQy5CU1vDA+KMmmciS3xnURipcrCAQ5wdRdQLExweWVu3KND5
 sSNQ1qLThr1NCYHIiI+AKSk=
X-Google-Smtp-Source: ABdhPJxbcAkWzCn8wBqg2Qygyvfae1+PNC2+6cfMA1MUXenUVOqFKyVbCfKjrB/nygqObE32z7chew==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr355544wro.350.1616542507409;
 Tue, 23 Mar 2021 16:35:07 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u4sm494647wrm.24.2021.03.23.16.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 16:35:06 -0700 (PDT)
Subject: Re: Crashes with qemu-system-ppc64
To: Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <20210324000056.349b6782@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
Date: Wed, 24 Mar 2021 00:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324000056.349b6782@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 12:00 AM, Greg Kurz wrote:
> Cc'ing David
> 
> On Tue, 23 Mar 2021 17:48:36 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>>
>> In case anyone is interested in fixing those, there are two regressions with 
>> qemu-system-ppc64 in the current master branch:
>>
>> $ ./qemu-system-ppc64 -M ppce500 -device macio-oldworld
>> qemu-system-ppc64: ../../devel/qemu/softmmu/memory.c:2443: 
>> memory_region_add_subregion_common: Assertion `!subregion->container' failed.
>>
>> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
>> /home/thuth/devel/qemu/include/hw/boards.h:24:MACHINE: Object 0x5635bd53af10 
>> is not an instance of type machine
>> Aborted (core dumped)
>>
> 
> I've bisected this one to:
> 
> 3df261b6676b5850e93d6fab3f7a98f8ee8f19c5 is the first bad commit
> commit 3df261b6676b5850e93d6fab3f7a98f8ee8f19c5
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Fri Mar 13 17:24:47 2020 +0000
> 
>     softmmu/vl.c: Handle '-cpu help' and '-device help' before 'no default machine'
>     
>     Currently if you try to ask for the list of CPUs for a target
>     architecture which does not specify a default machine type
>     you just get an error:
>     
>       $ qemu-system-arm -cpu help
>       qemu-system-arm: No machine specified, and there is no default
>       Use -machine help to list supported machines
>     
>     Since the list of CPUs doesn't depend on the machine, this is
>     unnecessarily unhelpful. "-device help" has a similar problem.
>     
>     Move the checks for "did the user ask for -cpu help or -device help"
>     up so they precede the select_machine() call which checks that the
>     user specified a valid machine type.
>     
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
>  softmmu/vl.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> bisect run success
> 
> This change is fine but it unveils a bad assumption.
> 
> 0  0x00007ffff64a3708 in raise () at /lib64/power9/libc.so.6
> #1  0x00007ffff6483bcc in abort () at /lib64/power9/libc.so.6
> #2  0x00000001008db940 in object_dynamic_cast_assert
>     (obj=0x10126f670, typename=0x100c20380 "machine", file=0x100b34878 "/home/greg/Work/qemu/qemu-ppc/include/hw/boards.h", line=<optimized out>, func=0x100bcd320 <__func__.30338> "MACHINE") at ../../qom/object.c:883
> #3  0x0000000100456e00 in MACHINE (obj=<optimized out>) at /home/greg/Work/qemu/qemu-ppc/include/hw/boards.h:24
> #4  0x0000000100456e00 in cpu_core_instance_init (obj=0x10118e2c0) at ../../hw/cpu/core.c:69
> #5  0x00000001008d9f44 in object_init_with_type (obj=obj@entry=0x10118e2c0, ti=0x1011fd470) at ../../qom/object.c:375
> #6  0x00000001008d9f24 in object_init_with_type (obj=obj@entry=0x10118e2c0, ti=0x101211ad0) at ../../qom/object.c:371
> #7  0x00000001008d9f24 in object_init_with_type (obj=obj@entry=0x10118e2c0, ti=ti@entry=0x101212760) at ../../qom/object.c:371
> #8  0x00000001008dc474 in object_initialize_with_type (obj=obj@entry=0x10118e2c0, size=size@entry=160, type=type@entry=0x101212760) at ../../qom/object.c:517
> #9  0x00000001008dc678 in object_new_with_type (type=0x101212760) at ../../qom/object.c:732
> #10 0x00000001009fbad8 in qmp_device_list_properties (typename=<optimized out>, errp=<optimized out>) at ../../qom/qom-qmp-cmds.c:146
> #11 0x00000001005a4bf0 in qdev_device_help (opts=0x10126c200) at ../../softmmu/qdev-monitor.c:285
> #12 0x0000000100760afc in device_help_func (opaque=<optimized out>, opts=<optimized out>, errp=<optimized out>) at ../../softmmu/vl.c:1204
> #13 0x0000000100ad1050 in qemu_opts_foreach (list=<optimized out>, func=0x100760ae0 <device_help_func>, opaque=0x0, errp=0x0) at ../../util/qemu-option.c:1167
> #14 0x00000001007653cc in qemu_process_help_options () at ../../softmmu/vl.c:2451
> #15 0x00000001007653cc in qemu_init (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../../softmmu/vl.c:3521
> #16 0x00000001002f4f88 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../../softmmu/main.c:49
> 
> Basically, "-device power8_v2.0-spapr-cpu-core,help" ends up
> instantiating an object of the "power8_v2.0-spapr-cpu-core" type,
> which derives from "cpu-core". The "cpu-core" type has an instance
> init function that assumes that qdev_get_machine() returns an object
> of type "machine"...
> 
> static void cpu_core_instance_init(Object *obj)
> {
>     MachineState *ms = MACHINE(qdev_get_machine());
>                          ^^
>                      ...here.
> 
> qdev_get_machine() cannot return a valid machine type since
> select_machine() hasn't been called yet... an instance init
> function is probably not the best place to use qdev_get_machine()
> if any.

Hmmm does this assert() matches your comment?

-- >8 --
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a9..41cbee77d14 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1130,6 +1130,8 @@ Object *qdev_get_machine(void)
 {
     static Object *dev;

+    assert(phase_check(PHASE_MACHINE_CREATED));
+
     if (dev == NULL) {
         dev = container_get(object_get_root(), "/machine");
     }
---

> 
>     CPUCore *core = CPU_CORE(obj);
> 
>     core->nr_threads = ms->smp.threads;
> }
> 
> It seems that this should rather sit in a device realize function,
> when the machine type is known.
> 
>>   Thomas
>>
>>
> 
> 


