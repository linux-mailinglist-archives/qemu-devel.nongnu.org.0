Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3A42D404
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:48:21 +0200 (CEST)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mavTP-0001FH-Ti
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mavQc-0008TY-Je
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:45:26 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:59053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mavQZ-0003ma-5S
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:45:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 29B16214CB;
 Thu, 14 Oct 2021 07:45:19 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 14 Oct
 2021 09:45:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ff302d3c-835a-4796-bd73-4da4003cd886,
 478463A4BF00ECA76DB51169D4E954975F83058A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c19211f1-5db0-f494-d234-df24b96e8575@kaod.org>
Date: Thu, 14 Oct 2021 09:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] aspeed: Add support for the fp5280g2-bmc board
Content-Language: en-US
To: John Wang <wangzq.jn@gmail.com>
References: <20211014064548.934799-1-wangzhiqiang02@inspur.com>
 <f636c41c-30dd-85ba-1654-dafb0f65d0d3@kaod.org>
 <CAHwNHZVifJnSSs2b0npg52bBd38Mxqfe7A+uYCihiUq+E_7GLw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAHwNHZVifJnSSs2b0npg52bBd38Mxqfe7A+uYCihiUq+E_7GLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d81f9068-b233-4c52-b337-8b921d8dae97
X-Ovh-Tracer-Id: 16145123190709390127
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -34
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenfghrlhcuvffnffculddujedmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleevgeeiiefgteffiefhheejueeiudevleevgfdtgedthfeigfejgeduvdefteeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhoohhglhgvrdgtohhmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, lintao.lc@inspur.com,
 duanzhijia01@inspur.com,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, liuxiwei@inspur.com,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 09:36, John Wang wrote:
> Cédric Le Goater <clg@kaod.org> 于2021年10月14日周四 下午3:19写道：
>>
>> On 10/14/21 08:45, John Wang wrote:
>>> The fp5280g2-bmc is supported by OpenBMC, It's
>>> based on the following device tree
>>>
>>> https://github.com/openbmc/linux/blob/dev-5.10/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
>>>
>>> Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
>>
>> Is a flash image available so that we can give this new machine a try ?
> 
> I've tested. here is the image:
> https://drive.google.com/file/d/1lAQ7nG2sq0FfAVydjSlF1zHmnKlgFCVq/view?usp=sharing

I will add it to my collection of images for non regression.

> 
> it can be built on openbmc/openbmc with
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47824

Thanks

C.

