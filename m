Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CCF4F11C0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:13:16 +0200 (CEST)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIlu-0007PF-TL
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:13:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbIiH-0004sH-HW
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:09:30 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:53551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbIiD-0005CN-8U
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:09:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AEF2C22C9D;
 Mon,  4 Apr 2022 09:09:21 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 11:09:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b1767bdd-1359-4db1-b3a6-81b355ed1d77,
 193BEDB8EED17CFBFC1316EE01F9191BF107EB6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a1c0c878-fc9f-e503-132a-ce53795b8308@kaod.org>
Date: Mon, 4 Apr 2022 11:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] linux-user/ppc: Narrow type of ccr in save_user_regs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220401191643.330393-1-richard.henderson@linaro.org>
 <6dcbc929-6d27-2520-0ee6-f416b2469ec4@kaod.org>
 <CAFEAcA9MNgR+hbw=Q5cyZBGPbL7q=FwNeu2Q_9HS+eLHixTsbg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9MNgR+hbw=Q5cyZBGPbL7q=FwNeu2Q_9HS+eLHixTsbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b4aec2bf-029a-4b5b-8a85-cb9f1d1fd785
X-Ovh-Tracer-Id: 13096749193414020003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:41, Peter Maydell wrote:
> On Mon, 4 Apr 2022 at 07:55, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 4/1/22 21:16, Richard Henderson wrote:
>>> Coverity warns that we shift a 32-bit value by N, and then
>>> accumulate it into a 64-bit type (target_ulong on ppc64).
>>>
>>> The ccr is always 8 * 4-bit fields, and thus is always a
>>> 32-bit quantity; narrow the type to avoid the warning.
>>>
>>> Fixes: Coverity CID 1487223
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>    linux-user/ppc/signal.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Queued for ppc-7.0
> 
> NB that this is only suppressing a coverity warning, not
> correcting any incorrect behaviour, so if you don't have
> anything else you were planning to send for 7.0 it could
> also wait til 7.1.

I have a couple of small fixes in :

   https://github.com/legoater/qemu/commits/ppc-for-upstream

   linux-user/ppc: Narrow type of ccr in save_user_regs
   ppc/pnv: Fix number of registers in the PCIe controller on POWER9
   hw/ppc: free env->tb_env in spapr_unrealize_vcpu()

Nothing critical indeed. So these can wait 7.1 ?

Thanks,

C.

