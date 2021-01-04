Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A9C2E9071
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 07:42:49 +0100 (CET)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwJZn-0006T4-Pj
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 01:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kwJVm-0005uD-AZ
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 01:38:42 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kwJVe-0002pO-0g
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 01:38:38 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2E47F580316;
 Mon,  4 Jan 2021 01:38:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 04 Jan 2021 01:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=s
 UrEzbFX6ytYA+TxUXIUKrDlSZVdbRxWtHqS9eXPJvU=; b=Xf1B4k1QFm15atzZ1
 oFwIbDWvvSXrJnCcAU5CCkDTwM+tSBheKhPfLl41h0U9Msd4p0GmlUtEo1miR6ji
 fvB9aukkHIDuDjcdtuL7cXTyu9MTmmKjA4tslScRWZqwwmNh1CfAtK+4Q4uWPJ2q
 cVQVQh8uALVRpYL/CPIndynBulwVbIlk2rX2aR0F/TQW72ul8nX620ehay2lMcpB
 chTfA6bur5aRPnxRNvJP3KRXCpueiVJCYfhDP0AWX7YGs/1Adl6BkK+C0dhwg3iZ
 T2v2VtbgofQGbcx71lmqWgfTEWFmpXahQlzCFZYIknM6+MLLo1TIMDmM/k6cmwst
 Z6wzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=sUrEzbFX6ytYA+TxUXIUKrDlSZVdbRxWtHqS9eXPJ
 vU=; b=TcC7oDNFXwvtXrV2NUGVuFRD0KVPTbBwOySe+QwEqTGVW8b2ifPRiry7h
 QLox6Q8jXNDPojWrygnBSFQwpyCTIv6xHDwlfYF0eRShChn3zKC8Thurj3tV/aOR
 jfDrZY0UXq8hjYc4CgkIVudABzZS0brOF9+X4yAXaFyJG0XcG3Xu7Hd9fT+5oLtG
 uwME3PhXTXatuA0MX3HRmvh1r4AQT74cuXvuOBxe9iRH+qQPqAyKc1evUbSoz+ej
 c2HfezI47xv830nDv1LB4NOh2C6xCX3O7fZ65gYqpPCnBs6qnpqBONNbqoL/4BnG
 K/M51H1e2kAsHFzS+VTHJSkTh7Dfw==
X-ME-Sender: <xms:3rfyX6po3CK9pHTewjcHNo2GB7LnbWFO-cSYczTexu87CoIBNFXfgg>
 <xme:3rfyX4pojw4CyUfi3c9o2hTTwgzQTTXl_hLXVGT45bLq4CTeEhfg6VCCSXWcEhB69
 RumTS1m3a3puH2HnbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefvddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeghfekuddugfegleffkeegteektdelffffvdegffdvffeuudel
 hefhhefhuedvtdenucffohhmrghinheprghnhhgvnhhgrdgtohhmrdgtnhdpghhithhhuh
 gsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppeeghedrfeefrdehtddrvdehgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgi
 hunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:3rfyX_PWkw0goqpVsuTDdrrEpakj4gsU0hCDkixwMobL1uiL4n3gCg>
 <xmx:3rfyX55D-MGJudH0AOCaI0XV7tpZtHZvmiU2SxNYpKWS8IAmTvkXXg>
 <xmx:3rfyX56CYDn4vfeGVP3-Mh-DDtFknkLP6IeSCrI8D2vGrFlrk0pS3Q>
 <xmx:37fyX2i_-7g76GM852sPIkK93Q5cXRbdahBcjQ77QZjSl_43xBzCig>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5094A1080057;
 Mon,  4 Jan 2021 01:38:20 -0500 (EST)
Subject: Re: [PATCH 00/24] vt82c686b clean ups and vt8231 emulation - all in
 one
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <cover.1609584215.git.balaton@eik.bme.hu>
 <6f66caae-64fb-6325-9950-8ff52f1b13eb@amsat.org>
 <43d1085-572e-4bc4-c28-66478848e83f@eik.bme.hu>
 <3a8f9b76-6e26-f483-3252-e1fd7f0c888d@amsat.org>
 <d39c8f3c-6eac-1cb5-481-f5ef9b7a312a@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e0edd212-3b71-55c4-1ccb-20e48a5661d6@flygoat.com>
Date: Mon, 4 Jan 2021 14:38:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d39c8f3c-6eac-1cb5-481-f5ef9b7a312a@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.221;
 envelope-from=jiaxun.yang@flygoat.com; helo=new1-smtp.messagingengine.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/4 上午1:07, BALATON Zoltan 写道:
