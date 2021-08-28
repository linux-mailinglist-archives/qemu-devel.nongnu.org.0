Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1933FA53C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 13:07:47 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJwBZ-0004c1-2K
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 07:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mJwAO-0003kr-AS; Sat, 28 Aug 2021 07:06:28 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:41225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mJwAL-0007qK-S0; Sat, 28 Aug 2021 07:06:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 921F0200AD;
 Sat, 28 Aug 2021 11:06:21 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 28 Aug
 2021 13:06:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003fe7dd30e-bef9-4ab9-ac33-8937de540edf,
 6CE952B1E590FC391734534FA2C2FCCDA042449D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
To: Mark Kettenis <mark.kettenis@xs4all.nl>
References: <7r8MLHEKQicVkfT4tQLsiRXQmt_800XbV1s0mM_QJTgOY7XadpiRcD4HizmXByPaZRsMQV2WbNKDfKU-PdVo3ZO9JC6fJ0MF5LM_j5a2fgA=@protonmail.com>
 <20210827170113.5f4ed260@bahia.lan>
 <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
Date: Sat, 28 Aug 2021 13:06:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f6390f59-a226-4ce9-9a03-6de76ce7d392
X-Ovh-Tracer-Id: 1778077430714371003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudduhedgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeelkeekgfefudehueetjeffheevfeegteegveekffduvdejleefueeugeehvdeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohhpvghnsghsugdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.437,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pjp@centroid.eu, QEMU Developers <qemu-devel@nongnu.org>, gardask@gmail.com,
 rgcinjp@disroot.org, daniel@pocock.pro, groug@kaod.org, ppc@openbsd.org,
 kite@centroid.eu, joseph.mayer@protonmail.com, siliconbadger@protonmail.com,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ ... ] 

> OpenBSD probably uses XIVE in a different way than Linux though.
If it is running under the skiboot firmware (Like on the Talos 
system), it is necessarily using an OPAL interface, either the 
P8 legacy interface (on top of XIVE HW) or the XIVE native 
interface.     

  https://github.com/open-power/skiboot/blob/master/doc/opal-api/index.rst
  https://github.com/open-power/skiboot/blob/master/doc/xive.rst


[ ... ]

> qemu-system-ppc64 -M powernv9 -cpu power9 -m 2G -smp 1 \
>                   -serial mon:stdio \
>                   -device ich9-ahci,id=ahci0,bus=pcie.0 \
>                   -device qemu-xhci,id=usb0,bus=pcie.2 \
>                   -bios /usr/local/share/qemu/skiboot.lid \
>                   -kernel ./pnor.BOOTKERNEL \
>                   -drive id=disk,file=miniroot70.img,if=none \
>                   -device ide-hd,bus=ahci0.0,drive=disk \
>                   -drive id=disk1,file=power.img,if=none \
>                   -device ide-hd,bus=ahci0.1,drive=disk1 \
>                   -device e1000e,bus=pcie.1
> 
> miniroot70.img is the OpenBSD installer image that can be found at:
> 
>   http://cdn.openbsd.org/pub/OpenBSD/snapshots/powerpc64/miniroot70.img
> 
> power.img is the disk image to install on; you can probably leave that out.
> 
> Not sure where I got pnor.BOOTKERNEL from anymore.

That's the file we would be interested in. I suppose this is the same 
image used to boot the Talos ? 

> This command boots into the installer, but hangs at the "Welcome to
> the OpenBSD installer" message.  It is supposed to print a prompt
> after that, but that never happens.

It shouldn't be too hard to debug with all the FW images.  

[ ... ]

>> I thought the BSD folks were working on POWER9 baremetal support,
>> PowerNV platform, on top of OPAL/skiboot. Is that completed ?
> 
> Yup. OpenBSD boots fine on the Raptor Talos/Blackbird machines that we have.

Great ! Where can we get the kernel/rootfs images loaded by skiboot ?  
That would make a good acceptance test for the QEMU PowerNV machines.

Thanks,

C.
 


