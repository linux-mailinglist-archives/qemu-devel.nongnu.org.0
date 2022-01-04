Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B744844B3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:34:02 +0100 (CET)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lp2-0000TW-SU
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n4lnv-00083e-1f
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:32:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n4lnq-0005An-S9
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641310365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHb1Dlc/ItOolPMR+Jc0/qUYSK2KoiTzttrdRcxrJcE=;
 b=dyS6Ih0p1wQmSTYdZJhw7vylS5kwUrm+7ef1asegoeWLNWKmOi4ASx/Le4fnqsNt7Z2/J9
 iY6eB5OoFzntFmFZ2RMMpQknfH6UDIhg0MGD72YEVJ7g5xEorIRRj/Q3O+IisRNesaj2X9
 gDafs2r/ofUgodo3zTswx22eYzgnXzg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-RcAyeyLHPEumt-6EyFIJ_Q-1; Tue, 04 Jan 2022 10:31:38 -0500
X-MC-Unique: RcAyeyLHPEumt-6EyFIJ_Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so11778758wrb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 07:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=dHb1Dlc/ItOolPMR+Jc0/qUYSK2KoiTzttrdRcxrJcE=;
 b=BBiyyqsefulv4NUxMZgmtJbIDq69Sg6pdRlXaI/qDZgFRDJygCEuclTA3rFY1hjmNB
 gmZ/THg+csGvtalChmHTo12w+ewPS8k2lbxnlK0lqKj3ad3KSZn6eAOyDHpKHXIfq4rs
 Uw9alc8TCZaGVzj76iCztleLejYPrkaOlRMm7lVCIyZE2LMr4RwWtuVoyR7r2csYEyyY
 h6AiHJA1I0dJi8PbraMiQCFK0u7fLhk+4b2zDnxjrhWA315EZtKw2xdIUXWE4xRnhf+q
 OuzKp/GgCZWNVcDSJO+9Gvu/goTqGCxUpQJhAtzoyfwTrzJiHSx3w3vZ78qdDhESeA8H
 xGzg==
X-Gm-Message-State: AOAM532seIeNSWHAcxB4uzYVSZxZVhyRd0VL2dbT/u0Igg1QfEavoBnr
 /a6pubGNZTJxhQuYPE51RZJbZO/Nf9QzRFwstYcyoH/nMYTsypeLx/q8/V5vxQFIggPWY608YFw
 Rfk0f+TROjJVuS8U=
X-Received: by 2002:a05:600c:4f83:: with SMTP id
 n3mr41830319wmq.129.1641310295504; 
 Tue, 04 Jan 2022 07:31:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV9IRJ1sEs6RhagLAEfvJinAJ1OWUzplrbq8dl6cI1k7STj6fGh3vl7cyX2z/tYQ7+BP7Pxw==
X-Received: by 2002:a05:600c:4f83:: with SMTP id
 n3mr41830296wmq.129.1641310295252; 
 Tue, 04 Jan 2022 07:31:35 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id ay29sm39635325wmb.13.2022.01.04.07.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 07:31:34 -0800 (PST)
Subject: Re: [PATCH v2 1/5] hw/arm/virt: Key enablement of highmem PCIe on
 highmem_ecam
To: Marc Zyngier <maz@kernel.org>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-2-maz@kernel.org>
 <dbe883ca-880e-7f2b-1de7-4b2d3361545d@redhat.com>
 <87pmpiyrfw.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <b9031d40-897e-b8c5-4240-fc2936dcbcb9@redhat.com>
Date: Tue, 4 Jan 2022 16:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87pmpiyrfw.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 12/27/21 4:53 PM, Marc Zyngier wrote:
> Hi Eric,
>
> Picking this up again after a stupidly long time...
>
> On Mon, 04 Oct 2021 13:00:21 +0100,
> Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Marc,
>>
>> On 10/3/21 6:46 PM, Marc Zyngier wrote:
>>> Currently, the highmem PCIe region is oddly keyed on the highmem
>>> attribute instead of highmem_ecam. Move the enablement of this PCIe
>>> region over to highmem_ecam.
>>>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> ---
>>>  hw/arm/virt-acpi-build.c | 10 ++++------
>>>  hw/arm/virt.c            |  4 ++--
>>>  2 files changed, 6 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 037cc1fd82..d7bef0e627 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -157,10 +157,9 @@ static void acpi_dsdt_add_virtio(Aml *scope,
>>>  }
>>>  
>>>  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>> -                              uint32_t irq, bool use_highmem, bool highmem_ecam,
>>> -                              VirtMachineState *vms)
>>> +                              uint32_t irq, VirtMachineState *vms)
>>>  {
>>> -    int ecam_id = VIRT_ECAM_ID(highmem_ecam);
>>> +    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
>>>      struct GPEXConfig cfg = {
>>>          .mmio32 = memmap[VIRT_PCIE_MMIO],
>>>          .pio    = memmap[VIRT_PCIE_PIO],
>>> @@ -169,7 +168,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>>          .bus    = vms->bus,
>>>      };
>>>  
>>> -    if (use_highmem) {
>>> +    if (vms->highmem_ecam) {
>> highmem_ecam is more restrictive than use_highmem:
>> vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
>>
>> If I remember correctly there was a problem using highmem ECAM with 32b
>> AAVMF FW.
>>
>> However 5125f9cd2532 ("hw/arm/virt: Add high MMIO PCI region, 512G in
>> size") introduced high MMIO PCI region without this constraint.
> Then I really don't understand the point of this highmem_ecam. We only
> register the highmem version if highmem_ecam is set (see the use of
> VIRT_ECAM_ID() to pick the right ECAM window).

but aren't we talking about different regions? On one hand the [high]
MMIO region (512GB wide) and the [high] ECAM region (256MB large).
To me you can enable either independently. High MMIO region is used by
some devices likes ivshmem/video cards while high ECAM was introduced to
extend the number of supported buses: 601d626d148a (hw/arm/virt: Add a
new 256MB ECAM region).

with the above change the high MMIO region won't be set with 32b
FW+kernel and LPAE whereas it is currently.

high ECAM was not supported by 32b FW, hence the highmem_ecam.

but maybe I miss your point?

Eric
>
> So keying this on highmem makes it expose a device that may not be
> there the first place since, as you pointed out that highmem_ecam can
> be false in cases where highmem is true.
>
>> So to me we should keep vms->highmem here
> I really must be missing how this is supposed to work.
>
> 	M.
>


