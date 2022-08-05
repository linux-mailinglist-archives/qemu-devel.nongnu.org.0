Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D958ADB1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:53:23 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzda-0006i0-Vc
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJzbY-0002QR-AZ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJzbR-0004ST-6K
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659714668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ee0FZ5CrPLTCnSVrilgGUULd3s5JA4pa6kqxC9ZuQ9w=;
 b=XAWLkz7FnXgJowoMdWI5iyWAPIspD2r/ZoMoXY0erJDfl3WNdxJsNnbtY6nuhxnEV/TQNd
 isXmBv8N9D5sYs+TNDjGAurez1xentIvH46o2E3euHWW5Pls+2/ZmI7zapgvtlhEZrjYuT
 z5M+ApbL1WLRXrOl1rjn9zB8ekV6vNk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-7C0pAChyMEGQZwx7ljyLFw-1; Fri, 05 Aug 2022 11:51:07 -0400
X-MC-Unique: 7C0pAChyMEGQZwx7ljyLFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h133-20020a1c218b000000b003a4f57eaeaaso1403671wmh.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=Ee0FZ5CrPLTCnSVrilgGUULd3s5JA4pa6kqxC9ZuQ9w=;
 b=4HofUuuS1ItX8gZMkkg9P71aKpxopVLUJQEAi+QzYUffg5s+D5AX7QG9BKb5mbSoA8
 +EQDiU0MFRe3daCwGrApvhDYvmfwvwL9QwpC2SaZ47diCYvwXfBYoC4lUYZF8ZXTzLMb
 1hoVYbM+O267fQjBPpIe3aWHJz8dUmA5k7rgkYQB+lcvQM21veT4hC4KOFsIi+qZSxdj
 eu9dVjEFaksoK+hIcEGtK2k8niwyYQbR70t5wv2Mt+pQ89lZhkNyF4cVpNkGTUgJH/52
 MS9oG997Qux4Tp7ZzIgkLvWvdRkmOeN14qmzHS8D1NNK2pef8n43ammxET6o4qDMXyIl
 Fk+g==
X-Gm-Message-State: ACgBeo1g/Ufvq8bBTi3esAHaQqN+H3vr0MyrVkGojh6KQI5jhzJt5J9I
 wrRpfjXtbSJYnC88J4MfgeulaZcALxOqYkr0rgZKOe3kmAhLeTfoPTt+9TFV1GPfbpFF8VjY/L8
 6jPsMqtGqGbK8/PM=
X-Received: by 2002:adf:f684:0:b0:221:7af4:45be with SMTP id
 v4-20020adff684000000b002217af445bemr1182632wrp.509.1659714665818; 
 Fri, 05 Aug 2022 08:51:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5QPP7jxwYYPWZ2NqvOtnaY9REmBjhH02o/wQdH6//iU6ZBDeOj60U1MUh3RGRw28Y0ZrjoUQ==
