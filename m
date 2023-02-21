Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086B69EB46
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:32:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUc6s-0003ty-EX; Tue, 21 Feb 2023 18:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc6p-0003rm-KS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:31:43 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc6n-0003Vg-Hv
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:31:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c1d0700b003dc4050c94aso4200221wms.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5uxvXRGBI9/B10yveBE80mDp8T1mznwE9dNv+/aatg4=;
 b=LktjvSAkHcwpgNb3mznrZzELL43ylOOY2vI2ZBCtEu58xWPGa7y3vGtoQGrVdrJ8y9
 Omjo5zkewwhMJ2mSiWS77Ax19njdWhc5qyQBNvex0ALSYht2z2DhRW6n0XYtED9KL2Db
 ips4UPn7wXazBl1/wK4rNl69k0LQaWntvA9izQ3pyzE4sLMIC/Et7h3zp9O65rznRjN7
 arcZ4qD0oy6Ay4m7k19F1/u/ngerPWTDbHg5ZM5yt6IX0YIK8TMFFF+QG/0E1j/dgQ4g
 YhBOb6g8KtENrSM1/6A658OP0bS18F7o6jcMo4kmDJAkE8V8vaeS1KhoqDG5DPVq+Q35
 VDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5uxvXRGBI9/B10yveBE80mDp8T1mznwE9dNv+/aatg4=;
 b=WWjn2Nife4ECHlqaZX/C1+/ndUDuxUmcxuqKIeJHcQNzxdL4+WWy0J/QM9Be6S8wmk
 RTYBBsaBsBgDsxxF0EpGwvewTMha8+k1XFBo5/BamFhecSt0663Xc1tllgxu3GoLKVfL
 U3toVFQzLl7J6CieNJXwt4B6v6T/X98SyVLoaBJNsRVScOLBaM1c8EyYymaT9fN3lthX
 2acn9W9amTq1EqHnujBskAVwp/HeTRo0/OUg9bkch+4MHC3JHyiYq5btS5TBnoOYdPVD
 hKuS3NuviSua+1DxoPWKKq5kUgAew+8rSNwoEw38iMjuZJcuImJ7s/Bf0Ygi4lzrILKo
 jpug==
X-Gm-Message-State: AO0yUKW/rgzqrJw+f02vXbszd87ob87cwj7YcsxQimQMdrZqn24NSY8/
 UNts5aJhLRNFZtvR6bxzOvBUZQ==
X-Google-Smtp-Source: AK7set/m1cg6P7eFkP/dZemAVzVGsFhgIZjlI0wrG2s4Bbq+IXZLSQpvcOdR9oornmANMkR3AWC3Tw==
X-Received: by 2002:a05:600c:4d06:b0:3dc:5937:35a2 with SMTP id
 u6-20020a05600c4d0600b003dc593735a2mr4999341wmp.9.1677022299896; 
 Tue, 21 Feb 2023 15:31:39 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1c7203000000b003dc522dd25esm6233025wmc.30.2023.02.21.15.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 15:31:39 -0800 (PST)
Message-ID: <d49eb549-9a8f-ad31-9836-cfd7dac78be6@linaro.org>
Date: Wed, 22 Feb 2023 00:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/arm/virt: Prevent CPUs in one socket to span mutiple
 NUMA nodes
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, yihyu@redhat.com,
 shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
References: <20230221085352.212938-1-gshan@redhat.com>
 <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
 <3e88a2ec-6425-f484-8483-560d511a27ca@redhat.com>
 <b76a1ffa-f9d8-192d-ef65-0fdf43dabaa6@linaro.org>
 <8150f6d9-9c5b-28c5-4744-ee866cf16ca7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8150f6d9-9c5b-28c5-4744-ee866cf16ca7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 22/2/23 00:12, Gavin Shan wrote:
