Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB34D627C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 14:36:14 +0100 (CET)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSfRF-0008VY-7l
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 08:36:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSfGV-0003TP-V7; Fri, 11 Mar 2022 08:25:08 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=43697
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSfGQ-0002LZ-Bo; Fri, 11 Mar 2022 08:25:04 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so10457443ooa.10; 
 Fri, 11 Mar 2022 05:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qaqP4FL0HIFt9AkgsbDnlV3MuoeOMu65SJP7Awp+Ac4=;
 b=DI5h6RPJSiX7FRyG+LgG3kfNY9xNKhE6Bmi5xEmyW8zGuJC4Gjs+4SEPWXaG97q6Ys
 jjGIwwmhCDh2XB091WhWhGCnHcdA5YmJ6HJNd1jvSxoTrQkDwYAkxAAAqiIgKS7QXJlY
 +BQlVICity12keH3NDn226zqWwwwt/U+B99jY/bfbUpsfJcFGoMrdopm7G+iClslqiZi
 IVAJ+hwe38nJafnFhpA70cUbJjpMafnepHno4nsxFNK4svIsUbffnOs1H6LdNQhTP4Ru
 IlSqzoclAsrHVN4HZDRP552817/BR84oiu5IQCrHNcL5Z7t/SoDl8jv0aR8m/gysc0QY
 9+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qaqP4FL0HIFt9AkgsbDnlV3MuoeOMu65SJP7Awp+Ac4=;
 b=rmyC2T34kC1gjignPaeN1O4DcNbmEzmJ2N+kF2FxUv3As8/ROa7vHlxkPY6O4d0jaV
 GX1W4HPrHfu8U5g5Zf0uaV/3lbMe7Y0iHFA/az5HI+Qtcon8OhusXk9bZ2+DS5D8lvEr
 WXxHoNSODbkAtwd1uB/0mInSgck+8+b9y7eixs89qu+gjN79kLcJ9ZhaRUM+lufcMlXe
 BRUKESeN4fHVbQG1rG6ZMxLH95u/iTOlUgvEoGjWhBWOa6dR8Jb8Os9WxHBQPaKJD+pa
 Jz3iwTBnLRsWh0yOj0aGLZkXoQBoiuuqIFhYkM7bNRM0DjaSqe/4i+bMhfcPWB3R+rQ3
 JiIQ==
X-Gm-Message-State: AOAM533nvmA93KdGbRstuslin/zrA8sgCcgELtQ9BIq5cq6p7g4Egbsl
 XqYEFULPoTfc3WdniIkb3tk=
X-Google-Smtp-Source: ABdhPJx6pBcFL+PQTFDH913GtZ+7tHE+dLno9y3oPeXDdcMVQm5K8LHYUCoqa6rMiHuftDNpSrzMbQ==
X-Received: by 2002:a05:6870:2320:b0:da:b3f:2b80 with SMTP id
 w32-20020a056870232000b000da0b3f2b80mr11037720oao.287.1647005100733; 
 Fri, 11 Mar 2022 05:25:00 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:5655:fd2a:accf:db6c:e4fd?
 ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 z25-20020a056808065900b002d97bda386esm3657033oih.51.2022.03.11.05.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 05:25:00 -0800 (PST)
Message-ID: <a8eb4e33-4831-cf5a-5eea-291d641c6b7f@gmail.com>
Date: Fri, 11 Mar 2022 10:24:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/5] user creatable pnv-phb4 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <cc037332-a0f5-3acb-396a-49bdac653d2e@redhat.com>
 <0afba7b7-3778-2799-a77b-54091386a42a@gmail.com>
 <8421661c-58b7-a448-9294-474524098650@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8421661c-58b7-a448-9294-474524098650@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Frederic Barrat <frederic.barrat@fr.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/11/22 09:45, Cédric Le Goater wrote:
