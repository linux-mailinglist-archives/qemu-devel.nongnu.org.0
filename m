Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B01489CC5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:51:48 +0100 (CET)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wxX-00065m-Iu
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:51:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wuV-0004K1-4H
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wuT-0003Ap-9b
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641829716;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRh34pLIE/j1S6VXPTEy162SKih2nlk9xawUHYO91Iw=;
 b=DsmFFqZFwgyET2iY+Gb1sFUYp6AJaji6Ca+hSSk0nDlJe94GIoetn6mveQld/OFl3sLaSq
 viga72DATkqqHiQ6+m0tJq74CJjDU2kRiWdJRE/gY/hjmdv8tBCukldFazIlgYWYAxvw3O
 3s1yPSqwDw5gqxCKh1LEhpmrCniXT9Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-LV4tlp4OMXOQzOB51BGnDA-1; Mon, 10 Jan 2022 10:48:35 -0500
X-MC-Unique: LV4tlp4OMXOQzOB51BGnDA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so2279027wml.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 07:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=FRh34pLIE/j1S6VXPTEy162SKih2nlk9xawUHYO91Iw=;
 b=lnJX9ib87ApJRngK3aFhGvrHjpOgO4biFwwdmVBpNYNt61K0MmBB9m5GV9moceFPIX
 yFlV8zgXLke1N/WloyENeLVMl31YNWfb10XWzFO+0fvJu56DV4my+FFfxI/g3iXL/GSq
 4G7cH8kAiSWJUDCH6Wth6/7rrHum2NMg3jqx6aBMq3LEsPgU63LaGMS82m0cnyQ2kYVo
 p/AqqaqQCOR5vYYwMWFsnYx7yVZMXnSC8i9IMx6yjK5szUI+SkN/vqGwEaJ16QGOZivK
 EmFW5PwwKCKcbNvUOOcNnvorfR5e+GPyxSLFWs12FRDUTqSwX/MiNbpRUrkHQSaiEz0R
 8evw==
X-Gm-Message-State: AOAM531m1UztVBrE9B9tiCqUBGWV9/Dld/qhPb2Mb09Yxy4sN+Yqd3XJ
 qmkd3tPZTrzqhWhSUiZ8lBQ12jyRhn1fnHiyVPIp8nSPWaKQRroEYeXFn9De4T2BcVBIADIywRC
 N5/dciTJ61HDby0s=
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr220805wrx.266.1641829714355; 
 Mon, 10 Jan 2022 07:48:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydJ6KvXu0aXm01WZeSn2a0YAfQz/ZkJxslisA/6vpKl4Olp4DRMWEoBlP6JYDRfwXVCFQ3Nw==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr220793wrx.266.1641829714194; 
 Mon, 10 Jan 2022 07:48:34 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id b14sm6946310wrg.15.2022.01.10.07.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 07:48:33 -0800 (PST)
Subject: Re: [PATCH v4 2/6] hw/arm/virt: Add a control for the the highmem
 redistributors
To: Marc Zyngier <maz@kernel.org>
References: <20220107163324.2491209-1-maz@kernel.org>
 <20220107163324.2491209-3-maz@kernel.org>
 <448274ac-2650-7c09-742d-584109fb5c56@redhat.com>
 <87k0f7tx17.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f1d5a00b-b9d1-8e86-acd6-f7a605b77d8b@redhat.com>
Date: Mon, 10 Jan 2022 16:48:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87k0f7tx17.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 1/10/22 4:45 PM, Marc Zyngier wrote:
> Hi Eric,
>
> On Mon, 10 Jan 2022 15:35:44 +0000,
> Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Marc,
>>
>> On 1/7/22 5:33 PM, Marc Zyngier wrote:
> [...]
>
>>> @@ -190,7 +191,8 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>>>  
>>>      assert(vms->gic_version == VIRT_GIC_VERSION_3);
>>>  
>>> -    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
>>> +    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
>>> +            vms->highmem_redists) ? 2 : 1;
>> If we fail to use the high redist region, is there any check that the
>> number of vcpus does not exceed the first redist region capacity.
>> Did you check that config, does it nicely fail?
> I did, and it does (example on M1 with KVM):
>
> $ /home/maz/vminstall/qemu-hack -m 1G -smp 256 -cpu host -machine virt,accel=kvm,gic-version=3,highmem=on -nographic -drive if=pflash,format=raw,readonly=on,file=/usr/share/AAVMF/AAVMF_CODE.fd
> qemu-hack: warning: Number of SMP cpus requested (256) exceeds the recommended cpus supported by KVM (8)
> qemu-hack: warning: Number of hotpluggable cpus requested (256) exceeds the recommended cpus supported by KVM (8)
> qemu-hack: Capacity of the redist regions(123) is less than number of vcpus(256)

OK perfect!

Eric
>
> Thanks,
>
> 	M.
>


