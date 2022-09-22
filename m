Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086FB5E5BA5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 08:50:32 +0200 (CEST)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obG2X-000232-6e
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 02:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1obFxQ-0000Uv-5E
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 02:45:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1obFxL-0006eU-Tz
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 02:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663829105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imMNN1JaK6dp8YnVmo84o4Tf7jUOebxUTcSDt3GgW/E=;
 b=dFCKZFKGjS59jBlKrMM0TqYTcxskzQ8sV15DzTMq6w3a/gOBLs+FD1XScqpu00vtMlQkJK
 tKW5bwZqknV3u1JBAuL4OJnMgWMn6raf73hJl4XYc/mL7pa8C+Ul23NEwJgMC7OwlVK8W1
 C/xkK8HtMg7jbpcS54foqDdXbClNmyc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-ysWk7_jPMvuvR_2tzeI1fQ-1; Thu, 22 Sep 2022 02:45:04 -0400
X-MC-Unique: ysWk7_jPMvuvR_2tzeI1fQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so5956953edz.0
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 23:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=imMNN1JaK6dp8YnVmo84o4Tf7jUOebxUTcSDt3GgW/E=;
 b=aHf2WFF+DbpNi0z4CFkjlwoXJvelmKOlf6nFPhHl66dhXSw39qS15ih2B92avC9/dD
 2Jmnx0imhjpRSXmwNnhKQ8gpvcfggK2sAC92OxiIjf/vdiDnLISbqLi9RQx4/4NWytfE
 6jItAJ+QvntE7Br4kdDhoc1Li7lGbqoZpput2cc+/i+CqPrZV8fTFVPO4wcIO9l9Kta7
 8mo4RUf+ow9bot0dHLj7WPwqG8f2Ivk44TnWKJ0OB7eY0NSGP9WmjSOjj2dL2GhRtsbH
 lswTIxA2vUwkLyDw9qhTiS1wZcyuvR4GZe83hST+a3WaSXCs5QDYi8UbSEHSv1nsh2WN
 yg4A==
X-Gm-Message-State: ACrzQf326vhERqBFBJEGII8lZ7GqYi1cDT5dNsjPzkdrwOcMNHM68THz
 yggR0PCfVi/lKdOSu0kL5Oo5UWUvamQTZkrg4Tcw4/nfOeDUPVng+7ze/5D2YIHIlzpfxVx+683
 rpERRZRC8deWZGAI=
X-Received: by 2002:a05:6402:28b:b0:454:3be1:a6de with SMTP id
 l11-20020a056402028b00b004543be1a6demr1673547edv.211.1663829103360; 
 Wed, 21 Sep 2022 23:45:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4v2RHLLjW60JK4B/KfdRixOoFV3o86ODDVKDsr9yIH9gcrT6KJykdvuTYTUkNT+vlOrWknaQ==
X-Received: by 2002:a05:6402:28b:b0:454:3be1:a6de with SMTP id
 l11-20020a056402028b00b004543be1a6demr1673523edv.211.1663829103171; 
 Wed, 21 Sep 2022 23:45:03 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 op7-20020a170906bce700b00781be3e7badsm2214440ejb.53.2022.09.21.23.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 23:45:02 -0700 (PDT)
Message-ID: <3b5ccd36-238a-f853-e877-04759f2a706a@redhat.com>
Date: Thu, 22 Sep 2022 08:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
 <d17620c7-5d52-c41b-66f2-3055a2dc572a@redhat.com>
 <b587ca18-945e-1f1d-519f-7f3f75ce32b6@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <b587ca18-945e-1f1d-519f-7f3f75ce32b6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.702, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 9/21/22 16:54, David Hildenbrand wrote:
> On 21.09.22 16:44, Michal Prívozník wrote:
>> On 7/21/22 14:07, David Hildenbrand wrote:
>>>
>>
>> Ping? Is there any plan how to move forward? I have libvirt patches
>> ready to consume this and I'd like to prune my old local branches :-)
> 
> Heh, I was thinking about this series just today. I was distracted with
> all other kind of stuff.
> 
> I'll move forward with this series later this week/early next week.

No rush, it's only that I don't want this to fall into void. Let me know
if I can help somehow. Meanwhile, here's my aforementioned branch:

https://gitlab.com/MichalPrivoznik/libvirt/-/tree/qemu_thread_context

I've made it so that ThreadContext is generated whenever
.prealloc-threads AND .host-nodes are used (i.e. no XML visible config
knob). And I'm generating ThreadContext objects for each memory backend
separately even though they can be reused, but IMO that's optimization
that can be done later.

Michal


