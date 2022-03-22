Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B54E3AE8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:43:47 +0100 (CET)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWa7G-0003dj-Rb
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:43:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWa59-0000Xs-Ie
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:41:36 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:56645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWa57-00050T-Fm
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:41:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2AC2CED97510;
 Tue, 22 Mar 2022 09:41:31 +0100 (CET)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 22 Mar
 2022 09:41:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00159c961c8-fa2e-4ffc-8df6-21bb72a6a1db,
 469EFB141CFE40B2A85C1EB4DF33FF44F3CA3D4D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <78d45395-2017-ebbb-d37e-73a7a26930c4@kaod.org>
Date: Tue, 22 Mar 2022 09:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Memory leak in via_isa_realize()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Peter Maydell <peter.maydell@linaro.org>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
 <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
 <CAFEAcA-hQt7fGU7Lm=N+jkXunsekJy15s=xVWBBnoEuDDM30yg@mail.gmail.com>
 <4bd52c83-a4c8-ead6-1210-a5e464c32196@ilande.co.uk>
 <8bf5cb89-34c8-f1f2-31f2-beea5336ba35@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8bf5cb89-34c8-f1f2-31f2-beea5336ba35@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7c82cd42-47a4-4fff-bde9-e46bb6256357
X-Ovh-Tracer-Id: 10068641394744068911
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhhvghnthgvhiesghhmrghilhdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 09:37, Thomas Huth wrote:
> On 22/03/2022 09.23, Mark Cave-Ayland wrote:
> [...]
>> but the main blocker for me was not being able to test all the different PPC machine configurations.
> 
> I think the best you can do is to run the avocado tests:
> 
>   make check-venv
>   ./tests/venv/bin/avocado run -t arch:ppc64 tests/avocado/
>   ./tests/venv/bin/avocado run -t arch:ppc tests/avocado/
> 
> That tests at least that the machines mpc8544ds, prep, virtex-ml507, bamboo, ref405ep, ppce500, powernv, g3beige and mac99 are basically still working, which is IMHO a good set already.

yes. There are little more combinations with :

	https://github.com/legoater/qemu-ppc-boot

>> Out of curiosity does anyone know how to test the KVM in-kernel OpenPIC implementation in hw/intc/openpic_kvm.c? It seems to be used for e500 only.
> 
> I guess you need some old real e500 silicon to test this...?

That's the problem :/

Thanks,

C.

