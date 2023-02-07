Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B268DF53
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPS6S-0005Z8-1I; Tue, 07 Feb 2023 12:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPS6Q-0005Yj-EU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:49:58 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPS6O-0006hZ-NC
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:49:58 -0500
Received: by mail-wr1-x433.google.com with SMTP id y1so14384015wru.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nEPSPNIpeKY2kYybeQvc2wqyxKZKQ18+QISd6HLbIp0=;
 b=ePasMimE7dJs58CMqX5WpHYlTXw+uXnlk5NVTLmv7Nj46MIV4qnVI9L6mZ3EYu6w+J
 ZIhO9EE/9A4sM4qd3a9sgPXwbRQIC4a4clyf02UWm8O6UAc/MXzSxfPUCqKNIh8dFHMB
 3A/bLoyhn8rjZDavsM07UTW7dHLnrAZCRUSIg+bZW3J8DQNWKWb6UaKBEy5V/mcOqaV3
 V/j/9WwKf9PksxAoy90IL6GJEL5/m6+4tf0LoEkzfztGpnNUU4kFUqk5FP+D7pa66go4
 FeDBJZzRFyOI+eZaceo4YOEoBQ25SlXlm8Uyc73vXtkBb5+w1YvjcA4is+2BM2XNzzsx
 Knqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nEPSPNIpeKY2kYybeQvc2wqyxKZKQ18+QISd6HLbIp0=;
 b=ch1XAlKGW7jyRF35L+/bIETd6z2ob1eigYy06h0kGlSc6kgAPQJuyLYJusNUz/vRqm
 aemjE1/J14DBy1Q1+weZGl29LdoUAiHPq/Pu11E7UkqYbLJ27VqNcxgG1MVd27/FcJ+9
 teJslYKNG+djDnvwnWN4/gKfNJJ+PzobiszxebHTaHYwilGxnb8puJ+eqzkDBDDiGOgr
 YRo+fHEVSsbuC3kSjS782CpdBXPE7LQhaTy64mDRQNQf+3qdMuI398c8gCVSd7SphRYS
 msVTx+O+iSgLn93akoBpt6CmgxA2Pdqxq+NL3KB9+5brofW6eHiGmNzmKDVax/xESLuJ
 VWug==
X-Gm-Message-State: AO0yUKVgjOacd8NPsh8c79KdQZ0onXpBy4WOfNC8zDbuDRWvssIs7W+b
 SFxZyPswhbLhEBupvj6JbCpWOA==
X-Google-Smtp-Source: AK7set8wSW//odsyNvsrmxtoMpwDOC5jkhMROyAy7A7emzf7vU1N+dp1/xuQ90pOooCrTWpB2Vb4Lw==
X-Received: by 2002:a5d:4bc2:0:b0:2c3:db3e:6a0a with SMTP id
 l2-20020a5d4bc2000000b002c3db3e6a0amr2560420wrt.68.1675792194123; 
 Tue, 07 Feb 2023 09:49:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d408d000000b002c3f42f3687sm2153529wrp.72.2023.02.07.09.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 09:49:53 -0800 (PST)
Message-ID: <38cbdfd8-aa1d-aca7-c760-8fa4a92c16ab@linaro.org>
Date: Tue, 7 Feb 2023 18:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] hw/core/cpu: always print cpu index with cpu state
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com,
 joe.jin@oracle.com
References: <20230206234220.8414-1-dongli.zhang@oracle.com>
 <71f8e94b-f66c-099f-cc3d-2cd431ced9ba@linaro.org>
 <8f490130-4d01-a38f-e263-127977e0051a@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8f490130-4d01-a38f-e263-127977e0051a@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 18:32, Dongli Zhang wrote:
