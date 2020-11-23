Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA802C03EE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:18:17 +0100 (CET)
Received: from localhost ([::1]:34624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh9rL-0004Yk-Uq
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh9pS-0003dX-2J; Mon, 23 Nov 2020 06:16:18 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:50434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh9pP-000193-PM; Mon, 23 Nov 2020 06:16:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 61DDC212474;
 Mon, 23 Nov 2020 12:16:11 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 12:16:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004650f3bcd-7c89-492d-aeff-d7a0a2508906,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 0/6] spapr/xive: Activate StoreEOI in P10 compat guests
To: David Gibson <david@gibson.dropbear.id.au>
References: <20201005165147.526426-1-clg@kaod.org>
 <20201009002326.GB1025389@yekko.fritz.box>
 <cabb6bda-c7b5-6546-a142-b2bb2dce28ef@kaod.org>
 <20201123064454.GY521467@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <90801056-75cf-6c79-183e-d2c5686f2871@kaod.org>
Date: Mon, 23 Nov 2020 12:16:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123064454.GY521467@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b3aba5a0-e196-45ed-9e5e-4b1954504e88
X-Ovh-Tracer-Id: 11095462106997885859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelgfejveehieefffduueehvdevfedtleeiudekjeegveeigfeifefhtdfffedtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gustavo Romero <gromero@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 7:44 AM, David Gibson wrote:
> On Mon, Nov 02, 2020 at 02:22:35PM +0100, Cédric Le Goater wrote:
>> Sorry for the late answer I was out for a couple of weeks.
>>
>> On 10/9/20 2:23 AM, David Gibson wrote:
>>> On Mon, Oct 05, 2020 at 06:51:41PM +0200, Cédric Le Goater wrote:
>>>> Hello,
>>>>
>>>> When an interrupt has been handled, the OS notifies the interrupt
>>>> controller with an EOI sequence. On the XIVE interrupt controller
>>>> (POWER9 and POWER10), this can be done with a load or a store
>>>> operation on the ESB interrupt management page of the interrupt. The
>>>> StoreEOI operation has less latency and improves interrupt handling
>>>> performance but it was deactivated during the POWER9 DD2.0 time-frame
>>>> because of ordering issues. POWER9 systems use the LoadEOI instead.
>>>> POWER10 has fixed the issue with a special load command which enforces
>>>> Load-after-Store ordering and StoreEOI can be safely used.
>>>
>>> Do you mean that ordering is *always* enforced on P10?  Or it's a
>>> special form of load that has the ordering?
>>
>> It's a special load offset that has the ordering. Oring 0x40 to the load
>> address : 
>>
>>   #define XIVE_ESB_LOAD_EOI	0x000 /* Load */
>>   #define XIVE_ESB_GET		0x800 /* Load */
>>   #define XIVE_ESB_SET_PQ_00	0xc00 /* Load */
>>   #define XIVE_ESB_SET_PQ_01	0xd00 /* Load */
>>   #define XIVE_ESB_SET_PQ_10	0xe00 /* Load */
>>   #define XIVE_ESB_SET_PQ_11	0xf00 /* Load */
>>
>> will enforce load-after-store ordering.
> 
> Oh... I had assumed the problem was to do with the load/store ordering
> within the CPU core itself (or maybe the L1, I guess).  But if the
> address used can change it, the problem must be within the XIVE, yes?

Yes. It's in the XIVE logic handling the load/store operations on the 
PQ bits.

> Or at least somwhere on the Powerbus.  So, wasn't this just a plain
> XIVE hardware bug?  

It's a theoretical bug in HW. StoreEOI is activated on the P9 systems 
we use for performance testing and it never showed up.

> In which case why is there software involvement as well?

Software is involved as an optimization, because only PQ_10 loads need 
the ordering enforcement.

commit b1f9be9392f0 in Linux says more : 
    
    There is usually no need to enforce ordering between ESB load and
    store operations as they should lead to the same result. E.g. a store
    trigger and a load EOI can be executed in any order. Assuming the
    interrupt state is PQ=10, a store trigger followed by a load EOI will
    return a Q bit. In the reverse order, it will create a new interrupt
    trigger from HW. In both cases, the handler processing interrupts is
    notified.
    
    In some cases, the XIVE_ESB_SET_PQ_10 load operation is used to
    disable temporarily the interrupt source (mask/unmask). When the
    source is reenabled, the OS can detect if interrupts were received
    while the source was disabled and reinject them. This process needs
    special care when StoreEOI is activated. The ESB load and store
    operations should be correctly ordered because a XIVE_ESB_STORE_EOI
    operation could leave the source enabled if it has not completed
    before the loads.
    
    For those cases, we enforce Load-after-Store ordering with a special
    load operation offset. To avoid performance impact, this ordering is
    only enforced when really needed, that is when interrupt sources are
    temporarily disabled with the XIVE_ESB_SET_PQ_10 load. It should not
    be needed for other loads.

This ordering is a requirement for StoreEOI. 

    

C.

