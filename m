Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0772FCCFD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 09:56:48 +0100 (CET)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29IF-0002ym-4B
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 03:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l29H4-0002Wp-ES
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:55:34 -0500
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:60303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l29H1-0001t7-Dr
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:55:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 723EB2369C5;
 Wed, 20 Jan 2021 09:55:20 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 20 Jan
 2021 09:55:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003f711de6c-78ed-4f88-8c04-bfad6fe68f53,
 AB06206A1A84CFA0853927AAC0B7B8E56FC2CC40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: eMMC support
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <saipava@xilinx.com>
References: <BY5PR02MB6772761F83EDC56737969C18CA210@BY5PR02MB6772.namprd02.prod.outlook.com>
 <CACPK8XexXLYrwMenkyou0Xkc8Tx+p1SNi7jbFBj6aObAKHcBwQ@mail.gmail.com>
 <6a30107a-abf1-635b-c96f-af3d63f93bc8@kaod.org>
Message-ID: <6c1e1335-887e-0459-f1c7-f37daa008c4d@kaod.org>
Date: Wed, 20 Jan 2021 09:55:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6a30107a-abf1-635b-c96f-af3d63f93bc8@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a1582924-8a6b-4bbd-b77a-134d178ca0c7
X-Ovh-Tracer-Id: 17291289294510394275
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddugdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffhvfhfkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffffueejudegtddtudffuddtieehjeetvddtvdehuedtudfgveeffedvfeejueehnecuffhomhgrihhnpehgnhhurdhorhhgpdhoiihlrggsshdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo52.mail-out.ovh.net
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
Cc: Edgar Iglesias <edgari@xilinx.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/20 8:25 AM, Cédric Le Goater wrote:
> On 9/17/20 2:55 AM, Joel Stanley wrote:
>> On Wed, 16 Sep 2020 at 18:35, Sai Pavan Boddu <saipava@xilinx.com> wrote:
>>>
>>> Hi Philippe,
>>>
>>>
>>>
>>> We are looking to add eMMC support, I searched the mailing list and found a series posted on eMMC by “Vincent Palatin”
>>>
>>> https://lists.gnu.org/archive/html/qemu-devel/2011-07/msg02833.html
>>
>> I would be interested in emmc support for the aspeed machines. Please
>> cc me when you post patches.
>>
>>> I would like to consider the above work and mix-up with more changes to start adding support for eMMC. Do you have any suggestions on the approach followed in above patches ?
>>
>> The patches had minor review comments, but I assume the reason they
>> didn't go anywhere is the author never followed up with further
>> revisions. I would suggest applying them to the current tree, cleaning
>> up any style changes that have happened since they were posted, and
>> re-posting them for review.
> 
> It seems we only care about these three patches :
> 
>   https://patchwork.ozlabs.org/patch/106762
>   https://patchwork.ozlabs.org/patch/106761
>   https://patchwork.ozlabs.org/patch/106763
> 
> It should not be too complex to get something going.
>>> Note: Here is the existing support available in Xilinx fork, which might require some work
>>> https://github.com/Xilinx/qemu/blob/master/hw/sd/sd.c
> 
> What are the relevant patches ? 

FYI, aspeed machines successfully boot on top of 16G emmc disk images.
I merged some of xilinx patches on top of the aspeed-6.0 branch to 
improve the model completeness but only the one fixing powerup was 
really necessary. 

The initial diffstat is rather small.

 hw/sd/sd.c             |  168 ++++++++++++++++++++++++++++++++++++++++++-------

We can surely find a way to merge support in mainline without 
covering the whole specs. The Extended CSD register would be the 
big part.

See :

   https://github.com/legoater/qemu/commits/aspeed-6.0

Cheers,

C.

