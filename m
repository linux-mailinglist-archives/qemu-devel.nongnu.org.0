Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C647489F4C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:35:51 +0100 (CET)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zWI-0004fR-1v
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6zSC-0008Bb-So
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:31:36 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:59725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6zSA-0005GW-5l
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:31:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C4468D6D23B5;
 Mon, 10 Jan 2022 19:31:30 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 19:31:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b4f3b4f3-eb5e-4051-bf7c-ee848da88971,
 A9D23E93096AF6ACD837C7DE23AD2D939339D7DC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <674044a9-2cb1-36ef-e021-627904844b6b@kaod.org>
Date: Mon, 10 Jan 2022 19:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] target/ppc: Remove xscmpnedp instruction
Content-Language: en-US
To: Victor Colombo <victor.colombo@eldorado.org.br>, <qemu-devel@nongnu.org>, 
 <qemu-ppc@nongnu.org>
References: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
 <379e6b1f-31c6-843d-fba4-05398885161a@kaod.org>
 <201b2745-31ab-54c4-6e53-4f49557a9c3e@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <201b2745-31ab-54c4-6e53-4f49557a9c3e@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f65660fd-c810-4e76-a8f5-07edbfa6deba
X-Ovh-Tracer-Id: 8899675815324388201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: danielhb413@gmail.com, matheus.ferst@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 18:57, Victor Colombo wrote:
> 
> 
> On 10/01/2022 12:02, Cédric Le Goater wrote:
>> On 1/6/22 12:23, Víctor Colombo wrote:
>>> xscmpnedp was added in ISA v3.0 but removed in v3.0B. This patch
>>> removes this instruction as it was not in the final version of v3.0.
>>
>> Could please resend on top of the VSX combo patchset ?
>>
> Absolutely! I will add it between "Implement xvtlsbb instruction" and "Refactor VSX_SCALAR_CMP_DP" instead of on top, to avoid moving it to decodetree just to remove it later. We will send it together with the patchset v2 later.

Ah. if you resend the whole, perfect. It looks correct from the
tests I did. And fix your name to Víctor !

Thanks,

Cédric.


