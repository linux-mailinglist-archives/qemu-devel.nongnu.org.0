Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567053F697
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 08:54:38 +0200 (CEST)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyT6q-0003K6-Lx
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 02:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyT0k-0000RR-Gc
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:48:21 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:56765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyT0i-00049b-DA
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:48:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6C001225F8;
 Tue,  7 Jun 2022 06:48:12 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 08:48:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c6ae8c24-fbf3-4847-9e61-3b6185c864eb,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <65bccd8a-a75d-3b9f-d749-ae27165a1e98@kaod.org>
Date: Tue, 7 Jun 2022 08:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Help: How do I make a machine with 2 separate ARM SoC's?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: Peter Delevoryas <pdel@fb.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
 <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
 <ec17bc9d-e1cb-3315-6b5e-88ec6d75c7bb@kaod.org>
 <CAFEAcA_vo-WmhpjpXcqE6qzS5xwoTfOm=d+jk9e2bG3Ob3Ye1g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_vo-WmhpjpXcqE6qzS5xwoTfOm=d+jk9e2bG3Ob3Ye1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f27ff6c3-ec8c-4c47-b732-20b21e64d2e7
X-Ovh-Tracer-Id: 17630466645117144032
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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

On 6/6/22 19:02, Peter Maydell wrote:
> On Mon, 6 Jun 2022 at 16:37, Cédric Le Goater <clg@kaod.org> wrote:
>> On the CPU topic, I think we will need to change the GIC device
>> to stop using qemu_get_cpu() in the CPU interface init routine
>> and in the GIC realize routine, since this is global to the machine.
>> I am having the same problem when trying to model a multi SoC board
>> with a GIC device on each chip.
>>
>> What would be a good approach to loop only on the CPUs related
>> to a GIC device ? Could we tag the CPUs and the GIC in some way
>> to filter the unrelated CPUs ? Or pass a CPU list to the GIC
>> device ?
> 
> GICv2 or GICv3 ?

v3 yes. sorry.

> Guessing GICv3, I think probably the right approach is to
> have the GICv3 device have an array of QOM link properties,
> and then the SoC or board code links up the CPUs to the
> GIC device object.

I will look at this.

Thanks,

C.
  

