Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DD48E52A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:02:44 +0100 (CET)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HXn-0004zH-4O
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:02:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8GgR-00011B-9t
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:07:36 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8GgH-00016x-FJ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:07:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CBF2FD7A9C99;
 Fri, 14 Jan 2022 08:07:22 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 08:07:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0011144f782-6962-48d7-af4f-06a98ea6467c,
 48AE69F32F38AAAF76E9DC5A3CEB3A821FE35450) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a2b11256-5afe-42de-ffb3-dad07c8165b3@kaod.org>
Date: Fri, 14 Jan 2022 08:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: ppc pbr403 vmstate
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
References: <YeB0zGRC/ct8DAzM@work-vm> <YeC4xYrYhdAKKwTx@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YeC4xYrYhdAKKwTx@yekko.fritz.box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1f602188-46b6-412d-b25f-c9882c1a91f2
X-Ovh-Tracer-Id: 2389722555603454828
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdeggddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, quintela@redhat.com,
 danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 00:41, David Gibson wrote:
> On Thu, Jan 13, 2022 at 06:51:56PM +0000, Dr. David Alan Gilbert wrote:
>> Hi,
>>    Is there any easy way of getting a machine where the pbr403 vmstate
>> would be generated?
> 
> The condition in pbr403_needed is...
> 
>      return (pvr & 0xffff0000) == 0x00200000;
> 
> .. which looks to be the PVR for ppc403 models.  That makes sense with
> the section name... but not so much with the fact that it's under
> cpu/tlb6xx.  The 6xx MMU is basically unrelated to the 40x MMU.  But
> it looks like the vmstate_tlbemb might be shared between then, because
> of bad ideas of the past.
> 
> But in any case, we already dropped what little 403 support we ever
> had - there's nothing with that PVR even listed in
> target/ppc/cpu-models.h.
> 
> So I think we should just drop it.

yes. But we can not remove env.pb since this would break migration
compatibility, correct ?


I will send a patch.

Thanks,

C.

