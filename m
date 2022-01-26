Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEF49D1B2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:27:30 +0100 (CET)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCn10-0008D6-4F
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:27:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCmxI-0004tm-VN
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:23:40 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:36329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCmxG-0004v9-Up
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:23:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 11F7A20546;
 Wed, 26 Jan 2022 18:23:35 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 19:23:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003c89ab753-3f26-496c-adf6-0a91cf37adbf,
 287BED84A9017288FF62140CC5311BBCB0E36ECC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f4f8fb10-faaf-4371-6ccb-baf10705da88@kaod.org>
Date: Wed, 26 Jan 2022 19:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
 <d98af016-0a9-49d0-74b4-c59f26a4af6@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d98af016-0a9-49d0-74b4-c59f26a4af6@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2c4deaf4-a828-4aec-ad87-3b0188e13925
X-Ovh-Tracer-Id: 10495357456843901734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfedugdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffeuleefgfdtvdduffetudekkeehjefhtddujeelffeugfduheeiuddvueehgfelnecuffhomhgrihhnpehmohhrphhhohhsqdhtvggrmhdrnhgvthdpsghmvgdrhhhupdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/22 18:55, BALATON Zoltan wrote:
> On Wed, 26 Jan 2022, Fabiano Rosas wrote:
>> This handles the exception code for the 74xx family, i.e. 7400, 7410,
>> 7440, 7445, 7450, 7455, 7457.
>>
>> This is another family that is quite well known, so it should be
>> straight-forward as well.
> 
> I guess this is what may break VOF on pegasos2. Was Philippe's test case for this machine ever merged? (Although that may use the firmware ROM that was preferred as it tests more of the machine and may predate VOF so not sure it also tests with VOF.) The way to test it is this:
> 
> Get morphos demo ISO from https://www.morphos-team.net/morphos-3.15.iso
> Extract boot.img from the root directory of the CD
> Run QEMU as shown at http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos

I could never make it work :/

> 
> (For debugging maybe enabling vof traces would give more info but it was a while so I don't remember the details any more.)
> 
>> Based on legoater/ppc-7.0
> 
> I could test when it's merged or when it applies on master but I don't usually test on branches. Did you verify it still works with pegasos2 or could you please make sure it won't break that use case?

I have a large set of images, here, that I use for non regression tests :

   https://github.com/legoater/qemu-ppc-boot

If we could add a pegasos, that would be nice.

Thanks,

C.

