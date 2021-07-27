Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594A63D6D37
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 06:23:27 +0200 (CEST)
Received: from localhost ([::1]:43302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Eco-0006xV-0l
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 00:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8Ebr-0006J5-PZ
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 00:22:27 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:37485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8Ebn-0001X9-RN
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 00:22:27 -0400
Received: by mail-qv1-xf35.google.com with SMTP id s14so6305802qvm.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 21:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9AVwkuxwKlxrOpms+sYf+/hkBMbSWaTD9WxhGgOFevs=;
 b=YZkNdVRF+Klj+xTN5oMveyNqHDip5QVmzfSKTv1vw2PJ9zCFXpV+mDjN2saHBkT/tJ
 c3GW2D6Sqn2m6SUyk1ZCmSavohHIzbMEgea0y0s4+vgdtiLGrUQ9otmHFTO7gx1R8vm4
 0Yl/kC7cPm/x1WQVLeyjjHxUVKEVw5UP+D222Dh5GKc9S8dL6kYG6zF3TNYkkCua+48K
 L9BN+6d+Nn2zFtZi3cUNM+9TuWBdcuTMR1zkoQuhdmZdw32xG20AFw9/iHAXuJQRxjbQ
 0uTTgh4XMSeeU1RvngXKkNKnyOf3ZHFVLzi7tQTWkPxHpS3rA57w5LFaHKeZozShboFW
 J3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9AVwkuxwKlxrOpms+sYf+/hkBMbSWaTD9WxhGgOFevs=;
 b=uF1jk7H3KQXWXbgiIaLl8y7I6nbyBUxEpFE/sN7XG6cX77pzVfZ4nKyILVY4UDsEqs
 D46XX4BzmHGaCm8aoJca6GL/QWiTgw+zB8E5OPt8pW/EmCZE3qA5GEEciKNhgm3bKxGw
 ufHU8C3MAfs7rAxdvIYNmmkvQO4VQSysWsJ5huTcOYRzLZwjGNiWO8FCt8gwMtmZMfJ7
 3kITQ4RBrZHy4sIqZ3p7hS0EGYIKqzxyT8B+f+S5x2uSzZ26pV77sYH7caJ5+Rd2pLwl
 oBv7GKq6H5igy2Ha3OQH4WKPpq0lue8LUMW/BDtisrVWjUkLsyG8aYDXatjZYD+GAwj6
 Khgg==
X-Gm-Message-State: AOAM533/gFcnkg1EpUezVc+7v1S2H+Xw71ydjooE0x0W4sBkJNujI01j
 XY2qc5wUouhzKyI/AneTGks=
X-Google-Smtp-Source: ABdhPJyh0+dRZ3X/mZc3BXbgU/d7BvPNVpesgb8wvDkJzoI/mUjFK4wfEKlmfOrvJ4KFeVVq/xIiNg==
X-Received: by 2002:ad4:46ed:: with SMTP id h13mr4731557qvw.56.1627359742106; 
 Mon, 26 Jul 2021 21:22:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x7sm1108872qki.102.2021.07.26.21.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 21:22:21 -0700 (PDT)
To: Bjorn Helgaas <helgaas@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
References: <20210726213156.GA645321@bjorn-Precision-5520>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <c72652af-ef72-f5fa-04a2-1f30b1705b0e@roeck-us.net>
Date: Mon, 26 Jul 2021 21:22:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726213156.GA645321@bjorn-Precision-5520>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=groeck7@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.438,
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
Cc: Jiahui Cen <cenjiahui@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, Ard Biesheuvel <ardb+tianocore@kernel.org>,
 qemu-devel@nongnu.org, Bjorn Helgaas <bhelgaas@google.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 2:31 PM, Bjorn Helgaas wrote:
> [+cc linux-pci]
> 
> On Mon, Jul 26, 2021 at 04:16:29PM -0500, Bjorn Helgaas wrote:
>> On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
>>> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
>>>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
>>>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
>>>>>>> work. Analysis shows that PCI devices with IO ports do not instantiate
>>>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
>>>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
>>>>>>> affects
>>>>>>> aarch64, not x86/x86_64.
>>>>>>>
>>>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
>>>>>>> keep firmware resource map"). Since this commit, PCI device BAR
>>>>>>> allocation has changed. Taking tulip as example, the kernel reports
>>>>>>> the following PCI bar assignments when running qemu v5.2.
>>>>>>>
>>>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>
>>> IIUC, these lines are read back from the BARs
>>>
>>>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
>>>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
>>>>>>> 0x10000000-0x1000007f]
>>>>>>>
>>>
>>> ... and this is the assignment created by the kernel.
>>>
>>>>>>> With qemu v6.0, the assignment is reported as follows.
>>>>>>>
>>>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>
>>> The problem here is that Linux, for legacy reasons, does not support
>>> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
>>> rejected.
>>>
>>> This might make sense on x86, where legacy I/O ports may exist, but on
>>> other architectures, this makes no sense.
>>
>> I guess this is the "#define PCIBIOS_MIN_IO 0x1000" in
>> arm64/include/asm/pci.h.  From a PCI point of view, I'm not opposed to
>> changing that to 0, as it is on csky, riscv, sh, sparc, um.  But it's
>> really an arch question, so the arm64 folks would have to weigh in.
>>
>> But I don't think that would fix this.  PCIBIOS_MIN_IO is mainly used
>> when we assign or reassign resources to a BAR, and if firmware tells
>> us to preserve the assignments done by firmware, Linux shouldn't be
>> doing any assignment or reassignment.
>>
>> Linux received 00:01.0 BAR 0 as [io 0x0000-0x007f], and Guenter didn't
>> report any reassignment, so I assume Linux saw the
>> DSM_PCI_PRESERVE_BOOT_CONFIG [1] and didn't change anything.
>>
>> Could this be due to drivers assuming that an I/O BAR of 0 is invalid?
>> I see that at least ne2k_pci_init_one() [2] seems to assume that.  And

