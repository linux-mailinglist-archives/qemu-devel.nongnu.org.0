Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365368D2EC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKNB-00050m-Hf; Tue, 07 Feb 2023 04:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pPKN8-0004zv-2j
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:34:42 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pPKN6-0005Er-3g
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:34:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3ED7421EC2;
 Tue,  7 Feb 2023 09:34:35 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 7 Feb
 2023 10:34:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003120cffc7-5b22-4e51-a5df-4aae120c553a,
 904990D422014CC0AD0CD8052B6B5031CF8ACE51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4c11d47e-5d34-758f-52a8-97b99fd91486@kaod.org>
Date: Tue, 7 Feb 2023 10:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Hao Wu
 <wuhaotsh@google.com>, Patrick Venture <venture@google.com>
CC: <cminyard@mvista.com>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <f4bug@amsat.org>, <qemu-devel@nongnu.org>, Doug Evans
 <dje@google.com>, Titus Rwantare <titusr@google.com>
References: <20220131222948.496588-1-venture@google.com>
 <20220131222948.496588-2-venture@google.com>
 <CAGcCb113A8y0zgXKvLjZEZJeMu-kDpJp0f5tUPyH--WfH36sLQ@mail.gmail.com>
 <98911d1f-59fe-4939-b022-c27b1013d9c1@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <98911d1f-59fe-4939-b022-c27b1013d9c1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6377640a-770c-4b8f-8adc-7b2379a02d9f
X-Ovh-Tracer-Id: 1957376988089584629
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudegkedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeitefgudeghfefleffueejjeevffetgeelkedvleegudekjedvudekvdeuffejveenucffohhmrghinheplhhkmhhlrdhorhhgpdgrmhgurdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpfihuhhgrohhtshhhsehgohhoghhlvgdrtghomhdpvhgvnhhtuhhrvgesghhoohhglhgvrdgtohhmpdgtmhhinhihrghrugesmhhvihhsthgrrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdplhhvihhvihgvrhesrhgvughhrghtrdgtohhmpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhfgegsuhhgsegrmhhsrghtrdhorhhgpdhqvghmuhdquggvvh
 gvlhesnhhonhhgnhhurdhorhhgpdgujhgvsehgohhoghhlvgdrtghomhdpthhithhushhrsehgohhoghhlvgdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

[ Cc: Titus, since he is maintainer of some sensor models already ]

On 2/7/23 07:51, Philippe Mathieu-Daudé wrote:
> On 7/2/23 00:24, Hao Wu wrote:
>> Hi,
>>
>> It seems like this patch set is reviewed but never merged. Who should take this patch set? What are our next steps for them?
> 
> Having some interest in interaction with emulated analog world,
> I could have an overall look at hw/sensor/. Co-maintainers welcomed!
>
>> On Mon, Jan 31, 2022 at 2:29 PM Patrick Venture <venture@google.com <mailto:venture@google.com>> wrote:
>>
>>     From: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>>
>>     SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
>>     interface that reports AMD SoC's Ttcl (normalized temperature),
>>     and resembles a typical 8-pin remote temperature sensor's I2C interface
>>     to BMC.
>>
>>     This patch implements a basic AMD SB-TSI sensor that is
>>     compatible with the open-source data sheet from AMD and Linux
>>     kernel driver.
>>
>>     Reference:
>>     Linux kernel driver:
>>     https://lkml.org/lkml/2020/12/11/968
>>     <https://lkml.org/lkml/2020/12/11/968>
>>     Register Map:
>>     https://developer.amd.com/wp-content/resources/56255_3_03.PDF
>>     <https://developer.amd.com/wp-content/resources/56255_3_03.PDF>
>>     (Chapter 6)
>>
>>     Signed-off-by: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>>     Signed-off-by: Patrick Venture <venture@google.com
>>     <mailto:venture@google.com>>
>>     Reviewed-by: Doug Evans <dje@google.com <mailto:dje@google.com>>
>>     Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>>     <mailto:f4bug@amsat.org>>
>>     Acked-by: Corey Minyard <cminyard@mvista.com
>>     <mailto:cminyard@mvista.com>>
>>     ---
>>       meson.build               |   1 +
>>       hw/sensor/trace.h         |   1 +
>>       include/hw/sensor/sbtsi.h |  45 +++++
>>       hw/sensor/tmp_sbtsi.c     | 369 ++++++++++++++++++++++++++++++++++++++
>>       hw/sensor/Kconfig         |   4 +
>>       hw/sensor/meson.build     |   1 +
>>       hw/sensor/trace-events    |   5 +
>>       7 files changed, 426 insertions(+)
>>       create mode 100644 hw/sensor/trace.h
>>       create mode 100644 include/hw/sensor/sbtsi.h
>>       create mode 100644 hw/sensor/tmp_sbtsi.c
>>       create mode 100644 hw/sensor/trace-events
> 


