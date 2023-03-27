Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF76CA8B3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 17:12:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgoUr-0001BI-Nu; Mon, 27 Mar 2023 11:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgoUp-00019x-T9
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:10:55 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgoUn-0006Ds-Om
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:10:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4B63A20B6F;
 Mon, 27 Mar 2023 15:10:49 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 27 Mar
 2023 17:10:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a741f3f8-ea4a-4417-a304-1fe12397f4fa,
 A6C3435B678E6C193C864925704A598F32E2E8B9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9d72b22b-9d53-8825-e7e1-fdcd9fa2d53d@kaod.org>
Date: Mon, 27 Mar 2023 17:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Ninad Palsule <ninad@linux.ibm.com>
CC: <qemu-devel@nongnu.org>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <20230326224426.3918167-2-ninad@linux.ibm.com>
 <CACPK8XfLBT-6eu4cv=CbS2d368N-wcVuvSy+w4Kt-JavPqrhyA@mail.gmail.com>
 <24c4b174-21d2-32ce-c944-8f76eec0281c@kaod.org>
 <b30609d2-2b4b-2c51-d957-936127032ffa@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b30609d2-2b4b-2c51-d957-936127032ffa@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: efbadc7f-6cc3-4d29-a963-0e4d1ee7782a
X-Ovh-Tracer-Id: 12824281416900643622
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehnihhnrggusehlihhnuhigrdhvnhgvthdrihgsmhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdhnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

>>>> +In case a ast2600-evb bmc machine is emulated and want to use TPM device
>>>> +attached to I2C bus, use the following command line:
>>>> +
>>>> +.. code-block:: console
>>>> +
>>>> +  qemu-system-arm -M ast2600-evb -nographic \
>>>> +    -kernel arch/arm/boot/zImage \
>>>> +    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
>>>> +    -initrd rootfs.cpio \
>>>> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>>>> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>>> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>>>
>>> For testing, use this command to load the driver to the correct address:
>>>
>>> echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
>>>
>>> (I don't know how specific we want to make the instructions, but
>>> adding a line like above would help others from having to re-discover
>>> the command).
>>
>> or/and add an avocado test for it. See tests/avocado/machine_aspeed.py.
>>
>> The avocado framework is a bit fragile when reading from the console but
>> we hope to fix that.
> 
> I never used it before so it will take little longer.
> 
> Is it required to merge this i2c work?

It isn't.

C.




