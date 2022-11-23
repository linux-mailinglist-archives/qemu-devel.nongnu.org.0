Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB43635B4F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxneI-0005QH-Om; Wed, 23 Nov 2022 06:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxneB-0005Pl-Dh
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:10:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxne6-0001jl-16
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669201816;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HH11FE8DY/EXb7stqLsTl9lcv3PSFQ6wYkaktpynMVs=;
 b=J9VOK/0Wnzr4Qd8sVwu9Xpoo9nqKXAXE5oX/dgQPAIfgklYZlZ3VwK7Tyg8aUx8qx9wGGB
 YQym8lgG1nvCU8wFgWt8rEbRztwO9mlj+y6nt0qmMonm8RTF/vG31nK7EDQyqdru/g/GHB
 DeLlz0FzDx/2oTp9ywWTbNSULzvlk+0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-66ZY98dkMwqhEcLRHsBq9w-1; Wed, 23 Nov 2022 06:10:14 -0500
X-MC-Unique: 66ZY98dkMwqhEcLRHsBq9w-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp10-20020a05620a458a00b006fa29f253dcso22229020qkb.11
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HH11FE8DY/EXb7stqLsTl9lcv3PSFQ6wYkaktpynMVs=;
 b=LtvdDzHc6PPiYMDJXtDT68+KD8TNgqoJibpVScjJaMP5nNVSyd66vVdQZikh6lvXgq
 z0AZt+ykQNf8c4zyeoZNpYS+LF6fLyDo+oUSmneKwgCfwrso6vHanaqm785YNe40dJ8t
 Ryc2fgYnkQ5FCKNqfi6UcygrWMUbrUaT0m7n5d/D7I9mQ1CcpbF8eHEbGpM6NQMTkCzt
 LOMKOUMO7+2PP4JYXkYEZSF/FUzEuXTj+SGATehqrb9HLFE24vs2FyY//iz+w423PYYw
 YksnV4/ScAOWWRMPVdkatdlNqgTWnvyWU3PCiXMVZOP6dlcKJxngCqseefO4NOCb3Ago
 VZrA==
X-Gm-Message-State: ANoB5pkYRxL0iT8IEepjDfyOhVgCn3GcqqT+mXbaZmGgkxI/1424IudP
 U30UQCG9sG6QhljjBLDfmPF7N1zT/VzXo/pZKR3c4cD1shlDjWnuaWuhK92Jk3fR+eSolk2ff9u
 upmpuBUX+flZ4d4s=
X-Received: by 2002:ac8:1019:0:b0:3a5:42b9:d7aa with SMTP id
 z25-20020ac81019000000b003a542b9d7aamr25415973qti.58.1669201814332; 
 Wed, 23 Nov 2022 03:10:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HoyDbWkbRc+vQqfjSyS8vdu/zkAAwEsggYc6gjX+LhrUIvTyN9Y2yYTZUE/i/ZhVVhEhIdA==
X-Received: by 2002:ac8:1019:0:b0:3a5:42b9:d7aa with SMTP id
 z25-20020ac81019000000b003a542b9d7aamr25415958qti.58.1669201814096; 
 Wed, 23 Nov 2022 03:10:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t3-20020ac86a03000000b0039c7b9522ecsm9593640qtr.35.2022.11.23.03.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:10:12 -0800 (PST)
Message-ID: <9ffcc26f-e3b2-77f1-5929-6c6caf1ea64d@redhat.com>
Date: Wed, 23 Nov 2022 12:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
 <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
 <20221123013441-mutt-send-email-mst@kernel.org>
 <45e916e5-9297-a8e4-c539-123e0ee6347c@redhat.com>
 <20221123043005-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221123043005-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/23/22 10:30, Michael S. Tsirkin wrote:
> On Wed, Nov 23, 2022 at 09:18:39AM +0100, Eric Auger wrote:
>> Hi,
>>
>> On 11/23/22 07:36, Michael S. Tsirkin wrote:
>>> On Fri, May 06, 2022 at 09:47:52AM -0400, Stefan Berger wrote:
>>>> On 5/6/22 09:25, Eric Auger wrote:
>>>>> In a subsequent patch, VFIO will need to recognize if
>>>>> a memory region owner is a TPM CRB device. Hence VFIO
>>>>> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
>>>>> let's add a stub function.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Suggested-by: Cornelia Huck <cohuck@redhat.com>
>>>> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
>>> ... and now in 7.2 vdpa needs a dependency on tpm too, what a hack :(
>>> And what exactly is it about TPM CRB that everyone needs to
>>> know about it and skip it? The API does not tell ...
>> An excerpt of one reply I made at that time:
>>
>> The spec (CG PC Client Platform TPM Profile (PTP)
>>     Specification Family “2.0” Level 00 Revision 01.03 v22, page 100) 
>> says that the command/response data "may be defined as large as 3968",
>> which is (0x1000 - 0x80), 0x80 being the size of the control struct.
>> so the size of the region logically is less than a 4kB page, hence our
>> trouble.
>>
>> We learnt in the past Windows driver has some stronger expectation wrt
>> memory mapping. I don't know if those latter would work if we were to
>> enlarge the window by some tricks.
>>
>> https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
>> says
>>
>> "
>> Including the control structure, the three memory areas comprise the
>> entirety of the CRB. There are no constraints on how those three memory
>> areas are provided. They can all be in system RAM, or all be in device
>> memory, or any combination.
>>
>> Thanks
>>
>> Eric
> So we put it in system RAM then? But why isn't DMA there allowed?

I don't think there is any need and since it violates the alignment
check in VFIO we discard the region from DMA mapped ones.

Thanks

Eric
>
>>>>> ---
>>>>>   include/sysemu/tpm.h | 6 ++++++
>>>>>   1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>>>>> index 68b2206463c..fb40e30ff60 100644
>>>>> --- a/include/sysemu/tpm.h
>>>>> +++ b/include/sysemu/tpm.h
>>>>> @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
>>>>>   #define tpm_init()  (0)
>>>>>   #define tpm_cleanup()
>>>>>
>>>>> +/* needed for an alignment check in non-tpm code */
>>>>> +static inline Object *TPM_IS_CRB(Object *obj)
>>>>> +{
>>>>> +     return NULL;
>>>>> +}
>>>>> +
>>>>>   #endif /* CONFIG_TPM */
>>>>>
>>>>>   #endif /* QEMU_TPM_H */


