Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B589D55BF58
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:11:46 +0200 (CEST)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66K0-0004kl-MM
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Ho-0006ig-7O
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:05:24 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Hl-0000WT-BO
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:05:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4C1DE22577;
 Tue, 28 Jun 2022 07:05:18 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 09:05:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003c47ffef7-0d01-4edc-a329-dcd2127ab6c5,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <94b12c69-cee0-192e-fe9c-19b9d85ae6b4@kaod.org>
Date: Tue, 28 Jun 2022 09:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 00/14] aspeed: Add I2C new register DMA slave mode support
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <zhdaniel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <komlodi@google.com>, <titusr@google.com>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20220627195506.403715-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fed8ab87-c33f-4631-9d19-9ccb960d8278
X-Ovh-Tracer-Id: 12118623647776541548
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/27/22 21:54, Peter Delevoryas wrote:
> Hey everyone,
> 
> I'm sending a big patch series for this, but only the last commit is really
> intended to be accepted right now. I'm just including the rest of them
> because it depends on them for testing.
> 
> Klaus's changes include the multi-master stuff in hw/i2c/core.c, and the old
> register mode slave mode support.
> 
> My series of patches includes a bunch of changes to eliminate most (if not
> all) of the I2C errors reported by the fb OpenBIC firmware for fby35
> CraterLake Bridge Interconnect (BIC) (shortname: oby35-cl) upon startup.
> 
> In particular, I needed to add the IC_DEVICE_ID to the isl voltage regulator
> implementation, which required a fix to the pmbus implementation when
> switching pages. We weren't resetting the buffer state when switching
> pages there.
> 
> I also added a placeholder implementation of the PECI controller, that does
> almost nothing, but doesn't produce errors.
> 
> I added the fby35-cpld, which oby35-cl queries using master-mode TX and RX
> commands.
> 
> And finally, I added an "intel-me" device (Intel Management Engine) that
> attempts to respond to the first IPMB message sent by the BIC. I used this
> to test the final patch, which I actually want to merge, the I2C new
> register DMA slave mode support.
> 
> All the patches except the last one can be ignored for now if you want,
> again, I just included them for testing purposes.
> 
> The final patch is pretty rough, but I wanted to start the review instead of
> waiting too long. I expect the interrupt handling part will be
> the main blocker.
> 
> Thanks,
> Peter
> 
> Klaus Jensen (3):
>    hw/i2c: support multiple masters
>    hw/i2c: add asynchronous send
>    hw/i2c/aspeed: add slave device in old register mode
> 
> Peter Delevoryas (11):
>    aspeed: i2c: Fix DMA len write-enable bit handling
>    aspeed: i2c: Fix R_I2CD_FUN_CTRL reference
>    aspeed: i2c: Fix MASTER_EN missing error message


I  didn't receive this patch ?

C.


>    aspeed: Add PECI controller
>    hw/misc: Add fby35-cpld
>    pmbus: Reset out buf after switching pages
>    pmbus: Add read-only IC_DEVICE_ID support
>    aspeed: Add oby35-cl machine
>    hw/misc: Add intel-me
>    aspeed: Add intel-me on i2c6 instead of BMC
>    aspeed: Add I2C new register DMA slave mode support
> 
>   hw/arm/aspeed.c                  |  42 ++++++
>   hw/arm/aspeed_ast10x0.c          |  11 ++
>   hw/arm/pxa2xx.c                  |   2 +
>   hw/display/sii9022.c             |   2 +
>   hw/display/ssd0303.c             |   2 +
>   hw/i2c/aspeed_i2c.c              | 234 +++++++++++++++++++++++++++----
>   hw/i2c/core.c                    |  70 ++++++++-
>   hw/i2c/pmbus_device.c            |   6 +
>   hw/i2c/smbus_slave.c             |   4 +
>   hw/i2c/trace-events              |   2 +
>   hw/misc/aspeed_peci.c            | 225 +++++++++++++++++++++++++++++
>   hw/misc/fby35_cpld.c             | 137 ++++++++++++++++++
>   hw/misc/intel_me.c               | 176 +++++++++++++++++++++++
>   hw/misc/meson.build              |   5 +-
>   hw/nvram/eeprom_at24c.c          |   2 +
>   hw/sensor/isl_pmbus_vr.c         |  30 ++++
>   hw/sensor/lsm303dlhc_mag.c       |   2 +
>   include/hw/arm/aspeed_soc.h      |   3 +
>   include/hw/i2c/aspeed_i2c.h      |  11 ++
>   include/hw/i2c/i2c.h             |  30 ++++
>   include/hw/i2c/pmbus_device.h    |   1 +
>   include/hw/misc/aspeed_peci.h    |  34 +++++
>   include/hw/sensor/isl_pmbus_vr.h |   1 +
>   23 files changed, 1002 insertions(+), 30 deletions(-)
>   create mode 100644 hw/misc/aspeed_peci.c
>   create mode 100644 hw/misc/fby35_cpld.c
>   create mode 100644 hw/misc/intel_me.c
>   create mode 100644 include/hw/misc/aspeed_peci.h
> 