X-Received: by 2002:adf:f684:0:b0:221:7af4:45be with SMTP id
 v4-20020adff684000000b002217af445bemr1182611wrp.509.1659714665516; 
 Fri, 05 Aug 2022 08:51:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52?
 (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de.
 [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a4a5bcd37esm9829861wma.23.2022.08.05.08.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:51:05 -0700 (PDT)
Message-ID: <4b56eb89-96cb-fe06-3897-e85b9ad6aa68@redhat.com>
Date: Fri, 5 Aug 2022 17:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC 7/7] vl: Allow ThreadContext objects to be created
 before the sandbox option
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
 <20220721120732.118133-8-david@redhat.com>
 <450f1c5b-1730-5e5c-b9bc-7cd5e744c250@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <450f1c5b-1730-5e5c-b9bc-7cd5e744c250@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.08.22 13:01, Michal Prívozník wrote:
> On 7/21/22 14:07, David Hildenbrand wrote:
>> Currently, there is no way to configure a CPU affinity inside QEMU when
>> the sandbox option disables it for QEMU as a whole, for example, via:
>>     -sandbox enable=on,resourcecontrol=deny
>>
>> While ThreadContext objects can be created on the QEMU commandline and
>> the CPU affinity can be configured externally via the thread-id, this is
>> insufficient if a ThreadContext with a certain CPU affinity is already
>> required during QEMU startup, before we can intercept QEMU and
>> configure the CPU affinity.
>>
>> Blocking sched_setaffinity() was introduced in 24f8cdc57224 ("seccomp:
>> add resourcecontrol argument to command line"), "to avoid any bigger of the
>> process". However, we only care about once QEMU is running, not when
>> the instance starting QEMU explicitly requests a certain CPU affinity
>> on the QEMU comandline.
>>
>> Right now, for NUMA-aware preallocation of memory backends used for initial
>> machine RAM, one has to:
>>
>> 1) Start QEMU with the memory-backend with "prealloc=off"
>> 2) Pause QEMU before it starts the guest (-S)
>> 3) Create ThreadContext, configure the CPU affinity using the thread-id
>> 4) Configure the ThreadContext as "prealloc-context" of the memory
>>    backend
>> 5) Trigger preallocation by setting "prealloc=on"
>>
>> To simplify this handling especially for initial machine RAM,
>> allow creation of ThreadContext objects before parsing sandbox options,
>> such that the CPU affinity requested on the QEMU commandline alongside the
>> sandbox option can be set. As ThreadContext objects essentially only create
>> a persistant context thread and set the CPU affinity, this is easily
>> possible.
>>
>> With this change, we can create a ThreadContext with a CPU affinity on
>> the QEMU commandline and use it for preallocation of memory backends
>> glued to the machine (simplified example):
>>
>> qemu-system-x86_64 -m 1G \
>>  -object thread-context,id=tc1,cpu-affinity=3-4 \
>>  -object memory-backend-ram,id=pc.ram,size=1G,prealloc=on,prealloc-threads=2,prealloc-context=tc1 \
>>  -machine memory-backend=pc.ram \
>>  -S -monitor stdio -sandbox enable=on,resourcecontrol=deny
>>
>> And while we can query the current CPU affinity:
>>   (qemu) qom-get tc1 cpu-affinity
>>   [
>>       3,
>>       4
>>   ]
>>
>> We can no longer change it from QEMU directly:
>>   (qemu) qom-set tc1 cpu-affinity 1-2
>>   Error: Setting CPU affinity failed: Operation not permitted
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  softmmu/vl.c | 30 +++++++++++++++++++++++++++++-
>>  1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index aabd82e09a..252732cf5d 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -1761,6 +1761,27 @@ static void object_option_parse(const char *optarg)
>>      visit_free(v);
>>  }
>>  
>> +/*
>> + * Very early object creation, before the sandbox options have been activated.
>> + */
>> +static bool object_create_pre_sandbox(const char *type)
>> +{
>> +    /*
>> +     * Objects should in general not get initialized "too early" without
>> +     * a reason. If you add one, state the reason in a comment!
>> +     */
>> +
>> +    /*
>> +     * Reason: -sandbox on,resourcecontrol=deny disallows setting CPU
>> +     * affinity of threads.
>> +     */
>> +    if (g_str_equal(type, "thread-context")) {
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>  /*
>>   * Initial object creation happens before all other
>>   * QEMU data types are created. The majority of objects
>> @@ -1775,6 +1796,11 @@ static bool object_create_early(const char *type)
>>       * add one, state the reason in a comment!
>>       */
>>  
>> +    /* Reason: already created. */
>> +    if (object_create_pre_sandbox(type)) {
>> +        return false;
>> +    }
>> +
>>      /* Reason: property "chardev" */
>>      if (g_str_equal(type, "rng-egd") ||
>>          g_str_equal(type, "qtest")) {
>> @@ -1895,7 +1921,7 @@ static void qemu_create_early_backends(void)
>>   */
>>  static bool object_create_late(const char *type)
>>  {
>> -    return !object_create_early(type);
>> +    return !object_create_early(type) && !object_create_pre_sandbox(type);
>>  }
>>  
>>  static void qemu_create_late_backends(void)
>> @@ -2365,6 +2391,8 @@ static int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp)
>>  
>>  static void qemu_process_early_options(void)
>>  {
>> +    object_option_foreach_add(object_create_pre_sandbox);
>> +
>>  #ifdef CONFIG_SECCOMP
>>      QemuOptsList *olist = qemu_find_opts_err("sandbox", NULL);
>>      if (olist) {
> 
> Cool, this is processed before -sandbox, so threads can have their
> affinity. However, it's also processed before -name debug-threads=on
> which means that even though we try to set a thread name in 3/7, it's
> effectively a dead code because name_threads from
> util/qemu-thread-posix.c is still false. Could we shift things a bit?
> E.g. like this:
> 
> static void qemu_process_early_options(void)
> {
>     qemu_opts_foreach(qemu_find_opts("name"),
>                       parse_name, NULL, &error_fatal);
> 
>     object_option_foreach_add(object_create_pre_sandbox);


Thanks for pointing that out. IMHO yes, there isn't too much magic to
parse_name().

-- 
Thanks,

David / dhildenb


