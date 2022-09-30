Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6205F0780
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:24:17 +0200 (CEST)
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCFk-0001xi-1G
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oeC94-0004eB-Ey
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oeC90-0004bn-F2
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664529428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YY4S2RlK0zFYXl0inKbxAGb7vqbE7rZJti54Hcxi8hY=;
 b=djicgoYvZXeHxundjHPgvXWS2vzdNdOa/KuARkB2LsovMwZy9OEccHKA/+rgKaTlJoYYF4
 i7NdepNfAt4WX420wYhTzuBDGdO73nWKECqEfLN3FW4d9TwuL6vEwHMZUZxzd+Q39F+kjH
 WbXiuY1UXFtIIcLJYraBWZzcM1VMxFI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-9gct3SJBP7e-Xj5ehI1Y0Q-1; Fri, 30 Sep 2022 05:17:06 -0400
X-MC-Unique: 9gct3SJBP7e-Xj5ehI1Y0Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 g15-20020adfbc8f000000b0022a4510a491so1352794wrh.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=YY4S2RlK0zFYXl0inKbxAGb7vqbE7rZJti54Hcxi8hY=;
 b=wzo/h9BlYcwl4mdF0BWRc+uxVyFx1Y5p8B9M0+6Y0Thynnb3j9DRl3RsN+fravSBMg
 riiUMhNW4Fr0P11SIlPFrqnFWL8j+Zov4vrUlf1HnXaIM/qG/K8vbwbB/0eo6FrhaexZ
 PxtTfntMUboV+dVZyVxI38u5olX/VLxNX/5Z9vcQdc4Qyz4qiIOm/HQodJYpBH/KNs5c
 zBODayLDpMtTvfodNSt6I4jdiWr1QTPxoTsFQsxvUnxgbwwElmxdMTRSuxSaiVu1KHrv
 0VDu+VgWWlOn8dLu1xn25qS0h9coRQ0xBt3IfUdnP7qGrZ234RcYg+OHszWv1pqDJRM5
 aC4w==
X-Gm-Message-State: ACrzQf0S35pwNTpZPtYJgl/sc8txtAhSKCNTUYTldQuDKKffRzBUfRlE
 L2CFJGbqjxHsQRR3cdJMRDF81VOa8MCfhsClLz270z/as9SJO1FiEllcDPqk9nD1VXwScNENJkk
 lPUad/SCCtaEFarM=
X-Received: by 2002:a05:6000:18a5:b0:22c:943d:221 with SMTP id
 b5-20020a05600018a500b0022c943d0221mr5071998wri.562.1664529425505; 
 Fri, 30 Sep 2022 02:17:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5t3w/4SV2sZq0PGFPyhgWEGDp1cJSbkCekz4jjsBdpO7GT0JKiZ6TP1mJH2M49KoE7N/KN2g==
X-Received: by 2002:a05:6000:18a5:b0:22c:943d:221 with SMTP id
 b5-20020a05600018a500b0022c943d0221mr5071977wri.562.1664529425186; 
 Fri, 30 Sep 2022 02:17:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:c00:48b:b68a:f9e0:ebce?
 (p200300cbc70c0c00048bb68af9e0ebce.dip0.t-ipconnect.de.
 [2003:cb:c70c:c00:48b:b68a:f9e0:ebce])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d5148000000b0022e04bfa661sm50449wrt.59.2022.09.30.02.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 02:17:04 -0700 (PDT)
Message-ID: <67bcf54c-f3ce-68cd-0533-1d4d44dacc90@redhat.com>
Date: Fri, 30 Sep 2022 11:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 4/7] util: Add write-only "node-affinity" property for
 ThreadContext
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220928164542.117952-1-david@redhat.com>
 <20220928164542.117952-5-david@redhat.com> <87a66itoug.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87a66itoug.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.09.22 13:13, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Let's make it easier to pin threads created via a ThreadContext to
>> all current CPUs belonging to given NUMA nodes.
>>
>> As "node-affinity" is simply a shortcut for setting "cpu-affinity", that
>> property cannot be read and if the CPUs for a node change due do CPU
>> hotplug, the CPU affinity will not get updated.
> 
> Color me confused.

I adjusted that to:

     util: Add write-only "node-affinity" property for ThreadContext
     
     Let's make it easier to pin threads created via a ThreadContext to
     all CPUs currently belonging to a given set of NUMA nodes -- which is the
     common case.
     
     "node-affinity" is simply a shortcut for setting "cpu-affinity" manually
     to the list of CPUs belonging to the set of nodes. This property can only
     be written.
     
     A simple QEMU example to set the CPU affinity to Node 1 on a system with
     two NUMA nodes, 24 CPUs each:
         qemu-system-x86_64 -S \
           -object thread-context,id=tc1,node-affinity=1
     
     And we can query the cpu-affinity via HMP/QMP:
         (qemu) qom-get tc1 cpu-affinity
         [
             1,
             3,
             5,
             7,
             9,
             11,
             13,
             15,
             17,
             19,
             21,
             23,
             25,
             27,
             29,
             31,
             33,
             35,
             37,
             39,
             41,
             43,
             45,
             47
         ]
     
     We cannot query the node-affinity:
         (qemu) qom-get tc1 node-affinity
         Error: Insufficient permission to perform this operation
     
     But note that due to dynamic library loading this example will not work
     before we actually make use of thread_context_create_thread() in QEMU
     code, because the type will otherwise not get registered.
     
     Note that if the CPUs for a node change due do physical CPU hotplug or
     hotunplug (e.g., lscpu output changes) after the ThreadContext was started,
     the CPU affinity will not get updated.



> 
>> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   qapi/qom.json         |  7 +++-
>>   util/meson.build      |  2 +-
>>   util/thread-context.c | 84 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 91 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 4775a333ed..d36bf3355f 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -838,10 +838,15 @@
>>   # @cpu-affinity: the CPU affinity for all threads created in the thread
>>   #                context (default: QEMU main thread affinity)
>>   #
>> +# @node-affinity: shortcut for looking up the current CPUs for the given nodes
>> +#                 and setting @cpu-affinity (default: QEMU main thread
>> +#                 affinity)
>> +#
> 
> Still confused.  Explain for dummies?  With an example, perhaps?
> 

I adjusted that to:

+# @node-affinity: the list of node numbers that will be resolved to a list
+#                 of CPU numbers used as CPU affinity. This is a shortcut for
+#                 specifying the list of CPU numbers belonging to the nodes
+#                 manually by setting @cpu-affinity. (default: QEMU main thread
+#                 affinity)
+#

Thanks!

-- 
Thanks,

David / dhildenb


