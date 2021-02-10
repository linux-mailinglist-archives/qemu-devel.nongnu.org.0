Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B26316826
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:38:59 +0100 (CET)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9phq-0000xa-Mi
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l9pgP-0000DS-L7
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:37:29 -0500
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:43589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l9pgK-0005C6-M5
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:37:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id F2BF426585E;
 Wed, 10 Feb 2021 14:37:19 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 10 Feb
 2021 14:37:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005da7a1374-f9eb-4611-b1ac-597f1db0ca3f,
 4C52CDDF7D11E8FC19FB534918B7DCABD727043D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: eMMC support
To: Joel Stanley <joel@jms.id.au>
References: <BY5PR02MB6772761F83EDC56737969C18CA210@BY5PR02MB6772.namprd02.prod.outlook.com>
 <CACPK8XexXLYrwMenkyou0Xkc8Tx+p1SNi7jbFBj6aObAKHcBwQ@mail.gmail.com>
 <6a30107a-abf1-635b-c96f-af3d63f93bc8@kaod.org>
 <6c1e1335-887e-0459-f1c7-f37daa008c4d@kaod.org>
 <d0ef7bbd-2b2b-422f-9420-29ca620db130@xilinx.com>
 <BY5PR02MB677227AB2EE184B02E1E90B8CAB69@BY5PR02MB6772.namprd02.prod.outlook.com>
 <e401d119-402e-0edd-c2bf-28950ba48ccb@kaod.org>
 <13ff3712-e187-9555-057f-3612654d25c9@kaod.org>
 <BY5PR02MB67726489BD76132422D6297ECA8E9@BY5PR02MB6772.namprd02.prod.outlook.com>
 <10976153-915c-8399-b6b3-6091ae41ec3c@kaod.org>
 <CACPK8Xec5o-+9La6AGaVZpfXXFOJ59x6iW9eEO=c016ga+az9A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <80420e50-1567-ce59-a597-88563382b2f7@kaod.org>
Date: Wed, 10 Feb 2021 14:37:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xec5o-+9La6AGaVZpfXXFOJ59x6iW9eEO=c016ga+az9A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b67cc5ec-750e-422b-b16d-97789c32267a
X-Ovh-Tracer-Id: 16253209580250237734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Edgar Iglesias <edgari@xilinx.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 2:05 PM, Joel Stanley wrote:
> On Wed, 10 Feb 2021 at 09:56, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello Sai Pavan,
>>
>> [ ... ]
>>
>>>>> The patchset is in the aspeed-6.0 branch :
>>>>>
>>>>>     df91d012672c Cédric Le Goater - hw/arm/aspeed: Load eMMC first boot
>>>>>                                     area as a boot rom
>>>>>     27b75a7ad322 Cédric Le Goater - hw/arm/aspeed: Add eMMC property
>>>>>     2836cf5a15a1 Joel Stanley - hw/arm/aspeed: Set boot device to emmc
>>>
>>> [Sai Pavan Boddu] I see you guys have implemented the boot area access here,
>>
>> The boot partition modeling fits our needs to boot the Aspeed machine
>> but this is very custom.
>>
>>> I was assuming, your use-case just need to access data from boot partitions.
>>> We are not implementing eMMC boot operations or Alternative bootmode right ?
>>
>> Joel could say more about it ?
> 
> The solution I came up with has room for improvement. There's no way
> to tell the qemu sd device what boot partitions it should expect to
> find, and likewise there's no way for the emulated machine to check
> that the image is formatted in the way it expects.
> 
> If there was a way to add metadata to the image (through qcow2?) then
> we could use this to define the boot partition sizes in the image, and
> have the model use these numbers to populate CSD_EXT. It's only an
> idea, and I don't know if qcow2 supports this kind of metadata.

We could add a new QEMU MMC block device with a set of properties
to describe the layout maybe ? 

C.

