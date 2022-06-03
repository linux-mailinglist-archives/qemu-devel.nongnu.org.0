Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0253C669
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:41:39 +0200 (CEST)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1wA-00034N-1U
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nx1PR-0003oI-0P
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 03:07:49 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nx1PN-0007xK-P6
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 03:07:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BD06A10714B9E;
 Fri,  3 Jun 2022 09:07:34 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 3 Jun 2022
 09:07:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002247641a2-916c-4550-968a-14e4aceb021e,
 2F375BC487B398842DD9155F09582B226C9A4747) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <79ba2e1a-569c-6583-6cfd-13389355bfa3@kaod.org>
Date: Fri, 3 Jun 2022 09:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Corey Minyard <cminyard@mvista.com>, Padmakar
 Kalghatgi <p.kalghatgi@samsung.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Arun Kumar Kashinath Agasar <arun.kka@samsung.com>, Klaus
 Jensen <k.jensen@samsung.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org> <YphzHGNYErSMEfPw@apples>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YphzHGNYErSMEfPw@apples>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fcea833a-06cf-4488-9e69-873d2eaa6ca6
X-Ovh-Tracer-Id: 12913508982122515387
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrleehgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffgefgkeevvedvvdffleefheelfffhhfetgeekudeuveffffekjeeiveffledthfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

>>> With this combined I am able to boot up Linux on an emulated Aspeed 2600
>>> evaluation board and have the i2c echo device write into a Linux slave
>>> EEPROM. Assuming the echo device is on address 0x42:
>>>
>>>     # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
>>>     i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
>>>     # i2cset -y 15 0x42 0x64 0x00 0xaa i
>>>     # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
>>>     0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>>>     0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>>>     *
>>>     0000100
>>
>> I have started working on buildroot images  :
>>
>>    https://github.com/legoater/buildroot/commits/aspeed
>>
>> The resulting files are quite small :
>>
>>      $ ll output/images/
>>      total 86040
>>      drwxr-xr-x 2 legoater legoater     4096 Jun  1 20:01 ./
>>      drwxrwxr-x 6 legoater legoater     4096 Jun  1 19:40 ../
>>      -rwxr-xr-x 1 legoater legoater    36837 Jun  1 20:01 aspeed-ast2600-evb.dtb*
>>      -rw-r--r-- 1 legoater legoater 67108864 Jun  1 20:01 flash.img
>>      -rw-r--r-- 1 legoater legoater  6682796 Jun  1 20:01 image.itb
>>      -rw-r--r-- 1 legoater legoater     1846 Jun  1 20:01 image.its
>>      -rw-r--r-- 1 legoater legoater  3168768 Jun  1 20:01 rootfs.cpio
>>      -rw-r--r-- 1 legoater legoater  1026660 Jun  1 20:01 rootfs.cpio.xz
>>      -rw-r--r-- 1 legoater legoater  3788800 Jun  1 20:01 rootfs.tar
>>      -rw-r--r-- 1 legoater legoater   653777 Jun  1 20:00 u-boot.bin
>>      -rw-r--r-- 1 legoater legoater  5617280 Jun  1 20:01 zImage
>>
>> I will probably host them on GH and we could use them under avocado
>> to extend the tests.
>>
>>
>> They should boot real HW. I will submit the defconfigs to buildroot
>> after more tests and cleanups.
>>
> 
> Nice!

Uploaded here :

https://github.com/legoater/qemu-aspeed-boot/tree/master/images/ast2600-evb/buildroot-2022.05-rc2


C.

