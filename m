Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C789B487B26
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:15:02 +0100 (CET)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5spR-00076d-UG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n5sla-0002aT-Ch
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:11:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n5slX-0005aO-D4
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641575458;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pHZETgLBLv2UtRUl6D+BkLJ1jpxDMC+Tp9BPH2rI4Y=;
 b=FDjNwNfKDV3kXW/CeeWv91/YQRcWAuKaVZ22Xz7pv95YNXU2Y0kymtYaaBHG3CoMFllAsh
 8dwQjKKeTo8kHRrbZOEGzU2JjdM4ND+dwKyQenonyaF/GUHelu4gTPl5ec1n38+3OAiJQY
 jx+0KDrLkZWsnYEzUdAVAoT10ujRuf4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-6tAnV7exNx-gKE8hZNPmxQ-1; Fri, 07 Jan 2022 12:10:54 -0500
X-MC-Unique: 6tAnV7exNx-gKE8hZNPmxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l34-20020a05600c08a200b003478e251a32so1320002wmp.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3pHZETgLBLv2UtRUl6D+BkLJ1jpxDMC+Tp9BPH2rI4Y=;
 b=R6zhb5GwTmbShjK/nsTQkMXoMbsyOfzLTjYd/OiaaUAIDylVETwvZunQMXxQCCaQjT
 lJdlCWcZ+wgq8ysXFaZJdw4c8PfrxlRujmOcjl2tsanAn6S9ELu99At2chBdyDErGK/u
 nW9jwPgUrgrurycPmurIm7xaT4AWh9LGNCCsnSp01aLmpv9WQFrwNB6rus/P8JPEbAF6
 PGUE0++xgxLYiDPx8ZoFX8wQbkiFGXAZQu8z9hdIVFyckJIBwsbEuOQqIEp4Z1zUD7K2
 qZdvFrGog41Xcfoes31D2VRLz7S59RNoHe9frn2Y87/6/vRL4QFoHeeIcwmQHd1/qiJX
 oQeQ==
X-Gm-Message-State: AOAM532TdVXzw7FO4bWzS3ryfMr0lKrF6Mli+48wLASZ0Byvjj8CMvyz
 G/96EallebZGssCpeVWDEFgJopAfzYKtGLu9+/AQY2Lo7Z1ZHE5+F7fTcVRNq0FJFfu0mosOQpO
 2iWThtmR9gyteQFo=
X-Received: by 2002:a05:6000:1e07:: with SMTP id
 bj7mr5846338wrb.126.1641575453616; 
 Fri, 07 Jan 2022 09:10:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9B+o3El0zBY9MRT5nLG9njMtu1q5Pq4PQVdvKApvURcNkIL2mU6w3Vbnbe92sMBLQ4jEp8A==
X-Received: by 2002:a05:6000:1e07:: with SMTP id
 bj7mr5846317wrb.126.1641575453396; 
 Fri, 07 Jan 2022 09:10:53 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p23sm5013096wms.3.2022.01.07.09.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 09:10:52 -0800 (PST)
Subject: Re: [PATCH v2 1/5] hw/arm/virt: Key enablement of highmem PCIe on
 highmem_ecam
To: Marc Zyngier <maz@kernel.org>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-2-maz@kernel.org>
 <dbe883ca-880e-7f2b-1de7-4b2d3361545d@redhat.com>
 <87pmpiyrfw.wl-maz@kernel.org>
 <b9031d40-897e-b8c5-4240-fc2936dcbcb9@redhat.com>
 <877dbfywpj.wl-maz@kernel.org>
 <cb9f6c39-40f8-eea7-73bf-13df1e5dae9d@redhat.com>
 <8735m0zmhq.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <44fcbe49-4eb2-8891-2cb9-2e2df7dee98b@redhat.com>
Date: Fri, 7 Jan 2022 18:10:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8735m0zmhq.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/6/22 8:34 PM, Marc Zyngier wrote:
> Hi Eric,
>
> On Wed, 05 Jan 2022 09:41:19 +0000,
> Eric Auger <eric.auger@redhat.com> wrote:
>> couldn't you simply introduce highmem_redist which is truly missing. You
>> could set it in virt_set_memmap() in case you skip extended_map overlay
>> and use it in virt_gicv3_redist_region_count() as you did?
>> In addition to the device memory top address check against the 4GB limit
>> if !highmem, we should be fine then?
> No, highmem really isn't nearly enough.
>
> Imagine you have (like I do) a system with 36 bits of IPA space.
> Create a VM with 8GB of RAM (which means the low-end of IPA space is
> already 9GB). Obviously, highmem=true here. With the current code, we
> will try to expose this PCI MMIO range, which falls way out of the IPA
> space (you need at least 40 bits of IPA to even cover it with the
> smallest configuration).
In that case the he High MMIO region is accounted in the vms->highest_gpa:

    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
        hwaddr size = extended_memmap[i].size;

        base = ROUND_UP(base, size);
        vms->memmap[i].base = base;
        vms->memmap[i].size = size;
        base += size;
    }
    vms->highest_gpa = base - 1;

and virt_kvm_type() should exit in that case at:
if (requested_pa_size > max_vm_pa_size) {
        error_report("-m and ,maxmem option values "
                     "require an IPA range (%d bits) larger than "
                     "the one supported by the host (%d bits)",
                     requested_pa_size, max_vm_pa_size);
        exit(1);
    }

?
>
> highmem really is a control that says 'things may live above 4GB'. It
> doesn't say *how far* above 4GB it can be placed. Which is what I am
> trying to address.

OK I will look at your v4 ;-)

Thanks

Eric
>
> Thanks,
>
> 	M.
>


