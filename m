Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EFF30B290
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:08:16 +0100 (CET)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6hMl-0007GQ-Po
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l6hLA-0006QJ-K7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:06:36 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l6hL8-0005CJ-EK
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:06:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.220])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 285F28171EDD;
 Mon,  1 Feb 2021 23:06:31 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Feb 2021
 23:06:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005c1082897-76ca-4904-ae8d-58bc1cf4aeae,
 43AF5B79A33AC54A678EB738DB65E99D5FB7B3E2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: eMMC support
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <BY5PR02MB6772761F83EDC56737969C18CA210@BY5PR02MB6772.namprd02.prod.outlook.com>
 <CACPK8XexXLYrwMenkyou0Xkc8Tx+p1SNi7jbFBj6aObAKHcBwQ@mail.gmail.com>
 <6a30107a-abf1-635b-c96f-af3d63f93bc8@kaod.org>
 <6c1e1335-887e-0459-f1c7-f37daa008c4d@kaod.org>
 <d0ef7bbd-2b2b-422f-9420-29ca620db130@xilinx.com>
 <BY5PR02MB677227AB2EE184B02E1E90B8CAB69@BY5PR02MB6772.namprd02.prod.outlook.com>
 <e401d119-402e-0edd-c2bf-28950ba48ccb@kaod.org>
Message-ID: <13ff3712-e187-9555-057f-3612654d25c9@kaod.org>
Date: Mon, 1 Feb 2021 23:06:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e401d119-402e-0edd-c2bf-28950ba48ccb@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3e38e4ee-0dd8-4da0-abff-e5b9ff56f4be
X-Ovh-Tracer-Id: 8891794517125991206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgdduhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffhvfhfkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdelleeutefgveelveeiieehieelheelkeevgfejffdvgfdtjeejkedvleevtefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshgrihhprghvrgesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 11:01 PM, Cédric Le Goater wrote:
> Hello, 
> 
>>> FYI, aspeed machines successfully boot on top of 16G emmc disk images.
>>> I merged some of xilinx patches on top of the aspeed-6.0 branch to
>>> improve the model completeness but only the one fixing powerup was
>>> really necessary.
>>>  
>>> The initial diffstat is rather small.
>>>  
>>>  hw/sd/sd.c             |  168 ++++++++++++++++++++++++++++++++++++++++++-------
>>>  
>>> We can surely find a way to merge support in mainline without
>>> covering the whole specs. The Extended CSD register would be the
>>> big part.
>>
>> */[Sai Pavan Boddu] I’m revisiting eMMC now, made some patches on top of previous series sent by “Vincent Palatin”./*
>>
>> */Would you like to share your changes, which made aspeed machines to work ?/*
>>
>> */Regards,
>> Sai Pavan/*
> 
> The patchset is in the aspeed-6.0 branch : 
> 
>     df91d012672c Cédric Le Goater - hw/arm/aspeed: Load eMMC first boot area as a boot rom
>     27b75a7ad322 Cédric Le Goater - hw/arm/aspeed: Add eMMC property
>     2836cf5a15a1 Joel Stanley - hw/arm/aspeed: Set boot device to emmc
>     42c9d57f5cd0 Joel Stanley - sd: mmc: Subtract bootarea size from blk
>     218301406607 Joel Stanley - sd: mmc: Support boot area in emmc image
>     df0452923b56 Cédric Le Goater - sd: mmc: Add Extended CSD register definitions
>     416c02bbfd32 Sai Pavan Boddu - sd: mmc: Add mmc switch function support
>     a228aef1a209 Sai Pavan Boddu - sd: mmc: add CMD21 tuning sequence
>     9b177d7baf8e Sai Pavan Boddu - sd: mmc: Update CMD1 definition for MMC
>     6677e4eb6812 Vincent Palatin - sd: add eMMC support

here : 

https://github.com/legoater/qemu/commits/aspeed-6.0

C.