> On Sun, 3 Jan 2021, Philippe Mathieu-Daudé wrote:
>> On 1/3/21 3:27 PM, BALATON Zoltan via wrote:
>>> On Sun, 3 Jan 2021, Philippe Mathieu-Daudé wrote:
>>>> On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
>>>>> Hello,
>>>>>
>>>>> This is an all in one series containing all the patches from my
>>>>> previous part I and part II vt82c686b clean up series plus the end of
>>>>> it to finally add vt8231 emulation that will be used by subsequent
>>>>> ppc/pegasos2 emulation. I consider this finished for now and good
>>>>> enough to get in also cleaning up and improving fuloong2e emulation a
>>>>> bit but previous disclaimer is still valid: It does not aim to fix 
>>>>> all
>>>>> existing bugs or make the model perfectly emulate the real chip just
>>>>> reach the level where we can have working emulation to boot guests
>>>>> which can then be improved later. (E.g. I think state saving was
>>>>> broken before and it remains broken after because I don't know all 
>>>>> the
>>>>> details how to add vmstate for all kinds of data structures and this
>>>>> could be addressed separately when fixing the already broken state
>>>>> saving if someone wants to test and fix it.) With this it boots at
>>>>> least MorphOS on pegasos2 and works with the pmon_2e.bin for 
>>>>> fuloong2e
>>>>> which needs more fixes for Linux that are currently under review. 
>>>>> More
>>>>> testing is welcome.
>>>>>
>>>>> It still needs the Bonito BONITO_PCICONF_REG_MASK fix for fuloong2e
>>>>> because it no longer maps SMBus but due to the Bonito bug guest 
>>>>> cannot
>>>>> write register 0xd2 to map it. With that fix pmon_2e.bin from here:
>>>>> http://www.anheng.com.cn/loongson/pmon/ works for me with this
>>>>> command: qemu-system-mips64el -M fuloong2e -net none -bios 
>>>>> pmon_2e.bin
>>>>>
>>>>> After rolling this for two years now I hope it can finally be merged
>>>>> and eventually also get pegasos2 emulation that will need this.
>>>>>
>>>>> Regards,
>>>>> BALATON Zoltan
>>>>>
>>>>> BALATON Zoltan (24):
>>>>>   vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
>>>>>   vt82c686: Remove unnecessary _DEVICE suffix from type macros
>>>>>   vt82c686b: Rename VT82C686B to VT82C686B_ISA
>>>>>   vt82c686: Remove vt82c686b_[am]c97_init() functions
>>>>>   vt82c686: Split off via-[am]c97 into separate file in hw/audio
>>>>>   audio/via-ac97: Simplify code and set user_creatable to false
>>>>>   vt82c686: Remove legacy vt82c686b_isa_init() function
>>>>>   vt82c686: Remove legacy vt82c686b_pm_init() function
>>>>>   vt82c686: Convert debug printf to trace points
>>>>>   vt82c686: Remove unneeded includes and defines
>>>>>   vt82c686: Use shorter name for local variable holding object state
>>>>>   vt82c686: Rename superio config related parts
>>>>
>>>> As the first half of this series is reviewed, I'm queuing it
>>>> (patches 1-12) via mips-next.
>>>
>>> Thanks, You may want to fix the single vt82c686b: in the above commit
>>> title that was a typo, just for consistency.
>>
>> Fixed (along with your git author email, instead of the list).
>
> Thanks, sorry for the email address, that's something that seems to 
> have changed last August without me doing anthing differently and I 
> still don't know if it's something with the list or my mail provider. 
> I've asked them both but I guess it's still holidays so haven't got an 
> answer yet.
>
>>> Will this pull include the
>>> Bonito BONITO_PCICONF_REG_MASK fix or some replacement for that? That
>>> would be needed to get the rest of this series starting with 15/24
>>> working. Up to that it's just clean up which should be OK.
>>
>> I checked the Bonito(32) ASIC and Bonito64 (FPGA) manuals, and
>> for (vendor_id = 0xdf53, device_id = 0x00d5) our implementation
>> is correct. I am waiting for further news from Jiaxun who asked
>> someone at Loongson for a manual of their Bonito variant.
>>
>> I expect a different PCI device_id, so we can add it with your
>> change.

Hi all,

Bonito 2E manual (Chinese) is available here:
https://github.com/loongson-community/docs/blob/master/2E/Godson_2E_NB_UM.pdf

It said when accessing PCICFG map, the address is continues, so
there is no need to mask out lowest 2 bit.

The actual command on PCI bus will be shifted by hardware as per PCI 
spec requirement,
but that is out of our scope, it is SysAD internal implementation.

As you may see, bonito64(malta version) driver in kernel does not shift 
regno as well.
https://elixir.bootlin.com/linux/latest/source/arch/mips/pci/ops-bonito64.c

So In my opinion the fix is fine.

Thanks.

- Jiaxun



>
> It's not my change, Jiaxun suggested it but fixes the problem with 
> accessing register at 0xd2 that's needed on fuloong2e to get SMBus 
> mapped after my series (patch 15 to be exact).
>
>>> I can repost
>>> the remaining patches rebased once it's merged in master or if you tell
>>> me which branch should I use.
>>
>> IMHO no need (at least not worthwhile until mips/next is merged).
>
> OK, I'll wait for that then before posting the remaining patches 
> again. If you can have a look at them anyway I can make any necessary 
> changes by then.
>
> Regards,
> BALATON Zoltan


