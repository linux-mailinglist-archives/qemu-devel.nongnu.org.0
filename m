Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13BA49FA30
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:59:51 +0100 (CET)
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQr0-0003qM-5H
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:59:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nDQ7J-0001Q2-E6
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:12:37 -0500
Received: from [2607:f8b0:4864:20::a2a] (port=37482
 helo=mail-vk1-xa2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nDQ7G-00077A-Dq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:12:36 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id v192so3748118vkv.4;
 Fri, 28 Jan 2022 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GfgMFtVtQGWXaGAV8n+udsct9x9Pevav4zo+G9TlSr4=;
 b=OSPtnyuSShLkm2sPdMIdFslfBq7fBVNTAkgAQy+VA+RU226QtXqlstrjrwPzjLYgip
 OWVKpYlm/mKwU+VsJYUSWxpmnqx72m5/AqG26k7LF6bzXNo/1nHpYUJ7x2j77IF3Z4G1
 syJlpNHBaXysNBdwoBRnbq7GhLKx8ImZ9z5xPyVu732D8lD8D+HxAQCqmRS7zHqQQ9uu
 eU6BpFB6ykZIeu+Rm1kR2Q0hO8yB+4VzIE6ZUgDpSU4S39Yopp5M6oEJYAUjREB2uO0H
 vxIhc2rkDENlyHjKwcFFFRNAocmgEF6ZsHS1kQBGO/8fC2Gi1LG//3HJNxNi+lryDCiT
 iR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GfgMFtVtQGWXaGAV8n+udsct9x9Pevav4zo+G9TlSr4=;
 b=EbV8sx7pEWYlCfPus8DZWrteW9d22ZCwp3ZJKjbwNACuaITZJBNDQGcFPZvGUpsJVy
 bpWtNfZxdQxOCRO3XfHXDqXGY9xrTKyHUNq+nhBswOyZG7e/gOi/Q7uJVNWMOgsiflkF
 k35r/2INqyKQFcpmZ8x6Mi4J9AMZrquf+wlP82PnoTz62A/6qypFOAMpdUP+oxcrPnh8
 6crNpBT6r/HHE03krGlXqnBoS5f5ADWzKbnjRxh//qhyVRx6Oq0HCyxNm+lRrNimW7/C
 pWTtAIBd0RHl8ImOwzqzp7QtrQkPL3fUBRhT44tTKDVq+mVdfKXhSwFd3uLuuNTE1hUJ
 CGfQ==
X-Gm-Message-State: AOAM532BsbLiBxV+bhtuwk1kp71dEjL0x0nYBFFXCutatC1tIdHrYfwX
 HKWlaWhSNg7M08v9ASKXxvo/Vn2JChw=
X-Google-Smtp-Source: ABdhPJwuWpEtAL5FGrOZaplzaEXWCUR2UdLdBFjY64RqnsPIVEau5Cp5lyXjMr9Nuzk/YCKGFabWnQ==
X-Received: by 2002:a05:6122:182a:: with SMTP id
 ay42mr3544903vkb.5.1643371951487; 
 Fri, 28 Jan 2022 04:12:31 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id u12sm1517332vku.9.2022.01.28.04.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 04:12:31 -0800 (PST)
Message-ID: <83296441-c3cc-d8b8-adc3-a83f0a10b54a@gmail.com>
Date: Fri, 28 Jan 2022 09:12:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
 <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
 <20220128032911.440323f1.pasic@linux.ibm.com>
 <cbac9c93-0d4a-1914-3c9d-203b1472056c@gmail.com>
 <20220128124833.0ceb0789.pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220128124833.0ceb0789.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/28/22 08:48, Halil Pasic wrote:
> On Fri, 28 Jan 2022 08:02:39 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>>> We may be able to differentiate between the two using ->dma_as, but for
>>> that it needs to be set up correctly: whenever you require translation
>>> it should be something different than address_space_memory. The question
>>> is why do you require translation but don't have your ->dma_as set up
>>> properly? It can be a guest thing, i.e. guest just assumes it has to do
>>> bus addresses, while it actually does not have to, or we indeed do have
>>> an IOMMU which polices the devices access to the guest memory, but for
>>> some strange reason we failed to set up ->dma_as to reflect that.
>>
>>
>> I have 2 suggestions. First is to separate how we interpret iommu_platform. I find it
>> hard to do this properly without creating a new flag/command line option.
>>
> 
> A new command line option looks problematic to me because of the
> existing setups. We could tie that to a compat machine, but it looks
> ugly and also a little wrong from where I stand.
>>
>> My second suggestion is, well .... I think it's proved that s390x-PV and AMD SEV are
>> being impacted (and probably Power secure guests as well), so why not check for
>> confidential guest support to skip that check entirely? Something like this patch:
>>
> 
> This is not acceptable for s390x and it should not be acceptable for SEV
> or Power secure guests, because s390x Secure Execution ()support predates
> the confidential guest support patches and "->cgs", and thus you don't
> have to turn on CGS to use SE. Just providing the iommu_platform=on
> manually on each device is perfectly fine! Should be the same for SEV

Hm, that's unfortunate. Checking machine->cgs would be an easy way out.

> 
> [..]
>> +    if (!machine->cgs && has_iommu &&
>> +        !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>            error_setg(errp, "iommu_platform=true is not supported by the device");
>>            return;
>>        }
> [..]
> 
>> This will not break anything for non-secure guests and, granted that machine->cgs is already
>> set at this point, this will fix the problem for s390x-PV and AMD SEV. And we won't have to
>> dive deep into a virtio-bus feature negotiation saga because of something that can be easily
>> handled for machine->cgs guests only.
> 
> Your assumption does not hold. See above. Unfortunately my assumption of
> ->dma_as == & address_space_memory implies does not need translation
> does not hold either. But IMHO we should really get to the bottom of
> that, because it just does not make sense.


I'll make an attempt to understand the logic in Power side.

> 
>>
>> If this patch works for you and Brijesh I believe this is a good option.
> 
> I don't believe it is a good option. @Brijesh can you confirm that SEV
> has the same problem with this approach s390x has, and that it would
> break existing setups?
> 
> I have another idea, but my problem is that I don't understand enough of
> the Power and PCI stuff. Anyway if for your plattform iommu_platform=on
> devices can not work in a VM that does not have an IOMMU you could
> error out on that. You could express that via a machine property, and
> then make sure your dma address space is not address_space_memory, if
> that machine property is set.


Bear in mind that the root problem of what I've reported up there isn't something that's
just Power specific. Any arch in which vhost-user-fs-pci doesn not support iommu_platform
will have the problem as well (e.g. x86 and the RH bug Kevin fixed).


What I mean is that I can fix my side using the PowerPC PCI specifications and be done
with it, but that would not help x86 for example. I believe a better way is to use the
PowerPC case to understand where the overall common logic can be improved to everyone.


Thanks,


Daniel



> 
> Regards,
> Halil

