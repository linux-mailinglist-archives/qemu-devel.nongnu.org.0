Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D521B69DCAB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOju-00043N-40; Tue, 21 Feb 2023 04:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUOjr-000436-BS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:15:07 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUOjo-000820-9u
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:15:06 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k14-20020a05600c1c8e00b003e22107b7ccso1949429wms.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XN8KfQ1A/kaBhYR/X/RchPZgi3ozKXQH50VyYMVMi5o=;
 b=qwg9suWm8rVcZTiFBTh0G2v8sWAMuSMa6bR1Pto1HkrSbs5/FCCURMwdnOhcPNRBq2
 LFsnQgIBqcNIpwiHdZwZf28/gCD6Ahw98uw3O+I0C10VJd5cVTQLVOpvhGzFE/9uqwe9
 sGdclP+/S4mam1uIpw1te6JCmFQ9+MDuDQjdxGBDB35qjW/+kZQ6jh/wTc2jNLJRwTmp
 ghbVNtYfLMUoex0SRY7oaAoRsWFpvQbMZumawDE95sm9EI8wSO0dwZ/J273quI33Y2Fe
 2qUy5UxewXq1PABfy7Zuky1iRpqj7sBjqwcJSv2lhnjYaJJxCPBbx6XlkvK+6Towj9rH
 Mtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XN8KfQ1A/kaBhYR/X/RchPZgi3ozKXQH50VyYMVMi5o=;
 b=RujCqtPchAQLcH/fHOVk7CFPirTnmsTY2GfKMFb54PN99L4X23bld5/w+tIriYGtLj
 cPFkZuBQ5bz/Id2o+GSuSP0PoBxPLlScUvIy1SRFMAClKyMOc7EL+Yu8G9P1FCJel+np
 4lQnqS+tqayz01r1iyYTNSfsEohE0EJjRPi1XQfLlGJRqX8wbjMOu+OJS+dFi7yzpo5a
 3VrO9bcg2obPAK/2FaCupZEoofYeenIK/L0XJ8QfOnSW8QonuwsdpFyu2iEgZqYF53Nc
 NUniogtGPgRtB0ANm5yeqht6jB0C0LUbAT1Bsifgj5l4+eguA4qUWdv8dsAIKCC7FzGA
 xAtw==
X-Gm-Message-State: AO0yUKXv/y5OjpyvJPeSkNnZSJFMpIu9lbv6pwK6CZ4UrPjrccTE6QKT
 wIOxs77nWwtuLe6SECgVqOQqBg==
X-Google-Smtp-Source: AK7set9bnRWyJaym5GO1iCNKaXeJRSdJFbIrRUrnXJJH5wd06U0ITz0MZ5YuVKkKMjAZjxLewjlduw==
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id
 x7-20020a05600c188700b003e20918ecd4mr2851779wmp.37.1676970902357; 
 Tue, 21 Feb 2023 01:15:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u17-20020a7bc051000000b003dff2b493c8sm3649986wmc.36.2023.02.21.01.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 01:15:01 -0800 (PST)
Message-ID: <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
Date: Tue, 21 Feb 2023 10:15:00 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221085352.212938-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 09:53, Gavin Shan wrote:
> Linux kernel guest reports warning when two CPUs in one socket have
> been associated with different NUMA nodes, using the following command
> lines.
> 
>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>    Modules linked in:
>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : build_sched_domains+0x284/0x910
>    lr : build_sched_domains+0x184/0x910
>    sp : ffff80000804bd50
>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>    Call trace:
>     build_sched_domains+0x284/0x910
>     sched_init_domains+0xac/0xe0
>     sched_init_smp+0x48/0xc8
>     kernel_init_freeable+0x140/0x1ac
>     kernel_init+0x28/0x140
>     ret_from_fork+0x10/0x20
> 
> Fix it by preventing mutiple CPUs in one socket to be associated with
> different NUMA nodes.
> 
> Reported-by: Yihuang Yu <yihyu@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ac626b3bef..e0af267c77 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
>       return false;
>   }
>   
> +static bool numa_state_valid(MachineState *ms)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    NumaState *state = ms->numa_state;
> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> +    const CPUArchId *cpus = possible_cpus->cpus;
> +    int len = possible_cpus->len, i, j;
> +
> +    if (!state || state->num_nodes <= 1 || len <= 1) {
> +        return true;
> +    }
> +
> +    for (i = 0; i < len; i++) {
> +        for (j = i + 1; j < len; j++) {
> +            if (cpus[i].props.has_socket_id &&
> +                cpus[i].props.has_node_id &&
> +                cpus[j].props.has_socket_id &&
> +                cpus[j].props.has_node_id &&
> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
> +                cpus[i].props.node_id != cpus[j].props.node_id) {
> +                error_report("CPU-%d and CPU-%d in socket-%ld have been "
> +                             "associated with node-%ld and node-%ld",
> +                             i, j, cpus[i].props.socket_id,
> +                             cpus[i].props.node_id,
> +                             cpus[j].props.node_id);
> +                return false;
> +            }
> +        }
> +    }
> +
> +    return true;
> +}
> +
>   static void create_randomness(MachineState *ms, const char *node)
>   {
>       struct {
> @@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    if (!numa_state_valid(machine)) {
> +        exit(1);
> +    }

Why restrict to the virt machine?

