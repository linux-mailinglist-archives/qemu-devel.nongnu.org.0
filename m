Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E6E467769
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:28:51 +0100 (CET)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7gI-0004oP-Qi
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:28:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt7dC-00010F-S3
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:25:38 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:54437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt7d9-0007OI-QD
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:25:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E951FCFA387B;
 Fri,  3 Dec 2021 13:25:31 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 13:25:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00643a70902-f25b-46d2-b30e-3c3f371dce5a,
 530A9595C01F0F4EFEED26D362E2F82770F5CBE3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f29e3aba-a1d7-484d-2aa2-b676113c4f43@kaod.org>
Date: Fri, 3 Dec 2021 13:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
 <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
 <32012645-274e-9ee9-2d8a-a3d87c4a6bf5@csgroup.eu>
 <599e5aa0-d7a9-b89c-2da9-5e7c909a6064@kaod.org>
 <75b27dfe-cb8f-d40c-c1bd-79415264a87f@redhat.com>
 <CAFEAcA9OQ=nFaMXgFi22BSuchP35OUiTwteG_yxFSnLXFHNTbQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9OQ=nFaMXgFi22BSuchP35OUiTwteG_yxFSnLXFHNTbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 806f2efa-850f-475b-b1b9-554b514a8080
X-Ovh-Tracer-Id: 917326952710048620
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtjeeffedvvedtffevjeeitdejgeeiueejhfffkeffgeeghedvleffuedvjeeftdenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 LEROY Christophe <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 11:40, Peter Maydell wrote:
> On Fri, 3 Dec 2021 at 10:32, Thomas Huth <thuth@redhat.com> wrote:
>> I guess it's an accidential NULL pointer dereference somewhere in the u-boot
>> code ... which will be quite hard to track down when the first page of
>> memory is marked as writable... :-/
> 
> Attach a target-arch gdb to the QEMU gdbstub and put a watchpoint on
> address zero ? (Or if you suspect something inside QEMU is doing it
> then run QEMU under gdb and watchpoint the host memory location
> corresponding to guest address 0, but that's more painful.) Nothing
> in the pre-kernel part of the boot process will have set up paging,
> so the watchpointing should be pretty reliable.

That's the guy:

   https://gitlab.com/huth/u-boot/-/blob/taihu/arch/powerpc/cpu/ppc4xx/sdram.c#L199

There must be an error in how get_ram_size() restores the RAM values :

   https://gitlab.com/huth/u-boot/-/blob/taihu/common/memsize.c

C.

