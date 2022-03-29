Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA3A4EA6C0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 06:54:07 +0200 (CEST)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ3rq-0004uN-EH
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 00:54:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ3qA-0004Cx-76
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ3q8-0007zE-Hy
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648529537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwGNOY+WlL6psrkeVopDIVktmESzdTmvXTUb3PXrxSM=;
 b=a4QJvDbMXPAUkXtEa1+kNbNeaWlXdWYsTjVt784RJpJmflBxMYACBSoVMN5wJV/eT+jwf1
 /CY3rV0frFesF7EnYN3uDBVCFKUwrB6nmOmep0sCy2ZTMIYjWOmjinLruV5OHWS3DS8MDw
 yhKXoaYUElARfow9vww4ICZKkLJjO14=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-TYJf7kvwOXS6WAfxM8V-kQ-1; Tue, 29 Mar 2022 00:52:15 -0400
X-MC-Unique: TYJf7kvwOXS6WAfxM8V-kQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 gk23-20020a17090b119700b001c65a1baa01so8448581pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 21:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EwGNOY+WlL6psrkeVopDIVktmESzdTmvXTUb3PXrxSM=;
 b=poSy89+ooNf4l5uWCqor8uRFBSzny/3YCivuHYOVWgOKQnIJB1XDUjyzY5QhyN/0Tn
 lcMYr/nbXb6OV0MTzx3YwGvGVROranxd4YfGRxgd99JN+AIBjvKpjT5ZBYjIhtaFDhKu
 3mMD+a/dzx69pWTaO7J80E/HYjg5tI/ovUTGkSQ266bLUWsbenU//fnPUbziUUuL63HE
 XF0AZCPyNTi3mvE+ZLwvDyiZKm2650MqV7YJEWEHW8qp/2d1Aq7FYgwuVNzAtPRg3eqO
 GYPShHW4OLKK3TlFwu2eZ6ZQV1QsBebWtf+Tnu3qaI40BMfZ9oLlDqUasR5LEtinQ5tT
 /j4g==
X-Gm-Message-State: AOAM5339Wv3B/yQ/bmGRR54wkHriFybnbexaqY6CFtfK4c/G6LTibsiR
 q0oEnVRgwaY7W+gIL/ZirlIDTi1afha4vGJ56oTz+b+EkiFq0I1EGiTzZoB/4+Nd+IqA1uEfIBB
 gd80R3N2QrXQLXPg=
X-Received: by 2002:a17:902:e84d:b0:155:d31c:5c93 with SMTP id
 t13-20020a170902e84d00b00155d31c5c93mr21459883plg.103.1648529534418; 
 Mon, 28 Mar 2022 21:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrQSJ6VE5M5ET6d4MgQTjJmyDkDrILeAs9xlebETip9W/bLMFUYvc8iuodaoTqFMNmEfC5aA==
X-Received: by 2002:a17:902:e84d:b0:155:d31c:5c93 with SMTP id
 t13-20020a170902e84d00b00155d31c5c93mr21459866plg.103.1648529534123; 
 Mon, 28 Mar 2022 21:52:14 -0700 (PDT)
Received: from [10.72.13.210] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a63b14c000000b00384332d9026sm14243099pgp.23.2022.03.28.21.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 21:52:13 -0700 (PDT)
Message-ID: <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
Date: Tue, 29 Mar 2022 12:52:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: Yi Liu <yi.l.liu@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/28 下午4:53, Yi Liu 写道:
>
>
> On 2022/3/28 10:27, Jason Wang wrote:
>> On Thu, Mar 24, 2022 at 4:21 PM Tian, Kevin <kevin.tian@intel.com> 
>> wrote:
>>>
>>>> From: Jason Wang
>>>> Sent: Monday, March 21, 2022 1:54 PM
>>>>
>>>> We use to warn on wrong rid2pasid entry. But this error could be
>>>> triggered by the guest and could happens during initialization. So
>>>> let's don't warn in this case.
>>>>
>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>> ---
>>>>   hw/i386/intel_iommu.c | 6 ++++--
>>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>>>> index 874d01c162..90964b201c 100644
>>>> --- a/hw/i386/intel_iommu.c
>>>> +++ b/hw/i386/intel_iommu.c
>>>> @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState
>>>> *s, VTDContextEntry *ce)
>>>>       if (s->root_scalable) {
>>>>           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>>>>           if (ret) {
>>>> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry 
>>>> error: %"PRId32,
>>>> -                              __func__, ret);
>>>> +            /*
>>>> +             * This error is guest triggerable. We should assumt PT
>>>> +             * not enabled for safety.
>>>> +             */
>>>
>>> suppose a VT-d fault should be queued in this case besides returning 
>>> false:
>>>
>>> SPD.1: A hardware attempt to access the scalable-mode PASID-directory
>>> entry referenced through the PASIDDIRPTR field in scalable-mode
>>> context-entry resulted in an error
>>>
>>> SPT.1: A hardware attempt to access a scalable-mode PASID-table entry
>>> referenced through the SMPTBLPTR field in a scalable-mode 
>>> PASID-directory
>>> entry resulted in an error.
>>
>> Probably, but this issue is not introduced in this patch. We can fix
>> it on top if necessary.
>
> agreed.
>
>>>
>>> Currently the implementation of vtd_ce_get_rid2pasid_entry() is also
>>> problematic. According to VT-d spec, RID2PASID field is effective only
>>> when ecap.rps is true otherwise PASID#0 is used for RID2PASID. I didn't
>>> see ecap.rps is set, neither is it checked in that function. It 
>>> works possibly
>>> just because Linux currently programs 0 to RID2PASID...
>>
>> This seems to be another issue since the introduction of scalable mode.
>
> yes. this is not introduced in this series. The current scalable mode 
> vIOMMU support was following 3.0 spec, while RPS is added in 3.1. Needs
> to be fixed.


Interesting, so this is more complicated when dealing with migration 
compatibility. So what I suggest is probably something like:

-device intel-iommu,version=$version

Then we can maintain migration compatibility correctly. For 3.0 we can 
go without RPS and 3.1 and above we need to implement RPS.

Since most of the advanced features has not been implemented, we may 
probably start just from 3.4 (assuming it's the latest version). And all 
of the following effort should be done for 3.4 in order to productize it.

Thanks


>
>> Thanks
>>
>>>
>>>>               return false;
>>>>           }
>>>>           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
>


