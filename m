Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B3A6BEFC9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdE0F-0006cB-VY; Fri, 17 Mar 2023 13:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pdE0D-0006bk-Q4
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pdE0C-0005MJ-6g
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679074587;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvJ2Bj5igWJHkhlKgwXphX2XEEepvMEsNXVHe8pcWJA=;
 b=Fa71TTKUGyOsNnHwzV+EJW5cTjMJju7Sxlu/GOYqTam3poPZW7jDrmW/Xu0vcEZE8V2xxD
 OOXMzTG5nqwwIT9c8TULRDw7DhkFix9TaJJuQwmIz1QZ6oLRkccQSClIHP0QXVrbm07tY5
 C28TQgdQF4JXrXj46YtEr8q1gtQ0wh4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-JdofJ6D2NHaJsHS-4UAIOQ-1; Fri, 17 Mar 2023 13:36:26 -0400
X-MC-Unique: JdofJ6D2NHaJsHS-4UAIOQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so2555642wmb.4
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wvJ2Bj5igWJHkhlKgwXphX2XEEepvMEsNXVHe8pcWJA=;
 b=TDbhxdKu6yOKE93ARWJP1J0uNnt4+M3SuxZKfji9BzAnhPkfUiG3meC5f4CxhKDeud
 JOQdxOeqnW/YaXwXMf+NkfsbC00AGPIEOv1n6NMRTnRHIiBQNTGhwkxhp07ETEFMuGr/
 JSoEkhg1N9E1tp6KI5D7IploI5rKdHEYpn3HDlADirEH+ihU47tDTORv3qzo8R0u57YR
 LSe5tdGSmDsiB1l0ipVVweXMFoWksjshHPznikLumbF6DpJhn4DrvEdEdbwF0LOPg4cN
 /Qf0EdRkEqP7eAlX9N2WaN8cnycO1C89OlDb5C6Kje48BCmXQld+GaGn6L0GLOAEL+Zt
 tk0g==
X-Gm-Message-State: AO0yUKU3ZMkbuW/gqDmqEBTNCxqeeyM8z7NqiLDZzvL6ssfBVX2vVMcn
 FJTKzYQJqHtnVdzPfJe/zqev8+d4R3J7MN+vChu3FQEQ5KXRhlPpQ+iwUoayRXhZmE/1f/m1TWB
 oCEUBirWBgidOjgU=
X-Received: by 2002:adf:e941:0:b0:2ce:e571:5cc3 with SMTP id
 m1-20020adfe941000000b002cee5715cc3mr3261679wrn.28.1679074585169; 
 Fri, 17 Mar 2023 10:36:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set9rS7giSWzxLFMSa6Au9t//M5el/lr1/YiMUmx9/lZIXF5ptilXVFvKTst3OZ9BLspQTYxxVg==
X-Received: by 2002:adf:e941:0:b0:2ce:e571:5cc3 with SMTP id
 m1-20020adfe941000000b002cee5715cc3mr3261660wrn.28.1679074584883; 
 Fri, 17 Mar 2023 10:36:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n2-20020adffe02000000b002cfeffb442bsm2449773wrr.57.2023.03.17.10.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 10:36:24 -0700 (PDT)
Message-ID: <afcc10e8-b983-1b67-c4fb-38fdcb3acd6d@redhat.com>
Date: Fri, 17 Mar 2023 18:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 02/11] hw/arm/smmuv3: Update translation config to
 hold stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-3-smostafa@google.com>
 <0f65997a-9b35-6e41-3960-c5de6ac13ec9@redhat.com>
 <ZBR8rjjP+qQoNUaC@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZBR8rjjP+qQoNUaC@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Mostafa,

On 3/17/23 15:43, Mostafa Saleh wrote:
> Hi Eric,
>
> Thanks for reviewing the patch.
>
> On Fri, Mar 17, 2023 at 12:37:11PM +0100, Eric Auger wrote:
>> Hi Mostafa,
>>
>> On 2/26/23 23:06, Mostafa Saleh wrote:
>>> In preparation for adding stage-2 support, add a S2 config
>>> struct(SMMUS2Cfg), composed of the following fields and embedded in
>>> the main SMMUTransCfg:
>>>  -tsz: Input range
>>>  -sl0: start level of translation
>>>  -affd: AF fault disable
>>>  -granule_sz: Granule page shift
>>>  -vmid: VMID
>>>  -vttb: PA of translation table
>>>  -oas: Output address size
>>>
>>> They will be used in the next patches in stage-2 address translation.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>>> ---
>>> Changes in v2:
>>> -Add oas
>>> ---
>>>  include/hw/arm/smmu-common.h | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>>> index 9fcff26357..2deead08d6 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -58,6 +58,16 @@ typedef struct SMMUTLBEntry {
>>>      uint8_t granule;
>>>  } SMMUTLBEntry;
>>>  
>>> +typedef struct SMMUS2Cfg {
>>> +    uint8_t tsz;            /* Input range */
>> nit: Size of IPA input region. Called t0sz
> I named it this way to be similar to stage-1, as SMMUTransTableInfo
> just calls it tsz, I guess that is because it can hold either t0sz or
> t1sz.
> I can rename it for stage-2 to t0sz.
no strong opinion though, you can simply add this in the comment
>
>>> +    uint8_t sl0;            /* Start level of translation */
>>> +    bool affd;              /* AF Fault Disable */
>>> +    uint8_t granule_sz;     /* Granule page shift */
>>> +    uint8_t oas;            /* Output address size */
>> called s2ps. if you don't want to rename you may add this in the comment.
> This is not the S2PS parsed from the STE, but the effective value which is
> capped to SMMU_IDR5.OAS, which is used for checking output size, I can add
> a clarifying comment.
ok
>
>> I am suprised to not see S2R which would match S1 record_faults.
> I was thinking about this also, right now we piggy back on record_faults
> in SMMUTransCfg.
> But it makes more sense to separate this from the beginning as other
> fields. I will update that by adding record_faults field in SMMUS2Cfg.
ok
>
>> Also without further reading we can wonder wheter the parent
>> iotlb_hits/misses also record S2 events?
> For iotlb_*, they are shared also. However, I think this is not important for now as
> it is not architectural, and it produces the correct output as only one
> stage is advertised at the moment.
> When nesting is supported, TLB implementation might change and then we
> can take a decision about this.
>
>> I think we need to be/make clear what fields of the original S1 parent
>> struct also are relevant for the S2 only case.
>> Maybe tag them with a specific comment S1-only or S1 | S2. It may be
>> cleaner to introduce a union and common fields in the parent struct though.
> I agree, maybe we encapsulate stage-1 only fields in a similar struct
> and leave common fields outside.
>
> struct SMMUTransCfg:
> 	stage, bypassed, disabled, iotlb_* //common fields
> 	struct SMMUS2Cfg
> 	struct SMMUS1Cfg
> 		ttb,asid....
>
> Or we can add SMMUS1Cfg and SMMUS2Cfg in a union for now and when nesting is supported we
> separate them.

yeah that would be cleaner but it is also more invasive. At least make
it clear in the comments and commit msg what is used for each stage.

Thanks

Eric
>
>
> Thanks,
> Mostafa
>


