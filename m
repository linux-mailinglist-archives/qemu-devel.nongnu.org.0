Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E6423001
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:27:22 +0200 (CEST)
Received: from localhost ([::1]:56924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXp9t-0004Rb-0P
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mXoO9-0004ZQ-LT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mXoO6-0006rf-Ki
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633455477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PN6teGn2Aze5GuaEtlrg30b6lsf8nrcc6ar48PJXOL4=;
 b=NWTBBEYqWkY9Eb8dIZJ8I+SGAv58hGNfNMRSfReDmWH5SpNP2zfGw8Q4NfXME3W5KJDJDh
 cQzwi3bPgyUIzP1Lud9s2252b2vB+A3spJP7JPL6GXT0z1+b/aMDHXDTnPyNX0TGTHnKth
 8iOUA+n8x95jwIgZ3dSrdtna/ESDNAE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-WRYMBQb2PX-k7hr48mM9vg-1; Tue, 05 Oct 2021 13:37:57 -0400
X-MC-Unique: WRYMBQb2PX-k7hr48mM9vg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so14588wmj.8
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 10:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PN6teGn2Aze5GuaEtlrg30b6lsf8nrcc6ar48PJXOL4=;
 b=R2rPTVVYOdIWFuLbBkLOvT2Mok6ISRXrq7auJnzkDU45RTA2IaDkQdI5ZdvpW6CtRA
 /ivwEBnVu9FSHZalFcsm3Q6wZy2hD2b/nzoZSTElmkk+EmYkgYsH04aUNPc/f7KZW40Q
 JF/DxvuPQ6uo9r1bf2BxJ2Idq4QnZsjrM93zoLI0/PmG6r1LMMcwBIdCaflxG8JVWUEp
 Utwpaj7Zt742rHDcsdVwEERLkep5ewyL+yHi6Q9yl1HkE/bxP7efGDlOkcgEvOFMT+LF
 tgHi/mNKXHJhb3OnoUPSHmzpj5d75rlmWoikld3gJiR681ZjgNZszPqGtcvqzxdAnaUA
 koBA==
X-Gm-Message-State: AOAM5325HwegXj5UrwF6b1uFUAYbEB8eFObGfqkXo+tC5fdHyefETJkW
 Piu23xsyjU7L1nm13eUrAbFbAlsx9KsC6DIfAO3Bs4AHqNDvAX90J73A8Hel+EuZWBZSZPcfDPW
 VedodKJTW3nVvjg4XjRuTvnP1Z+nVk6421X294Z7NKaFdUw0W/kyBrIcPvEsEM7Fv
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr23045091wrs.58.1633455475108; 
 Tue, 05 Oct 2021 10:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzRWKSG2Iz3FK66EPj2G1AO3c+3BIyBweB2Ipbvm9N/16tyLLH7iBhLPcIOr/NVJ4MWWk+TA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr23045070wrs.58.1633455474861; 
 Tue, 05 Oct 2021 10:37:54 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r27sm17901026wrr.70.2021.10.05.10.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 10:37:54 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
To: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <87o89nnus1.fsf@dusky.pond.sub.org> <87o89m7zai.fsf@dusky.pond.sub.org>
 <87ee94q9hr.fsf@dusky.pond.sub.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <630cb326-dd99-7f11-b6f3-292747467af8@redhat.com>
Date: Tue, 5 Oct 2021 19:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87ee94q9hr.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo, Peter,

On 10/2/21 7:30 AM, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> Markus Armbruster <armbru@redhat.com> writes:
>>
>>> Did this series fall through the cracks for 6.1?
>>
>> Missed 6.1.  What now?
> 
> If I understand this correctly, it's a regression in 6.1.  Paolo, please
> advise on what should be done.

Can we get those 2 fixes merged?

Maybe we should also add
Cc: qemu-stable@nongnu.org

If so is there a chance the fix gets backported to 6.1?

Thanks

Eric
> 
>>> Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
>>>
>>>> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
>>>> parameter definitions cannot use underscores, because keyval_dashify()
>>>> transforms them to dashes and the parser doesn't find the parameter.
>>>>
>>>> This affects option default_bus_bypass_iommu which was introduced in the
>>>> same release:
>>>>
>>>> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
>>>> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
>>>>
>>>> Rename the parameter to "default-bus-bypass-iommu". Passing
>>>> "default_bus_bypass_iommu" is still valid since the underscore are
>>>> transformed automatically.
>>>>
>>>> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
>>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>> ---
>>>>  hw/arm/virt.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index b4598d3fe6..7075cdc15e 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -2671,10 +2671,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>>>                                            "Set the IOMMU type. "
>>>>                                            "Valid values are none and smmuv3");
>>>>  
>>>> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
>>>> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>>>>                                     virt_get_default_bus_bypass_iommu,
>>>>                                     virt_set_default_bus_bypass_iommu);
>>>> -    object_class_property_set_description(oc, "default_bus_bypass_iommu",
>>>> +    object_class_property_set_description(oc, "default-bus-bypass-iommu",
>>>>                                            "Set on/off to enable/disable "
>>>>                                            "bypass_iommu for default root bus");
> 
> 


