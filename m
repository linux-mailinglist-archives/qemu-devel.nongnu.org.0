Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCE424F4E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:33:02 +0200 (CEST)
Received: from localhost ([::1]:44002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOpn-0001ns-Bg
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYOme-0008KH-2t
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYOmb-0002im-Bq
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633595380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qAQDMDOILhrN7bqzbCYbEWzEPNovRxzacgFDmQV6nE=;
 b=iyKaSvo8oTklw1xQuyFWjyrMqIS53crB9kwxD3NdXvDl9JDLzwpXIBgI3vEY4jA6DsO6oT
 O17wmI7dyRzrtOZ8KuGOk12zqMvOehbf9B7Poeczu5YwI7LyMCbBIQXQhunjZjHjMhhL1B
 mbnuYu8A7GkISvq/3umTmHZhkBEcq+o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-h3qaMIh3N1CAom5Q3eHrXw-1; Thu, 07 Oct 2021 04:29:38 -0400
X-MC-Unique: h3qaMIh3N1CAom5Q3eHrXw-1
Received: by mail-ed1-f69.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so5163460edi.19
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 01:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0qAQDMDOILhrN7bqzbCYbEWzEPNovRxzacgFDmQV6nE=;
 b=QqIfUzdQacPtzsBDMt/nQVdk+GXiG8asUnjg1+vYj9MiTAX0J2HZ8823p49o/Bye0n
 s7hvsf/b68BTkZZwbiuN54SbfZdNTa7bG+ZYs99EotJHDPZSRa2IQllPlpmAOdx4kCtU
 MJN0iTSndwoYHsTAOiLzhseCbjJJO8pPezyUeXBBLPWSgRL9JYW3y6UmKbkqhMU6MlRi
 Kys6ddgRzuEDvpO6Il3K7cO9mvXzKo8Q3mrdExio9+J3JVDj18CVMfAf48SxCzS9vKHA
 AWM58VgJl0TSUCluyUT2c9MlrKnALg2yqdDnWPOsFl0aV77fSrfv+TOqrGHU1fcL8gmd
 dJSg==
X-Gm-Message-State: AOAM530kZtbXRB7GrdzHSgEyEwoltiSiqV56rEQs5vgIrFSGsvNgH9xy
 ZOG5kYaiRxErjpNQEymZyGG+/FsjHQnJqMtns7dqtIlllqHvz69dLZ+kKeUtIKHQj3+hj+djSsm
 c7l0o5biDIHyAvbE=
X-Received: by 2002:a50:da8f:: with SMTP id q15mr4578043edj.139.1633595377495; 
 Thu, 07 Oct 2021 01:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwefieq8aX7pG5qJI6qja+3L2vmfjjwpervW2fJpReG0Lr6nIcHGT0SLgZaWYwVzMgBX2T7Q==
X-Received: by 2002:a50:da8f:: with SMTP id q15mr4578007edj.139.1633595377221; 
 Thu, 07 Oct 2021 01:29:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g9sm9977839ejo.60.2021.10.07.01.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:29:36 -0700 (PDT)
Message-ID: <7ecf30ae-9fdb-2fec-de0f-c542b51cbbb7@redhat.com>
Date: Thu, 7 Oct 2021 10:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
 <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com>
 <87bl47ll9l.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87bl47ll9l.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 13:27, Markus Armbruster wrote:
>> The "return a boolean" rule adds some complexity (and
>> a possibility for things to be wrong/inconsistent) to the function for
>> the benefit of the callers.
> Yes, but returning something is only a minor burden.  It also makes
> success vs. failure obvious at a glance.

Fair enough; I'd still prefer to have an exception to the rule for 
virtual functions.  In that case, I really find the benefit to be negative.

Paolo


