Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C83F5905
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 09:30:55 +0200 (CEST)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIQta-0003YT-CS
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 03:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIQsM-0002rD-RQ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 03:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIQsL-00074U-1J
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 03:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629790175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWZCiqFBEMd41lZzZZqFtsDC+DMyPLpvxX7U6CAdQck=;
 b=WwlfXbfASu1PZa4hKb+KEslfRA4AO61cVx2iSz1QI8SjyO72ArmNByGu9l5cRGEzFmz2z3
 4yojAaX1y9CgmR2iNB4Yctxpke8Ml5hlzYuIp7+b9irDGLtSfpRv+2gRTalibWMLvy5XfX
 pi32GK+UziSXL3Hgj045BV8L+QLVaCM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537--n877eB0Otal48ztsQlCuw-1; Tue, 24 Aug 2021 03:29:34 -0400
X-MC-Unique: -n877eB0Otal48ztsQlCuw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso837918wma.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 00:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OWZCiqFBEMd41lZzZZqFtsDC+DMyPLpvxX7U6CAdQck=;
 b=BdjbRk2rqf8/w5poLE0p3hKUSrl6WVAl/6YAxB2znAA2XOkpTCIRolKBlNxih6UP+e
 kqw27HXOcj/oXa05nDma+YDJn0FhQePhdAKBlOLSKXB09rjofWMQLIV7DIkDHJO9aKHa
 loXYIqSPwhE6xmgZHAPawtX4r3ELxIc+07JZc8tT11WGTwXY2Sm3s0QOmhzNoWGf4ET2
 pnr/hnU+BiuCuO64OrDuMw5IEKBBNIZrHcXprG1rs2bhpde9StkLhcHesjAdcqlVYq2k
 WyVqH9aZRS4lbpt4YjleM7DGa1t/lZ5MYnFrf6bA6pcpW8jZRjAJcjOL0X6r+K4PMe/c
 AOmA==
X-Gm-Message-State: AOAM532JDi2x18/Nk/Tz26NMBsL24o8tbgxlM4A9xhswFqdbWX5V7eHg
 rC0d4rgsx9T+bxin03Bm3yKJKFmrs+lPCbhhlqPR4e/H54V7ty0rZ/9OenfljbsVS/Do3pWaF7i
 KN+0/VBWbMmKlPFI=
X-Received: by 2002:a5d:590e:: with SMTP id v14mr17874466wrd.322.1629790173384; 
 Tue, 24 Aug 2021 00:29:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5y//DH+XGfCBVA+rigzFHMXAqjVX75d34zog5LubkGCD55i2muxM+wPVe5JG7tfXsabAKgw==
X-Received: by 2002:a5d:590e:: with SMTP id v14mr17874451wrd.322.1629790173218; 
 Tue, 24 Aug 2021 00:29:33 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 19sm1439970wmo.39.2021.08.24.00.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 00:29:32 -0700 (PDT)
Subject: Re: [PATCH v7 05/15] machine: Improve the error reporting of smp
 parsing
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210823122804.7692-1-wangyanan55@huawei.com>
 <20210823122804.7692-6-wangyanan55@huawei.com>
 <c5a2bacc-ea23-6de7-2dd5-f0451034d2a8@redhat.com>
 <4b49fb0c-ec73-d8ca-f622-cc8e21ed0140@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a9adbc4d-c111-1280-965e-0242f9f43da8@redhat.com>
Date: Tue, 24 Aug 2021 09:29:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4b49fb0c-ec73-d8ca-f622-cc8e21ed0140@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Thomas Huth <thuth@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 6:51 AM, wangyanan (Y) wrote:
> On 2021/8/23 21:17, Philippe Mathieu-Daudé wrote:
>> On 8/23/21 2:27 PM, Yanan Wang wrote:
>>> We have two requirements for a valid SMP configuration:
>>> the product of "sockets * cores * threads" must represent all the
>>> possible cpus, i.e., max_cpus, and then must include the initially
>>> present cpus, i.e., smp_cpus.
>>>
>>> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
>>> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
>>> order of the sanity check, we can simplify the error reporting code.
>>> When reporting an error message we also report the exact value of
>>> each topology member to make users easily see what's going on.
>>>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>>> ---
>>>   hw/core/machine.c | 22 +++++++++-------------
>>>   hw/i386/pc.c      | 24 ++++++++++--------------
>>>   2 files changed, 19 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 85908abc77..093c0d382d 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -779,25 +779,21 @@ static void smp_parse(MachineState *ms,
>>> SMPConfiguration *config, Error **errp)
>>>       maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>>>       cpus = cpus > 0 ? cpus : maxcpus;
>>>   -    if (sockets * cores * threads < cpus) {
>>> -        error_setg(errp, "cpu topology: "
>>> -                   "sockets (%u) * cores (%u) * threads (%u) < "
>>> -                   "smp_cpus (%u)",
>>> -                   sockets, cores, threads, cpus);
>>> +    if (sockets * cores * threads != maxcpus) {
>>> +        error_setg(errp, "Invalid CPU topology: "
>>> +                   "product of the hierarchy must match maxcpus: "
>>> +                   "sockets (%u) * cores (%u) * threads (%u) "
>>> +                   "!= maxcpus (%u)",
>>> +                   sockets, cores, threads, maxcpus);
>>>           return;
>>>       }
>> Thinking about scalability, MachineClass could have a
>> parse_cpu_topology() handler, and this would be the
>> generic one. Principally because architectures don't
>> use the same terms, and die/socket/core/thread arrangement
>> is machine specific (besides being arch-spec).
>> Not a problem as of today, but the way we try to handle
>> this generically seems over-engineered to me.
> Hi Philippe,
> 
> The reason for introducing a generic implementation and avoiding
> specific ones is that we thought there is little difference in parsing
> logic between the specific parsers. Most part of the parsing is the
> automatic calculation of missing values and the related error reporting,
> in which the only difference between parsers is the handling of specific
> (no matter of arch-specific or machine-specifc) parameters.
> 
> So it may be better to keep the parsing logic unified if we can easily
> realize that. And actually we can use compat stuff to handle specific
> topology parameters well. See implementation in patch #10.
> 
> There have been patches on list introducing new specific members
> (s390 related in [1] and ARM related in [2]), and in each of them there
> is a specific parser needed. However, based on generic one we can
> extend without the increasing code duplication.
> 
> There is also some discussion about generic/specific parser in [1],
> which can be a reference.
> 
> [1]
> https://lore.kernel.org/qemu-devel/1626281596-31061-2-git-send-email-pmorel@linux.ibm.com/
> 
> [2]
> https://lore.kernel.org/qemu-devel/20210516103228.37792-1-wangyanan55@huawei.com/

OK I read Daniel's rationale here:
https://lore.kernel.org/qemu-devel/YPFN83pKBt7F97kW@redhat.com/

Thanks,

Phil.


