Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB43FFD95
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:55:36 +0200 (CEST)
Received: from localhost ([::1]:41684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5v5-00050n-8h
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mM5u3-00047v-5R
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:54:31 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:40255
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mM5ty-0005gE-3E
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:54:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id EFAC313FB3C;
 Fri,  3 Sep 2021 09:54:21 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 11:54:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0038e25f25f-7c1f-4452-8104-f8dcf1ff71f5,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 0/1] hw/arm/aspeed: Add Fuji machine type
To: <pdel@fb.com>
References: <20210903082027.704397-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f380c5b5-a472-d41e-7821-4155113bdbc0@kaod.org>
Date: Fri, 3 Sep 2021 11:54:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903082027.704397-1-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b27a03e1-99de-43e4-add6-9292f5df6288
X-Ovh-Tracer-Id: 17351524940819434403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefggeehhfdtkefhteeghfeghefgudfhteevteeltefgffevhfeggeffhfevleelfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
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
Cc: patrick@stwcx.xyz, qemu-arm@nongnu.org, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 10:20 AM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> v2:
>   - Added supported i2c devices (lm75, tmp75, tmp422, 24c64, 24c02)
>   - Switched flash model to mx66l1g45g (128MB)
>   - Completely separated fuji class definition from ast2600-evb
>   - Removed image acceptance test
> 
> Link: https://github.com/peterdelevoryas/qemu/tree/aspeed-next
> 
> I investigated the boot issues pointed out in the previous submission a
> little, let me know if any of these are blockers for this patch:
> 
>>> Is the Fuji using the Aspeed RTC ?
>>>
>>> hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument
> 
> I don't understand exactly what's going on here, but running "hwclock --get"
> and "hwclock --set --date 2021-01-01" both seem to work fine after booting,
> so I think the Aspeed RTC is setup correctly and working. As far as I know
> Fuji uses it, but I'm not really sure.

QEMU doesn't model the SoC RTC. Something to add on the TODO list.

>>>
>>> That's a weird MMIO range for the ADC ?
>>>
>>> [   42.856022] aspeed_adc: probe of 1e6e9100.adc failed with error -110
> 
> I think there's 2 ADC's in the DTS, one at 1e6e9000 and one at 1e6e9100, but
> I don't see explicit support for the Aspeed ADC in hw/adc/, and I'm not sure
> that any of the existing emulators would work.

The ADC model is not merged yet. It's aging in the aspeed-6.2 branch. 
 
The Ast2600 has indeed 2 ADCs. We missed that in QEMU.

>>>
>>> And that's unexected :
>>>
>>> Error: unable to disable the 2nd watchdog: FMC_WDT2=0xFFFFFFFF
> 
> So, this is an OpenBMC script trying to disable the alternate boot watchdog
> by writing 0x0 to 0x1e620064 (Aspeed SMC 0x64). It checks the register after
> attempting to write it and prints this error message if the lowest bit is
> not cleared. Since the Aspeed SMC is not simulating this register, I don't
> think aspeed_smc_write() does anything, and aspeed_smc_read() returns -1. I
> also testetd changing -1 to 0xdeadbeef locally to confirm.

I see. QEMU is also missing support. 

> https://github.com/facebook/openbmc/blob/helium/common/recipes-utils/openbmc-utils/files/aspeed-g6/disable_watchdog.sh
> 
> Let me know if there's anything else I should look into. I'm still planning
> on submitting an image acceptance test for this too, but as a separate
> patch.

yes. 

> I've also included a boot log at the end of this cover letter for
> reference.

Thanks

C. 

 
> Thanks,
> Peter
> 
> Peter Delevoryas (1):
>   hw/arm/aspeed: Add Fuji machine type
> 
>  hw/arm/aspeed.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 


