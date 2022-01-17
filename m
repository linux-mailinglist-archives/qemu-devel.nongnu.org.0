Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC71490563
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:48:29 +0100 (CET)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Ocl-00071u-Rt
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:48:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9OaR-0005RG-BF
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:46:03 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9OaO-0007qm-JN
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:46:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B9027D82E6A0;
 Mon, 17 Jan 2022 10:45:57 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 10:45:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033e9c74ef-75bf-4211-aa9e-bbcd12091710,
 9556A11AC16C5E8FE4FF301E40865CB3D13C347E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8609da8e-e4e6-3b78-6d49-c6cf4cb07ddd@kaod.org>
Date: Mon, 17 Jan 2022 10:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: ppc pbr403 vmstate
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <YeB0zGRC/ct8DAzM@work-vm> <YeC4xYrYhdAKKwTx@yekko.fritz.box>
 <a2b11256-5afe-42de-ffb3-dad07c8165b3@kaod.org>
 <YeUEB0lb7mhuoP6G@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YeUEB0lb7mhuoP6G@yekko.fritz.box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9d61fdff-d07f-4484-81eb-6286bf37d322
X-Ovh-Tracer-Id: 4239294625816152940
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddugddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, quintela@redhat.com,
 qemu-devel@nongnu.org, danielhb413@gmail.com, groug@kaod.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 06:52, David Gibson wrote:
> On Fri, Jan 14, 2022 at 08:07:21AM +0100, Cédric le Goater wrote:
>> On 1/14/22 00:41, David Gibson wrote:
>>> On Thu, Jan 13, 2022 at 06:51:56PM +0000, Dr. David Alan Gilbert wrote:
>>>> Hi,
>>>>     Is there any easy way of getting a machine where the pbr403 vmstate
>>>> would be generated?
>>>
>>> The condition in pbr403_needed is...
>>>
>>>       return (pvr & 0xffff0000) == 0x00200000;
>>>
>>> .. which looks to be the PVR for ppc403 models.  That makes sense with
>>> the section name... but not so much with the fact that it's under
>>> cpu/tlb6xx.  The 6xx MMU is basically unrelated to the 40x MMU.  But
>>> it looks like the vmstate_tlbemb might be shared between then, because
>>> of bad ideas of the past.
>>>
>>> But in any case, we already dropped what little 403 support we ever
>>> had - there's nothing with that PVR even listed in
>>> target/ppc/cpu-models.h.
>>>
>>> So I think we should just drop it.
>>
>> yes. But we can not remove env.pb since this would break migration
>> compatibility, correct ?
> 
> Only if it appears in a migration section that's actually emitted by a
> supported machine type.  As far as I can tell the only section that
> does that is vmstate_pbr403, which we're also dropping so we should be
> fine.

I sent a patch to remove vmstate_pbr403 first.

  > It is also touched in the *super* old cpu_load_old.  I suspect we
> could probably just drop that completely, since I don't think we
> realistically support migration from a version that old anyway.  But
> even if we don't want to do that right now, we can just replace the
> reads into env->pb with discarding reads and we'll be fine.  We don't
> implement any cpus that actually used those fields, so we can ignore
> them in the migration stream.

I will take a look at this also with follow ups.

Thanks,

C.

