Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A97350B18
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 02:20:29 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRl4W-0001Wm-F5
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 20:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lRl21-0000kK-Qe
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 20:17:53 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lRl1w-0003dS-KW
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 20:17:53 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso23009pjb.4
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GF22wmpToUIaD196MjAK+9lbB5xQkq4EB0MI99MmOYk=;
 b=FJo/ZW+I49/2h+SnT/D5byLSzb3CUjPXNk5h5u2Bx5mSvc0vnGfPwLNyCj1PTBuBhv
 zvzQlRWBZN4HsHS7uPTST2y1ijZNMbHpTWAMIsvqMJ1LR2BCfYZnqYpY6MEUwxqUgtbk
 G9aVmbSOaea2XZyE6m4ffmUmTE7J1my0V4XsZvsnkpANYTWn33XZgxEGk7Ni5YUDf12O
 6ihbzWRn3so3jQcXEG/+ljgXSjER1IKqeuNIbKwNHJrmasUIvpYVCPifEA/QnJizZTK4
 O3jNVnD8JzEHAsrSedkZpNTr7o+ugAGQIg3B+bIoPxWph1HAyJRP1YqgVYuG6mxizy7U
 /6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GF22wmpToUIaD196MjAK+9lbB5xQkq4EB0MI99MmOYk=;
 b=t0J86VxtBMOpjYhFAwS8JsZO5iKBijF+guhUbe0BuZ8wSDaqComOaTidfZUU3IsExp
 JRbaSMtruRUwVp/ylHRP3S5gwJ+gkq+Lnn9gAhr1nqIG2ukJLg4T2h0lOkKNIq2qUsH7
 dcCWwTzyP4ByZpxOSaoHhgWRoWabD1gA+UT3FlkMIJtQCjkKjoxPw40j5Y24TDVKyn+7
 NiEB5QRAlzF0pPwzX1MR6kZeFmXNZF9d7kldK2+wvJfJ75UHAvFoQM92MZSE2l/InMUZ
 8r8A27PBbA1tXfXlvJAQYwhlW2X8A8H0zLQRTYq5CbaYsEB6hHKDG63YDOHGiUXpQDqJ
 +VyQ==
X-Gm-Message-State: AOAM532pNvklLRit4MRVyT/FptMwEYTVXhCunFoJDgpArHijryRpoIr9
 ArcfAQXmf6bP8mT9f33pdoTVTQ==
X-Google-Smtp-Source: ABdhPJwQV5lwTUJo/NzqKqsmHVKeH4my6wB2AxdVX7agsbltVn6Nc7M9DsK9upjfiSgVXNwpR5CJNw==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr6127681pjr.194.1617236264968; 
 Wed, 31 Mar 2021 17:17:44 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id e6sm3245294pfc.159.2021.03.31.17.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 17:17:44 -0700 (PDT)
Message-ID: <2880d500-94bb-5579-8aba-4b78d35ba504@ozlabs.ru>
Date: Thu, 1 Apr 2021 11:17:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH qemu v16] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210323025830.104781-1-aik@ozlabs.ru>
 <YFv69rtZd6yzKAtU@yekko.fritz.box>
 <98565b10-debd-be0a-79f7-9f08737a49d1@ozlabs.ru>
 <YGPKcKqPtKCTdMCi@yekko.fritz.box>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YGPKcKqPtKCTdMCi@yekko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/03/2021 12:03, David Gibson wrote:
