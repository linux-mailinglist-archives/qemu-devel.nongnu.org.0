Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13578557362
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 08:58:47 +0200 (CEST)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Gnb-0001Xs-DO
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 02:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Ge9-0004wH-2W
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 02:48:57 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:40821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Ge6-0005Zo-Nv
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 02:48:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2573222C87;
 Thu, 23 Jun 2022 06:48:50 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 08:48:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006f3ddc5b8-5ee0-48a1-b826-90c025d94000,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2780eff7-17de-0496-7a5b-f3ede706794a@kaod.org>
Date: Thu, 23 Jun 2022 08:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/9] Add Qualcomm BMC machines
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Graeme Gregory
 <quic_ggregory@quicinc.com>, Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <CACPK8Xcfyu0BxEhVZDQ=mfw0OcPgSm6nVSzpmT5nviq7X+rFTA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xcfyu0BxEhVZDQ=mfw0OcPgSm6nVSzpmT5nviq7X+rFTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fc3418cd-75c8-4d9e-ac53-508798d0da0c
X-Ovh-Tracer-Id: 923800874689596207
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefiedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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

On 6/23/22 07:25, Joel Stanley wrote:
> On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> Hello,
>>
>> I'm sending a series to add Qualcomm BMC machines that are equipped with
>> Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
>> emulation. Please help to review.
> 
> Thanks for the MAX31785 model, that's handy to have.
> 
> I'm all for more emulation and testing using Qemu models, but I wonder
> if you need to add all three of your boards. They seem to be a
> progression (evb-proto -> dc-scm -> firework). Could you get away with
> just one or two of those?

I am not sure the evb-proto-bmc is useful to upstream. The other two
are fine.

Thanks,

C.



> 
> 
>>
>> Thanks,
>>
>> Jae
>>
>> Graeme Gregory (2):
>>    hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
>>    hw/arm/aspeed: add Qualcomm Firework machine and FRU device
>>
>> Jae Hyun Yoo (3):
>>    hw/arm/aspeed: add support for the Qualcomm EVB proto board
>>    hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
>>    hw/arm/aspeed: firework: add I2C MUXes for VR channels
>>
>> Maheswara Kurapati (4):
>>    hw/i2c: pmbus: Page #255 is valid page for read requests.
>>    hw/sensor: add Maxim MAX31785 device
>>    hw/arm/aspeed: firework: Add MAX31785 Fan controllers
>>    hw/arm/aspeed: firework: Add Thermal Diodes
>>
>>   hw/arm/Kconfig        |   1 +
>>   hw/arm/aspeed.c       | 158 +++++++++++-
>>   hw/i2c/pmbus_device.c |   1 -
>>   hw/sensor/Kconfig     |   4 +
>>   hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/sensor/meson.build |   1 +
>>   6 files changed, 742 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/sensor/max31785.c
>>
>> --
>> 2.25.1
>>


