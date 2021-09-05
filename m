Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01407400EB8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:52:29 +0200 (CEST)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMnt1-0006WD-UD
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMns5-0005rO-JH
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:51:25 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:56625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMns3-0002FY-Dw
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:51:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.97])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id EF3BB13B207;
 Sun,  5 Sep 2021 08:51:12 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sun, 5 Sep
 2021 10:51:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004331eaad8-828d-4545-a9b1-1e56699ed50d,
 66A9BF958F2B7C6001B822A929017098407F6BEC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210903194108.131403-1-clg@kaod.org>
 <beab1f50-d8f5-b3d3-5612-15e5f74eb961@amsat.org>
 <9ef56813-94f9-a1cb-aba5-9d2e2a081d23@kaod.org>
 <24abcdb3-e666-477b-a3e7-746326640bca@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cb42b5f4-0484-2192-5c93-fe20bbb39ef1@kaod.org>
Date: Sun, 5 Sep 2021 10:51:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <24abcdb3-e666-477b-a3e7-746326640bca@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c9dcaa99-aa07-40a7-af18-1d8f4820acba
X-Ovh-Tracer-Id: 9583660009386838889
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefuddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.832,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/21 1:03 AM, Philippe Mathieu-Daudé wrote:
> On 9/4/21 7:33 AM, Cédric Le Goater wrote:
>> On 9/3/21 10:41 PM, Philippe Mathieu-Daudé wrote:
>>> Hi Peter,
>>>
>>> On 9/3/21 9:40 PM, Cédric Le Goater wrote:
>>>> The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:
>>>>
>>>>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210903
>>>>
>>>> for you to fetch changes up to 907796622b2a6b945c87641d94e254ac898b96ae:
>>>>
>>>>   hw/arm/aspeed: Add Fuji machine type (2021-09-03 18:43:16 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> Aspeed patches :
>>>>
>>>> * MAC enablement fixes (Guenter)
>>>> * Watchdog  and pca9552 fixes (Andrew)
>>>> * GPIO fixes (Joel)
>>>> * AST2600A3 SoC and DPS310 models (Joel)
>>>> * New Fuji BMC machine (Peter)
>>>>
>>>> ----------------------------------------------------------------
>>>
>>>> Peter Delevoryas (3):
>>>>       hw/arm/aspeed: Initialize AST2600 UART clock selection registers
>>>>       hw/arm/aspeed: Allow machine to set UART default
>>>>       hw/arm/aspeed: Add Fuji machine type
>>>
>>> I have a pending question with the last patch, do you mind holding
>>> this PR until it is resolved with Cédric and the patch author please?
>>>
>>> Thanks,
>>>
>>> Phil.
>>>
>>
>> I guess we can drop the following from the commit log : 
>>
>> 	git clone https://github.com/facebook/openbmc
>> 	cd openbmc
>> 	./sync_yocto.sh
>> 	source openbmc-init-build-env fuji build-fuji
>> 	bitbake fuji-image
>> 	dd if=/dev/zero of=/tmp/fuji.mtd bs=1M count=128
>> 	dd if=./tmp/deploy/images/fuji/flash-fuji of=/tmp/fuji.mtd \
>> 	    bs=1k conv=notrunc
>> 	
>> 	git clone --branch aspeed-next https://github.com/peterdelevoryas/qemu
>> 	cd qemu
>> 	./configure --target-list=arm-softmmu --disable-vnc
>> 	make -j $(nproc)
>> 	./build/arm-softmmu/qemu-system-arm \
>> 	    -machine fuji-bmc \
>> 	    -drive file=/tmp/fuji.mtd,format=raw,if=mtd \
>> 	    -serial stdio \
>> 	    -nic user,hostfwd=::2222-:22
>> 	sshpass -p 0penBmc ssh root@localhost -p 2222
> 
> Sounds good. Eventually document that in docs/system/arm/aspeed.rst
> in a follow up patch?
> 
> Regards,
> 
> Phil.
> 


Peter D, 

Could you please resend the "hw/arm/aspeed: Add Fuji machine type"
patch addressing Phil's comment. I will resend a PR with the 
update.

Thanks,

C. 






