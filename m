Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0B44C214
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:28:34 +0100 (CET)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkneT-0006A2-Gj
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:28:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mknbw-0004fV-Hi
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:25:57 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:56435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mknbs-0001Mv-2J
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:25:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 520A120348;
 Wed, 10 Nov 2021 13:25:49 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 10 Nov
 2021 14:25:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0049134b7db-1a42-4b6a-a789-e85a43030a5e,
 FF02C7A8D8E58AFC286F2B1DBFB5F34314452EF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7abe43d8-88c7-e708-0f67-3728fcc38af6@kaod.org>
Date: Wed, 10 Nov 2021 14:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/1] spapr_numa.c: fix FORM1 distance-less nodes
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211110123921.1927528-1-danielhb413@gmail.com>
 <20211110123921.1927528-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211110123921.1927528-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b5eef461-0b81-4303-99d5-4f15f1bc57fc
X-Ovh-Tracer-Id: 14437695982786218857
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudejgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetveeludeuffffleevleehkeeutdevheekudetffffhfekuddthefgtdejhfdtffenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 13:39, Daniel Henrique Barboza wrote:
> Commit 71e6fae3a99 fixed an issue with FORM2 affinity guests with NUMA
> nodes in which the distance info is absent in
> machine_state->numa_state->nodes. This happens when QEMU adds a default
> NUMA node and when the user adds NUMA nodes without specifying the
> distances.
> 
> During the discussions of the forementioned patch [1] it was found that
> FORM1 guests were behaving in a strange way in the same scenario, with
> the kernel seeing the distances between the nodes as '160', as we can
> see in this example with 4 NUMA nodes without distance information:
> 
> $ numactl -H
> available: 4 nodes (0-3)
> (...)
> node distances:
> node   0   1   2   3
>    0:  10  160  160  160
>    1:  160  10  160  160
>    2:  160  160  10  160
>    3:  160  160  160  10
> 
> Turns out that we have the same problem with FORM1 guests - we are
> calculating associativity domain using zeroed values. And as it also
> turns out, the solution from 71e6fae3a99 applies to FORM1 as well.
> 
> This patch creates a wrapper called 'get_numa_distance' that contains
> the logic used in FORM2 to define node distances when this information
> is absent. This helper is then used in all places where we need to read
> distance information from machine_state->numa_state->nodes. That way
> we'll guarantee that the NUMA node distance is always being curated
> before being used.
> 
> After this patch, the FORM1 guest mentioned above will have the
> following topology:
> 
> $ numactl -H
> available: 4 nodes (0-3)
> (...)
> node distances:
> node   0   1   2   3
>    0:  10  20  20  20
>    1:  20  10  20  20
>    2:  20  20  10  20
>    3:  20  20  20  10
> 
> This is compatible with what FORM2 guests and other archs do in this
> case.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01960.html
> 
> Fixes: 690fbe4295d5 ("spapr_numa: consider user input when defining associativity")
> CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> CC: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

queued for 6.2.

Thanks for the resend.

C.


