Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D049D3F3709
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 00:52:19 +0200 (CEST)
Received: from localhost ([::1]:42280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHDN4-0000bb-Ec
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 18:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mHDLP-00081C-5M
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 18:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mHDLM-0000qZ-BE
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 18:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629499830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaZUh9ghPS5XjhdXLAE8pt3nZUloYx5NYARCkpXBB1w=;
 b=VU6HgM+6/aSn5jdAOr+qecbkiSnkHjvq6c7J47QQFoqPGgeFavpZsWgHj+EN2Eubhu/7eT
 I3g+AoXC5NIoPlcRbYE02C1+rZviUWjopoTCHVU0D1NBgkXNc1wNSwEFneaRUATunqrdc1
 csQ4vRWD1x6506uV7QYMW1ogS4c1GC8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-v_IKhzUkNBWXXoCsFlNWng-1; Fri, 20 Aug 2021 18:50:29 -0400
X-MC-Unique: v_IKhzUkNBWXXoCsFlNWng-1
Received: by mail-wr1-f72.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso3300962wrm.9
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 15:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HaZUh9ghPS5XjhdXLAE8pt3nZUloYx5NYARCkpXBB1w=;
 b=dkJ1KisK2BmW2Hti7ukBjpwc0PNI0cCpkaxGjfyHxfx6YKfrqoTJjQ/7f4n3urRtjq
 bZAfWBcoKcioKbQAr9MCu1mmNGvkTk2TV068ovm44ToYwZyd6/KVKXP7rMGCoE66A5mw
 OU/rMJ832qfsWa3ivllaE+gUEy2mptV2WF1lrY1KufzG00fBM3Z9l8SNBVzDCAlR8tmr
 MP6XXg2n2Dnqxgkut5SJcYaobeQGvPPlJAaWKSqs1WEGrCIpZwSqVPa4znFJs47MSRBS
 W53MH4H3QU713s6MVhKMNQih2WDn7EL76N/umTdSOC1vmsutO/6++ywbml5JmxneIaJz
 R2eQ==
X-Gm-Message-State: AOAM533KVOlGtiLWr0u85CQlRQMa32Yowa3jrW6L8fflp4VPF9fKxA43
 yaP6le1gNZYwDC1FnPQQngc/xmaAx+gfXZ7vv1FuTRKqxeXB7NAQpK3J/lnuhk35X0prrN/x73X
 17Jngh3WbS4vgIg4=
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr1041827wrx.426.1629499827794; 
 Fri, 20 Aug 2021 15:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrnlue9WUotk5etxpdjnKa3xaSsrW1QqoX5VgVloOsdV6pyZ/nK8ArjNpLG6vpDIZ2rD4Gdg==
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr1041812wrx.426.1629499827598; 
 Fri, 20 Aug 2021 15:50:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h6sm7095423wmq.5.2021.08.20.15.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 15:50:27 -0700 (PDT)
Subject: Re: [PATCH] memory: Have 'info mtree' remove duplicated Address Space
 information
To: Peter Xu <peterx@redhat.com>
References: <20210820105435.3034561-1-philmd@redhat.com>
 <73fa7b2f-fba2-6af0-5cf4-2066d7f625e5@redhat.com> <YSANtgAah4THaxub@t490s>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <15b14de0-40e9-835b-5734-71602a29b329@redhat.com>
Date: Sat, 21 Aug 2021 00:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSANtgAah4THaxub@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 10:16 PM, Peter Xu wrote:
> Phil,
> 
> On Fri, Aug 20, 2021 at 12:58:05PM +0200, Philippe Mathieu-Daudé wrote:
>>>   (qemu) info mtree
>>>   address-space: I/O
>>>     0000000000000000-000000000000ffff (prio 0, i/o): io
>>>
>>>   address-space shared 9 times:
>>>     - cpu-memory-0
>>>     - cpu-memory-1
>>>     - cpu-memory-2
>>>     - cpu-memory-3
>>>     - cpu-secure-memory-0
>>>     - cpu-secure-memory-1
>>>     - cpu-secure-memory-2
>>>     - cpu-secure-memory-3
>>>     - memory
> 
> Do you think below would look better?
> 
>    address-space cpu-memory-0:
>    address-space cpu-memory-1:
>    address-space cpu-memory-3:
>    ...
>    address-space memory:
>      [memory ranges]

OK.

> "info mtree -f" has something similar:
> 
> FlatView #2
>  AS "ich9-ahci", root: bus master container
>  AS "vtd-root", root: vtd-00.0
>  AS "virtio-blk-pci", root: bus master container
>  AS "vtd-root", root: vtd-01.0
>  AS "vtd-root", root: vtd-02.0
>  AS "vtd-root", root: vtd-03.0
>  AS "vtd-root", root: vtd-04.0
>  AS "vtd-root", root: vtd-1f.0
>  AS "vtd-root", root: vtd-1f.2
>  AS "vtd-root", root: vtd-1f.3
>  Root memory region: vtd-nodmar
>    [memory ranges]
> 
> [...]
> 
>>> +struct AddressSpaceInfo {
>>> +    MemoryRegionListHead *ml_head;
>>> +    int counter;
>>
>> Doh this field is unused :/
> 
> Looks good to me otherwise.

Thanks!

Phil.


