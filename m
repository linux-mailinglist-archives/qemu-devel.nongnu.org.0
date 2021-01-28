Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA777307C6A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:28:47 +0100 (CET)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5B66-0003B0-UV
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5AyB-0005Xh-Je; Thu, 28 Jan 2021 12:20:35 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5Ay7-00009k-Rg; Thu, 28 Jan 2021 12:20:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 71339801FDA7;
 Thu, 28 Jan 2021 18:20:27 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 18:20:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003c74f914a-b758-4a6a-a8c8-176e612c998c,
 E57BA53B85CD0AA8C573FC380C1E6825DC018892) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/3] spapr, spapr_numa: fix max-associativity-domains
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
 <20210128170318.1e164823@bahia.lan>
 <6057fa92-e554-edfb-c6a7-4d0d318dd52d@gmail.com>
 <0192a49c-f356-ea53-64bb-3b5edd231af4@kaod.org>
Message-ID: <571deb6a-b39a-9234-5707-dfd53b02343f@kaod.org>
Date: Thu, 28 Jan 2021 18:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0192a49c-f356-ea53-64bb-3b5edd231af4@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5fc333b6-bdf6-4481-a6b9-613678a7e585
X-Ovh-Tracer-Id: 17463551983448525731
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuhffvfhfkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekledvffeikeefudefvdeghfefffffffdvleffhedvhfffgfegieevjeejkedugfenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 6:13 PM, Cédric Le Goater wrote:
> On 1/28/21 6:05 PM, Daniel Henrique Barboza wrote:
>>
>>
>> On 1/28/21 1:03 PM, Greg Kurz wrote:
>>> On Thu, 28 Jan 2021 12:17:28 -0300
>>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> Patches 02 and 03 contain fixes for a problem Cedric found out when
>>>> booting TCG guests with multiple NUMA nodes. See patch 03 commit
>>>> message for more info.
>>>>
>>>
>>> This paragraph mentions "TCG guests", but I see nothing that is
>>> specific to TCG in these patches... so I expect the problem to
>>> also exists with KVM, right ?
>>
>> Yeah. I mentioned TCG because this is the use case Cedric reproduced
>> the bug with, but I myself had no problems reproducing it with
>> accel=kvm as well.
> 
> I was also seeing the issue on KVM and I am still seeing it with 
> this patchset. It's gone on TCG however. 

ooups, sorry. All good on KVM also ! 

Tested-by: Cédric Le Goater <clg@kaod.org>

We can now safely use for_each_node() in the kernel.

Thanks Daniel,

C.

