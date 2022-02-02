Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ABE4A7A85
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 22:33:11 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFNFW-0003sJ-Fj
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 16:33:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel@sholland.org>)
 id 1nFMvO-0007gj-PW; Wed, 02 Feb 2022 16:12:23 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:38549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel@sholland.org>)
 id 1nFMvK-0003im-Lw; Wed, 02 Feb 2022 16:12:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id F1ED25801A3;
 Wed,  2 Feb 2022 16:11:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 02 Feb 2022 16:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=x7W2grgQ49M3Bn
 qxizFgjkfMZCqQ5TAAlaLCeVyENng=; b=Vduk70lzqGVSkufzg7pYFlWBIf+GTB
 W+gHO6MXl3mzQ+Zak+CTr2Yf9ZVThs2/MnF6PjUqE95S+5xEDedFviFgEQCqtdtp
 Z7z5R7yNpXpIjcjOGV4dFd+xdWupmC/sZRMLZiH6ITT35O6gsxGhU+zD2ogVrOtF
 1BHiiYgiyxzXMQQaUIdH9FPvr0H6dcT1Ze92t19KQHm0tn5fw1jtcHjesPSCt39f
 a5By0KU/epM5f1qTmecGumrlr2qZoiQg1xPQulrZx6lNfKdbKWgFXOk7FtTAqe91
 J+xnZOLOst5wjFp5qTzYGnBt0gOtX/1cbcLAeFsV1OGINE5UBlepFe5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=x7W2grgQ49M3BnqxizFgjkfMZCqQ5TAAlaLCeVyEN
 ng=; b=SWQIci1pieqy1qKJESB/no1jr1SpSIYVryyKVPoSHtp+V4CFFSIf0FkEn
 TKG9dBcxdPoILwlL/8G6Q/D7OWrg1TBLnAH4+W/uxkRfs9rw+UnWWXNTij7+HfCL
 nQEE7mVA7o+uq1AdcY4JHVZITV3cqqvtffSpZNgL22GhvU0CpCeOuQKAPD1f3car
 XNiBtfmq86sQzXHVscynBwC/leIUpkyfzf0e/VThQUm5WkbQfNYqI28uP3xAgCtQ
 UauxrEOgyV2XhH47PjNOj0pRB+lpqldCuB+t5Li0kRsmuNXI78f8Z0Gy0JOTpLPz
 LALAmpQ2Lx4KRUVsgXAhrw8byrctg==
X-ME-Sender: <xms:kvP6YSCy060YBm73KblEGiXIwEIschSu9BTVIoFmzeGp3Qv5IUEGCA>
 <xme:kvP6YcizoXIMKCAFsNuRMLszhLFBROE-CTIjrGdhZYMoFOsSLG1PAa9EZGftS55uZ
 nv7BLxFxDRXOaBsZw>
X-ME-Received: <xmr:kvP6YVmUHzqIQwdU0pAcSO4aywuS3x_Dh5UplW3wvQwrYA9caH1Q8RqEwENHMqUhN6BBgQj1roiUKalnFRhQned5Lr-Hkgc1eMWt8sNdRcFimIAHee9q1OBdWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddugeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepteetffejfefhgedtudeluddtgeduffeludeufedtvdelgfeiffev
 fefhudekgedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:kvP6YQyMqVNoP66O49dM-aP7ML2SnlN9B3HWZuvh6H_MTjlYUFmauA>
 <xmx:kvP6YXQtV7IjO7U0NV9g4W42--_4LX7x8myhXSoiIf2sXTyDnlKHjQ>
 <xmx:kvP6YbYuy0FSkA8UiAQAvhDj0hISbav6QdFTzNKt6XlKTY9S1h8iKg>
 <xmx:lPP6YYT_cQ_nNYbtbPeQP_lCain2eY-YJlbeVkm88f2OEVZtNKpMnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 16:11:45 -0500 (EST)
Subject: Re: [PATCH 05/16] hw/arm: allwinner: Don't enable PSCI conduit when
 booting guest in EL3
To: Andre Przywara <andre.przywara@arm.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-6-peter.maydell@linaro.org>
 <CAPan3WrPgyTqzgcP5Bc6zdvmqrQ7mN3xjowzo+Qo-UHH5miH0g@mail.gmail.com>
 <20220131105237.61439421@donnerap.cambridge.arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <4a18b224-7ccb-2d89-ed2b-85f177f17ec1@sholland.org>
Date: Wed, 2 Feb 2022 15:11:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220131105237.61439421@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=samuel@sholland.org;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 02 Feb 2022 16:28:56 -0500
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>,
 Rob Herring <robh@kernel.org>, Beniamino Galvani <b.galvani@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 4:52 AM, Andre Przywara wrote:
