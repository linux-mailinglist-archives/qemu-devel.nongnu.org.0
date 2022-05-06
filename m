Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FB51D174
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 08:34:47 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmrY5-0008HP-RR
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 02:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nmrTk-0007Dr-Mr
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:30:17 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:48481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nmrTi-0000bf-BL
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:30:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A98E621D0C;
 Fri,  6 May 2022 06:30:10 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 6 May 2022
 08:30:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a661c56a-4da7-4bb7-bb46-6bded6cdaa71,
 85FEA43FB7D152D5FE87D0D31D0EEF45A371AE19) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <97674ac7-17c5-06cf-6bd0-0e7acc37abcc@kaod.org>
Date: Fri, 6 May 2022 08:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter
 Maydell <peter.maydell@linaro.org>, Klaus Jensen <its@irrelevant.dk>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
 <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a99988e5-e2cf-4127-9b12-839ce753a2b7
X-Ovh-Tracer-Id: 13867146206085155622
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhtedtkeegheetfeetfeefkeeltedtieeggfehjeejfeethfeuveeijedtgefgjeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsvghtuhhpqdguvghvrdhshhdprhgvrgguthhhvgguohgtshdrihhopdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehithhssehirhhrvghlvghvrghnthdrughk
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/4/22 18:34, Peter Delevoryas wrote:
> 
>> On May 4, 2022, at 12:39 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> ﻿On 5/4/22 00:59, Peter Delevoryas wrote:
>>> Add the 'fby35-bmc' machine type based on the kernel DTS[1] and userspace
>>> i2c setup scripts[2]. Undefined values are inherited from the AST2600-EVB.
>>> Reference images can be found in Facebook OpenBMC Github Release assets
>>> as "fby35.mtd". [3]
>>> You can boot the reference images as follows (fby35 uses dual-flash):
>>> qemu-system-arm -machine fby35-bmc \
>>>      -drive file=fby35.mtd,format=raw,if=mtd \
>>>      -drive file=fby35.mtd,format=raw,if=mtd \
>>>      -nographic
>>> [1] https://github.com/facebook/openbmc-linux/blob/412d5053258007117e94b1e36015aefc1301474b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
>>> [2] https://github.com/facebook/openbmc/blob/e2294ff5d31dd65c248fe396a385286d6d5c463d/meta-facebook/meta-fby35/recipes-fby35/plat-utils/files/setup-dev.sh
>>> [3] https://github.com/facebook/openbmc/releases
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks!

Could you please send a v2 with an update of the documentation ?
or a follow up ? no need to resend the first patch unless you
want to change something. A one-liner in :

   https://qemu.readthedocs.io/en/latest/system/arm/aspeed.html

[ ... ]

> As a matter of fact yes! I tested booting our OpenBIC Zephyr kernel last week with the 1030, that worked. I also used the experimental i2c multi-master patches from Klaus to make a i2c-netdev device that connects two separate QEMU instances through a socket and sends their i2c messages back and forth. I was able to test a basic MCTP transaction.

Nice ! And do you need anything special from the I2C Aspeed models ?
Apart from :

  https://patchwork.ozlabs.org/project/qemu-devel/list/?series=292928

> I’m hoping to help however possible with merging Klaus’s changes, 

They don't need much work. Klaus doesn't have the datasheet, so we
should help him with the changes requiring some internal knowledge.

> and then propose the i2c-netdev thing too.

I was going to ask since I didn't see any models for such devices.

I hope to do something similar with the usb-net device but it needs
fixes first.

Thanks,

C.

