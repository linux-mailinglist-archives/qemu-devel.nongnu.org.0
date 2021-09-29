Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9641BF1D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 08:27:10 +0200 (CEST)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVT3d-00076j-NF
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 02:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mVT1L-0005T4-83; Wed, 29 Sep 2021 02:24:48 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:41311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mVT1G-00021V-Rg; Wed, 29 Sep 2021 02:24:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 128C4204CC;
 Wed, 29 Sep 2021 06:24:39 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 29 Sep
 2021 08:24:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003bb6d52d2-36cc-4483-be76-720774a8a298,
 44937510F21C5BE293C6940AFAD8BDBE61667EBD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <85fb7136-c7b3-8144-d79f-19b5e95e83cb@kaod.org>
Date: Wed, 29 Sep 2021 08:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC 0/1] hw/ipmi: add an aspeed IPMI iBT device model
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>
References: <20210928223942.244860-1-titusr@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210928223942.244860-1-titusr@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c3fa26d2-c8df-4621-8c56-90f90be30d37
X-Ovh-Tracer-Id: 479070410788014953
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekuddguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevgedtveeitdeuvedtgfefhfefveeiieegjeeujeekvdevueethfdujeekffehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhoiihlrggsshdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
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
Cc: minyard@acm.org, andrew@aj.id.au, qemu-devel@nongnu.org, f4bug@amsat.org,
 wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Titus,

On 9/29/21 00:39, Titus Rwantare wrote:
> This patch follows the Handing IPMI for emulating BMC patch set by Hao Wu.
> Building on top of the work in [PATCH] hw/misc: Add an iBT device model posted
> by Cédric Le Goater, this iBT model works as a backend to ipmi-host-extern.

Could you please resend with my patch which is still available here :

  https://github.com/legoater/qemu/commit/c6b679690f32534e8992d96752d90d2c4aa48130

or here :

  http://patchwork.ozlabs.org/project/qemu-devel/patch/20210407171637.777743-20-clg@kaod.org/

and in another patch, the modifications you made on top of mine. That
will help understand where the problem could be.

You can modify patches but you need to keep the original author name,
commit log, signed-off-by to certify its origin. Then list the changes
you have made and add your signed-off-by.

The patch you sent seems to be mostly mine and I don't see any of the
above.

Here is some more info in the kernel documentation :

   https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

I don't think we have the same kind of documentation in QEMU but it's
the same process.

> Needed to run:
> - [PATCH 4/8] hw/ipmi: Refactor IPMI interface, Hao Wu
> - [PATCH 5/8] hw/ipmi: Take out common from ipmi_bmc_extern.c, Hao Wu
> - [PATCH 6/8] hw/ipmi: Move handle_command to IPMICoreClass, Hao Wu
> - [PATCH 7/8] hw/ipmi: Add an IPMI external host device, Hao Wu

I have no idea what these patches do and where they are. They seem to
modify the core IPMI framework and it is important to understand the
overall changes. Please include them in the patchset first since they
are initial requirements.

> Host commandline
>      -chardev socket,id=ipmichr1,host=localhost,port=9999,reconnect=10 \
>      -device ipmi-bmc-extern,chardev=ipmichr1,id=bmc0 \
>      -device isa-ipmi-bt,bmc=bmc0,irq=10 -nodefaults
> 
> BMC commandline
>      -chardev socket,id=ipmichr1,host=localhost,port=9999,server=on,wait=off \
>      -device "ipmi-host-extern,chardev=ipmichr1,responder=/machine/soc/ibt"

Could we have the full command lines also ?


> Currently, IRQs are not functional, but it is able to connect.
> The following printout is from the host:
> 
> [    6.869742] ipmi_si IPI0001:00: IPMI message handler: Found new BMC (man_id:
>   0x002b79, prod_id: 0x0000, dev_id: 0x00)
> [   12.393281] ipmi_si IPI0001:00: IPMI bt interface initialized
> 
> This patch is an RFC because of the missing IRQs and the need for other patches
> to get merged.

We will need the whole project to start reviewing.

Thanks,

C.

> 
> Thank you all.
> 
> Titus Rwantare (1):
>    hw/ipmi: add an aspeed ipmi iBT device model
> 
>   hw/ipmi/ipmi_extern.h        |   1 +
>   include/hw/arm/aspeed_soc.h  |   2 +
>   include/hw/ipmi/aspeed_ibt.h |  77 +++++++++
>   hw/arm/aspeed_ast2600.c      |  12 ++
>   hw/arm/aspeed_soc.c          |  12 ++
>   hw/ipmi/aspeed_ibt.c         | 311 +++++++++++++++++++++++++++++++++++
>   hw/ipmi/meson.build          |   1 +
>   hw/ipmi/trace-events         |   7 +
>   8 files changed, 423 insertions(+)
>   create mode 100644 include/hw/ipmi/aspeed_ibt.h
>   create mode 100644 hw/ipmi/aspeed_ibt.c
> 


