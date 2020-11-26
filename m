Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AE2C4F21
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 08:08:36 +0100 (CET)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiBON-0000qV-7a
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 02:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kiBMy-0000IO-8M
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:07:09 -0500
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:57150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kiBMv-0007dD-Ju
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:07:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 737E320EC68;
 Thu, 26 Nov 2020 08:06:54 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 26 Nov
 2020 08:06:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003afb6fff9-2393-4169-881f-a22795be4717,
 13CDA3D162A7083D5961EA92AA131951AC2C82F1) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
To: Greg Kurz <groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
 <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
 <20201123121635.65506f0c@bahia.lan>
 <e7a4b597-300a-6f9b-337e-507703dc4d35@kaod.org>
 <20201124180120.7a86f49c@bahia.lan>
 <353fd413-6c50-64ea-f2cf-24d42ee8010d@kaod.org>
 <20201125103337.4716b0d0@bahia.lan>
 <be6b856e-1517-eb77-ae27-80a851b78168@kaod.org>
 <20201125132603.11a0c08e@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4f87fc37-bb2e-f030-1b1a-3f7a35cbeb1e@kaod.org>
Date: Thu, 26 Nov 2020 08:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125132603.11a0c08e@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0eb98297-1551-4019-a112-359aebb63b70
X-Ovh-Tracer-Id: 6056497073994238944
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehuddguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> why ? we would stop claiming IPIs in spapr_irq_init() and so
>> they won't appear as being valid anymore, at boot time or
>> restore time.
>>
> 
> If we don't claim the IPIs in spapr_irq_init() anymore then
> we must at least claim them on the path of H_INT_GET_SOURCE_INFO
> otherwise it will fail with H_P2 and the guest won't even
> try to setup the IPI. 

IPIs could be handled a special case as we know in which range 
they are.

> Even if we do that, we still have a
> window where the source is valid in QEMU but not yet at
> the KVM level.

May be some kind of lazy binding with KVM would help us.

The problem is that the guest ESB pages won't be backed by HW 
pages which could lead to a crash. We could overlap the emulated 
one until we are bound to KVM. Just a thought.

C.



