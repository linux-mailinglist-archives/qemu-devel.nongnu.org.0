Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4B46E38F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 08:57:38 +0100 (CET)
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvEJ6-00064A-QU
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 02:57:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEIB-0005CP-Nt
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:56:39 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:46967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEI2-0000DO-W7
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:56:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 260B420221;
 Thu,  9 Dec 2021 07:56:23 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 9 Dec
 2021 08:56:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00208cffa6f-4be2-4a20-94e5-d4759b85a086,
 CEC1E8B44BCED238FE59940CA9620AA9C7B98FBC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <146bb4cf-0258-8e81-2155-89775320d3b4@kaod.org>
Date: Thu, 9 Dec 2021 08:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] docs: rSTify ppc-spapr-hcalls.txt
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
References: <cover.1638982480.git.lagarcia@br.ibm.com>
 <e20319dcf0ec37bedd915c740c3813eb0e58ead4.1638982486.git.lagarcia@br.ibm.com>
 <da9c1d2d-ce52-5114-eefc-cbf3eb7c475f@gmail.com> <YbFW7JjNLvr5aVKI@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YbFW7JjNLvr5aVKI@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9e5004bc-67e0-49e3-aad6-5f428c1b5c53
X-Ovh-Tracer-Id: 13161488439482157929
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeelgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.803,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, lagarcia@linux.ibm.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> -When the guest runs in "real mode" (in powerpc lingua this means
>>> -with MMU disabled, ie guest effective == guest physical), it only
>>> -has access to a subset of memory and no IOs.
>>> +H_LOGICAL_MEMOP (0xf001)
>>> +^^^^^^^^^^^^^^^^^^^^^^^^
>>> -PAPR provides a set of hypervisor calls to perform cacheable or
>>> +When the guest runs in "real mode" (in powerpc lingua this means with MMU
>>
>> What's up with 'lingua'? As you already know "lingua" is Brazilian portuguese for "tongue"
>> and it's so weird to be used in this context.
>>
>> The one English word that I can think of that is closer to "lingua" and would make sense here
>> is 'lingo'. But that is a slang for 'jargon' and not appropriate for a technical document
>> either. "langua" as a short form of "language" seems weird as well. I really believe 'jargon'
>> is a more suitable word here.
> 
> As a native speaker: "lingo" would make sense here, though its tone is
> a little informal.  "jargon" could also work, but "terminology" would
> probably better match the tone of the document.

I changed it to terminology. No need to resend !

Thanks,

C.

