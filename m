Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE14C6F78
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:29:36 +0100 (CET)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOh1r-0005Gr-A5
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:29:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOgiL-0003ba-PH
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:09:26 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:60375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOgiK-0007oR-3C
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:09:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3A4C6E454B31;
 Mon, 28 Feb 2022 15:09:19 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 28 Feb
 2022 15:09:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00160def291-c4e7-478e-a797-39b1c7d63c3b,
 252894939833E8233A028C6995915A29C4CB1534) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a5c7be8b-0f55-a671-651f-b8072ad1fbce@kaod.org>
Date: Mon, 28 Feb 2022 15:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Nicholas Piggin
 <npiggin@gmail.com>
References: <20220216063903.1782281-1-npiggin@gmail.com>
 <20220216063903.1782281-2-npiggin@gmail.com> <Yg2UBtTXneXhDdHz@yekko>
 <1645601745.av9rgobn2v.astroid@bobo.none> <Yhwuwp+eAkiu6fnY@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Yhwuwp+eAkiu6fnY@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d308a60b-e0e2-4a9a-a39b-33db687ff7b5
X-Ovh-Tracer-Id: 15532633640614726563
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>> +    /* These tests match the CPU_FTR_P9_RADIX_PREFETCH_BUG flag in Linux */
>>>> +    if (((pcc->pvr & 0xffffff00) == CPU_POWERPC_POWER9_DD1) ||
>>>> +        ((pcc->pvr & 0xffffff00) == CPU_POWERPC_POWER9_DD20) ||
>>>> +        ((pcc->pvr & 0xffffff00) == CPU_POWERPC_POWER9_DD21)) {
>>>> +        return 0;
>>>> +    }
>>>
>>> Deducing what KVM supports rather than getting it to tell us
>>> explicitly with a cap is usually frowned upon.  However, given the
>>> earlier discussion, I'm satisfied that this is the least bad available
>>> option, at least for now.
>>
>> BTW this particular test doesn't work as I hoped because we only have
>> a power9 dd2.0 model.
> 
> Oh.. yes... IIRC dd2.0 is barely present in the wild, since it doesn't
> have vital Spectre mitigations....
> 
>> Adding a 2.2 or 2.3 would be possible. Maybe overkill.  I'll change
>> the test just to catch all POWER9 for now.
> 
> ... no, given the above, I think we should definitely add the newer
> models.  Maybe even remove dd2.0 and replace it with the newer ones.

yes. It's really not a big effort.

Thanks,

C.