Correct, and ne2k_pci is known to already fail on architectures where the
IO address range starts at 0, such as riscv. Not that it helps to fix the
code - doing so only results in a crash elsewhere when running a riscv
emulation (when executing outsl, suggesting that there may be a problem
with that emulation or its use). But that is a different problem.

>> tulip_init_one() [3] and pci_esp_probe_one() (am53c974.c, [4]) use
>> pci_iomap() [5], which fails if the resource starts at 0.
>>
>> So pci_iomap() is probably already broken on the arches above that
>> allow I/O BARs to be zero.  Maybe pci_iomap() should only fail on
>> "!start" for *memory* BARs, e.g.,
>>
>> diff --git a/lib/pci_iomap.c b/lib/pci_iomap.c
>> index 2d3eb1cb73b8..77455e702a3e 100644
>> --- a/lib/pci_iomap.c
>> +++ b/lib/pci_iomap.c
>> @@ -34,7 +34,9 @@ void __iomem *pci_iomap_range(struct pci_dev *dev,
>>   	resource_size_t len = pci_resource_len(dev, bar);
>>   	unsigned long flags = pci_resource_flags(dev, bar);
>>   
>> -	if (len <= offset || !start)
>> +	if (flags & IORESOURCE_MEM && !start)
>> +		return NULL;

I am far out of my league here, but what is the purpose of the !start
check given the PCIBIOS_MIN_MEM define which can also be 0 ? Shouldn't
the check be against PCIBIOS_MIN_MEM and PCIBIOS_MIN_IO ?

But, anyway, the above change fixes the problem for 'tulip', though
obviously not for 'ne2k_pci'. 'ne2k_pci' starts working if I remove
the "!ioaddr" check in ne2k_pci_init_one().

Thanks,
Guenter

>> +	if (len <= offset)
>>   		return NULL;
>>   	len -= offset;
>>   	start += offset;
>>
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/pci_root.c?id=v5.13#n915
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/8390/ne2k-pci.c?id=v5.13#n247
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/dec/tulip/tulip_core.c?id=v5.13#n1418
>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/am53c974.c?id=v5.13#n431
>> [5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/pci_iomap.c?id=v5.13#n37
>>
>>>>>>> and the controller does not instantiate. The problem disapears after
>>>>>>> reverting commit 0cf8882fd0.
>>>>>>>
>>>>>>> Attached is a summary of test runs with various devices and qemu v5.2
>>>>>>> as well as qemu v6.0, and the command line I use for efi boots.
>>>>>>>
>>>>>>> Did commit 0cf8882fd0 introduce a bug, do I now need need some different
>>>>>>> command line to instantiate PCI devices with io ports, or are such
>>>>>>> devices
>>>>>>> simply no longer supported if the system is booted with efi support ?
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Guenter
>>>>>>
>>>>>>
>>>>>> So that commit basically just says don't ignore what efi did.
>>>>>>
>>>>>> The issue's thus likely efi.
>>>>>>
>>>>>
>>>>> I don't see the problem with efi boots on x86 and x86_64.
>>>>> Any idea why that might be the case ?
>>>>>
>>>>> Thanks,
>>>>> Guenter
>>>>>
>>>>>> Cc the maintainer. Philippe can you comment pls?
>>>>
>>>> I'll have a look. Cc'ing Ard for EDK2/Aarch64.
>>>
>>> So a potential workaround would be to use a different I/O resource
>>> window for ArmVirtPkg, that starts at 0x1000. But I would prefer to
>>> fix Linux instead.
>>>
>>>
>>>>>>
>>>>>>> ---
>>>>>>> Command line (tulip network interface):
>>>>>>>
>>>>>>> CMDLINE="root=/dev/vda console=ttyAMA0"
>>>>>>> ROOTFS="rootfs.ext2"
>>>>>>>
>>>>>>> qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
>>>>>>>           -m 512 -cpu cortex-a57 -no-reboot \
>>>>>>>           -device tulip,netdev=net0 -netdev user,id=net0 \
>>>>>>>           -bios QEMU_EFI-aarch64.fd \
>>>>>>>           -snapshot \
>>>>>>>           -device virtio-blk-device,drive=d0 \
>>>>>>>           -drive file=${ROOTFS},if=none,id=d0,format=raw \
>>>>>>>           -nographic -serial stdio -monitor none \
>>>>>>>           --append "${CMDLINE}"
>>>>>>>
>>>>>>> ---
>>>>>>> Boot tests with various devices known to work in qemu v5.2.
>>>>>>>
>>>>>>>          v5.2    v6.0    v6.0
>>>>>>>          efi    non-efi    efi
>>>>>>> e1000        pass    pass    pass
>>>>>>> e1000-82544gc    pass    pass    pass
>>>>>>> e1000-82545em    pass    pass    pass
>>>>>>> e1000e        pass    pass    pass
>>>>>>> i82550        pass    pass    pass
>>>>>>> i82557a        pass    pass    pass
>>>>>>> i82557b        pass    pass    pass
>>>>>>> i82557c        pass    pass    pass
>>>>>>> i82558a        pass    pass    pass
>>>>>>> i82559b        pass    pass    pass
>>>>>>> i82559c        pass    pass    pass
>>>>>>> i82559er    pass    pass    pass
>>>>>>> i82562        pass    pass    pass
>>>>>>> i82801        pass    pass    pass
>>>>>>> ne2k_pci    pass    pass    fail    <--
>>>>>>> pcnet        pass    pass    pass
>>>>>>> rtl8139        pass    pass    pass
>>>>>>> tulip        pass    pass    fail    <--
>>>>>>> usb-net        pass    pass    pass
>>>>>>> virtio-net-device
>>>>>>>          pass    pass    pass
>>>>>>> virtio-net-pci    pass    pass    pass
>>>>>>> virtio-net-pci-non-transitional
>>>>>>>          pass    pass    pass
>>>>>>>
>>>>>>> usb-xhci    pass    pass    pass
>>>>>>> usb-ehci    pass    pass    pass
>>>>>>> usb-ohci    pass    pass    pass
>>>>>>> usb-uas-xhci    pass    pass    pass
>>>>>>> virtio        pass    pass    pass
>>>>>>> virtio-blk-pci    pass    pass    pass
>>>>>>> virtio-blk-device
>>>>>>>          pass    pass    pass
>>>>>>> nvme        pass    pass    pass
>>>>>>> sdhci        pass    pass    pass
>>>>>>> dc390        pass    pass    fail    <--
>>>>>>> am53c974    pass    pass    fail    <--
>>>>>>> lsi53c895ai    pass    pass    pass
>>>>>>> mptsas1068    pass    pass    pass
>>>>>>> lsi53c810    pass    pass    pass
>>>>>>> megasas        pass    pass    pass
>>>>>>> megasas-gen2    pass    pass    pass
>>>>>>> virtio-scsi-device
>>>>>>>          pass    pass    pass
>>>>>>> virtio-scsi-pci    pass    pass    pass
>>>>>>
>>>>>
>>>>
>>>


