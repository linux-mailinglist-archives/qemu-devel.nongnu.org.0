Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576794B65F7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:24:24 +0100 (CET)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt8J-0004y2-Fm
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:24:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJt5X-0002mA-Il
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:21:32 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJt5J-0004r2-EA
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:21:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E4170DFE59EC;
 Tue, 15 Feb 2022 09:21:08 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 09:21:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0059adf2899-4329-4757-aaf6-a25b7936d30f,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <42407797-ffa0-7a78-c4a7-63cbf033c897@kaod.org>
Date: Tue, 15 Feb 2022 09:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v11 3/4] target/ppc: add PPC_INTERRUPT_EBB and EBB
 exceptions
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220211183354.563602-1-danielhb413@gmail.com>
 <20220211183354.563602-4-danielhb413@gmail.com>
 <d1e2f0c2-ddfa-b0d3-2b45-bcb34687cd73@kaod.org>
 <5ef3cc27-38f0-5a30-5c6b-ce9d61c9f266@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5ef3cc27-38f0-5a30-5c6b-ce9d61c9f266@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1eeb2585-84a7-4749-b649-1c4c589aa2b5
X-Ovh-Tracer-Id: 7094295315177311200
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 18:52, Daniel Henrique Barboza wrote:
> 
> 
> On 2/14/22 14:34, Cédric Le Goater wrote:
>> On 2/11/22 19:33, Daniel Henrique Barboza wrote:
>>> PPC_INTERRUPT_EBB is a new interrupt that will be used to deliver EBB
>>> exceptions that had to be postponed because the thread wasn't in problem
>>> state at the time the event-based branch was supposed to occur.
>>>
>>> ISA 3.1 also defines two EBB exceptions: Performance Monitor EBB
>>> exception and External EBB exception. They are being added as
>>> POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB.
>>>
>>> PPC_INTERRUPT_EBB will check BESCR bits to see the EBB type that
>>> occurred and trigger the appropriate exception. Both exceptions are
>>> doing the same thing in this first implementation: clear BESCR_GE and
>>> enter the branch with env->nip retrieved from SPR_EBBHR.
>>>
>>> The checks being done by the interrupt code are msr_pr and BESCR_GE
>>> states. All other checks (EBB facility check, BESCR_PME bit, specific
>>> bits related to the event type) must be done beforehand.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>> It looks correct.
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> Next step is to modify the POWER9 input pins and these routines :
>>
>>    xive_tctx_realize()
>>    xive_tctx_output()
>>    power9_set_irq()
>>
>> to add an EBB "wire" between the IC and the CPU.
> 
> Got it. I'll see if I can get this EBB lane up from the IC and CPU. 
> Any suggestions how I should test it?

Without a software stack configuring the IC and handling the EBB,
you can not.

C.

