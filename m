Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6007307C00
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:18:20 +0100 (CET)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Avz-0001fE-ST
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5Arc-0008CE-Kj; Thu, 28 Jan 2021 12:13:48 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5Ara-0005wP-4S; Thu, 28 Jan 2021 12:13:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A6D33801F7CF;
 Thu, 28 Jan 2021 18:13:42 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 18:13:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00695697f95-91f5-4eb3-9f12-6b3eda776a62,
 E57BA53B85CD0AA8C573FC380C1E6825DC018892) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/3] spapr, spapr_numa: fix max-associativity-domains
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
 <20210128170318.1e164823@bahia.lan>
 <6057fa92-e554-edfb-c6a7-4d0d318dd52d@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0192a49c-f356-ea53-64bb-3b5edd231af4@kaod.org>
Date: Thu, 28 Jan 2021 18:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6057fa92-e554-edfb-c6a7-4d0d318dd52d@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fbbaee86-b0f8-44ef-9c91-1c2ff81b1a97
X-Ovh-Tracer-Id: 17349554617853905827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/28/21 6:05 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 1/28/21 1:03 PM, Greg Kurz wrote:
>> On Thu, 28 Jan 2021 12:17:28 -0300
>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>
>>> Hi,
>>>
>>> Patches 02 and 03 contain fixes for a problem Cedric found out when
>>> booting TCG guests with multiple NUMA nodes. See patch 03 commit
>>> message for more info.
>>>
>>
>> This paragraph mentions "TCG guests", but I see nothing that is
>> specific to TCG in these patches... so I expect the problem to
>> also exists with KVM, right ?
> 
> Yeah. I mentioned TCG because this is the use case Cedric reproduced
> the bug with, but I myself had no problems reproducing it with
> accel=kvm as well.

I was also seeing the issue on KVM and I am still seeing it with 
this patchset. It's gone on TCG however. 

C.

