Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AB8477C56
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 20:21:27 +0100 (CET)
Received: from localhost ([::1]:49124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxwJe-0003k7-IX
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 14:21:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxwH3-0002WD-WF
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 14:18:42 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxwH2-0007cb-14
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 14:18:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 75799D267279;
 Thu, 16 Dec 2021 20:18:37 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 16 Dec
 2021 20:18:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0050d830b1c-95d5-48f7-a7b1-08db485e8003,
 C4E9F14F77021FCD78381261BFC7BBA46F2BB44E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <322a8cf2-55ac-5dcb-f459-0d4fa3fede0a@kaod.org>
Date: Thu, 16 Dec 2021 20:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 000/102] ppc queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <2ef5a85e-8955-2028-026d-7cb3ad13d718@linaro.org>
 <2f7401a9-a466-2e5b-df8b-6544fc7b16ba@kaod.org>
 <56e6beae-1c4f-2723-6174-f239f1a38c94@kaod.org>
 <c794cd0d-fb49-467b-dc2b-01f2ea86a4c2@linaro.org>
 <77cde36a-d770-5176-b28d-2db7a157e45e@kaod.org>
 <de9fd39a-e8d8-2836-621c-95f59bea6132@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <de9fd39a-e8d8-2836-621c-95f59bea6132@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7f1b7285-c4f2-46be-a4f7-3a69679b0e47
X-Ovh-Tracer-Id: 10452010310880627619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekkeefheefvdefhefgjeelveekheeileehudevkeefvdfhleetiedvffdtudeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlrghgrghrtghirgeslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 19:18, Richard Henderson wrote:
> On 12/16/21 9:51 AM, Cédric Le Goater wrote:
>>>> It's certainly due to
>>>>
>>>>    [PULL 017/102] docs: rSTify ppc-spapr-hcalls.txt
>>>>
>>>> However, it does not reproduce on f34 and 21.10 systems using python-sphinx
>>>> 3.4.3-2 and 3.5.4-2
>>>
>>> Correct, it's a system running 18.04.5 LTS, python3-sphinx 1.6.7.
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/1890700682
>>>
>>> Is our s390x ci host really the only one left running 18.04?
>>> That seems like a mistake...
>>
>> ok. Tell me if you want a resend.
> 
> Well, yes.  I can't edit your signed tag.

I was hoping an update of the s390x ci host.

working on a v2.

C.

