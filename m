Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78C46E0EFC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:39:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmxAS-00029H-Dz; Thu, 13 Apr 2023 09:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pmxAP-00028o-F6
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pmxAN-0008Pk-9D
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681393148;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLTEnlNnryDeu3bY+Efaxs2tlXR/HklE3XK0i2rSPDc=;
 b=bG3KJ3/6t/fV/vuPzYMb/m6xSWxnnGEcm33JutOfsGWvHDsQr/mxleW+bgVJzoIsz2BPls
 bEoUwnjqExWmLWKAbwbCTSt6kSNcS7M5VvvoyRbwvfKcYF6WwXuOJjGbopAeiLQcdDgdUN
 RPsaX3RrcIENvs8EFdeI4sRl6Hs4xUY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-aPZ9eu9xPaGcFEiBWkRCzQ-1; Thu, 13 Apr 2023 09:39:06 -0400
X-MC-Unique: aPZ9eu9xPaGcFEiBWkRCzQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 s42-20020a05622a1aaa00b003e99419b127so1580062qtc.17
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 06:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681393145; x=1683985145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLTEnlNnryDeu3bY+Efaxs2tlXR/HklE3XK0i2rSPDc=;
 b=PhBwi80pnfOCNykMd8w3N9itBYB0zYD6FGz+C0OVn2EG0BhxZiUrOIL24xrnVYours
 6GYXYKk9ONXWi4n5nCp2XxiuajyEca4C3Xon0L8yvA1wvSpscUUW2oJoo8vPlZ0NQ+xx
 yDlHRe43hJpotXCxuxL7mvLFIpzApfCxCSAKrtHJWXm9rQUHjlE1mo9VJTUFnHRZcSBc
 LaMZGeNAK+OjQZOaYlyZkki8KWpusiPerQYiqnELH27rbP3vnbYwE+VLaObjdQL9h+an
 d8bDlz8vutF48DN1Xnr4dw2cdtwwjLVgl4Db2WR40WJReFkwXqu30mn1kIzH1TeqWy3T
 8QZw==
X-Gm-Message-State: AAQBX9fEeTA2eLuW6uyfSecestChgf24sNFFUvXh9bZYFGSWFhCFOcmH
 rVM4sPkMUHvvHLvzBVl6G5DnLvGyMRzQryBOVFkWXJv0z3jzaQkd+xiuX1Xzgx9i2Ua+rAYfCEX
 JyTzIxKtTmPR7QRTaUq3Lj/U=
X-Received: by 2002:a05:6214:4110:b0:5e9:8487:3978 with SMTP id
 kc16-20020a056214411000b005e984873978mr2957215qvb.41.1681393145332; 
 Thu, 13 Apr 2023 06:39:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZdVtpFtu0/c0su+y8jonHkVOioE5JF2htAL3D+ZJEQBGs2mlBkESWx6V18SUs3Dkk06xuIRA==
X-Received: by 2002:a05:6214:4110:b0:5e9:8487:3978 with SMTP id
 kc16-20020a056214411000b005e984873978mr2957192qvb.41.1681393145012; 
 Thu, 13 Apr 2023 06:39:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a0ce805000000b005eedb5cebd1sm424923qvn.130.2023.04.13.06.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 06:39:04 -0700 (PDT)
Message-ID: <9a765411-00ad-307e-9ca2-f6a7defba9cc@redhat.com>
Date: Thu, 13 Apr 2023 15:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: virtio-iommu hotplug issue
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: virtio-dev@lists.oasis-open.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org
References: <15bf1b00-3aa0-973a-3a86-3fa5c4d41d2c@daynix.com>
 <20230413104041.GA3295191@myrica>
 <c6fb5a06-aa7e-91f9-7001-f456b2769595@daynix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <c6fb5a06-aa7e-91f9-7001-f456b2769595@daynix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi,

On 4/13/23 13:01, Akihiko Odaki wrote:
> On 2023/04/13 19:40, Jean-Philippe Brucker wrote:
>> Hello,
>>
>> On Thu, Apr 13, 2023 at 01:49:43PM +0900, Akihiko Odaki wrote:
>>> Hi,
>>>
>>> Recently I encountered a problem with the combination of Linux's
>>> virtio-iommu driver and QEMU when a SR-IOV virtual function gets
>>> disabled.
>>> I'd like to ask you what kind of solution is appropriate here and
>>> implement
>>> the solution if possible.
>>>
>>> A PCIe device implementing the SR-IOV specification exports a virtual
>>> function, and the guest can enable or disable it at runtime by
>>> writing to a
>>> configuration register. This effectively looks like a PCI device is
>>> hotplugged for the guest.
>>
>> Just so I understand this better: the guest gets a whole PCIe device PF
>> that implements SR-IOV, and so the guest can dynamically create VFs? 
>> Out
>> of curiosity, is that a hardware device assigned to the guest with VFIO,
>> or a device emulated by QEMU?
>
> Yes, that's right. The guest can dynamically create and delete VFs.
> The device is emulated by QEMU: igb, an Intel NIC recently added to
> QEMU and projected to be released as part of QEMU 8.0.
From below description In understand you then bind this emulated device
to VFIO on guest, correct?
>
>>
>>> In such a case, the kernel assumes the endpoint is
>>> detached from the virtio-iommu domain, but QEMU actually does not
>>> detach it.
The QEMU virtio-iommu device executes commands from the virtio-iommu
driver and my understanding is the VFIO infra is not in trouble here. As
suggested by Jean, a detach command probably is missed.
>>>
>>> This inconsistent view of the removed device sometimes prevents the
>>> VM from
>>> correctly performing the following procedure, for example:
>>> 1. Enable a VF.
>>> 2. Disable the VF.
>>> 3. Open a vfio container.
>>> 4. Open the group which the PF belongs to.
>>> 5. Add the group to the vfio container.
>>> 6. Map some memory region.
>>> 7. Close the group.
>>> 8. Close the vfio container.
>>> 9. Repeat 3-8
>>>
>>> When the VF gets disabled, the kernel assumes the endpoint is
>>> detached from
>>> the IOMMU domain, but QEMU actually doesn't detach it. Later, the
>>> domain
>>> will be reused in step 3-8.
>>>
>>> In step 7, the PF will be detached, and the kernel thinks there is no
>>> endpoint attached and the mapping the domain holds is cleared, but
>>> the VF
>>> endpoint is still attached and the mapping is kept intact.
>>>
>>> In step 9, the same domain will be reused again, and the kernel
>>> requests to
>>> create a new mapping, but it will conflict with the existing mapping
>>> and
>>> result in -EINVAL.
>>>
>>> This problem can be fixed by either of:
>>> - requesting the detachment of the endpoint from the guest when the PCI
>>> device is unplugged (the VF is disabled)
>>
>> Yes, I think this is an issue in the virtio-iommu driver, which
>> should be
>> sending a DETACH request when the VF is disabled, likely from
>> viommu_release_device(). I'll work on a fix unless you would like to
>> do it
>
> It will be nice if you prepare a fix. I will test your patch with my
> workload if you share it with me.

I can help testing too

Thanks

Eric
>
> Regards,
> Akihiko Odaki
>
>>
>>> - detecting that the PCI device is gone and automatically detach it on
>>> QEMU-side.
>>>
>>> It is not completely clear for me which solution is more appropriate
>>> as the
>>> virtio-iommu specification is written in a way independent of the
>>> endpoint
>>> mechanism and does not say what should be done when a PCI device is
>>> unplugged.
>>
>> Yes, I'm not sure it's in scope for the specification, it's more about
>> software guidance
>>
>> Thanks,
>> Jean
>