> On Thu, Mar 25, 2021 at 02:25:33PM +1100, Alexey Kardashevskiy wrote:
>>
>>
>> On 25/03/2021 13:52, David Gibson wrote:
>>> On Tue, Mar 23, 2021 at 01:58:30PM +1100, Alexey Kardashevskiy wrote:
>>>> The PAPR platform which describes an OS environment that's presented by
>>>> a combination of a hypervisor and firmware. The features it specifies
>>>> require collaboration between the firmware and the hypervisor.
>>>>
>>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>>> been implemented as a 20 byte shim which simply forwards it to
>>>> a hypercall implemented in qemu. The boot time firmware component is
>>>> SLOF - but a build that's specific to qemu, and has always needed to be
>>>> updated in sync with it. Even though we've managed to limit the amount
>>>> of runtime communication we need between qemu and SLOF, there's some,
>>>> and it has become increasingly awkward to handle as we've implemented
>>>> new features.
>>>>
>>>> This implements a boot time OF client interface (CI) which is
>>>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>>> which implements Open Firmware Client Interface (OF CI). This allows
>>>> using a smaller stateless firmware which does not have to manage
>>>> the device tree.
>>>>
>>>> The new "vof.bin" firmware image is included with source code under
>>>> pc-bios/. It also includes RTAS blob.
>>>>
>>>> This implements a handful of CI methods just to get -kernel/-initrd
>>>> working. In particular, this implements the device tree fetching and
>>>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>>>> "/memory@0/available" to report the client about available memory.
>>>>
>>>> This implements changing some device tree properties which we know how
>>>> to deal with, the rest is ignored. To allow changes, this skips
>>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>>> appending.
>>>>
>>>> In absence of SLOF, this assigns phandles to device tree nodes to make
>>>> device tree traversing work.
>>>>
>>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>>>
>>>> This adds basic instances support which are managed by a hash map
>>>> ihandle -> [phandle].
>>>>
>>>> Before the guest started, the used memory is:
>>>> 0..e60 - the initial firmware
>>>> 8000..10000 - stack
>>>> 400000.. - kernel
>>>> 3ea0000.. - initramdisk
>>>>
>>>> This OF CI does not implement "interpret".
>>>>
>>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>>> includes a disk image with pre-formatted nvram.
>>>>
>>>> With this basic support, this can only boot into kernel directly.
>>>> However this is just enough for the petitboot kernel and initradmdisk to
>>>> boot from any possible source. Note this requires reasonably recent guest
>>>> kernel with:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
>>>>
>>>> The immediate benefit is much faster booting time which especially
>>>> crucial with fully emulated early CPU bring up environments. Also this
>>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>>>
>>>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>>>> other POWERPC boards which do not support pSeries.
>>>>
>>>> This is coded in assumption that later on we might be adding support for
>>>> booting from QEMU backends (blockdev is the first candidate) without
>>>> devices/drivers in between as OF1275 does not require that and
>>>> it is quite easy to so.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>
>>> I have some comments below, but they're basically all trivial at this
>>> point.  We've missed qemu-6.0 obviously, but I'm hoping I can merge
>>> the next spin to my ppc-for-6.1 tree.
>>>
>>>> ---
>>>>
>>>> The example command line is:
>>>>
>>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>>> -nodefaults \
>>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>>> -nographic \
>>>> -vga none \
>>>> -enable-kvm \
>>>> -m 2G \
>>>> -machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
>>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>>> -initrd pb/rootfs.cpio.xz \
>>>> -drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw \
>>>
>>> Removing the need for a prebuild NVRAM image is something I'd like to
>>> see as a followup.
>>
>>
>> We do not _need_ NVRAM in the VM to begin with, or is this a requirement?
> 
> Actually.. I'm not certain.


Have you heard of using it, ever? What do people store in there in practice?


>> The whole VOF thing is more like a hack and I do not recall myself on doing
>> anything useful with NVRAM.
>>
>> If we really need it, then when to format it - in QEMU or VOF.bin? This
>> alone will trigger a (lengthy) discussion :)
> 
> I prefer qemu, but we can worry about that later.


[...]

>>>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>>>> +                     target_ulong *stack_ptr, Error **errp)
>>>> +{
>>>> +    Vof *vof = spapr->vof;
>>>> +
>>>> +    vof_cleanup(vof);
>>>> +
>>>> +    spapr_vof_client_dt_finalize(spapr, fdt);
>>>> +
>>>> +    if (vof_claim(spapr->fdt_blob, vof, 0, spapr->fw_size, 0) == -1) {
>>>> +        error_setg(errp, "Memory for firmware is in use");
>>>
>>> This could probably be an assert, yes?  IIUC this the very first
>>> claim, so if this fails then we've placed things incorrectly in the
>>> first place, so it's a code error rather than a user error.
>>
>>
>> Passing &error_fatal as errp is an assert pretty much but more informative
>> imho.
> 
> Not quite.  Passing &error_abort is similar to an assert, but
> &error_fatal is not.  The rule is that error_abort or assert() should
> be used for things that can only occur as a result of a bug in qemu
> itself, whereas error_fatal and other errors should be used for things
> where the failure may be because of user configuration, or something
> wrong on the host or in the guest.
> 
> Since the VOF image is being provided by qemu and this is too early
> for the guest to have messed with it, this counts as something that is
> necessarily a problem in qemu itself.


vof.bin can be passed via "-bios" which is +1 for error_fatal imho.

Sorry I missed this reply when posted v18. Repost with error_abort? I do 
not care as much about this one.


-- 
Alexey

