Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766E650B722
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:19:19 +0200 (CEST)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsFq-0005Rg-Io
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhrK5-0002hB-Us
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhrK4-0008Jl-2Y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650626375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3Se5rM3YOMJIUpybN0Yt53Jh/vNmSn1WCZ43d1D2Pw=;
 b=at4uxy4W6tW/E6QpYrhZDrUhskYAVbyNAbc7l5QBClWYGtP57SiTURXUDaXzh0H5QLssz5
 VbPlKefpMTL+jDPTp0jolKTgirhIreQmbKMYjz/zBnCyX6mgOGNrL3CYzmHIegiDaLjt/v
 Yh6jdzpnj93KDYoKKYgzfNGHkPF0mvU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-UgqOfVxIPqKGMzKrTrAHgg-1; Fri, 22 Apr 2022 07:19:34 -0400
X-MC-Unique: UgqOfVxIPqKGMzKrTrAHgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8053A29AA2ED;
 Fri, 22 Apr 2022 11:19:33 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11E53C44CC3;
 Fri, 22 Apr 2022 11:19:23 +0000 (UTC)
Subject: Re: [PATCH v7 1/4] qapi/machine.json: Add cluster-id
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220420104909.233058-1-gshan@redhat.com>
 <20220420104909.233058-2-gshan@redhat.com>
 <b1c7a10a-40ca-c7c7-0512-357271c67598@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0a59ae45-c8f6-9e57-e5aa-5f16026d3704@redhat.com>
Date: Fri, 22 Apr 2022 19:19:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <b1c7a10a-40ca-c7c7-0512-357271c67598@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan,

On 4/21/22 7:51 PM, wangyanan (Y) wrote:
> On 2022/4/20 18:49, Gavin Shan wrote:
>> This adds cluster-id in CPU instance properties, which will be used
>> by arm/virt machine. Besides, the cluster-id is also verified or
>> dumped in various spots:
>>
>>    * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>>      CPU with its NUMA node.
>>
>>    * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>>      CPU with NUMA node when no default association isn't provided.
> nit: It doesn't really matter too much. But maybe clearer to read a sentence like
> "machine_numa_finish_cpu_init() to record CPU slots with no NUMA mapping set."

I will modify this accordingly in v8. I prefer to hold v8 posting for
several days in case someone still have more comments on v7.

>>
>>    * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>>      cluster-id.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine-hmp-cmds.c |  4 ++++
>>   hw/core/machine.c          | 16 ++++++++++++++++
>>   qapi/machine.json          |  6 ++++--
>>   3 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
>> index 4e2f319aeb..5cb5eecbfc 100644
>> --- a/hw/core/machine-hmp-cmds.c
>> +++ b/hw/core/machine-hmp-cmds.c
>> @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>>           if (c->has_die_id) {
>>               monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
>>           }
>> +        if (c->has_cluster_id) {
>> +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
>> +                           c->cluster_id);
>> +        }
>>           if (c->has_core_id) {
>>               monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
>>           }
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 1e23fdc14b..ac91dfd834 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -679,6 +679,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>               return;
>>           }
>> +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
>> +            error_setg(errp, "cluster-id is not supported");
>> +            return;
>> +        }
>> +
>>           if (props->has_socket_id && !slot->props.has_socket_id) {
>>               error_setg(errp, "socket-id is not supported");
>>               return;
>> @@ -698,6 +703,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>                   continue;
>>           }
>> +        if (props->has_cluster_id &&
>> +            props->cluster_id != slot->props.cluster_id) {
>> +                continue;
>> +        }
>> +
>>           if (props->has_die_id && props->die_id != slot->props.die_id) {
>>                   continue;
>>           }
>> @@ -992,6 +1002,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>>           }
>>           g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>>       }
>> +    if (cpu->props.has_cluster_id) {
>> +        if (s->len) {
>> +            g_string_append_printf(s, ", ");
>> +        }
>> +        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
>> +    }
>>       if (cpu->props.has_core_id) {
>>           if (s->len) {
>>               g_string_append_printf(s, ", ");
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index d25a481ce4..4c417e32a5 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -868,10 +868,11 @@
>>   # @node-id: NUMA node ID the CPU belongs to
>>   # @socket-id: socket number within node/board the CPU belongs to
>>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>> -# @core-id: core number within die the CPU belongs to
>> +# @cluster-id: cluster number within die the CPU belongs to (since 7.1)
>> +# @core-id: core number within cluster the CPU belongs to
>>   # @thread-id: thread number within core the CPU belongs to
>>   #
>> -# Note: currently there are 5 properties that could be present
>> +# Note: currently there are 6 properties that could be present
>>   #       but management should be prepared to pass through other
>>   #       properties with device_add command to allow for future
>>   #       interface extension. This also requires the filed names to be kept in
>> @@ -883,6 +884,7 @@
>>     'data': { '*node-id': 'int',
>>               '*socket-id': 'int',
>>               '*die-id': 'int',
>> +            '*cluster-id': 'int',
>>               '*core-id': 'int',
>>               '*thread-id': 'int'
>>     }

Thanks,
Gavin


