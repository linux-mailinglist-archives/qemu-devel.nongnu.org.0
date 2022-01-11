Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D256748B147
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:49:34 +0100 (CET)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JOw-0005Hp-07
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7JNW-0003zN-QR
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:48:08 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:57777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7JNK-0002Fp-3g
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:48:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1C06422DDB;
 Tue, 11 Jan 2022 15:47:48 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 16:47:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003309d6223-8894-4873-943b-32961459e864,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8cf0a790-7dca-0d3b-7a2f-b5da5865999d@kaod.org>
Date: Tue, 11 Jan 2022 16:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 4/5] ppc/pnv: Introduce user creatable pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <20220111131027.599784-5-danielhb413@gmail.com>
 <69ab634e-bdb6-d5ad-e6be-771ac3d9a780@kaod.org>
 <a7b6515f-70da-24ce-006b-4e97a9a8577f@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a7b6515f-70da-24ce-006b-4e97a9a8577f@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9fd067b4-b566-466b-840a-d49d2e705bf0
X-Ovh-Tracer-Id: 12007441034192128992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/11/22 15:57, Daniel Henrique Barboza wrote:
> 
> 
> On 1/11/22 11:42, Cédric Le Goater wrote:
>> On 1/11/22 14:10, Daniel Henrique Barboza wrote:
>>> This patch introduces pnv-phb4 user creatable devices that are created
>>> in a similar manner as pnv-phb3 devices, allowing the user to interact
>>> with the PHBs directly instead of creating PCI Express Controllers that
>>> will create a certain amount of PHBs per controller index.
>>>
>>> We accomplish this by doing the following:
>>>
>>> - add a pnv_phb4_get_stack() helper to retrieve which stack an user
>>> created phb4 would occupy;
>>>
>>> - when dealing with an user created pnv-phb4 (detected by checking if
>>> phb->stack is NULL at the start of phb4_realize()), retrieve its stack
>>> and initialize its properties as done in stk_realize();
>>>
>>> - use 'defaults_enabled()' in stk_realize() to avoid creating and
>>> initializing a 'stack->phb' qdev that might be overwritten by an user
>>> created pnv-phb4 device. This process is wrapped into a new helper
>>> called pnv_pec_stk_default_phb_realize().
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> Nothing is left in the stack model. I think the next cleanup is to
>> get rid of it.
> 
> 
> The first step would be to move some MemoryOps from the stack to the phb, then
> little by little we can get into a point where the stack will just be a pointer
> to its phb.
> 
> This is something that we can keep working on in smaller bits here and there.
> I mean, assuming that we're not going to use this code base for PHB5. If that's
> the case then I can prioritize this cleanup.

PHB5 uses the same models. Only the PHB version and the root port
model need some adaptation.


On branch https://github.com/legoater/qemu/commits/powernv-7.0,
I have merged :

   ppc/pnv: Move root port allocation under pnv_pec_stk_default_phb_realize()
   ppc/pnv: Add a 'rp_model' class attribute for the PHB4 PEC
   ppc/pnv: Remove PHB4 version property

preparing ground for :

   ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge

Should we rework slightly your patchset to include them ? Or we don't
care may be. Please advise :)

Thanks,

C.