> Hello,
> 
> In 3/11/22 03:18, Daniel Henrique Barboza wrote:
>>
>>
>> On 3/10/22 15:49, Thomas Huth wrote:
>>> On 11/01/2022 14.10, Daniel Henrique Barboza wrote:
>>>> Hi,
>>>>
>>>> This version implements Cedric's review suggestions from v4. No
>>>> drastic design changes were made.
>>>>
>>>> Changes from v4:
>>>> - patches 1,3,5: unchanged
>>>> - patch 2:
>>>>    * renamed function to pnv_phb4_xscom_realize()
>>>>    * pnv4_phb4_xscom_realize() is now called at the end of phb4_realize()
>>>> - patch 4:
>>>>    * changed pnv_phb4_get_stack signature to use chip and phb
>>>>    * added a new helper called pnv_pec_stk_default_phb_realize() to
>>>> realize the default phb when running with defaults
>>>> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02148.html
>>>>
>>>> Daniel Henrique Barboza (5):
>>>>    ppc/pnv: set phb4 properties in stk_realize()
>>>>    ppc/pnv: move PHB4 XSCOM init to phb4_realize()
>>>>    ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
>>>>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>>>>    ppc/pnv: turn pnv_phb4_update_regions() into static
>>>
>>> It's now possible to crash QEMU with the pnv-phb4 device:
>>>
>>> $ ./qemu-system-ppc64 -nographic -M powernv9 -device pnv-phb4
>>> Unexpected error in object_property_try_add() at ../../devel/qemu/qom/object.c:1229:
>>> qemu-system-ppc64: -device pnv-phb4: attempt to add duplicate property 'pnv-phb4[0]' to object (type 'power9_v2.0-pnv-chip')
>>> Aborted (core dumped)
>>>
>>> Any ideas how to fix this?
>>
>> Thanks for catching this up.
>>
>> The issue here is that we're not handling the case where an user adds a pnv-phb4 device
>> when running default settings (no -nodefaults). With default settings we are adding all
>> pnv-phb4 devices that are available to the machine, having no room for any additional
>> user creatable pnv-phb4 devices.
>>
>> A similar situation happens with the powernv8 machine which errors out with a different
>> error message:
>>
>> $ ./qemu-system-ppc64 -nographic -M powernv8 -device pnv-phb3
>> qemu-system-ppc64: -device pnv-phb3: Can't add chassis slot, error -16
>>
>>
>> Adding all possible phbs by default is a behavior these machines had since they were introduced,
>> and I don't think we want to change it. Thus, a fix would be to forbid user created pnv-phb devices
>> when running with defaults.
> 
> 
> On a real system with POWER{8,9,10} processors, PHBs are sub-units of
> the processor, they can be deactivated by firmware but not plugged in
> or out like a PCI adapter on a slot. Nevertheless, it seemed to be
> good idea to have user-created PHBs for testing purposes.
> 
> Let's come back to the PowerNV requirements.
> 
>   1. having a limited set of PHBs speedups boot time.
>   2. it is useful to be able to mimic a partially broken topology you
>      some time have to deal with during bring-up.
> 
> PowerNV is also used for distro install tests and having libvirt
> support eases these tasks. libvirt prefers to run the machine with
> -nodefaults to be sure not to drag unexpected devices which would need
> to be defined in the domain file without being specified on the QEMU
> command line. For this reason :
> 
>   3. -nodefaults should not include default PHBs
> 
> The solution we came with was to introduce user-created PHB{3,4,5}
> devices on the powernv{8,9,10} machines. Reality proves to be a bit
> more complex, internally when modeling such devices, and externally
> when dealing with the user interface.
> 
> So, to make sure that we don't ship a crappy feature in QEMU 7.0,
> I think we should step back a little.
> 
> Req 1. and 2. can be simply addressed differently with a machine option:
> "phb-mask=<uint>", which QEMU would use to enable/disable PHB device
> nodes when creating the device tree.

Would this property only impact the device-tree?

Let's say that we're running a 2 socket pnv4 machine, with default settings. That
would give us 12 PHBs. So phb-mask=FFFF is kind of a no-op because you're adding
all PHBs, phb-mask=0001 would add just the first PHB (index=0 chip-id=0) and so
on. Is that correct?

> 
> For Req 3., we need to make sure we are taking the right approach. It
> seems that we should expose a new type of user-created PHB device,
> a generic virtualized one, that libvirt would use and not one depending
> on the processor revision. This needs more thinking.

libvirt support isn't upstream yet. We have room to make changes.

I agree that creating generic, un-versioned pnv-phb and pnv-phb-root-port devices
that can be used by all pnv machines would be good for libvirt support.

> 
> Hence, I am proposing we drop user-created PHB{3,4,5} for QEMU-7.0.
> All the cleanups we did are not lost and they will be useful for the
> next steps in QEMU 7.1.


Seems like a good idea for now. Even if we decide to expose them in the end, if we
keep them user visible for the 7.0 release we won't be able to change our minds
in 7.1.


Thanks,


Daniel

> 
> 
> Thanks,
> 
> C.
> 