> On 2/21/23 9:21 PM, Philippe Mathieu-Daudé wrote:
>> On 21/2/23 10:21, Gavin Shan wrote:
>>> On 2/21/23 8:15 PM, Philippe Mathieu-Daudé wrote:
>>>> On 21/2/23 09:53, Gavin Shan wrote:
>>>>> Linux kernel guest reports warning when two CPUs in one socket have
>>>>> been associated with different NUMA nodes, using the following command
>>>>> lines.
>>>>>
>>>>>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>>>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>>>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>>>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>>>>
>>>>>    ------------[ cut here ]------------
>>>>>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 
>>>>> build_sched_domains+0x284/0x910
>>>>>    Modules linked in:
>>>>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>>>>>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>    pc : build_sched_domains+0x284/0x910
>>>>>    lr : build_sched_domains+0x184/0x910
>>>>>    sp : ffff80000804bd50
>>>>>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>>>>>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>>>>>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>>>>>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>>>>>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>>>>>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>>>>>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>>>>>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>>>>>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>>>>>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>>>>>    Call trace:
>>>>>     build_sched_domains+0x284/0x910
>>>>>     sched_init_domains+0xac/0xe0
>>>>>     sched_init_smp+0x48/0xc8
>>>>>     kernel_init_freeable+0x140/0x1ac
>>>>>     kernel_init+0x28/0x140
>>>>>     ret_from_fork+0x10/0x20
>>>>>
>>>>> Fix it by preventing mutiple CPUs in one socket to be associated with
>>>>> different NUMA nodes.
>>>>>
>>>>> Reported-by: Yihuang Yu <yihyu@redhat.com>
>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>> ---
>>>>>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>>>>>   1 file changed, 37 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> index ac626b3bef..e0af267c77 100644
>>>>> --- a/hw/arm/virt.c
>>>>> +++ b/hw/arm/virt.c
>>>>> @@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
>>>>>       return false;
>>>>>   }
>>>>> +static bool numa_state_valid(MachineState *ms)
>>>>> +{
>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>>> +    NumaState *state = ms->numa_state;
>>>>> +    const CPUArchIdList *possible_cpus = 
>>>>> mc->possible_cpu_arch_ids(ms);
>>>>> +    const CPUArchId *cpus = possible_cpus->cpus;
>>>>> +    int len = possible_cpus->len, i, j;
>>>>> +
>>>>> +    if (!state || state->num_nodes <= 1 || len <= 1) {
>>>>> +        return true;
>>>>> +    }
>>>>> +
>>>>> +    for (i = 0; i < len; i++) {
>>>>> +        for (j = i + 1; j < len; j++) {
>>>>> +            if (cpus[i].props.has_socket_id &&
>>>>> +                cpus[i].props.has_node_id &&
>>>>> +                cpus[j].props.has_socket_id &&
>>>>> +                cpus[j].props.has_node_id &&
>>>>> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
>>>>> +                cpus[i].props.node_id != cpus[j].props.node_id) {
>>>>> +                error_report("CPU-%d and CPU-%d in socket-%ld have 
>>>>> been "
>>>>> +                             "associated with node-%ld and node-%ld",
>>>>> +                             i, j, cpus[i].props.socket_id,
>>>>> +                             cpus[i].props.node_id,
>>>>> +                             cpus[j].props.node_id);
>>>>> +                return false;
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>>   static void create_randomness(MachineState *ms, const char *node)
>>>>>   {
>>>>>       struct {
>>>>> @@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState 
>>>>> *machine)
>>>>>           exit(1);
>>>>>       }
>>>>> +    if (!numa_state_valid(machine)) {
>>>>> +        exit(1);
>>>>> +    }
>>>>
>>>> Why restrict to the virt machine?
>>>>
>>>
>>> We tried x86 machines and virt machine, but the issue isn't 
>>> reproducible on x86 machines.
>>> So I think it's machine or architecture specific issue. However, I 
>>> believe RiscV should
>>> have similar issue because linux/drivers/base/arch_topology.c is 
>>> shared by ARM64 and RiscV.
>>> x86 doesn't use the driver to populate its CPU topology.
>>
>> Oh, I haven't thought about the other archs, I meant this seem a generic
>> issue which affects all (ARM) machines, so why restrict to the (ARM)
>> virt machine?
>>
> 
> [Ccing Igor for comments]
> 
> Well, virt machine is the only concern to us for now. You're right that 
> all ARM64 and ARM machines
> need this check and limitation. So the check needs to be done in the 
> generic path. The best way
> I can figure out is like something below. The idea is to introduce a 
> switch to 'struct NumaState'
> and do the check in the generic path. The switch is turned on by 
> individual machines. Please let me
> know if you have better ideas

Can't this be done generically in machine_numa_finish_cpu_init()
-> numa_validate_initiator()?

> - Add 'bool struct NumaState::has_strict_socket_mapping', which is 
> 'false' by default until
>    machine specific initialization function calls helper 
> set_numa_strict_socket_mapping(), for
>    example in hw/arm/virt.c::virt_instance_init().
> 
> - In numa_complete_configuration(), do the check to make sure the socket 
> doesn't cross over
>    the NUMA node boundary if 'bool struct 
> NumaState::has_strict_socket_mapping' is true.
> 
> Thanks,
> Gavin
> 
> 


