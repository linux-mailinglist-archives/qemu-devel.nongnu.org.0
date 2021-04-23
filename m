Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341DC369483
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 16:22:53 +0200 (CEST)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZwho-0007yn-0y
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 10:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZwgV-0007Ze-1u
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZwgR-0006tR-TJ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619187686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vedEytwA5Q7GAe6u1pqxkXNvT/5EHzbeL/kpjOzcHk=;
 b=LzdJKn5VaC1dLj7a8J7Lfg8vsEvuBkEmTgRFt9jMvYtsyqhFFpHNIyrJKL1VOjOV4E5XxN
 KnKQ+in7Mhvj9h6Urf5feDOBv+/xKCpPpS9tlu4OncZBPdS392ZH0Z0N+LxUzK/HvJ1rcE
 c8EpMAyYip5r8s6p33/gac9p/b1sy1w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-VunE7hkMO5mpWfduCRoe7w-1; Fri, 23 Apr 2021 10:21:25 -0400
X-MC-Unique: VunE7hkMO5mpWfduCRoe7w-1
Received: by mail-wr1-f71.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so3550343wrs.19
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 07:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/vedEytwA5Q7GAe6u1pqxkXNvT/5EHzbeL/kpjOzcHk=;
 b=lpM7UI3XgZdSpJqS8edIg8ypLNiGXozA6hItuA1RDdMdrLrqXd9R36Y7suH1lLXKVJ
 kOaQvPzUS2b+S5yZe3dVCk+1NtpjjdJePuGPKL1HhyB9Rs1lsUzliVdEZGuEpay8IgAG
 L+276lmCFjE3OreCK5RP07dSVJl+X9aB7R5RViluy6E7iufglp+GIv5RLWZz1m0MXgbx
 m/XUE09Tn0R6QW/qidpFUybSykFvjtaaM3yBKtJz7Uu2nAyPcbciIO/mNPUhucWeJ5ag
 aa8LhMQ3OnZA1jMTvtOC+7+KD1lUGlGW3NAGQ8JlMHIerXJc3mJSM44tUD0Kc3pwEROV
 Zcfw==
X-Gm-Message-State: AOAM531eopNvlEScsypfqwgqFwUuJMaEC8hT2wJ6Nj0JKVcEnZ+6BFGk
 U4MON/sdhyt1WOw9h1qT2CNX3gmoSQZh/jhNDbkJb/JXIVTR78JzXIFEgT7TeDeVlHvxip6vaib
 klpKMLibLQHH03DQ=
X-Received: by 2002:adf:e58f:: with SMTP id l15mr4946017wrm.175.1619187683907; 
 Fri, 23 Apr 2021 07:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaclg2BaA5WEnR24N5wf4GnOhsI43Hv4GMO0PzXAZTTRVYS9gEaohH8TE50obGBapikiGMVg==
X-Received: by 2002:adf:e58f:: with SMTP id l15mr4945979wrm.175.1619187683645; 
 Fri, 23 Apr 2021 07:21:23 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 o62sm36792737wmo.3.2021.04.23.07.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 07:21:23 -0700 (PDT)
Subject: Re: [PATCH v6 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
To: Markus Armbruster <armbru@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-11-david@redhat.com>
 <87a6ppi77c.fsf@dusky.pond.sub.org>
 <7cf63e36-1d1c-113d-15b5-227d099d76a1@redhat.com>
 <878s59gq1v.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <884e43d0-36c1-f897-3a4e-03d96a9861c0@redhat.com>
Date: Fri, 23 Apr 2021 16:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <878s59gq1v.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.04.21 14:10, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>>>> diff --git a/backends/hostmem.c b/backends/hostmem.c
>>>> index c6c1ff5b99..58fdc1b658 100644
>>>> --- a/backends/hostmem.c
>>>> +++ b/backends/hostmem.c
>>>> @@ -217,6 +217,11 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
>>>>        Error *local_err = NULL;
>>>>        HostMemoryBackend *backend = MEMORY_BACKEND(obj);
>>>>    +    if (!backend->reserve && value) {
>>>> +        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
>>>> +        return;
>>>> +    }
>>>
>>> Aha.  Shouldn't this be documented in qom.json?
>>
>> Whoops, skipped that comment. Can add it if that's the place to
>> document that.
> 
> Yes, please.  .json doc comments is where we document the external
> interface.
> 

What about something like this:

diff --git a/qapi/qom.json b/qapi/qom.json
index e9b86893a5..4fa3137aab 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -559,6 +559,12 @@
  #                                        false generally, but true for machine
  #                                        types <= 4.0)
  #
+# Note: prealloc=true and reserve=false cannot be set at the same time. With
+#       reserve=true, the behavior depends on the operating system: for example,
+#       Linux will not reserve swap space for shared file mappings --
+#       "not applicable". In contrast, reserve=false will bail out if it cannot
+#       be configured accordingly.
+#
  # Since: 2.1
  ##
  { 'struct': 'MemoryBackendProperties',


-- 
Thanks,

David / dhildenb


