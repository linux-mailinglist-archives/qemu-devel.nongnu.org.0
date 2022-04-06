Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8584F5AB3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 12:39:08 +0200 (CEST)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc348-0000xd-10
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 06:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc328-0007ze-0l
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:37:04 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:51711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc326-00067r-1D
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:37:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C9874F3AFA18;
 Wed,  6 Apr 2022 12:36:58 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 12:36:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00126eb826a-30e5-4942-9431-331360b6e48e,
 ACAFAA60954BC139C96B6B3855CBF7BDA7777862) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a6b3745a-403d-1bf8-ea75-23130f00dd5f@kaod.org>
Date: Wed, 6 Apr 2022 12:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/7] aspeed: i2c: Add new mode support
Content-Language: en-US
To: Joe Komlodi <komlodi@google.com>, <qemu-devel@nongnu.org>
References: <20220331043248.2237838-1-komlodi@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331043248.2237838-1-komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 619f2f9a-9101-4ec4-9890-4a80d7707b92
X-Ovh-Tracer-Id: 7875106901861042982
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeehffehleffiefgfefhteejuddvjeekjeeivdeiheduledthfelhffhgeettdeknecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepvhgvnhhtuhhrvgesghhoohhglhgvrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, joel@jms.id.au,
 venture@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Joe,

On 3/31/22 06:32, Joe Komlodi wrote:
> Hi all,
> 
> This series migrates the Aspeed I2C controller to use the register API,

I like the idea but it's an earthquake in the I2C model and they are other
patchsets on the way. Let's wait a bit before changing it all.

> and then adds new mode support.
>
> New mode has some behavior changes and a register layout change compared
> to old mode.

Troy sent a similar proposal. Did you have a look ?

   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=291804

Thanks,

C.


> The series starts by adding "shared field" macros to help simplify logic
> when adding new mode.
> Generally, the macros are to be used in cases where register locations
> change depending on what mode a peripheral is operating in, but
> the fields in those registers have the same offsets.
> Specifically, this happens very frequently with new and old I2C modes on
> Aspeed I2C.
> 
> After that we migrate over to the register API and then add new mode
> support.
> 
> Thanks!
> Joe
> 
> Joe Komlodi (7):
>    hw/registerfields: Add shared fields macros
>    aspeed: i2c: Add ctrl_global_rsvd property
>    aspeed: i2c: Migrate to registerfields API
>    aspeed: i2c: Use reg array instead of individual vars
>    aspeed: i2c: Add new mode support
>    aspeed: i2c: Add PKT_DONE IRQ to trace
>    aspeed: i2c: Move regs and helpers to header file
> 
>   hw/arm/aspeed_ast2600.c     |   2 +
>   hw/i2c/aspeed_i2c.c         | 792 ++++++++++++++++++++++--------------
>   hw/i2c/trace-events         |   2 +-
>   include/hw/i2c/aspeed_i2c.h | 282 ++++++++++++-
>   include/hw/registerfields.h |  70 ++++
>   5 files changed, 828 insertions(+), 320 deletions(-)
> 


