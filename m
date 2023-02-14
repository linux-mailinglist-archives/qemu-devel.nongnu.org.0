Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2356695F21
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrbU-0004t9-Rt; Tue, 14 Feb 2023 04:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRrbT-0004sn-4q
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:27:59 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRrbR-00086g-AD
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:27:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso4741932wms.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 01:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=th/wqkcbS8yLsBesrdlXZKptO8SujZi9h5i3iX4xDZE=;
 b=Q/X6N15EPq5Wgfq/l16T13ef/JWgmterbwaJawfySd+2Bjl9KU3mw2qxiJh44Y7+bs
 vVn8dICANcV5p9WkGqvY9ezLkyRYMi9d96EZKSXa30jjyFgq1A0GlCBa4GWrTa3WI7+Y
 gN+Dg/HF2kyamrNuz9CI6E2NqidHBIf7jrn/mPdsK74esIjuYNJYBjuHTyfYky/5zrAp
 TzP88dXVnYsHx/i3bfzMD/hvD86t9+eHa5YEvUSNEivVJSs/yw0HVPbu0wgogVeMMwTM
 URB53QZyFVMFxrzrAYhiCAqpEAlJWlN/AXAOIYDRHhDTDHWQLGMu9MKwWfM069vEQ4M7
 dk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=th/wqkcbS8yLsBesrdlXZKptO8SujZi9h5i3iX4xDZE=;
 b=K0rnmwOTQDjHGsWBHGWYydK++7XShwJ0NOeE1uJKmpGdPu85L88Pqb8ymlpCEZLhwc
 tL4syI3Qpvp2Jzt6VLQh1Mjm/OS3CJ3j3z+GftY67cecPPArIyVSUNIMdZiR83RlG1k4
 wcvewbtDmqYoKKaWpMop75mc4wG/nOn3ExbUiaaRKH7lj23ganlro1W9B/PlcRe7lZRE
 UaOlvVj/L9ASSwueF3dmIjqQjEHEYXxVY5l0EDhMHB6/2Aglydrk7txv9pKhU1cklJFC
 dfCIhDWVqbcMep0xBEUrEtyG9S4YSZlzULceg+E4LTuM+vAe7d87QLDzSsO+PRSXHHI5
 dJEQ==
X-Gm-Message-State: AO0yUKU1dS1esW2W/72bO6H65tm4210CH5jKEtp3cN0Pj46U8rf5apFV
 8WOCbTfZkNLXMtuFVma+4iwqZg==
X-Google-Smtp-Source: AK7set+ANTdU2zg9uhi4sATg90gleGFbbTRQU9iJOVlj1k2ICXnsbioJQ5pT9GlEMPjvOXruUB/dCg==
X-Received: by 2002:a05:600c:5124:b0:3dc:496f:ad56 with SMTP id
 o36-20020a05600c512400b003dc496fad56mr1428552wms.14.1676366875839; 
 Tue, 14 Feb 2023 01:27:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003dc47d458cdsm15664834wmg.15.2023.02.14.01.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 01:27:55 -0800 (PST)
Message-ID: <99722e63-8f9b-22c9-f0ff-aa4b2a55a2ae@linaro.org>
Date: Tue, 14 Feb 2023 10:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-7-zhao1.liu@linux.intel.com>
 <d0fa7c07-824a-6dfb-2eaf-2e8f72aa7ad6@linaro.org>
 <Y+tUzz22eOaCqV8g@liuzhao-OptiPlex-7080>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y+tUzz22eOaCqV8g@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 14/2/23 10:30, Zhao Liu wrote:
> On Mon, Feb 13, 2023 at 02:10:17PM +0100, Philippe Mathieu-Daudé wrote:
>> Date: Mon, 13 Feb 2023 14:10:17 +0100
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: Re: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
>>
>> On 13/2/23 10:49, Zhao Liu wrote:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> For smp systems, the parts in one topology level are the same. But now
>>> there are more and more systems with hybrid architectures. Different
>>> parts of the same topology level may have differences. For example,
>>> Intel's Alder Lake series CPU has two types of cores, so the CPU
>>> topology is no longer symmetrical.
>>>
>>> The hybrid topology is compatible with the smp topology type, that is,
>>> different parts on the same level of the hybrid topology can set to be
>>> the same, but the hybrid topology will introduce more complexity (need
>>> to allocate more memory, organized with array or linked-list), so the
>>> original smp topology support is retained while introducing the hybrid
>>> topology, and the hybrid topology is only built when the hybrid is
>>> explicitly required.
>>>
>>> Therefore, we introduce the definition support of hybrid cpu topology
>>> here. At the same time, in order to unify with the original smp, we
>>> introduce a new cpu topology structure that can support smp topology
>>> or hybrid topology. This structure will replace the CpuTopology type (in
>>> include/hw/boards.h) used by MachineState.smp.
>>>
>>> As for now, we only support two hybrid topology levels: core and
>>> cluster.
>>>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    MAINTAINERS                   |   1 +
>>>    include/hw/cpu/cpu-topology.h | 117 ++++++++++++++++++++++++++++++++++
>>>    qapi/machine.json             |  12 ++++
>>>    3 files changed, 130 insertions(+)
>>>    create mode 100644 include/hw/cpu/cpu-topology.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 58794885ced3..918a9418d98e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1742,6 +1742,7 @@ F: qapi/machine-target.json
>>>    F: include/hw/boards.h
>>>    F: include/hw/core/cpu.h
>>>    F: include/hw/cpu/cluster.h
>>> +F: include/hw/cpu/cpu-topology.h
>>>    F: include/sysemu/numa.h
>>>    F: tests/unit/test-smp-parse.c
>>>    T: git https://gitlab.com/ehabkost/qemu.git machine-next
>>
>> Worth splitting this section in 2, machine VS numa/clusters?
> 
> Do you mean splitting this header file into numa.h and cluster.h?

No, I meant the MAINTAINERS 'Machine' section.

> It seems that the cpu topology is not related to the content of
> numa.h,

And you seem to agree ;)

> and it may be possible to merge some content into cluster.h,
> but the definition in cluster.h is to use the cluster as a device
> (if I understand correctly...) , and cpu_topology.h is just about
> topology-related things.
> 
> I have not included the contents of cluster.h/cluster.c into hybrid
> considerations, but only modified the topology defined by smp.
> 
> Zhao


