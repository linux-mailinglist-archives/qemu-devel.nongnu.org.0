Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0D54201D6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 15:58:00 +0200 (CEST)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX207-0001qo-TH
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 09:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mX1yj-0000Vp-TU
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:56:33 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:58687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mX1yh-0007nt-8j
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:56:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C36D820D89;
 Sun,  3 Oct 2021 13:56:27 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sun, 3 Oct
 2021 15:56:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00476540788-92e9-4ce8-9a40-b4e7b7173965,
 56C86F9822E7E9F8B10CEC01D5C891B794C43A82) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.222.244
Message-ID: <f553afbb-f29f-6837-8815-334a77c8e7f8@kaod.org>
Date: Sun, 3 Oct 2021 15:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] hw/adc: Add basic Aspeed ADC model
Content-Language: en-US
To: <pdel@fb.com>
References: <20211002214414.2858382-1-pdel@fbc.om>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211002214414.2858382-1-pdel@fbc.om>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e0e7181a-b7b9-46c1-94e6-92183aaabc2f
X-Ovh-Tracer-Id: 13153607140591831855
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephefhgfeuteeuveffleeufedtffetiefhgeejudeufeetuddutdegffduhfegheefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopeiihhgurghnihgvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, alistair@alistair23.me,
 qemu-devel@nongnu.org, patrick@stwcx.xyz, qemu-arm@nongnu.org, joel@jms.id.au,
 Peter Delevoryas <pdel@fb.com>, zhdaniel@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 23:44, pdel@fbc.om wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> Following up from
> 
> https://lore.kernel.org/qemu-devel/20210930004235.1656003-1-pdel@fb.com/
> 
> This is a resubmission of Andrew Jeffery's ADC model, but with the
> registers converted from typed-member-fields to a regs[] array.
> Otherwise, it should be pretty much equivalent.

Thanks for taking over.

> 
> References to the original patches from Andrew:
> 
> https://github.com/legoater/qemu/commit/1eff7b1cf10d1777635f7d2cef8ecb441cc607c4
> https://github.com/legoater/qemu/commit/3052f9d8ccdaf78b753e53574b7e8cc2ee01429f
> 
> I did A/B "--trace aspeed_adc_engine_*" testing and the output from the
> boot sequence was equivalent, and I tested that the channel simulation
> code produces the same sequence of values.
> 
> Here's the initialization sequence:
> 
> aspeed_adc_engine_write engine[0] 0x0 0xf  ; Engine init
> aspeed_adc_engine_read engine[0] 0x0 0x10f ; bit 8 set
> aspeed_adc_engine_write engine[0] 0x0 0x2f ; Auto compensating sensing mode
> aspeed_adc_engine_read engine[0] 0x0 0x10f ; bit 8 set (redoing engine init, lol), bit 5 reset
> 
> Here's some of the channel simulation:
> 
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x00070005
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x000e000a
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x0015000f
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x001c0014
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x00230019
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x002a001e
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x00310023
> (qemu) xp 0x1e6e9010
> 000000001e6e9010: 0x00380028
> 
> This was tested with a Fuji OpenBMC image:
> 
> https://github.com/peterdelevoryas/openbmc/releases/download/fuji.mtd.0/fuji.mtd
> 
> My refactoring was kinda awkward, it took me a few tries to finally get
> something that made sense to me. In particular, I don't know if you guys
> realized this previously, but in the AST2600, there's 2 engines, but
> still only 16 channels: each engine only has half the registers, as far
> as I understand.

yes.

  
> That's why I added the "nr-channels" property to the engine. I also
> tried to add guest-error logs when a driver tries to read or write to
> the upper-eight channel registers in the 2600 engines. For example:
> 
> (qemu) xp 0x1e6e9000
> 000000001e6e9000: 0xffff010f
> (qemu) xp 0x1e6e9020
> aspeed_adc_engine_read: engine[0]: data register 4 invalid, only 0...3 valid
> 000000001e6e9020: 0x00000000
> (qemu) xp 0x1e6e9030
> 000000001e6e9030: 0x00000000
> (qemu) xp 0x1e6e9040
> 000000001e6e9040: 0x00000000
> (qemu) xp 0x1e6e9050
> aspeed_adc_engine_read: engine[0]: bounds register 8 invalid, only 0...7 valid
> 000000001e6e9050: 0x00000000
> (qemu) xp 0x1e6e9060
> aspeed_adc_engine_read: engine[0]: bounds register 12 invalid, only 0...7 valid
> 000000001e6e9060: 0x00000000
> (qemu) xp 0x1e6e9070
> 000000001e6e9070: 0x00000000
> (qemu) xp 0x1e6e9080
> 000000001e6e9080: 0x00000000
> (qemu) xp 0x1e6e9090
> aspeed_adc_engine_read: engine[0]: hysteresis register 8 invalid, only 0...7 valid
> 000000001e6e9090: 0x00000000
> (qemu) xp 0x1e6e90a0
> aspeed_adc_engine_read: engine[0]: hysteresis register 12 invalid, only 0...7 valid
> 000000001e6e90a0: 0x00000000

This looks nice.

> 
> It might turn out that we should just stick with a closer version of
> Andrew's original patch, and that would be totally fine with me, I just
> want to get the ADC support merged one way or another.


Do you have a test case we could include in qtest ? This is not a
requirement but it's always good to have.

Thanks,

C.

> Also, I'm interested in resubmitting Andrew's work on supporting
> unaligned accesses for models that only implement aligned access, to
> make supporting 8-bit and 16-bit reads transparent to this model, but
> I'll submit that separately.
>
> 
> Reference: https://lore.kernel.org/qemu-devel/20170630030058.28943-1-andrew@aj.id.au/
> 
> Thanks,
> Peter
> 
> Andrew Jeffery (2):
>    hw/adc: Add basic Aspeed ADC model
>    hw/arm: Integrate ADC model into Aspeed SoC
> 
>   hw/adc/aspeed_adc.c         | 416 ++++++++++++++++++++++++++++++++++++
>   hw/adc/meson.build          |   1 +
>   hw/adc/trace-events         |   3 +
>   hw/arm/aspeed_ast2600.c     |  11 +
>   hw/arm/aspeed_soc.c         |  11 +
>   include/hw/adc/aspeed_adc.h |  55 +++++
>   include/hw/arm/aspeed_soc.h |   2 +
>   7 files changed, 499 insertions(+)
>   create mode 100644 hw/adc/aspeed_adc.c
>   create mode 100644 include/hw/adc/aspeed_adc.h
> 


