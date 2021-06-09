Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A673A0BD3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 07:25:28 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqqiV-0000hM-EE
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 01:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lqqhC-0008EY-8u; Wed, 09 Jun 2021 01:24:06 -0400
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:47273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lqqh9-0007Gj-Ke; Wed, 09 Jun 2021 01:24:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id ED85327FFC6;
 Wed,  9 Jun 2021 07:23:58 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 9 Jun
 2021 07:23:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b7349328-68cf-4fd9-9ed7-168320019d7c,
 8962E09D3B98DEC2FB864AA05CC490E9B3FF7AA6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
 <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
 <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
 <CAO=notxHN_JVuyVTO7p+85zWOjeY_uxFfwdbjJXe94qdKhHD0A@mail.gmail.com>
 <CACPK8XdXYXCnSW4Cs0+CbtDWe9csrtPGuZx3hvMedV6fR-un7Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a91d1e9a-ed64-e8ed-cd71-367e420405ae@kaod.org>
Date: Wed, 9 Jun 2021 07:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdXYXCnSW4Cs0+CbtDWe9csrtPGuZx3hvMedV6fR-un7Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c3283823-1cad-4601-9288-a39db5b0138f
X-Ovh-Tracer-Id: 5795569773384338223
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 3:58 AM, Joel Stanley wrote:
> On Tue, 8 Jun 2021 at 19:56, Patrick Venture <venture@google.com> wrote:
>>
>> On Wed, May 19, 2021 at 10:18 AM Patrick Venture <venture@google.com> wrote:
>>>
>>> On Tue, May 18, 2021 at 4:27 PM Joel Stanley <joel@jms.id.au> wrote:
>>>>
>>>> On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
>>>>>
>>>>> Enables the pca954x muxes in the bmc board configuration.
>>>>>
>>>>> Signed-off-by: Patrick Venture <venture@google.com>
>>>>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>>>>
>>>> Not sure about this one, there's no device tree for it in Linux.
>>>
>>> Yeah, this was just a pick-up from grepping other BMC boards.  I added
>>> these going off the comment alone.  I'd be okay with dropping this in
>>> the series.
>>
>> In this case, the number of patches changed within a version change --
>> should I start a fresh series or just bump the version and drop the
>> last patch?
> 
> I wasn't saying we shouldn't include this change - it's good. I just
> didn't have any information to say whether it was correct or not.
> 
> I see you chose to resend without this one, lets get Cedric to merge
> those patches.

I took these patches in the aspeed-6.1 branch : 

  hw/arm: add quanta-gbs-bmc machine
  hw/arm: quanta-gbs-bmc add i2c comments
  hw/arm: gsj add i2c comments
  hw/arm: gsj add pca9548
  hw/arm: quanta-q71l add pca954x muxes
  aspeed: sonorapass: enable pca954x muxes

Peter,

I can include them in an aspeed PR.

Thanks,

C.