> Hi Philippe,
> 
> On 2/6/23 23:16, Philippe Mathieu-Daudé wrote:
>> On 7/2/23 00:42, Dongli Zhang wrote:
>>> The cpu_dump_state() does not print the cpu index. When the
>>> cpu_dump_state() is invoked due to the KVM failure, we are not able to tell
>>> from which CPU the state is. The below is an example.
>>>
>>> KVM internal error. Suberror: 764064
>>> RAX=0000000000000002 RBX=ffff8a9e57c38400 RCX=00000000ffffffff
>>> RDX=ffff8a9cc00ba8a0
>>> RSI=0000000000000003 RDI=ffff8a9e57c38400 RBP=ffffb6120c5b3c50
>>> RSP=ffffb6120c5b3c40
>>> R8 =0000000000000000 R9 =ffff8a9cc00ba8a0 R10=ffffffff8e467350
>>> R11=0000000000000007
>>> R12=000000000000000a R13=ffffffff8f987e25 R14=ffffffff8f988a01
>>> R15=0000000000000000
>>> RIP=ffffffff8e51bb04 RFL=00010046 [---Z-P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
>>> ES =0000 0000000000000000 ffffffff 00c00000
>>> CS =0010 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
>>> SS =0000 0000000000000000 ffffffff 00c00000
>>> DS =0000 0000000000000000 ffffffff 00c00000
>>> FS =0000 0000000000000000 ffffffff 00c00000
>>> GS =0000 ffff8ac27fcc0000 ffffffff 00c00000
>>> LDT=0000 0000000000000000 ffffffff 00c00000
>>> TR =0040 fffffe0000096000 0000206f 00008b00 DPL=0 TSS64-busy
>>> GDT=     fffffe0000094000 0000007f
>>> IDT=     fffffe0000000000 00000fff
>>> CR0=80050033 CR2=0000000000000000 CR3=00000010ca40a001 CR4=003606e0
>>> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
>>> DR3=0000000000000000
>>> DR6=00000000fffe0ff0 DR7=0000000000000400
>>> EFER=0000000000000d01
>>> Code=0f 1f ... ...
>>>
>>> Print the cpu->cpu_index in cpu_dump_state() and remove it from the caller.
>>>
>>> Cc: Joe Jin <joe.jin@oracle.com>
>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>> ---
>>>    hw/core/cpu-common.c      | 1 +
>>>    monitor/hmp-cmds-target.c | 2 --
>>>    softmmu/cpus.c            | 1 -
>>>    3 files changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>>> index 5ccc3837b6..d2503f2d09 100644
>>> --- a/hw/core/cpu-common.c
>>> +++ b/hw/core/cpu-common.c
>>> @@ -105,6 +105,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
>>>          if (cc->dump_state) {
>>>            cpu_synchronize_state(cpu);
>>
>> Should we check for:
>>
>>            if (cpu->cpu_index != -1) {
>>
>>> +        qemu_fprintf(f, "\nCPU#%d\n", cpu->cpu_index);
>>
>>            }
> 
> I think you meant if (cpu->cpu_index != UNASSIGNED_CPU_INDEX).
> 
> I do not see this case may happen within my knowledge. The cpu_index is always
> expected to be assigned if cpu_exec_realizefn()-->cpu_list_add() is called.
> 
>   83 void cpu_list_add(CPUState *cpu)
>   84 {
>   85     QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
>   86     if (cpu->cpu_index == UNASSIGNED_CPU_INDEX) {
>   87         cpu->cpu_index = cpu_get_free_index();
>   88         assert(cpu->cpu_index != UNASSIGNED_CPU_INDEX);
>   89     } else {
>   90         assert(!cpu_index_auto_assigned);
>   91     }
>   92     QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
>   93     cpu_list_generation_id++;
>   94 }
> 
> 
> In addition, the cc->dump_state() is always invoked by cpu_dump_state(). As a
> result, e.g., arm_cpu_dump_state() or x86_cpu_dump_state() may always print the
> cpu state unconditionally (same for mips, s390 or riscv). I do not see a reason
> to hide the cpu_index.
> 
> Would you please let me know if the above is wrong? I do not think it is
> required to filter the cpu_index with UNASSIGNED_CPU_INDEX.

You are right.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks for clarifying!

