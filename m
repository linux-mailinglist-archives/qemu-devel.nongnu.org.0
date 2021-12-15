Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AE6475E09
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:59:00 +0100 (CET)
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXcJ-0002pm-95
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXTf-0005H1-QP; Wed, 15 Dec 2021 11:50:05 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:42361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXTd-00024y-JE; Wed, 15 Dec 2021 11:50:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 269F0D225B62;
 Wed, 15 Dec 2021 17:50:00 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:49:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005249d325f-0e7b-4085-9b99-948d3b8841f3,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <880aa46a-97cb-ad79-b72e-f8276692d750@kaod.org>
Date: Wed, 15 Dec 2021 17:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/15] ppc/ppc405: decade cleanup
Content-Language: en-US
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20211206103712.1866296-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1e583416-7941-422f-8295-054bbf43d36a
X-Ovh-Tracer-Id: 2069404028859878249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:36, Cédric Le Goater wrote:
> Hello,
> 
> The goal of these changes is to refresh the QEMU ref405ep machine and
> enable boot from a Linux kernel without relying on a U-Boot firmware.
> The reason for doing so is that we are unable to find a "ppc405_rom.bin"
> firmware image or a flash image for the 405EP machines.
> 
> Thomas fought is way through on a v2015.10 U-Boot and taihu defconfig
> and provided a compatible image available here :
> 
>   https://gitlab.com/huth/u-boot/-/tree/taihu/
> 
> With this image, QEMU reaches the U-Boot prompt (with a simple
> workaround in the SDRAM).
> 
> On the Linux side, the only available 405EP CPU board is the one for
> the ESTeem 195E (PPC405EP) SBC (hotfoot). It was added in 2009. The
> board information structure in Linux, in U-Boot and in QEMU are not in
> sync and the hotfoot board also adds its own flavor because the FW was
> an ancient U-Boot without dual ethernet support [1].
> 
> For this kernel to be loaded by the U-Boot image provided by Thomas,
> we either need to modify U-Boot or Linux. The same question arise for
> QEMU, see the last patch of this series which is controversial. Please
> advise !

Applied patch 1-14 to ppc-next.

I kept the hotfoot hack for later. We need to fix user space first.

Thanks,

C.

