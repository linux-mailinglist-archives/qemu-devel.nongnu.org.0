Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C134E4052
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:13:43 +0100 (CET)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfGY-0002Y7-OU
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:13:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWfEa-0001VB-Jm
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:11:40 -0400
Received: from [2a00:1450:4864:20::32b] (port=56116
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWfEY-0003PV-3s
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:11:39 -0400
Received: by mail-wm1-x32b.google.com with SMTP id n35so9555436wms.5
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jZyHXiiRUKBPSug4zRfvxJ4vQfPiNJq+efCZBx4jhfA=;
 b=DlB4BIKJo6TzVJCw9sMT8OqwzzRRr1l6+FFZvCNpAFXJrnyXvCpEtr7Vw5SFQEmgrm
 eHSi2sBClyk1O1b93bdUhAslDp6gVl/9RgCm6VLfp+EJzRCc0o9WqWvvihYr5xIuymEB
 Ya9oFjVxDh3lTFtErvC3svUt3eRk9CKhAENa7By1Xxb22qq0YKwwNNJKJ+h1cxxJxnHN
 3VbgLPj6RO2tt2JPObUIPC3HX+Fua+xy85A6zmCgswNdkZsmDZZckGNXOVgdph7tKClP
 oXKz3NRZuLngJtenZVFwTEKVukJmhstB18ZnbMbNhSCV3nwSTBpXC2hguyJfXQKzh9+w
 JGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jZyHXiiRUKBPSug4zRfvxJ4vQfPiNJq+efCZBx4jhfA=;
 b=GsxWU+7zg/fqiR9cnWFelKAthlz23EjQvvkq+G/cR9SMcBmu9nR7FhEBv/uPe0z7wk
 zm9t84tdEp/jOCEc9PiQCbg+cDExIrndEpUaosxIK/D7thegwUOks9Whcwn0+FtWIb8P
 B+mGQEKBloyzi+rVcgm4nvZrtvHihyLAMBgupIsk1AUD3Fy6If3jaz/N9RxN2PosY5sV
 xxc/YSc4G7fSArJuJdwXhqru0ZjMhxu6ZhkZ8HGa3H02zRvqT9t995hoyYJop0ILXH9n
 IwQP9Qb27zzoYCTvM7bN+81uGIRziQuJaXHU3hsFSS9whKwBAGmCOMGA46gHbdYzZ8CH
 6Kwg==
X-Gm-Message-State: AOAM531Kdej/QcTU+oz1K2knDvkxzutNxJONK3f6MXEQ9dbTGQsXN5jf
 lv32S8NGMGlm7ePsmq4NTE8=
X-Google-Smtp-Source: ABdhPJwiLRJOyCSrZGigL9EUS+F9+c+h9NYg009qlbPibZaGiOsn11fwhgL6wff6JxREyS3zB3TJNw==
X-Received: by 2002:a05:600c:154c:b0:389:fb24:f36c with SMTP id
 f12-20020a05600c154c00b00389fb24f36cmr4163047wmg.51.1647958295996; 
 Tue, 22 Mar 2022 07:11:35 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056000022c00b00203ee262d12sm12392042wrz.116.2022.03.22.07.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:11:35 -0700 (PDT)
Message-ID: <4967c8c2-36be-fa58-d111-bf33342fe3cd@gmail.com>
Date: Tue, 22 Mar 2022 15:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0 v4] target/i386/kvm: Free xsave_buf when
 destroying vCPU
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
 <20220322145629.7e0b3b8c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220322145629.7e0b3b8c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/3/22 14:56, Igor Mammedov wrote:
> On Tue, 22 Mar 2022 13:05:22 +0100
> Philippe Mathieu-Daudé         <philippe.mathieu.daude@gmail.com> wrote:
> 
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Fix vCPU hot-unplug related leak reported by Valgrind:
>>
>>    ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
>>    ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
>>    ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
>>    ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
>>    ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
>>    ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
>>    ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
>>    ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
>>    ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
>>    ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
>>    ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
>>    ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
>>
>> Reported-by: Mark Kanda <mark.kanda@oracle.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Based on a series from Mark:
>> https://lore.kernel.org/qemu-devel/20220321141409.3112932-1-mark.kanda@oracle.com/
>>
>> RFC because currently no time to test
>> ---
>>   target/i386/kvm/kvm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index ef2c68a6f4..e93440e774 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -2072,6 +2072,8 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>>       X86CPU *cpu = X86_CPU(cs);
>>       CPUX86State *env = &cpu->env;
>>   
>> +    g_free(env->xsave_buf);
>> +
>>       if (cpu->kvm_msr_buf) {
>>           g_free(cpu->kvm_msr_buf);
>>           cpu->kvm_msr_buf = NULL;
> 
> 
> shouldn't we do the same in hvf_arch_vcpu_destroy() ?

Yeah HVF needs a similar patch (at least hvf_caps needs to be released
too, but I had no time to review it carefully yet).


