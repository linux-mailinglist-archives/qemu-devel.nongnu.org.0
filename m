Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04756D7B1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 10:19:40 +0200 (CEST)
Received: from localhost ([::1]:38858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAodn-0005tL-1h
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 04:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oAoYb-0000xl-Gr
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:14:17 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oAoYW-0001y4-M6
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:14:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9D34326E63;
 Mon, 11 Jul 2022 08:14:08 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 11 Jul
 2022 10:14:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0012d5bb2cf-29b7-4301-a400-05aea7395715,
 B4A626E929F7F6A388BA3F96B07B1F4CEE71A9BF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <c893d821-381f-06ea-3aa8-e6354ea3f95d@kaod.org>
Date: Mon, 11 Jul 2022 10:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org> <YscdtXYL5sJRSm6Z@pdel-mbp>
 <YscuKtVuZojYtqXo@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YscuKtVuZojYtqXo@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: dfd50cae-17b8-4a8b-a638-59f29c702d66
X-Ovh-Tracer-Id: 15839159891890309926
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/7/22 21:04, Peter Delevoryas wrote:
> On Thu, Jul 07, 2022 at 10:53:57AM -0700, Peter Delevoryas wrote:
>> On Thu, Jul 07, 2022 at 10:56:02AM +0200, Cédric Le Goater wrote:
>>> On 7/7/22 09:17, Peter Delevoryas wrote:
>>>> It seems that aspeed_gpio_update is allowing the value for input pins to be
>>>> modified through register writes and QOM property modification.
>>>>
>>>> The QOM property modification is fine, but modifying the value through
>>>> register writes from the guest OS seems wrong if the pin's direction is set
>>>> to input.
>>>>
>>>> The datasheet specifies that "0" bits in the direction register select input
>>>> mode, and "1" selects output mode.
>>>>
>>>> OpenBMC userspace code is accidentally writing 0's to the GPIO data
>>>> registers somewhere (or perhaps the driver is doing it through a reset or
>>>> something), and this is overwriting GPIO FRU information (board ID, slot
>>>> presence pins) that is initialized in Aspeed machine reset code (see
>>>> fby35_reset() in hw/arm/aspeed.c).
>>>
>>> It might be good to log a GUEST_ERROR in that case, when writing to an
>>> input GPIO and when reading from an output GPIO.
>>
>> Good idea, I'll include a GUEST_ERROR for writing to an input GPIO.
>>
>> I'm actually not totally certain about emitting an error when reading from an
>> output GPIO, because the driver can only do 8-bit reads at the finest
>> granularity, and if 1 of the 8 pins' direction is output, then it will be
>> reading the value of an output pin. But, that's not really bad, because
>> presumably the value will be ignored. Maybe I can go test this out on
>> hardware and figure out what happens though.
> 
> Did a small experiment, I was looking at some of the most significant
> bits:
> 
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x3CFF303E
> root@dhcp-100-96-192-133:~# devmem 0x1e780004
> 0x2800000C
> root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0xffffffff
> root@dhcp-100-96-192-133:~# devmem 0x1e780004
> 0x2800000C
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x3CFF303E
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x3CFF303E
> root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x14FF303A
> 
> Seems like the output pin 0x20000000 was initially high, and the input
> pin right next to it 0x10000000 was also high. After writing 0 to the
> data register, the value in the data register changed for the output
> pin, but not the input pin.  Which matches what we're planning on doing
> in the controller.
> 
> So yeah, I'll add GUEST_ERROR for writes to input pins but not output
> pins. The driver should probably be doing a read-modify-update.
> Although...if it's not, that technically wouldn't matter, behavior
> wise...maybe GUEST_ERROR isn't appropriate for writes to input pins
> either, for the same reason as I mentioned with reads of output pins.
> I'll let you guys comment on what you think we should do.

I am not an expert of the GPIO controller. Andrew may be ?

Anyhow, anything that can help tracking invalid software operations
is good to have and it seems that your patch is trying to fix one.
Hence my suggestion to add some logging where it makes sense.

Thanks,

C.

