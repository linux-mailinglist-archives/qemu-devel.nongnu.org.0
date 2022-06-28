Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C297C55BF30
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:41:43 +0200 (CEST)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65qw-0008RJ-Od
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o64Ru-0007oq-SZ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:11:47 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:50657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o64Rr-0001zC-7i
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:11:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A015D2229C;
 Tue, 28 Jun 2022 06:11:40 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 08:11:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00214ae6f7c-9932-41b3-96e9-7ecd47dac751,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cbf0654d-3424-6225-1fb2-53fbf8f7e5c5@kaod.org>
Date: Tue, 28 Jun 2022 08:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH] qemu-options: bring the kernel and image options
 together
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>
References: <20220622145052.4012981-1-alex.bennee@linaro.org>
 <474f352b-4cb6-00c1-cc3b-432a54468b7b@kaod.org> <8735fvr850.fsf@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8735fvr850.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8b4932ec-c938-4e1e-ab41-bc21c4c64e99
X-Ovh-Tracer-Id: 11212837176013523866
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueehvdeuveetgfefveekgffgffffjedvleejkeefhfetueefkeekvddvjeeikeetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpphhptgdqsghoohhtrdhshhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/23/22 12:21, Alex Bennée wrote:
> 
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 6/22/22 16:50, Alex Bennée wrote:
>>> How to control the booting of QEMU is often a source of confusion for
>>> users. Bring the options that control this together in the manual
>>> pages and add some verbiage to describe when each option is
>>> appropriate.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>    qemu-options.hx | 80 ++++++++++++++++++++++++++++++++++++++-----------
>>>    1 file changed, 62 insertions(+), 18 deletions(-)
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 377d22fbd8..9b0242f0ef 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -1585,13 +1585,6 @@ SRST
>>>        Use file as SecureDigital card image.
>>>    ERST
>>>    -DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
>>> -    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
>>> -SRST
>>> -``-pflash file``
>>> -    Use file as a parallel flash image.
>>> -ERST
>>> ->   DEF("snapshot", 0, QEMU_OPTION_snapshot,
>>>        "-snapshot       write to temporary files instead of disk image files\n",
>>>        QEMU_ARCH_ALL)
>>> @@ -3680,12 +3673,51 @@ DEFHEADING()
>>>      #endif
>>>    -DEFHEADING(Linux/Multiboot boot specific:)
>>> +DEFHEADING(Boot Image or Kernel specific:)
>>> +SRST
>>> +There are broadly 4 ways you can boot a system with QEMU.
>>> +
>>> + - specify a firmware and let it control finding a kernel
>>> + - specify a firmware and pass a hint to the kernel to boot
>>> + - direct kernel image boot
>>> + - manually load files into the guests address space
>>> +
>>> +The last method is useful for quickly testing kernels but as there is
>>> +no firmware to pass configuration information to the kernel it must
>>> +either be built for the exact configuration or be handed a DTB blob
>>> +which tells the kernel what drivers it needs.
>>
>> The last method can also load any FW blob with the correct executable
>> layout (reset vector).
> 
> Heh - actually I wrote that paragraph for the direct kernel image boot
> and then added the manual option after the fact. I'll try and clean that
> up to make it clearer.
> 
>>
>>> +
>>> +ERST
>>> +
>>> +SRST
>>> +
>>> +For x86 machines ``-bios`` will generally do the right thing with
>>> +whatever it is given. For non-x86 machines the more strict ``-pflash``
>>> +option needs an image that is sized for the flash device for the given
>>> +machine type.
>>
>> Some ppc machine use -bios also, mac, pseries, PowerNV (let's not restrict
>> to x86).
> 
> Ahh the magic some ;-) Does it essentially rely on if the correct
> plumbing has been done for the machine? 

They rely on finding a reset vector. So yes, the FW should be mapped
where it is expected and have vectors. The machines also know how to
expose kernel/initrd to the FW and the FWs have runtime services.
It's more than a kernel loader.

> Anything I can look for to audit other machine types?

Good question. There are some many ways to start a machine.

The avocado tests should be a good reference and here is a little
tool I use to verify that the PPC machines supported in QEMU boot
correctly :

   https://github.com/legoater/qemu-ppc-boot/blob/main/ppc-boot.sh

Sometime ago, I did a model for a MicroWatt SoC, a POWER9 FPGA
implementation, and I found quite a few ways to boot from some blob.
See :

   https://github.com/qemu/qemu/commit/2f43989f87332c226358c1f3ef7b96d94ba342ca

I guess when FW runtime services are required so is -bios. Else all
these options  :

  -kernel
  -bios
  -device loader
  -drive <flash>

can be used more or less in the same way.

Thanks,

C.


> 
>>
>>
>> LGTM.
>>
>> Thanks,
>>
>> C.
>>
>>
>>> +
>>> +ERST
>>> +
>>> +DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
>>> +    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
>>> +SRST
>>> +``-bios file``
>>> +    Set the filename for the BIOS.
>>> +ERST
>>> +
>>> +DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
>>> +    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
>>> +SRST
>>> +``-pflash file``
>>> +    Use file as a parallel flash image.
>>> +ERST
>>> +
>>>    SRST
>>> -When using these options, you can use a given Linux or Multiboot kernel
>>> -without installing it in the disk image. It can be useful for easier
>>> -testing of various kernels.
>>>    +The kernel options were designed to work with Linux kernels
>>> although
>>> +other things (like hypervisors) can be packaged up as a kernel
>>> +executable image. The exact format of a executable image is usually
>>> +architecture specific.
>>>    ERST
>>>    @@ -3725,6 +3757,25 @@ SRST
>>>        kernel on boot.
>>>    ERST
>>>    +SRST
>>> +
>>> +Finally you can also manually load images directly into the address
>>> +space of the guest. This is most useful for developers who already
>>> +know the layout of their guest and take care to ensure something sane
>>> +will happen when the reset vector executes.
>>> +
>>> +The generic loader can be invoked by using the loader device:
>>> +
>>> +``-device loader,addr=<addr>,data=<data>,data-len=<data-len>[,data-be=<data-be>][,cpu-num=<cpu-num>]``
>>> +
>>> +there is also the guest loader which operates in a similar way but
>>> +tweaks the DTB so a hypervisor loaded via ``-kernel`` can find where
>>> +the guest image is:
>>> +
>>> +``-device guest-loader,addr=<addr>[,kernel=<path>,[bootargs=<arguments>]][,initrd=<path>]``
>>> +ERST
>>> +
>>>    DEFHEADING()
>>>      DEFHEADING(Debug/Expert options:)
>>> @@ -4175,13 +4226,6 @@ SRST
>>>        To list all the data directories, use ``-L help``.
>>>    ERST
>>>    -DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
>>> -    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
>>> -SRST
>>> -``-bios file``
>>> -    Set the filename for the BIOS.
>>> -ERST
>>> -
>>>    DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
>>>        "-enable-kvm     enable KVM full virtualization support\n",
>>>        QEMU_ARCH_ARM | QEMU_ARCH_I386 | QEMU_ARCH_MIPS | QEMU_ARCH_PPC |
> 
> 


