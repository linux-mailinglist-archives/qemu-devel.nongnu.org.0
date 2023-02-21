Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFDA69DDC6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:22:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPmn-0006f4-KM; Tue, 21 Feb 2023 05:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUPmk-0006dh-Is
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:22:10 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUPmd-0004Sg-Is
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:22:06 -0500
Received: by mail-wr1-x432.google.com with SMTP id t13so3754368wrv.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nedSA78JxMjIMyKTHPBu2rq5Ntt7K4OzDpz9qp/4dnI=;
 b=ibnj3k18yxTFyb7LXBgGQ6lsfJ35O81x+jNnqvrpZciiLWPVhJFalJ1tMazSoQ9yEo
 wnT9e5VjmePmnqfnTXhlGt991eDE6TOMC1tOyCBEWBLQLhLVYG+nHpca5Kk7KDEIxF2v
 zho/oIcD39y1F1pB+PwUlXEuvHh4d7p4UGe7HGrR7QHSRvdpwHKmgEKSQ3fm79yM/BGU
 zFbr72iArwwX2c26vl5yb+lbIvLCqrndN7SzefSW1NjfW0J7A5YmQsva0Ve6gp57ncGK
 IGxQOgD587Exg80YtJkHZZQkH36w6gkYN6co1k7FFbXKIz0WeVi3K2FxA1wPiOg6Nvvo
 19zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nedSA78JxMjIMyKTHPBu2rq5Ntt7K4OzDpz9qp/4dnI=;
 b=gwDqN5j91DnoBWOmt/EKwN7BjVSAUUkVAqjDyD/7tmoNUXAsPfaLWKU1H2P/y0PbhT
 FxCbbE0pUaY+A3dLXVt4moTSon2d4pNfJe7CrjmxTLYBfLq94Ek4d280o3mVjj4P2TLD
 QbD9wMHAgUYb4E+H/leK7/HRosjRM9tB7Lu5MxV8bukbkIUDdcEXuAS+2Yl9JevY2Bhz
 FxvwahuBhVHpSX3XDNbKb0+Psy/pmKdC9yYkOboHfx+Hq2kx5y6zz694vaNIzmoKgTOR
 dMt+C5wT6ZxJWDfSs0UK9iiSuBdftu30ezopr4zYppkX820lExjLgx/LhezgzlnkRwl2
 uAqQ==
X-Gm-Message-State: AO0yUKVoNFQQW8seLT7kzaO+oPOT0N8UU7LH+R+QB78SvWydl5zHXZdR
 tWfNdOdXQTTzXQAHBRVOysFBbA==
X-Google-Smtp-Source: AK7set8Iulx1IQNlPy+dYDJqx5qcBeqOZdzOTXzu7wLTdnokatL9w3ezc8LexGoP3gkZV/Etu9M2Qw==
X-Received: by 2002:adf:f303:0:b0:2c5:5f9e:b0 with SMTP id
 i3-20020adff303000000b002c55f9e00b0mr2125794wro.8.1676974921857; 
 Tue, 21 Feb 2023 02:22:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v25-20020a5d5919000000b002c551f7d452sm3793825wrd.98.2023.02.21.02.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:22:00 -0800 (PST)
Message-ID: <b76a1ffa-f9d8-192d-ef65-0fdf43dabaa6@linaro.org>
Date: Tue, 21 Feb 2023 11:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/arm/virt: Prevent CPUs in one socket to span mutiple
 NUMA nodes
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, yihyu@redhat.com,
 shan.gavin@gmail.com
References: <20230221085352.212938-1-gshan@redhat.com>
 <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
 <3e88a2ec-6425-f484-8483-560d511a27ca@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3e88a2ec-6425-f484-8483-560d511a27ca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/2/23 10:21, Gavin Shan wrote:
> On 2/21/23 8:15 PM, Philippe Mathieu-Daudé wrote:
>> On 21/2/23 09:53, Gavin Shan wrote:
>>> Linux kernel guest reports warning when two CPUs in one socket have
>>> been associated with different NUMA nodes, using the following command
>>> lines.
>>>
>>>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>>
>>>    ------------[ cut here ]------------
>>>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 
>>> build_sched_domains+0x284/0x910
>>>    Modules linked in:
>>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>>>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>    pc : build_sched_domains+0x284/0x910
>>>    lr : build_sched_domains+0x184/0x910
>>>    sp : ffff80000804bd50
>>>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>>>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>>>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>>>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>>>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>>>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>>>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>>>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>>>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>>>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>>>    Call trace:
>>>     build_sched_domains+0x284/0x910
>>>     sched_init_domains+0xac/0xe0
>>>     sched_init_smp+0x48/0xc8
>>>     kernel_init_freeable+0x140/0x1ac
>>>     kernel_init+0x28/0x140
>>>     ret_from_fork+0x10/0x20
>>>
>>> Fix it by preventing mutiple CPUs in one socket to be associated with
>>> different NUMA nodes.
>>>
>>> Reported-by: Yihuang Yu <yihyu@redhat.com>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 37 insertions(+)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index ac626b3bef..e0af267c77 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
>>>       return false;
>>>   }
>>> +static bool numa_state_valid(MachineState *ms)
>>> +{
>>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>> +    NumaState *state = ms->numa_state;
>>> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
>>> +    const CPUArchId *cpus = possible_cpus->cpus;
>>> +    int len = possible_cpus->len, i, j;
>>> +
>>> +    if (!state || state->num_nodes <= 1 || len <= 1) {
>>> +        return true;
>>> +    }
>>> +
>>> +    for (i = 0; i < len; i++) {
>>> +        for (j = i + 1; j < len; j++) {
>>> +            if (cpus[i].props.has_socket_id &&
>>> +                cpus[i].props.has_node_id &&
>>> +                cpus[j].props.has_socket_id &&
>>> +                cpus[j].props.has_node_id &&
>>> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
>>> +                cpus[i].props.node_id != cpus[j].props.node_id) {
>>> +                error_report("CPU-%d and CPU-%d in socket-%ld have 
>>> been "
>>> +                             "associated with node-%ld and node-%ld",
>>> +                             i, j, cpus[i].props.socket_id,
>>> +                             cpus[i].props.node_id,
>>> +                             cpus[j].props.node_id);
>>> +                return false;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>   static void create_randomness(MachineState *ms, const char *node)
>>>   {
>>>       struct {
>>> @@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState *machine)
>>>           exit(1);
>>>       }
>>> +    if (!numa_state_valid(machine)) {
>>> +        exit(1);
>>> +    }
>>
>> Why restrict to the virt machine?
>>
> 
> We tried x86 machines and virt machine, but the issue isn't reproducible 
> on x86 machines.
> So I think it's machine or architecture specific issue. However, I 
> believe RiscV should
> have similar issue because linux/drivers/base/arch_topology.c is shared 
> by ARM64 and RiscV.
> x86 doesn't use the driver to populate its CPU topology.

Oh, I haven't thought about the other archs, I meant this seem a generic
issue which affects all (ARM) machines, so why restrict to the (ARM)
virt machine?


