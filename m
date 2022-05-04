Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D3851A28C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:49:46 +0200 (CEST)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmGK1-0007P2-Dd
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmGIc-0005yn-On; Wed, 04 May 2022 10:48:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmGIa-0007g3-WA; Wed, 04 May 2022 10:48:18 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmGHZ-0004LH-FJ; Wed, 04 May 2022 15:47:17 +0100
Message-ID: <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
Date: Wed, 4 May 2022 15:48:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <87ilql9xww.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2022 15:26, Fabiano Rosas wrote:

> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> 
>> On 03/05/2022 15:06, Fabiano Rosas wrote:
>>
>>> Murilo Opsfelder Araújo <muriloo@linux.ibm.com> writes:
>>>
>>>> $ cat > configs/devices/rh-virtio.mak <<"EOF"
>>>> CONFIG_VIRTIO=y
>>>> CONFIG_VIRTIO_BALLOON=y
>>>> CONFIG_VIRTIO_BLK=y
>>>> CONFIG_VIRTIO_GPU=y
>>>> CONFIG_VIRTIO_INPUT=y
>>>> CONFIG_VIRTIO_INPUT_HOST=y
>>>> CONFIG_VIRTIO_NET=y
>>>> CONFIG_VIRTIO_RNG=y
>>>> CONFIG_VIRTIO_SCSI=y
>>>> CONFIG_VIRTIO_SERIAL=y
>>>> EOF
>>>>
>>>> $ cat > configs/devices/ppc64-softmmu/ppc64-rh-devices.mak <<"EOF"
>>>> include ../rh-virtio.mak
>>>> CONFIG_DIMM=y
>>>> CONFIG_MEM_DEVICE=y
>>>> CONFIG_NVDIMM=y
>>>> CONFIG_PCI=y
>>>> CONFIG_PCI_DEVICES=y
>>>> CONFIG_PCI_TESTDEV=y
>>>> CONFIG_PCI_EXPRESS=y
>>>> CONFIG_PSERIES=y
>>>> CONFIG_SCSI=y
>>>> CONFIG_SPAPR_VSCSI=y
>>>> CONFIG_TEST_DEVICES=y
>>>> CONFIG_USB=y
>>>> CONFIG_USB_OHCI=y
>>>> CONFIG_USB_OHCI_PCI=y
>>>> CONFIG_USB_SMARTCARD=y
>>>> CONFIG_USB_STORAGE_CORE=y
>>>> CONFIG_USB_STORAGE_CLASSIC=y
>>>> CONFIG_USB_XHCI=y
>>>> CONFIG_USB_XHCI_NEC=y
>>>> CONFIG_USB_XHCI_PCI=y
>>>> CONFIG_VFIO=y
>>>> CONFIG_VFIO_PCI=y
>>>> CONFIG_VGA=y
>>>> CONFIG_VGA_PCI=y
>>>> CONFIG_VHOST_USER=y
>>>> CONFIG_VIRTIO_PCI=y
>>>> CONFIG_VIRTIO_VGA=y
>>>> CONFIG_WDT_IB6300ESB=y
>>>> CONFIG_XICS=y
>>>> CONFIG_XIVE=y
>>>> CONFIG_TPM=y
>>>> CONFIG_TPM_SPAPR=y
>>>> CONFIG_TPM_EMULATOR=y
>>>> EOF
>>>>
>>>> $ mkdir build
>>>> $ cd build
>>>>
>>>
>>> <snip>
>>>
>>>> $ ../configure --without-default-devices --with-devices-ppc64=ppc64-rh-devices --target-list=ppc64-softmmu
>>>> $ make -j
>>>> ...
>>>> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data.rel+0x3228): undefined reference to `hmp_info_via'
>>>> collect2: error: ld returned 1 exit status
>>>>
>>>> Since TARGET_PPC is defined when building target ppc64-softmmu, the hmp_info_via will be referenced when processing the hmp-commands-info.hx.
>>>> However, hmp_info_via implementation resides on hw/misc/mos6522.c, which is built only if CONFIG_MOS6522 is defined, as per hw/misc/meson.build.
>>>
>>> I think this particular problem you hit is due to the 64 bit devices
>>> file including 32 bit as well:
>>>
>>> $ cat configs/devices/ppc64-softmmu/default.mak
>>> # Default configuration for ppc64-softmmu
>>>
>>> # Include all 32-bit boards
>>> include ../ppc-softmmu/default.mak <----- here
>>>
>>> # For PowerNV
>>> CONFIG_POWERNV=y
>>>
>>> # For pSeries
>>> CONFIG_PSERIES=y
>>> ---
>>>
>>> So ppc64-softmmu doesn't quite do what it says on the tin. I think in
>>> the long run we need to revisit the conversation about whether to keep
>>> the 32 & 64 bit builds separate. It is misleading that you're explicitly
>>> excluding ppc-softmmu from the `--target-list`, but a some 32 bit stuff
>>> still comes along implicitly.
>>
>> Unfortunately for historical reasons it isn't quite that simple: the mac99 machine in
>> hw/ppc/mac_newworld.c is both a 32-bit and a 64-bit machine, but with a different PCI
>> host bridge and a 970 CPU if run from qemu-system-ppc64. Unfortunately it pre-dates
>> my time working on QEMU's PPC Mac machines but I believe it was (is?) capable of
>> booting Linux, even though I doubt it accurately represents a real machine.
> 
> Well, what you describe is fine in my view, the 64-bit machine uses
> qemu-system-ppc64. If there is shared code with 32-bit, that is ok.
> 
> What I would like to understand is what is the community's direction
> with this, do we want:
> 
> 1) the 64-bit build to include all of the code and have it run all
>     machines, or;
> 
> 2) the 64-bit build to run only 64-bit machines and the 32-bit build to
>     run only 32-bit machines.
> 
> There are things such as 'target_ulong' that go against #1, and this
> thread shows that we're not doing #2 as well.
> 
> I know there have been discussions about this in the past but I couldn't
> find them in the archives.

Certainly if a 64-bit Mac machine were to be added today, I'd be inclined to copy 
mac_newworld.c into a separate file and give it a separate machine name for ppc64 to 
make a clear distinction between the two machines (and allow them to evolve 
separately). Unfortunately I have no idea as to what the reference machine for the 
PPC64 Mac machine was supposed to be which makes it harder to decide what to do :(

In my mind it feels like qemu-system-ppc is for 32-bit guests and qemu-system-ppc64 
is for 64-bit guests which I believe is consistent with how it currently works with 
MIPS and ARM (someone feel free to correct me here).


ATB,

Mark.

