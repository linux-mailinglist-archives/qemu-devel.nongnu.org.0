Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491684929C8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:41:29 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qbv-0005ue-S8
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9pMA-0006x7-94
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 09:21:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9pM6-00067k-QK
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 09:21:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642515661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X42F4jvqsZLH3EX9PUF+5oopMzJzIvIEKn+tyhU9syM=;
 b=gkRucqbVkDECGuiZhUP6Eknxcvquj0OtYhNBnFLHCFBVUBzM9h1JiZcve4hc/nHmiuqKpg
 OfdjzcWVXE/X4ZalAcr1anP67k4x7K2gP1+flQHzT/tuMMIzLmWOMWZ6P+crB0wOmqI3QO
 DBGif9fcdirreYuNzA4RGdDfE0Y4Axs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-wyQkgInAOpucZtOtMu7waA-1; Tue, 18 Jan 2022 09:21:00 -0500
X-MC-Unique: wyQkgInAOpucZtOtMu7waA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a3-20020a05600c348300b0034a0dfc86aaso1941289wmq.6
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 06:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X42F4jvqsZLH3EX9PUF+5oopMzJzIvIEKn+tyhU9syM=;
 b=d1QRl1wqPrQFtCLYUq7NS/MFnPCeino1aa//KG16r4OUOw/H+1a4uiU2zCSTaBKeoh
 B/mvpcXO76FcJlS26FrWG282s80efzO4lMoQHEW71uBLpTHzln1xJOFUwjyMmHC3sLZc
 l5bdT2WYmk5E9MDh7ESe7glPCg5HO7diuoQ+ATfqSsv2S6QHly8KpwvV9yf0+ms/ETbO
 lM4q0HzCwQnVN4r4/ImsARVQyqAKSktnqqs6wZJOpIfvac22kTTcK4iWdPR4yMkTThVC
 F5p39f/3bAyHhEzmME+Y50OdZiSosEVTF+VejOmECrOKch7PyxOmKgiTlHZ4kz4sI459
 yqgg==
X-Gm-Message-State: AOAM531WEX/17b/fbNByVxKk186Lpr5mQK4NWlKD9QRCJlS3boHUOTFN
 Crw7R64S8wfDfYhb2CVjZbn2Uk1C8Ch+3eCEt0TToz/Q62aJyCvMw6A/oueUrnn1I/TwyIO3jom
 MT5T1+4CIZHwyFRQ=
X-Received: by 2002:a5d:5227:: with SMTP id i7mr24310561wra.212.1642515659005; 
 Tue, 18 Jan 2022 06:20:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykB0k5wz+5C08c+hX00fm+yckiPrTbDErrB5pKbBbAV2v0rC3N6Rqj6X7WJ1l9kD8CxMOaBQ==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr24310544wra.212.1642515658808; 
 Tue, 18 Jan 2022 06:20:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id n5sm2511885wmc.47.2022.01.18.06.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 06:20:58 -0800 (PST)
Message-ID: <c43b5baf-2645-1ba1-a66f-02a28c04835c@redhat.com>
Date: Tue, 18 Jan 2022 15:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v5 1/1] s390x: sigp: Reorder the SIGP STOP code
To: David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20211213210919.856693-1-farman@linux.ibm.com>
 <20211213210919.856693-2-farman@linux.ibm.com>
 <afbc20ac-5be6-c260-c9aa-afa2980b7b6e@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <afbc20ac-5be6-c260-c9aa-afa2980b7b6e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2022 14.34, David Hildenbrand wrote:
> On 13.12.21 22:09, Eric Farman wrote:
>> Let's wait to mark the VCPU STOPPED until the possible
>> STORE STATUS operation is completed, so that we know the
>> CPU is fully stopped and done doing anything. (When we
>> also clear the possible sigp_order field for STOP orders.)
>>
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> ---
>>   target/s390x/sigp.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
>> index 51c727834c..9dd977349a 100644
>> --- a/target/s390x/sigp.c
>> +++ b/target/s390x/sigp.c
>> @@ -139,7 +139,7 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
>>       case S390_CPU_STATE_OPERATING:
>>           cpu->env.sigp_order = SIGP_STOP_STORE_STATUS;
>>           cpu_inject_stop(cpu);
>> -        /* store will be performed in do_stop_interrup() */
>> +        /* store will be performed in do_stop_interrupt() */
>>           break;
>>       case S390_CPU_STATE_STOPPED:
>>           /* already stopped, just store the status */
>> @@ -479,13 +479,17 @@ void do_stop_interrupt(CPUS390XState *env)
>>   {
>>       S390CPU *cpu = env_archcpu(env);
>>   
>> -    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
>> -        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>> -    }
>> +    /*
>> +     * Complete the STOP operation before exposing the CPU as
>> +     * STOPPED to the system.
>> +     */
>>       if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
>>           s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
>>       }
>>       env->sigp_order = 0;
>> +    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
>> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>> +    }
>>       env->pending_int &= ~INTERRUPT_STOP;
>>   }
>>   
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 

Thanks, queued to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