> On Sun, 30 Jan 2022 23:35:37 +0100
> Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>> On Thu, Jan 27, 2022 at 4:46 PM Peter Maydell <peter.maydell@linaro.org>
>> wrote:
>>> If anybody knows for definite that the secondaries should be
>>> powered-down at startup for guest firmware, we can delete the TODO.
>>
>> Looking at the Allwinner H3 datasheet in 4.4.3.7 page 146, it says that
>> for the CPU1 Status Register the default value indicates at least that its
>> not in a
>> wait for interrupt standby mode. And if I look in U-Boot's
>> arm/arm/cpu/armv7/sunxi/psci.c code
>> in the psci_cpu_on implementation, there is an explicit 'power on' part
>> there, suggesting the secondary CPUs
>> are by default off. So while I don't have any hard proof, these findings
>> suggest we are modeling the correct behavior
>> with secondary CPUs by default off.
> 
> So when it comes to firmware, indeed the secondaries seem to be off when
> the first user provided code (boot0/SPL) is entered. However there is an
> MPIDR read in the BROM, with the corresponding "branch if not primary
> core". I think this is because the BROM is mapped at the reset vector, so
> upon SMP firmware releasing the reset line it always starts in ROM, then
> gets diverted to the actual entry point.

Yes, I believe this is an accurate explanation.

> Maybe Samuel can confirm that the secondary cores are power gated when the
> SoCs comes out of reset?

The secondary cores are powered up but held in reset, as described in the
datasheet (sections 4.4.3.5/8/11 "CPU1/2/3 Reset Register"). The boot ROM does
not touch any of the CPU Configuration registers, so they hold their default
values into U-Boot execution. Looking at the registers from the U-Boot shell
confirms the datasheet:

=> md.l 1f01500 20
01f01500: 00000000 00000000 00000000 00000000  ................
                 ^ output gating[0] is disabled for all CPUs
01f01510: 00000000 00000000 00000000 00000000  ................
01f01520: 00000001 00000000 00000000 00000000  ................
01f01530: 00000000 00000000 00000000 00000000  ................
01f01540: 00000000 00000000 00000000 00000000  ................
                ^^       ^^       ^^       ^^
                power switches[1] are enabled for all CPUs
01f01550: 00000000 00000000 00000000 00000000  ................
01f01560: 00000000 00000000 00000000 00000000  ................
01f01570: 00000000 00000000 00000000 00000000  ................

=> md.l 1f01c40 40
01f01c40: 00000003 00000000 00000001 00000000  ................
                 ^ nCPUPORESET and nCORERESET deasserted
01f01c50: 00000000 00000000 00000000 00000000  ................
01f01c60: 00000000 00000000 00000000 00000000  ................
01f01c70: 00000000 00000000 00000000 00000000  ................
01f01c80: 00000001 00000000 00000000 00000000  ................
                 ^ nCPUPORESET deasserted; nCORERESET asserted
01f01c90: 00000000 00000000 00000000 00000000  ................
01f01ca0: 00000000 00000000 00000000 00000000  ................
01f01cb0: 00000000 00000000 00000000 00000000  ................
01f01cc0: 00000001 00000000 00000000 00000000  ................
                 ^ nCPUPORESET deasserted; nCORERESET asserted
01f01cd0: 00000000 00000000 00000000 00000000  ................
01f01ce0: 00000000 00000000 00000000 00000000  ................
01f01cf0: 00000000 00000000 00000000 00000000  ................
01f01d00: 00000001 00000000 00000000 00000000  ................
                 ^ nCPUPORESET deasserted; nCORERESET asserted
01f01d10: 00000000 00000000 00000000 00000000  ................
01f01d20: 00000000 00000000 00000000 00000000  ................
01f01d30: 00000000 00000000 00000000 00000000  ................

Since these CPU configuration registers are in the "CPUS" (ARISC) power domain,
it is not possible to reset them to their defaults using software. However, on
64-bit SoCs the CPUCFG registers are in the "CPU_SUBSYS" (ARM) power domain, and
they can be fully reset by toggling CPU_SYS_RESET[2][3]. Using A64 as an
example, the default value for the Cluster Reset Control Register 0x11101101,
which also matches the manual (section 3.4.5.8). Again, this has core 0 reset
deasserted and the remaining core resets asserted. So far, this behavior has
been consistent across every Allwinner SoC I have worked with.

Regards,
Samuel

[0]:
https://github.com/crust-firmware/crust/blob/master/platform/h3/include/platform/prcm.h#L55
[1]:
https://github.com/crust-firmware/crust/blob/master/platform/h3/include/platform/prcm.h#L69
[2]:
https://github.com/crust-firmware/crust/blob/master/platform/a64/include/platform/cpucfg.h#L98
[3]:
https://github.com/crust-firmware/crust/blob/master/drivers/css/sun50i-a64-css.c#L24

