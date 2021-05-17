Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC57382311
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 05:26:31 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liTtm-0000A6-24
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 23:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1liTsN-0007ci-Sy
 for qemu-devel@nongnu.org; Sun, 16 May 2021 23:25:03 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1liTsL-0005fG-05
 for qemu-devel@nongnu.org; Sun, 16 May 2021 23:25:03 -0400
Received: by mail-pg1-x52a.google.com with SMTP id l70so3707032pga.1
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 20:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KYBCFec7JKFNurnF2pciPcViLIzdXJY/n3Bb8DOr8S8=;
 b=Y/JmoDYpfVsS2Z+54RqBFvwMQSEcFieBGPpSqFXNfj3tpg+H57BbjKQ0Y6oPnoRacc
 xaEKnKoBXrapqw6z4mjnMX2aEKgG+2/ozrgzgx2w8rd/MNhlw2a9fwKBLJWWlz3CeJAF
 p3EbW0enr/fK6M7h0Fnj0u5deX7czeDYBZ+jMpGI32rxQsDlH40hKgkQu6EBP1d/9IGI
 t7sX0evi1xnXI43PVYzo4HPIJuDI9YP+dVWwMC22tvs4o3G6xkscPyabJ5FlZIoInsf5
 5XVXoDUTnJ/PGSPOT00pHaj1WRzogCSXTeqrhUBEcaE6KUULA32FcOVHDg2G4C0FQ+gr
 +rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KYBCFec7JKFNurnF2pciPcViLIzdXJY/n3Bb8DOr8S8=;
 b=n6uAKz3tDSkHS03AbVaSS53b8z0mOZyPSx+mIgeS5Si9HV0t+e1ZB/sMs63pnA4rGz
 IwlWPPu/3ycqWv9d9a96cuaQCmB9dDkNO6dkCLYRZI6PijbdjjbSWzQDrLaC89b2bwCC
 GDvD4+k+KzKX5sWi+5ZSxtTQ5T7QimRYNGhBxYJueBF6X3agCGTbd0ooOpSGpRFsKTNF
 5AW/+ZrsZvFJ6/GGT4ib/BLQvbxBDLobbSFVBckpBsc2/VF4p2SnvFmeXgfOb9EY8y70
 StgB5THvIEc7HmUeBm7HEa4KJ+I7rVgOz4AmSGOBO9L6EtntdHpGHU4bpLu5Whw0Ca6q
 gvpQ==
X-Gm-Message-State: AOAM530LO+MVqtnrr3o7SdmPSzs0xY8zBbamSgYq7tS7j9lxjldNK42Z
 7E2zoZUDnpX1Pe2qbMurZDX9zEflcHhFNg==
X-Google-Smtp-Source: ABdhPJyhW5REs0tOS4VauFKTlLh4EyvNGumdf6IjHMDLoHTbIzQZMS/1EIRdu7fZmNInNF8UYi84Aw==
X-Received: by 2002:aa7:96a5:0:b029:28e:97c0:cb5e with SMTP id
 g5-20020aa796a50000b029028e97c0cb5emr57611658pfk.7.1621221897867; 
 Sun, 16 May 2021 20:24:57 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id ch24sm2514896pjb.18.2021.05.16.20.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 20:24:57 -0700 (PDT)
Message-ID: <4f7af3d0-81e1-18d9-a932-13560d6f0519@ozlabs.ru>
Date: Mon, 17 May 2021 13:24:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <8ee8ae9-63f2-9633-1cf0-b4738c89f5fc@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <8ee8ae9-63f2-9633-1cf0-b4738c89f5fc@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.833,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/16/21 06:19, BALATON Zoltan wrote:
> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
>> The PAPR platform describes an OS environment that's presented by
>> a combination of a hypervisor and firmware. The features it specifies
>> require collaboration between the firmware and the hypervisor.
>>
>> Since the beginning, the runtime component of the firmware (RTAS) has
>> been implemented as a 20 byte shim which simply forwards it to
>> a hypercall implemented in qemu. The boot time firmware component is
>> SLOF - but a build that's specific to qemu, and has always needed to be
>> updated in sync with it. Even though we've managed to limit the amount
>> of runtime communication we need between qemu and SLOF, there's some,
>> and it has become increasingly awkward to handle as we've implemented
>> new features.
>>
>> This implements a boot time OF client interface (CI) which is
>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>> which implements Open Firmware Client Interface (OF CI). This allows
>> using a smaller stateless firmware which does not have to manage
>> the device tree.
>>
>> The new "vof.bin" firmware image is included with source code under
>> pc-bios/. It also includes RTAS blob.
>>
>> This implements a handful of CI methods just to get -kernel/-initrd
>> working. In particular, this implements the device tree fetching and
>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>> "/memory@0/available" to report the client about available memory.
>>
>> This implements changing some device tree properties which we know how
>> to deal with, the rest is ignored. To allow changes, this skips
>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>> appending.
>>
>> In absence of SLOF, this assigns phandles to device tree nodes to make
>> device tree traversing work.
>>
>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>
>> This adds basic instances support which are managed by a hash map
>> ihandle -> [phandle].
>>
>> Before the guest started, the used memory is:
>> 0..e60 - the initial firmware
>> 8000..10000 - stack
>> 400000.. - kernel
>> 3ea0000.. - initramdisk
>>
>> This OF CI does not implement "interpret".
>>
>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>> includes a disk image with pre-formatted nvram.
>>
>> With this basic support, this can only boot into kernel directly.
>> However this is just enough for the petitboot kernel and initradmdisk to
>> boot from any possible source. Note this requires reasonably recent guest
>> kernel with:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>
>>
>> The immediate benefit is much faster booting time which especially
>> crucial with fully emulated early CPU bring up environments. Also this
>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>
>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>> other POWERPC boards which do not support pSeries.
>>
>> This is coded in assumption that later on we might be adding support for
>> booting from QEMU backends (blockdev is the first candidate) without
>> devices/drivers in between as OF1275 does not require that and
>> it is quite easy to so.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
> [...]
>> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
>> index 86d6f379d1c3..dcd2e5c80df4 100644
>> --- a/hw/ppc/meson.build
>> +++ b/hw/ppc/meson.build
>> @@ -28,6 +28,8 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>>   'spapr_rtas_ddw.c',
>>   'spapr_numa.c',
>>   'pef.c',
>> +  'spapr_vof.c',
>> +  'vof.c',
>> ))
>> ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>> ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
> 
> It may be better to add a new CONFIG_VOF option to compile vof.c that I 
> can then depend on in CONFIG_PEGASOS2 instead of having to add vof.c 
> like it's added here. (If VOF is made independent of SPAPR then it 
> deserves to have an own config option and the machines using it can 
> depend on that.)

This is a valid point but I means now I have to reread everything said 
recently about "imply" and other Kconfig directives. Oh well, may be it 
is time, I'll fix that up :)


> 
> Regards,
> BALATON Zoltan

-- 
Alexey

